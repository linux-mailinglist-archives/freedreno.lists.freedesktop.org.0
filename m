Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E895A216E12
	for <lists+freedreno@lfdr.de>; Tue,  7 Jul 2020 15:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711376E073;
	Tue,  7 Jul 2020 13:50:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAADE6E05D
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jul 2020 10:48:38 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id by13so28106191edb.11
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jul 2020 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OZw9WF+sLD7+S/P+7F6VJUju0c1b8KGkxnX1D6C0CBY=;
 b=VLodcZ+XVy6S8cm4qwMKpTFvUNqrFoZEbNt/c4CCapdXa7iXxB5CpvNSLzMPaFPdid
 LHVLihcWQ+Q2oZcjFMyUezBnO/uav7shIwwBtxbaIyBR/zcLXsQS3hdDHRtl1BwJhVyX
 KeCZh+yMfxSDW58BnTwMioYFGPuHU+T9iquLZmLY6QmsymaYnOtBvwmEIYQEQ+xRvPqJ
 Hm8Bi7plNgs/1ulVCD/3t3wD59OEGJ1ktz5X1+9/Rg5i4YrlUspH4ZnC3eTYsuIz9enK
 x0tUCUdT5vuKNswGw+11te2bqgOsOYOEGxaKk3OcG4qgEqfCgyzCD71pXavPIJ7HIoBp
 WgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OZw9WF+sLD7+S/P+7F6VJUju0c1b8KGkxnX1D6C0CBY=;
 b=Nr80yBItd+7/Bf8jsIicyXI1LXiRqDssjcLPibxkMHC/Glae49Vz7VBMp9s5B/mZWb
 RfD5YGkmzd8TfpIrNJCrWtNz17rmriQcBSq1Jq+TKJ9+acfjLBrJtFdEKbrciYe/Qcnh
 yMPFtwsBF3S1/QYX6Jv5wSygPEjDA6JT/LlLbyjSJJCC0iXSZz6QrKYWVIvsvaSo9D8j
 gYSAZjbr+7giGRtGx5R61CrMvtfgBwVvIMvg65Z36CMBLVdo8mD0l3s1QEGC5KU5fQ3i
 T/G+v8Dc6c+VJq+rII9MowDGx9P/d2brJNLxyh6a2lSMOMmNItN67GgAAZwhsPqE/yci
 TA3A==
X-Gm-Message-State: AOAM533nEIMoWZ8Fq9Y7FmPbpgoqyu9boXovJ6P3+tr5vF8qFe8W3Uf/
 QkFFt/PpPb+xxv7QOGAUUToygg==
X-Google-Smtp-Source: ABdhPJxMCfYoXtG9EMvYyx83jtYoaHCy9ePgt3od0RIGDNDJYG7oY/Sdl2HKdoTPTHU2HCFZPmLE6A==
X-Received: by 2002:a05:6402:16db:: with SMTP id
 r27mr61765206edx.139.1594118917429; 
 Tue, 07 Jul 2020 03:48:37 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id t25sm174229ejc.34.2020.07.07.03.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:48:36 -0700 (PDT)
Date: Tue, 7 Jul 2020 12:48:25 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200707104825.GA159413@myrica>
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-2-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626200414.14382-2-jcrouse@codeaurora.org>
X-Mailman-Approved-At: Tue, 07 Jul 2020 13:50:56 +0000
Subject: Re: [Freedreno] [PATCH v2 1/6] iommu/arm-smmu: Add auxiliary domain
 support for arm-smmuv2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, John Stultz <john.stultz@linaro.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Jordan,

On Fri, Jun 26, 2020 at 02:04:09PM -0600, Jordan Crouse wrote:
> Support auxiliary domains for arm-smmu-v2 to initialize and support
> multiple pagetables for a single SMMU context bank. Since the smmu-v2
> hardware doesn't have any built in support for switching the pagetable
> base it is left as an exercise to the caller to actually use the pagetable.
> 
> Aux domains are supported if split pagetable (TTBR1) support has been
> enabled on the master domain.  Each auxiliary domain will reuse the
> configuration of the master domain. By default the a domain with TTBR1
> support will have the TTBR0 region disabled so the first attached aux
> domain will enable the TTBR0 region in the hardware and conversely the
> last domain to be detached will disable TTBR0 translations.  All subsequent
> auxiliary domains create a pagetable but not touch the hardware.
> 
> The leaf driver will be able to query the physical address of the
> pagetable with the DOMAIN_ATTR_PTBASE attribute so that it can use the
> address with whatever means it has to switch the pagetable base.
> 
> Following is a pseudo code example of how a domain can be created
> 
>  /* Check to see if aux domains are supported */
>  if (iommu_dev_has_feature(dev, IOMMU_DEV_FEAT_AUX)) {
> 	 iommu = iommu_domain_alloc(...);
> 

The device driver should also call iommu_dev_enable_feature() before using
the AUX feature. I see that you implement them as NOPs and in this case
the GPU is tightly coupled with the SMMU so interoperability between
different IOMMU and device drivers doesn't matter much, but I think it's
still a good idea to follow the same patterns in all drivers to make
future work on the core IOMMU easier.

> 	 if (iommu_aux_attach_device(domain, dev))
> 		 return FAIL;
> 
> 	/* Save the base address of the pagetable for use by the driver
> 	iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
>  }
> 
> Then 'domain' can be used like any other iommu domain to map and
> unmap iova addresses in the pagetable.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm-smmu.c | 219 ++++++++++++++++++++++++++++++++++++---
>  drivers/iommu/arm-smmu.h |   1 +
>  2 files changed, 204 insertions(+), 16 deletions(-)
[...]
> @@ -1653,6 +1836,10 @@ static struct iommu_ops arm_smmu_ops = {
>  	.get_resv_regions	= arm_smmu_get_resv_regions,
>  	.put_resv_regions	= generic_iommu_put_resv_regions,
>  	.def_domain_type	= arm_smmu_def_domain_type,
> +	.dev_has_feat		= arm_smmu_dev_has_feat,
> +	.dev_enable_feat	= arm_smmu_dev_enable_feat,
> +	.dev_disable_feat	= arm_smmu_dev_disable_feat,
> +	.aux_attach_dev		= arm_smmu_aux_attach_dev,

To be complete this also needs dev_feat_enabled() and aux_detach_dev() ops

Thanks,
Jean
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
