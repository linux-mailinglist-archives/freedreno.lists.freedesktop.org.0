Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2B661A83
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 23:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9B110E048;
	Sun,  8 Jan 2023 22:42:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985B510E050
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 22:42:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bq39so10421049lfb.0
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U+gHbx+gCIi2HWumnpJEZuh617XPeArEnKugXGoN56U=;
 b=Mbs1M7eoVfi549MvP93DkyztZl9K0GGdAor+b7LWFpAM9FiQ2jCmOMLEJIY41jlrsF
 gVeO4HWLnnIz7G+J7NsfCpaAJWaqOtG3/btPP4HJzh5ltsArFV+DEMjGt/vsaDRymOb2
 WMqeBzKBwbCk1kus/Eq5Qf7FIMnvlRa/tmi8jW07XJcaO0nJlrVu70epNCU2siF5PFiS
 rJXHmLzUMLGM/HcYGO8gvOIZFvXZRzgUEtXhX+raFvB0eDng8LEcoIUX+OVy1I67eeQo
 6kJ43JaQLc2IPxHqJlvhZ99plDtHWIWB5BwENRGzAkNB8g/oUw1rHdhH8SubJ4+4TtPy
 l2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U+gHbx+gCIi2HWumnpJEZuh617XPeArEnKugXGoN56U=;
 b=diUL5MHpP+vz+GfbNXsSieJr8s4Iqxb9PCMcONyekRaZ8ztRShMeb1Z2JEi7pjENkx
 7Q5BvRl+YHzBLO+jIZpCgqTNT8OvY1/afOnNHLhdJv8docrqUl4H2LQlLA6Kerxb5dK5
 rRxi5Mk6oSs692sGFX3ID+V0ydM76/ePJzXCt6rE8jayQ0yZ8N5iLJ+U3N59ZuSwuUJM
 LKviVYUrZHIZIbcnMufErzxvfWa8lWRwaGJH0wIfqsDv3WGm68Mi4e4vavDypLiY6j/C
 WLnrkaiwoLo6jAmZof+koxLhcT5Vqsm9N9fuYsL2hJaIULC4Es40QFHPTCDm3i2ns7gP
 My4w==
X-Gm-Message-State: AFqh2krzgHNXWFYAwYxdmAItnqEImAlHaa9ZBFxzGo+rJxUrVblS+GmW
 k4TwL7oEnrKUhLvT3OVka+svvA==
X-Google-Smtp-Source: AMrXdXsHFuuepdYa8vE9EqOF0qwKtR2eM1Dh7AEetug97Bc7kHio1DKYCB8SLj2r6PKpBI5rSoW9zA==
X-Received: by 2002:a05:6512:130c:b0:4cb:e53:d54b with SMTP id
 x12-20020a056512130c00b004cb0e53d54bmr13981866lfu.25.1673217741957; 
 Sun, 08 Jan 2023 14:42:21 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bu31-20020a056512169f00b004b54ca56cf9sm1266258lfb.303.2023.01.08.14.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 14:42:21 -0800 (PST)
Message-ID: <9f10957e-3c77-d5e5-107e-12fdb63c9a04@linaro.org>
Date: Mon, 9 Jan 2023 00:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, marijn.suijten@somainline.org, vkoul@kernel.org,
 dianders@chromium.org, marex@denx.de, vladimir.lypak@gmail.com
References: <20230106025609.29499-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230106025609.29499-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Add missing check for
 alloc_ordered_workqueue
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/01/2023 04:56, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference.
> Moreover, change the "return ret" into "goto fail" in order to be
> consistent with the others.
> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Fixes: 32d3e0feccfe ("drm/msm: dsi: Use OPP API to set clk/perf state")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 89aadd3b3202..12239f628d5a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1944,19 +1944,19 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   
>   	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
>   	if (ret)
> -		return ret;
> +		goto fail;

fail: is just 'return ret', so these changes are not required. Instead 
the fail label can be dropped.

>   	/* OPP table is optional */
>   	ret = devm_pm_opp_of_add_table(&pdev->dev);
>   	if (ret && ret != -ENODEV) {
>   		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
> -		return ret;
> +		goto fail;
>   	}
>   
>   	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>   	if (msm_host->irq < 0) {
>   		ret = msm_host->irq;
>   		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
> -		return ret;
> +		goto fail;
>   	}
>   
>   	/* do not autoenable, will be enabled later */
> @@ -1966,7 +1966,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
>   				msm_host->irq, ret);
> -		return ret;
> +		goto fail;
>   	}
>   
>   	init_completion(&msm_host->dma_comp);
> @@ -1977,6 +1977,11 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   
>   	/* setup workqueue */
>   	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
> +	if (!msm_host->workqueue) {
> +		ret = -ENOMEM;
> +		goto fail;
> +	}
> +
>   	INIT_WORK(&msm_host->err_work, dsi_err_worker);
>   
>   	msm_dsi->id = msm_host->id;

-- 
With best wishes
Dmitry

