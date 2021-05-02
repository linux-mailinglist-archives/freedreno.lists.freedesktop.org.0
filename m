Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD4370EDE
	for <lists+freedreno@lfdr.de>; Sun,  2 May 2021 21:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDD96E54C;
	Sun,  2 May 2021 19:54:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8FB6E544
 for <freedreno@lists.freedesktop.org>; Sun,  2 May 2021 19:54:10 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id a11so2532332ioo.0
 for <freedreno@lists.freedesktop.org>; Sun, 02 May 2021 12:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=1VGpYy/1zWV/NQYSTMPSWihj0KmJxGbDNurHwTwE9HM=;
 b=sAOdmZ7Tj6Yp46aAAgLBOcpyjoiQEzJ9bopaYE6PHeS+brnLFPq8BqP7sdPmsj5TEw
 TXDGHj92816H3Lym7ZWSfC5q47Mxmdej0df/PGvWbjg4liWZTSKmYqB/W2akMywyHty9
 FEgyEbJpZJmUBhWU8Gj0WaacVbx0gAHSi5+3W9uoAOu5M+oxgESk3wtK8KyDHOFn+dwf
 wrbm9YVPkxq2C5nbicmECMNEuBgGyke9RztfMIn6TNReCSDowu3oM4i5iOFSw+jGYVRL
 Ih5LhF08XqfqrsHllvytKkAX1f7oMEyroLyhPzrEzU3TULXWhCX0ORxgrVWcUCJ0bfkL
 ytWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=1VGpYy/1zWV/NQYSTMPSWihj0KmJxGbDNurHwTwE9HM=;
 b=MfEo3O3ylnnibB07+yW8F04x4YuZkAQ3WFRB149J8NZHSVPBe484dOMd6mlizuBm0E
 +hZnIFtXE/X3c5WCVm6c3cwyj8skzqRi4qxbIgDJuA9ch8mhbEAo2y9vlzX1wBbalj6d
 RDw35w1IvaQq2/uWEKKVATXtWA+tLiBfijffX1YNnSH+7bfwI7mUvXJNiBrqXgAt8+eB
 0zf9b8m0ZySXKPSFIIeYM9ufo9Llaq0NkSQH4qkbVRaM3v+7OWqy24+j4EOPJrNC772Y
 d2AhSuGxyxIkzaY4R0f66PQu0D6ZmzDwd5K5Qhd3+okE+a9S0J8aAP7ym7o2180yqePC
 xelQ==
X-Gm-Message-State: AOAM530HBUY/E75Vh09oGy8v/icJjHDDmxYPa4tTIzdh2tS/yiprBCX1
 7nmhxXMJBapN3T4ylzesy21Hdw==
X-Google-Smtp-Source: ABdhPJwP2mcqPGiTkoaaUbOq/rPQAYTRf2ATZL19JX8yuRctalk0esbxisYKWz4bz8l0wLe1q7+SqQ==
X-Received: by 2002:a5e:aa1a:: with SMTP id s26mr11533614ioe.95.1619985249561; 
 Sun, 02 May 2021 12:54:09 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id l7sm4479777ilh.49.2021.05.02.12.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 12:54:09 -0700 (PDT)
Date: Sun, 2 May 2021 13:54:07 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20210502195407.3packotroi5l5ie6@cosmicpenguin.net>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210423190833.25319-1-jonathan@marek.ca>
 <20210423190833.25319-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423190833.25319-4-jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH 3/5] drm/msm: use the right pgprot when
 mapping BOs in the kernel
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 03:08:19PM -0400, Jonathan Marek wrote:
> Use the same logic as the userspace mapping.
> 
> This fixes msm_rd with cached BOs.
> 

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 09abda42d764..0f58937be0a9 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -199,6 +199,15 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
>  	/* when we start tracking the pin count, then do something here */
>  }
>  
> +static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
> +{
> +	if (msm_obj->flags & MSM_BO_WC)
> +		return pgprot_writecombine(prot);
> +	if (msm_obj->flags & MSM_BO_UNCACHED)
> +		return pgprot_noncached(prot);
> +	return prot;
> +}
> +
>  int msm_gem_mmap_obj(struct drm_gem_object *obj,
>  		struct vm_area_struct *vma)
>  {
> @@ -206,13 +215,7 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
>  
>  	vma->vm_flags &= ~VM_PFNMAP;
>  	vma->vm_flags |= VM_MIXEDMAP;
> -
> -	if (msm_obj->flags & MSM_BO_WC)
> -		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> -	else if (msm_obj->flags & MSM_BO_UNCACHED)
> -		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
> -	else
> -		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> +	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
>  
>  	return 0;
>  }
> @@ -632,7 +635,7 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>  			goto fail;
>  		}
>  		msm_obj->vaddr = vmap(pages, obj->size >> PAGE_SHIFT,
> -				VM_MAP, pgprot_writecombine(PAGE_KERNEL));
> +				VM_MAP, msm_gem_pgprot(msm_obj, PAGE_KERNEL));
>  		if (msm_obj->vaddr == NULL) {
>  			ret = -ENOMEM;
>  			goto fail;
> -- 
> 2.26.1
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
