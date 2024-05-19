Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A68C93D3
	for <lists+freedreno@lfdr.de>; Sun, 19 May 2024 10:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF5010E14C;
	Sun, 19 May 2024 08:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zpmb+UkU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE03110E14C
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 08:16:35 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51ff65b1e14so3792593e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716106593; x=1716711393; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nqscv5hPY4OsF6W8djpNx/MqPGz0oq15EeGyLjqSwyg=;
 b=zpmb+UkUaG3zqSRoXUY0xLFCslwZ0VN7kJQo7WJ2b6lEdN10TQkWQ9W+Ne6HgdC+op
 6pRBCrQKSNPrOK+2AoKLl6MWwvhsuta3XuueE09B/LSCDrSo35HawE3xdxS5p3zvN182
 HwZxYB+8oEjsyRNG1l4laVcJhJNyiDYhVcep8mpLPP9lQF7G59EDCtj9sB5ZEPvjo/Uk
 qh7HbD1EtPnk+2d6fzhv8RAdBrFOHQb899GEV62OxKsGsYTHIf+p34sutACOajO5JJe5
 k8Yl4sd51Ru39i7ss7TG5eLkzzKw5vVlgD8kYzaKoUEhIFOzCKOdXoj1v7gP187hAzhf
 +ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716106593; x=1716711393;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqscv5hPY4OsF6W8djpNx/MqPGz0oq15EeGyLjqSwyg=;
 b=nb1ZTxuuVjfTqiG7WvX/7hY5DpN2fwRUangKbdcQUZzXcyHcXP8DlUqRUXf8dSyfxT
 MnDhoY61MN3ohyBEz6U+TV72u4ckG8npDqvPL/pegKIo2ggUyTsPua9o4LrVMGApNU2p
 wYOxzb2dy0/HA8gXDruarEU9ywBLB44X+2qaggFqoYObwWzdITKMbh8xBLNd1ex2kHfE
 1/ChmqWxLBrDWJKbiOGE2elhRO+iAPruF4GvRbZSs1ltUg97/9C3mH51+7qCzXBVZ3Bz
 XP2n6VDr9o6gpPklUGOZwqXRhVhnk1V8GxVDaTXbBY40J+NLspGStTb3ztooiXgZK08R
 PgbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiqAHZYhsOhs+3TVsqcRvsAlg0x+jg+WiaUiZa9CIjFJUJE2dx4bV3MJOPNKWNgttXR5yxd7eBnUllDDP95dZNg+rJjZIyjARnPmLVImM/
X-Gm-Message-State: AOJu0YwUhc+9nGoHq90W96e7S0+oP8zgndJ/fCS0Z7IYVxPnHRlSy0Mr
 LiLIZr5P0fMVnpDPW/oLvRczzX4Y4WS99Z7cfpK9u3IZYOILMUsxWC0P8TxvegQ=
X-Google-Smtp-Source: AGHT+IFRGaG2cgRyfRkJRXqkedyOipsI0+xvINvklLqDqBRjRxo9DNXLPfaP4ViVN92ReZ3cfEXEYA==
X-Received: by 2002:ac2:4c55:0:b0:51f:4165:9305 with SMTP id
 2adb3069b0e04-5221007016dmr19852722e87.55.1716106592716; 
 Sun, 19 May 2024 01:16:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d31aasm3904344e87.283.2024.05.19.01.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 01:16:32 -0700 (PDT)
Date: Sun, 19 May 2024 11:16:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/a6xx: request memory region
Message-ID: <4susqladik7qzknlggchehmfyzeaccc7j27jtpvgrfm4pc7bqk@weiwasipz674>
References: <20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, May 12, 2024 at 05:03:53AM -0400, Kiarash Hajian wrote:
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
> 
> Implement the region-request through the corresponding managed
> devres-function.
> 
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> Changes in v4:
> - Combine v3 commits into a singel commit
> - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
> 
> Changes in v3:
> - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
> 
> Changes in v2:
> - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..cf0b3b3d8f34 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -524,9 +524,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	uint32_t pdc_address_offset;
>  	bool pdc_in_aop = false;
>  
> -	if (IS_ERR(pdcptr))
> -		goto err;

So, if there is an error, we just continue through? What about the code
that accesses the region afterwards?

If error handling becomes void, then there should be an early return
instead of dropping the error check completely.

> -
>  	if (adreno_is_a650(adreno_gpu) ||
>  	    adreno_is_a660_family(adreno_gpu) ||
>  	    adreno_is_a7xx(adreno_gpu))
> @@ -540,8 +537,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  
>  	if (!pdc_in_aop) {
>  		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> -		if (IS_ERR(seqptr))
> -			goto err;

Same question.

>  	}
>  
>  	/* Disable SDE clock gating */
> @@ -633,12 +628,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	wmb();
>  
>  	a6xx_rpmh_stop(gmu);
> -
> -err:
> -	if (!IS_ERR_OR_NULL(pdcptr))
> -		iounmap(pdcptr);
> -	if (!IS_ERR_OR_NULL(seqptr))
> -		iounmap(seqptr);
>  }
>  
>  /*
> @@ -1503,7 +1492,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	ret = ioremap(res->start, resource_size(res));
> +	ret = devm_ioremap_resource(&pdev->dev, res);
>  	if (!ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>  		return ERR_PTR(-EINVAL);
> @@ -1613,13 +1602,11 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
>  	if (IS_ERR(gmu->mmio)) {
>  		ret = PTR_ERR(gmu->mmio);
> -		goto err_mmio;

And this is even worse. See the comment below.

>  	}
>  
>  	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
>  	if (IS_ERR(gmu->cxpd)) {
>  		ret = PTR_ERR(gmu->cxpd);
> -		goto err_mmio;
>  	}
>  
>  	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
> @@ -1635,7 +1622,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
>  	if (IS_ERR(gmu->gxpd)) {
>  		ret = PTR_ERR(gmu->gxpd);
> -		goto err_mmio;
>  	}
>  
>  	gmu->initialized = true;
> @@ -1645,9 +1631,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  detach_cxpd:
>  	dev_pm_domain_detach(gmu->cxpd, false);
>  
> -err_mmio:
> -	iounmap(gmu->mmio);
> -

You have dropped the iounmap(). However now the error path should
remain. The put_device() must be called. So fix the label name and just
drop the iounmap().

>  	/* Drop reference taken in of_find_device_by_node */
>  	put_device(gmu->dev);
>  
> @@ -1825,9 +1808,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	dev_pm_domain_detach(gmu->cxpd, false);
>  
>  err_mmio:
> -	iounmap(gmu->mmio);
> -	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -		iounmap(gmu->rscc);

Same comment here.

>  	free_irq(gmu->gmu_irq, gmu);
>  	free_irq(gmu->hfi_irq, gmu);
>  
> 
> ---
> base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
> change-id: 20240511-msm-adreno-memory-region-2bcb1c958621
> 
> Best regards,
> -- 
> Kiarash Hajian <kiarash8112hajian@gmail.com>
> 

-- 
With best wishes
Dmitry
