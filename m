Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1B2FCA6B
	for <lists+freedreno@lfdr.de>; Wed, 20 Jan 2021 06:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040066E135;
	Wed, 20 Jan 2021 05:24:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 20 Jan 2021 05:24:04 UTC
Received: from m42-8.mailgun.net (m42-8.mailgun.net [69.72.42.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8658A6E135
 for <freedreno@lists.freedesktop.org>; Wed, 20 Jan 2021 05:24:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611120244; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=elqg9TnQqVo3z+rjCzoXTDJ/nWUGnhtMTJRsONyCrT4=;
 b=S1ORf9TU1pZdj/0+Wx9Sqz9zLosAfZpc8ioOjUupuov/UgcRqwMlBQHyNspBCO3RDdpuuFhQ
 oPliggoz1Ky5pW71jIgDiq/gb9tVkIAZffCLqP3X16kAYTsqrz6w6LOVtvDUEAlKMtX/Glpq
 Pp1u/KrKX3xn0iaRdDVfrWT/xJ8=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6007bd3cf94f20d8b73cc04d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Jan 2021 05:18:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 040BFC43462; Wed, 20 Jan 2021 05:18:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 52F8BC43464;
 Wed, 20 Jan 2021 05:18:50 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 20 Jan 2021 10:48:50 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>, Rob
 Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 isaacm@codeaurora.org
In-Reply-To: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <3e6ec220c07bcf91fae0985e1798f7a1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent
 masters to use system cache
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-01-11 19:45, Sai Prakash Ranjan wrote:
> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> the memory type setting required for the non-coherent masters to use
> system cache. Now that system cache support for GPU is added, we will
> need to set the right PTE attribute for GPU buffers to be sys cached.
> Without this, the system cache lines are not allocated for GPU.
> 
> So the patches in this series introduces a new prot flag IOMMU_LLC,
> renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> and makes GPU the user of this protection flag.
> 
> The series slightly depends on following 2 patches posted earlier and
> is based on msm-next branch:
>  * https://lore.kernel.org/patchwork/patch/1363008/
>  * https://lore.kernel.org/patchwork/patch/1363010/
> 
> Sai Prakash Ranjan (3):
>   iommu/io-pgtable: Rename last-level cache quirk to
>     IO_PGTABLE_QUIRK_PTW_LLC
>   iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
>   drm/msm: Use IOMMU_LLC page protection flag to map gpu buffers
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  drivers/gpu/drm/msm/msm_iommu.c         | 3 +++
>  drivers/gpu/drm/msm/msm_mmu.h           | 4 ++++
>  drivers/iommu/io-pgtable-arm.c          | 9 ++++++---
>  include/linux/io-pgtable.h              | 6 +++---
>  include/linux/iommu.h                   | 6 ++++++
>  7 files changed, 26 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 00fd44a1a4700718d5d962432b55c09820f7e709


Gentle Ping!

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
