Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3A2E9B99
	for <lists+freedreno@lfdr.de>; Mon,  4 Jan 2021 18:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7E06E02F;
	Mon,  4 Jan 2021 17:01:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E324289B7B
 for <freedreno@lists.freedesktop.org>; Mon,  4 Jan 2021 07:32:49 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id x126so15954079pfc.7
 for <freedreno@lists.freedesktop.org>; Sun, 03 Jan 2021 23:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iRXPtY20D9orDIjb5tCwjmiIuDnS2goRBPjGMkiKUgk=;
 b=pYf9Tvqk/nYS1dsljbZYs4vnYyryXc1zZ8aFgpievKkuU/vwdqhMSLPp187p4iUzvk
 x97na1Zr5IZqGb1yry5b1l7NH6i0R3i19c2LMJof78NSIQ7AWfPL3L1gxGcKVpgpzzsW
 4LeiX2fUqlrZ4Lz3w8Dvgi/c43rEQRfyiHraEypHkBhucquIxrMWVhKoMbQkiMYxph+J
 cm/G2VFuGAfBI4oP322CJDvK17BbrTSHsAmuYQ8CKg2k9eDvZbTP5bqMJUpiEY7/iJSv
 p3pG+kTNMXRK2Yb9ytNFinssZq3pA2LVDEgeVCk9ox/hswNS46iqvElLD/oJZH9VD7bG
 d23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iRXPtY20D9orDIjb5tCwjmiIuDnS2goRBPjGMkiKUgk=;
 b=LzbTKV28Fs9e7kiDkTu6UlbS1ctqPpmr2e2kLMbHcVplNkKFlcuamAqNjwhUFpIEYs
 bgaB6zX5iGHUUcqP3lwKKZK6sPOBoPvUTSCpLvi9wfY6IZZuaMGL7xrmcsvVozlWS5sq
 +RElD1L87+Cvsugy0PSOgGuEuQteDQehANHXH+20MfLnYIO+uhXuLQuhd41/mZp98o58
 IAkX2yvLF5/gnxcVKTe7q71ZfE1JpUJOvpoK7XCtHKtfChlmGZZEytK//Mu0pKUf98vd
 KFizD3ko2pIbet2HO43PjHwxEgiSB0Bqf3QkDobZVsi+2k76U5O1T78Cu9pa4k2dGPlc
 uHaQ==
X-Gm-Message-State: AOAM532e22yyCDxrHN39WxPlu9jComgoqv+tmXLUZt7jMJI6V6QVQkLa
 wFohEUA+sTdy/yHM2/fNKERNmQ==
X-Google-Smtp-Source: ABdhPJxg1RuXm4l0IeX5T2nfNwUfb9eKCIJWL14v0Jtf8jWZLkym1C7f5dh7jOgWjIh5IRoQRH0klg==
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id
 t8-20020aa793880000b029019e06486480mr39127516pfe.21.1609745569526; 
 Sun, 03 Jan 2021 23:32:49 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id e5sm54143912pfc.76.2021.01.03.23.32.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:32:48 -0800 (PST)
Date: Mon, 4 Jan 2021 13:02:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Message-ID: <20210104073246.vub5fhfwfdbwxkdx@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-19-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-19-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 04 Jan 2021 17:01:51 +0000
Subject: Re: [Freedreno] [PATCH 18/31] drm/lima: remove unneeded
 devm_devfreq_remove_device()
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
> There is no need to manually release devm related resources.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index d5937cf86504..7690c5c69f9f 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -94,11 +94,6 @@ void lima_devfreq_fini(struct lima_device *ldev)
>  		devfreq_cooling_unregister(devfreq->cooling);
>  		devfreq->cooling = NULL;
>  	}
> -
> -	if (devfreq->devfreq) {
> -		devm_devfreq_remove_device(ldev->dev, devfreq->devfreq);
> -		devfreq->devfreq = NULL;
> -	}
>  }

Why is this part of this patchset ?

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
