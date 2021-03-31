Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE535040D
	for <lists+freedreno@lfdr.de>; Wed, 31 Mar 2021 18:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443386E214;
	Wed, 31 Mar 2021 16:03:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7EB6E214
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:03:40 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id f16so24523141ljm.1
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5LKuJHnY2f7qCpjih2QE7ExZcNPVTuCmCBGxBDXYgbA=;
 b=H3yc9Ow/ee4WAZarDtEWtUCZjqJ2SsXmt5AUo6HL+JLKuGQxZAWs5dwlRHZWTgWIyE
 qIHARj0BQ+BN6WS2RunvcHWbffg7rKWEWYDEUvOKK/e8fru/jZSNMN6F1AcPS9J4/Pp3
 t/KQVAuIlkvsQLmw8YTBhTu71k0LsD/R5mNNOWMQd0K6831G1F5fd1MF8MffRN9MkfJR
 AoJzWhXyUyfYK8I/LUpSYbH9/SnRPzKrfF5M2U0zmG/aI65iqLMq6KiOkh9n2wZ7OdG3
 FnqTsGDRQapooMou/IFxYGZhwP76g05ijTbBSlqWJIAisj4NICDMOWoFjp9XG3ozj5b3
 j2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5LKuJHnY2f7qCpjih2QE7ExZcNPVTuCmCBGxBDXYgbA=;
 b=Nbpe34sngWusdDepKg9kuByQAB9TcH/hYyUjN1NRuJGvzlTHKD+8oFbQQBK6yLFZc1
 5JiYCjj3HjGbIQhS9lVu27mnf7BiUZ9c56cWk5t1mtclyCmvHeHglveEetRmdSsj4CBI
 to86t2u8VAG+h90dUm4d5K3rAHOyVr6mYVObBe1rYBdWd1L8taemhDmu1/LsiS+99nSk
 qqZc22Sow8ElExzJwx5d/pHccs4+Keotenuvo4PkV+/KxSgBylzkwWcAb4xv+nrpax+5
 DlYXwj30pS5HssJOYIYNHZOLFdMRB8Z/nDAZA5PqHkn+nu0PWhRZSH2X9pwj9YVflJs0
 D66A==
X-Gm-Message-State: AOAM530WQj26yFwzr/JRzLfzdhaIwyokzR7m/7byysAMjd42WDyuO4UJ
 SG0AdkJ9gyaPCGC+z4H6UmC6NA==
X-Google-Smtp-Source: ABdhPJydM4JPcYVS7QzSGSky5qgWKHISfXYt6rm2VK8r6Cgr3stz9azQ5jlBswpvlvj3bbx4cWCWsw==
X-Received: by 2002:a2e:5c47:: with SMTP id q68mr2607391ljb.314.1617206618828; 
 Wed, 31 Mar 2021 09:03:38 -0700 (PDT)
Received: from [192.168.43.7] ([94.25.228.171])
 by smtp.gmail.com with ESMTPSA id d34sm268115lfv.102.2021.03.31.09.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 09:03:38 -0700 (PDT)
To: Kalyan Thota <kalyan_t@codeaurora.org>, y@qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <84fdbdc7-7890-965a-bc6b-a19bd0ca4937@linaro.org>
Date: Wed, 31 Mar 2021 19:03:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: fix warn stack reported
 during dpu resume
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
Cc: mkrishn@codeaurora.org, hywu@google.com, linux-kernel@vger.kernel.org,
 steev@kali.org, dianders@chromium.org, mka@google.com, robdclark@gmail.com,
 midean@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/03/2021 14:27, Kalyan Thota wrote:
> WARN_ON was introduced by the below commit to catch runtime resumes
> that are getting triggered before icc path was set.
> 
> "drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume"
> 
> For the targets where the bw scaling is not enabled, this WARN_ON is
> a false alarm. Fix the WARN condition appropriately.

Should we change all DPU targets to use bw scaling to the mdp from the 
mdss nodes? The limitation to sc7180 looks artificial.

> 
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 +++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  9 +++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 11 ++++++-----
>   3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index cab387f..0071a4d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -294,6 +294,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>   	struct icc_path *path1;
>   	struct drm_device *dev = dpu_kms->dev;
>   
> +	if (!dpu_supports_bw_scaling(dev))
> +		return 0;
> +
>   	path0 = of_icc_get(dev->dev, "mdp0-mem");
>   	path1 = of_icc_get(dev->dev, "mdp1-mem");
>   
> @@ -934,8 +937,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   		DPU_DEBUG("REG_DMA is not defined");
>   	}
>   
> -	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
> -		dpu_kms_parse_data_bus_icc_path(dpu_kms);
> +	dpu_kms_parse_data_bus_icc_path(dpu_kms);
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   
> @@ -1198,7 +1200,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>   
>   	ddev = dpu_kms->dev;
>   
> -	WARN_ON(!(dpu_kms->num_paths));
> +	WARN_ON((dpu_supports_bw_scaling(ddev) && !dpu_kms->num_paths));
>   	/* Min vote of BW is required before turning on AXI clk */
>   	for (i = 0; i < dpu_kms->num_paths; i++)
>   		icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index d6717d6..f7bcc0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -154,6 +154,15 @@ struct vsync_info {
>   
>   #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
>   
> +/**
> + * dpu_supports_bw_scaling: returns true for drivers that support bw scaling.
> + * @dev: Pointer to drm_device structure
> + */
> +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
> +{
> +	return of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss");
> +}
> +
>   /* Global private object state for tracking resources that are shared across
>    * multiple kms objects (planes/crtcs/etc).
>    */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index cd40788..8cd712c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -41,6 +41,9 @@ static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
>   	struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
>   	struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
>   
> +	if (dpu_supports_bw_scaling(dev))
> +		return 0;
> +
>   	if (IS_ERR_OR_NULL(path0))
>   		return PTR_ERR_OR_ZERO(path0);
>   
> @@ -276,11 +279,9 @@ int dpu_mdss_init(struct drm_device *dev)
>   
>   	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
>   
> -	if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
> -		ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> +	if (ret)
> +		return ret;
>   
>   	mp = &dpu_mdss->mp;
>   	ret = msm_dss_parse_clock(pdev, mp);
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
