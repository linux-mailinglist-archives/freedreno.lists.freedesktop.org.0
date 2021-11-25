Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A53845DD4B
	for <lists+freedreno@lfdr.de>; Thu, 25 Nov 2021 16:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9766E512;
	Thu, 25 Nov 2021 15:23:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E4C6E512
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 15:23:15 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id t11so13180122ljh.6
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 07:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sxzqCasNxA7qRgMjVwT1csJbgO3GvixtCu6AQo1EYeI=;
 b=SpB+0M0vVLE0uF0PFlJb8bKhun7f9KV16pkOEEmQAhOR9GO3puJOqNx+rJcnAlnAgA
 3BQjlDwr3YLXoX+eoYz/TXecnGLIqOwemzUYaRlvms1i9kW3YNs0Grhs2Rn6jLDrXmWm
 XWnq3cpiHM1ouDdLSspLnPtSk8xWnJQCnRSOjXidgyY+ggMlI5N/VRMzmwtWxhxyYIxi
 5tHAcGy/K6ZXCyMhWt1CBLLIGwzcprxwzRCIZBpvq+cHLaSfAZSWYPl5wfQMhPqMWtPV
 qIUvKEmhdvHt71LKoNrmWG6MinIt0IUGJXp3ZHfH8jI4RD4/xj+fAhiCzULjGvQVXJZl
 wnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sxzqCasNxA7qRgMjVwT1csJbgO3GvixtCu6AQo1EYeI=;
 b=n6gP/c9eEflkU6COSKkujVJZI3nqhlM4G1O5dZO2MQCoTIftTfKqrT5OfLvaSUFgm/
 tAwLE7XyxsGaMDSOLL0jw8zIVNA724MDYQqZrI8LpPJWYWgd8kiuAcAopuWXqd60BNV7
 I7vvydDYAa5kvKMQlrk+FRUdkow5+SBFEBdyj7y4iOAQGK7FOkSW63thNJ0G6P6+LJ5g
 Mor+0TwglDdANMWMFOksz7Msr0YWj28SjrC0JcFWMD8sXMN0E6sZtx+EVFK3xTelHqgo
 wCJpMT9kWvSyb5Tr4Lv42Wrik9R/6DZUD8TtuE6W8Owpq92YHHcRTo/e3iRfnsdZQ6wN
 41zw==
X-Gm-Message-State: AOAM530M4e1I3vF/kMlqxLBOkZw0V9eN1yD7UE4PqNRfqaHsfD18amhw
 6JNlP+KwW86Z9b4iL0x/3wXM+g==
X-Google-Smtp-Source: ABdhPJxeBLzfNimdd6oAm7pxLGyKllBio1+VyIJ/j4DfsEL/pzxmrOWddM1Q1xgJ02wvS/0sXuNrwQ==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr25221282ljm.168.1637853793539; 
 Thu, 25 Nov 2021 07:23:13 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l15sm283301lfe.309.2021.11.25.07.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 07:23:13 -0800 (PST)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robdclark@gmail.com
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <abfbff6c-14fb-b797-6abd-dcf02d495193@linaro.org>
Date: Thu, 25 Nov 2021 18:23:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Initialize MDSS irq domain at
 probe time
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jami.kettunen@somainline.org, maxime@cerno.tech, daniel@ffwll.ch,
 marijn.suijten@somainline.org, kernel@collabora.com, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/11/2021 18:09, AngeloGioacchino Del Regno wrote:
> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
> DSI host gets initialized earlier, but this caused unability to probe
> the entire stack of components because they all depend on interrupts
> coming from the main `mdss` node (mdp5, or dpu1).
> 
> To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
> them at msm_pdev_probe() time: this will make sure that we add the
> required interrupt controller mapping before dsi and/or other components
> try to initialize, finally satisfying the dependency.
> 
> While at it, also change the allocation of msm_drm_private to use the
> devm variant of kzalloc().
> 
> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 81 ++++++++++++++++-------------------
>   1 file changed, 38 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7936e8d498dd..790acf4993c0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -512,45 +512,12 @@ static int msm_init_vram(struct drm_device *dev)
>   static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> -	struct drm_device *ddev;
> -	struct msm_drm_private *priv;
> -	struct msm_kms *kms;
> -	struct msm_mdss *mdss;
> +	struct drm_device *ddev = platform_get_drvdata(pdev);
> +	struct msm_drm_private *priv = ddev->dev_private;
> +	struct msm_kms *kms = priv->kms;
> +	struct msm_mdss *mdss = priv->mdss;
>   	int ret, i;
>   
> -	ddev = drm_dev_alloc(drv, dev);
> -	if (IS_ERR(ddev)) {
> -		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
> -		return PTR_ERR(ddev);
> -	}
> -
> -	platform_set_drvdata(pdev, ddev);
> -
> -	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		ret = -ENOMEM;
> -		goto err_put_drm_dev;
> -	}
> -
> -	ddev->dev_private = priv;
> -	priv->dev = ddev;
> -
> -	switch (get_mdp_ver(pdev)) {
> -	case KMS_MDP5:
> -		ret = mdp5_mdss_init(ddev);
> -		break;
> -	case KMS_DPU:
> -		ret = dpu_mdss_init(ddev);
> -		break;
> -	default:
> -		ret = 0;
> -		break;
> -	}
> -	if (ret)
> -		goto err_free_priv;
> -
> -	mdss = priv->mdss;
> -
>   	priv->wq = alloc_ordered_workqueue("msm", 0);
>   	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
>   
> @@ -685,11 +652,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   err_destroy_mdss:
>   	if (mdss && mdss->funcs)
>   		mdss->funcs->destroy(ddev);
> -err_free_priv:
> -	kfree(priv);
> -err_put_drm_dev:
> -	drm_dev_put(ddev);
> -	platform_set_drvdata(pdev, NULL);
>   	return ret;
>   }
>   
> @@ -1382,12 +1344,42 @@ static const struct component_master_ops msm_drm_ops = {
>   static int msm_pdev_probe(struct platform_device *pdev)
>   {
>   	struct component_match *match = NULL;
> +	struct msm_drm_private *priv;
> +	struct drm_device *ddev;
>   	int ret;
>   
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ddev = drm_dev_alloc(&msm_driver, &pdev->dev);
> +	if (IS_ERR(ddev)) {
> +		DRM_DEV_ERROR(&pdev->dev, "failed to allocate drm_device\n");
> +		return PTR_ERR(ddev);
> +	}
> +
> +	platform_set_drvdata(pdev, ddev);
> +	ddev->dev_private = priv;
> +	priv->dev = ddev;
> +
> +	switch (get_mdp_ver(pdev)) {
> +	case KMS_MDP5:
> +		ret = mdp5_mdss_init(ddev);
> +		break;
> +	case KMS_DPU:
> +		ret = dpu_mdss_init(ddev);
> +		break;
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +	if (ret)
> +		goto err_put_drm_dev;
> +
>   	if (get_mdp_ver(pdev)) {
>   		ret = add_display_components(pdev, &match);
>   		if (ret)
> -			return ret;
> +			goto fail;
>   	}
>   
>   	ret = add_gpu_components(&pdev->dev, &match);
> @@ -1409,6 +1401,9 @@ static int msm_pdev_probe(struct platform_device *pdev)
>   
>   fail:
>   	of_platform_depopulate(&pdev->dev);
> +err_put_drm_dev:
> +	drm_dev_put(ddev);
> +	platform_set_drvdata(pdev, NULL);
>   	return ret;
>   }
>   
> 


-- 
With best wishes
Dmitry
