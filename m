Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB2C289135
	for <lists+freedreno@lfdr.de>; Fri,  9 Oct 2020 20:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DEC6ECEE;
	Fri,  9 Oct 2020 18:36:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B69B6ED80
 for <freedreno@lists.freedesktop.org>; Fri,  9 Oct 2020 18:36:42 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id o9so4859184plx.10
 for <freedreno@lists.freedesktop.org>; Fri, 09 Oct 2020 11:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RXaGCdzadhTSxJ90I/Q7ZO/dbk1lXiLeLP1YwXiDqbc=;
 b=i2SNn6sNaeePDINrDzF4Un/NDOxiB/WDjhMRR7QYro6nFfGDoYlgKzGa8iPs4M7m8b
 l/EdsCwFS7iNoU+1E5p429Nek58Q2uxCYySkwzwFS13mkgGopfmG7U/C3eZyPcnNVc4f
 QzdpUiLdxijdg8o32oY/xuVkpM01gyTBN0X5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RXaGCdzadhTSxJ90I/Q7ZO/dbk1lXiLeLP1YwXiDqbc=;
 b=C/R59U0azi5j5On3GUUpW5cCOulaM9LJ3g4V66pV9PEL21NI8RpY6InenqznV9O5Ct
 ahngq8wlfuGq7cEINzjNWaJhb4vRqWyGeE1QRWPlEgng6CVL7b2lXH8xKG287l+Ccx6L
 tT7meylIaMuffxNVzBYdiqTNi1CkgZ429Wlzx57kAJ/sHhtA4rPuAP9VSix7LBlBtseQ
 1ssEbMJFuNBGqkOzh72fvgziTJnSsprn1n0zdFHGl4eTliEPVTDA7igaxnlR6c2iNc4P
 2MtimLX2ioryvN67fZJZcBL8pAdARaiwX+Uh6+RHswbA08jORa1NWO1MgRE7TvJK/XFA
 BHpA==
X-Gm-Message-State: AOAM531sV1cy5MEQjhLAx6/lDlOMrZNCh8vhXPnxym8odA8GGtqQp/vd
 q7o6YSDUwqdpkleUbFGDJRaA9g==
X-Google-Smtp-Source: ABdhPJwDW/lNdv+r3y/iNReVvFRv6ckaeyTfiWYvv2Vr4ysFwwuvuddVKMCxbkvFjq8v7CAlF3fLxQ==
X-Received: by 2002:a17:902:7687:b029:d2:8d1f:1079 with SMTP id
 m7-20020a1709027687b02900d28d1f1079mr13523250pll.2.1602268601939; 
 Fri, 09 Oct 2020 11:36:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id bj17sm12423393pjb.15.2020.10.09.11.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 11:36:41 -0700 (PDT)
Date: Fri, 9 Oct 2020 11:36:40 -0700
From: mka@chromium.org
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20201009183640.GB1292413@google.com>
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [2/2] drm/msm: Add support for GPU cooling
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
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Akhil,

On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
> Register GPU as a devfreq cooling device so that it can be passively
> cooled by the thermal framework.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.h |  2 ++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 55d1648..93ffd66 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -14,6 +14,7 @@
>  #include <generated/utsrelease.h>
>  #include <linux/string_helpers.h>
>  #include <linux/devfreq.h>
> +#include <linux/devfreq_cooling.h>
>  #include <linux/devcoredump.h>
>  #include <linux/sched/task.h>
>  
> @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
>  	if (IS_ERR(gpu->devfreq.devfreq)) {
>  		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
>  		gpu->devfreq.devfreq = NULL;
> +		return;
>  	}
>  
>  	devfreq_suspend_device(gpu->devfreq.devfreq);
> +
> +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> +			gpu->devfreq.devfreq);
> +	if (IS_ERR(gpu->cooling)) {
> +		DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Couldn't register GPU cooling device\n");
> +		gpu->cooling = NULL;
> +	}
>  }
>  
>  static int enable_pwrrail(struct msm_gpu *gpu)
> @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	msm_devfreq_init(gpu);
>  
> -
>  	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
>  
>  	if (gpu->aspace == NULL)
> @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>  		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
>  		msm_gem_address_space_put(gpu->aspace);
>  	}
> +
> +	devfreq_cooling_unregister(gpu->cooling);

Resources should be released in reverse order, otherwise the cooling device
could use resources that have already been freed.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
