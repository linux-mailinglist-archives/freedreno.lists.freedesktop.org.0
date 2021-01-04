Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F122E9B94
	for <lists+freedreno@lfdr.de>; Mon,  4 Jan 2021 18:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D772489FFD;
	Mon,  4 Jan 2021 17:01:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B948989A
 for <freedreno@lists.freedesktop.org>; Mon,  4 Jan 2021 07:02:40 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id b5so10253907pjl.0
 for <freedreno@lists.freedesktop.org>; Sun, 03 Jan 2021 23:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dlLWZrIy6R69T+0RxdKISUof18f+oj7qL0+rpwclI9Q=;
 b=RWiath2GV29Ceq29YV4Eo/YDxoleBkI6KhvmDVrM13P6i6WvXBHLB3NL03EuF0d5Ig
 k3jN3V9R8TYaSIt0OajxpW6UaB9wqaf4kbP7YRvdeIkVNd/vE7mO5sxPJfWGQEcfV0TJ
 gZMIffKXxGkcLQZpqzBpYXnzYhYnVd/wNwl9DW3PspXwbZWlquvU8ndq1l6zzm/9Z2Ms
 jHlU/V+Cj9z2qjgPbAipggERD7vN+mLZJD88oCTUGrPBT9eVKuPbKuZBrtt01Y1UYPbg
 OtJCP+3nernL266el36h94jVbwk98vXd2vQnjhu4QVdYXhTe+6c+dYRx2+Up2YsN7xvd
 a9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dlLWZrIy6R69T+0RxdKISUof18f+oj7qL0+rpwclI9Q=;
 b=uBXYDK01iftJPUloD4PMd6A0a1Oxi3nXy7M1DAOsc18Q295mAfO+st9Jerbg/XDbHu
 Ed4TCG2HOXg8a1QxD4MNOviayb5iz1Q0IxoGZgebdk7Y6QsjaP14Vlop7EjUtWkv3Lhn
 Di8kmJGu/lqvumi9GH1BS5TmnA5KEZCghZzEQ0PypCvRsoB1pn+NKWH/GjgzsHbZnc/0
 hgz7iZPQK+LBQWTLe1dGyGcXDah0iUsXVm6l8SgX0jqcujlk1PD0AQFSGX2MpvMeFMTE
 cWGNYf7jLK3zb+2wRrXagPzP7SJoCFjfsFEezhmtp8qvPiHadXYODqShVZnOwtIXxlAk
 /iog==
X-Gm-Message-State: AOAM531QqR2Vql0IQt6D+00p2IwqaY3DC8/wigqjvwXS9dMqalUXQkqb
 oFiWbC/21Bq+lsNqKSb7oZ7lzA==
X-Google-Smtp-Source: ABdhPJxTIG1l0JLV+LUHEFjwB/9ntN9aIbvjRCJKn3vjHJRyQgMGHUy/WB5LS59Xy8aTKPshWnMfsA==
X-Received: by 2002:a17:90b:14d3:: with SMTP id
 jz19mr28643076pjb.196.1609743760002; 
 Sun, 03 Jan 2021 23:02:40 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id n195sm55117950pfd.169.2021.01.03.23.02.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:02:38 -0800 (PST)
Date: Mon, 4 Jan 2021 12:32:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Message-ID: <20210104070236.mnnj3frjtxka7emu@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-7-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-7-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 04 Jan 2021 17:01:51 +0000
Subject: Re: [Freedreno] [PATCH 06/31] serial: qcom_geni_serial: fix
 potential mem leak in qcom_geni_serial_probe()
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: nm@ti.com, ulf.hansson@linaro.org, gustavoars@kernel.org,
 jirislaby@kernel.org, airlied@linux.ie, linux-mmc@vger.kernel.org,
 stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, natechancellor@gmail.com, eric@anholt.net,
 thierry.reding@gmail.com, tongtiangen@huawei.com, groeck@chromium.org,
 marijn.suijten@somainline.org, digetx@gmail.com, steven.price@arm.com,
 festevam@gmail.com, mka@chromium.org, chandanu@codeaurora.org,
 emil.velikov@collabora.com, robh@kernel.org, linux-samsung-soc@vger.kernel.org,
 jonathan@marek.ca, harigovi@codeaurora.org, adrian.hunter@intel.com,
 vireshk@kernel.org, linux-pm@vger.kernel.org, kyungmin.park@samsung.com,
 krzk@kernel.org, jonathanh@nvidia.com, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, alyssa.rosenzweig@collabora.com,
 linux-serial@vger.kernel.org, airlied@redhat.com, smasetty@codeaurora.org,
 linux-imx@nxp.com, freedreno@lists.freedesktop.org, kernel@pengutronix.de,
 tzimmermann@suse.de, linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, jcrouse@codeaurora.org, broonie@kernel.org,
 rikard.falkeborn@gmail.com, kalyan_t@codeaurora.org,
 linux-tegra@vger.kernel.org, varar@codeaurora.org, jsanka@codeaurora.org,
 mchehab@kernel.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org, akashast@codeaurora.org, rnayak@codeaurora.org,
 parashar@codeaurora.org, tomeu.vizoso@collabora.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, rjw@rjwysocki.net,
 agross@kernel.org, linux-kernel@vger.kernel.org, robdclark@gmail.com,
 miaoqinglang@huawei.com, hoegsberg@google.com, yuq825@gmail.com,
 daniel@ffwll.ch, ddavenport@chromium.org, masneyb@onstation.org,
 shawnguo@kernel.org, georgi.djakov@linaro.org, lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01-01-21, 16:54, Yangtao Li wrote:
> We should use dev_pm_opp_put_clkname() to free opp table each time
> dev_pm_opp_of_add_table() got error.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 291649f02821..5aada7ebae35 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1438,9 +1438,12 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		return PTR_ERR(port->se.opp_table);
>  	/* OPP table is optional */
>  	ret = dev_pm_opp_of_add_table(&pdev->dev);
> -	if (ret && ret != -ENODEV) {
> -		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
> -		goto put_clkname;
> +	if (ret) {
> +		dev_pm_opp_put_clkname(port->se.opp_table);
> +		if (ret != -ENODEV) {
> +			dev_err(&pdev->dev, "invalid OPP table in device tree\n");
> +			return ret;
> +		}
>  	}
>  
>  	port->private_data.drv = drv;
> @@ -1482,7 +1485,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	return 0;
>  err:
>  	dev_pm_opp_of_remove_table(&pdev->dev);
> -put_clkname:
>  	dev_pm_opp_put_clkname(port->se.opp_table);
>  	return ret;
>  }

Since put_clkname is always done in remove(), I don't think there is
any memleak here. Over that with your patch we will do put_clkname
twice now, once in probe and once in remove. And that is a bug AFAICT.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
