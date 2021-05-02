Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42773370ED6
	for <lists+freedreno@lfdr.de>; Sun,  2 May 2021 21:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18026E542;
	Sun,  2 May 2021 19:51:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C836E546
 for <freedreno@lists.freedesktop.org>; Sun,  2 May 2021 19:51:32 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id z14so2488182ioc.12
 for <freedreno@lists.freedesktop.org>; Sun, 02 May 2021 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6wTSvRjZRCi7xWaHiuXeBW7eizhhGCMmkX8gXontjew=;
 b=yHlSVYqKpW87aQPAUbBHrY2IZxb40wNCc3Amztn6HHkkrwkJOgSL9p/15fPdMBvQHq
 cRWFvkAhN+yS18R4hU4CCXEgPOw0IajehcefiMLA7+nrsjUmf/MWvNPPi0sewfwJ++Xi
 kNsEUWVt5wJQ538dsJACfI+oe1rU6es0dQLtD9haznjCBlaKetoT6Wo7+rXVNKgV/TvG
 LHicek52p/T8LqxlWgwddH0WPHdBo6ekCCTZKSeVIKRArSc7q+OYG+skOIngZC3n1Wjr
 7cYbPSPLiJG0nZ/KJweEoOO7mw9wAHR6XarEWo+s5sEKPfiFj+y+u9KEHMNK+Rj6wo13
 QIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6wTSvRjZRCi7xWaHiuXeBW7eizhhGCMmkX8gXontjew=;
 b=jvs815Zez4a6bZdsyMSj14e4B8EkkYUPmPc8Y6zxLuDrhG0Oeq1N2Kqi4+92fJLFRU
 YAG8nkzb7d/MVfRmA7nXnZd8224WRZ8g1zHN4yhC8+XUmpU6CdXKwiVv6/p5jSjO0EvJ
 jfmKHT+zrjkzC+6ATBrODJpOv5iiGQOd2Ul/d0asuhDh2YaA7rhgl07E2Nd5jnxUsiqM
 bmkAE1nMwb0WqMje5Ze8Va80/SwRGNmi17KtxKB+A+QOlEQm+oxb2idpS268PGEh3+hH
 I2TR1ftDcMPC4pOTnl+rVaTn8KazIEAnCe1TYOl4M1xm8ACxp0CcbuYj3/bjb8S76jWy
 czNw==
X-Gm-Message-State: AOAM530mxSpD9vcHvNngmZGv8/iGGkVMl4p6VTHaLuGnWkwJkQZqzXWL
 lqe6DdUWLbX5KgBU8U7JTAtWVQ==
X-Google-Smtp-Source: ABdhPJxp10aKOLy+kwLqwyA0HIpwpx3dNzwSCoRuQezU/nzXYRn+E/Iz8jRZ77Q++14vSEI3kxyaiA==
X-Received: by 2002:a02:cc:: with SMTP id 195mr15669716jaa.73.1619985091752;
 Sun, 02 May 2021 12:51:31 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id w10sm4473063ilm.38.2021.05.02.12.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 12:51:31 -0700 (PDT)
Date: Sun, 2 May 2021 13:51:29 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20210502195129.jqayhebdlslpet67@cosmicpenguin.net>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
References: <20210423190833.25319-1-jonathan@marek.ca>
 <20210423190833.25319-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423190833.25319-2-jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm: remove unnecessary mmap logic
 for cached BOs
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 03:08:17PM -0400, Jonathan Marek wrote:
> No one knows what this is for anymore, so just remove it.

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index b199942266a2..09abda42d764 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -207,21 +207,12 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
>  	vma->vm_flags &= ~VM_PFNMAP;
>  	vma->vm_flags |= VM_MIXEDMAP;
>  
> -	if (msm_obj->flags & MSM_BO_WC) {
> +	if (msm_obj->flags & MSM_BO_WC)
>  		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> -	} else if (msm_obj->flags & MSM_BO_UNCACHED) {
> +	else if (msm_obj->flags & MSM_BO_UNCACHED)
>  		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
> -	} else {
> -		/*
> -		 * Shunt off cached objs to shmem file so they have their own
> -		 * address_space (so unmap_mapping_range does what we want,
> -		 * in particular in the case of mmap'd dmabufs)
> -		 */
> -		vma->vm_pgoff = 0;
> -		vma_set_file(vma, obj->filp);
> -
> +	else
>  		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> -	}
>  
>  	return 0;
>  }
> -- 
> 2.26.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
