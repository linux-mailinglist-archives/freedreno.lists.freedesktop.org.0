Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3E72AB08E
	for <lists+freedreno@lfdr.de>; Mon,  9 Nov 2020 06:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A640B893EC;
	Mon,  9 Nov 2020 05:15:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55402893EC
 for <freedreno@lists.freedesktop.org>; Mon,  9 Nov 2020 05:15:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604898934; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uTh+L8CvHLLdJK+ls2fzca5EQ/1eBi1ZJpxQzSgROEU=;
 b=T9DIS9R1SbOIHG1Is0MGYsSTLp1mngNnQ1J9bAmmMP/tAuLoQ04z6COMV5xVdlvD1f6E6IXG
 em+hnSbAxtduIdiEQkU41IW30VODhFvhQbsFSN4lBJbEpjhFEP6hMNMWtUnBmyzHs8zr6OE1
 O1Ylocl8TZasn3N2eoGV89OX7gQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fa8d07423a1a2b32d725082 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 05:15:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D294AC43385; Mon,  9 Nov 2020 05:15:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B63BCC433C8;
 Mon,  9 Nov 2020 05:15:30 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 09 Nov 2020 10:45:30 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>, Rob
 Clark <robdclark@gmail.com>
In-Reply-To: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <b4ec727f58cfffc6e5b941d1508a4212@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCHv7 0/7] System Cache support for GPU and
 required SMMU support
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org, "Kristian H .
 Kristensen" <hoegsberg@google.com>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-10-30 14:53, Sai Prakash Ranjan wrote:
> Some hardware variants contain a system cache or the last level
> cache(llc). This cache is typically a large block which is shared
> by multiple clients on the SOC. GPU uses the system cache to cache
> both the GPU data buffers(like textures) as well the SMMU pagetables.
> This helps with improved render performance as well as lower power
> consumption by reducing the bus traffic to the system memory.
> 
> The system cache architecture allows the cache to be split into slices
> which then be used by multiple SOC clients. This patch series is an
> effort to enable and use two of those slices preallocated for the GPU,
> one for the GPU data buffers and another for the GPU SMMU hardware
> pagetables.
> 
> Patch 1 - Patch 5 adds system cache support in SMMU and GPU driver.
> Patch 6 and 7 are minor cleanups for arm-smmu impl.
> 
> Changes in v7:
>  * Squash Jordan's patch to support MMU500 targets
>  * Rebase on top of for-joerg/arm-smmu/updates and Jordan's short
> series for adreno-smmu impl
> 
> Changes in v6:
>  * Move table to arm-smmu-qcom (Robin)
> 
> Changes in v5:
>  * Drop cleanup of blank lines since it was intentional (Robin)
>  * Rebase again on top of msm-next-pgtables as it moves pretty fast
> 
> Changes in v4:
>  * Drop IOMMU_SYS_CACHE prot flag
>  * Rebase on top of
> https://gitlab.freedesktop.org/drm/msm/-/tree/msm-next-pgtables
> 
> Changes in v3:
>  * Fix domain attribute setting to before iommu_attach_device()
>  * Fix few code style and checkpatch warnings
>  * Rebase on top of Jordan's latest split pagetables and per-instance
>    pagetables support
> 
> Changes in v2:
>  * Addressed review comments and rebased on top of Jordan's split
>    pagetables series
> 
> Jordan Crouse (1):
>   drm/msm/a6xx: Add support for using system cache on MMU500 based
>     targets
> 
> Sai Prakash Ranjan (4):
>   iommu/io-pgtable-arm: Add support to use system cache
>   iommu/arm-smmu: Add domain attribute for system cache
>   iommu: arm-smmu-impl: Use table to list QCOM implementations
>   iommu: arm-smmu-impl: Add a space before open parenthesis
> 
> Sharat Masetty (2):
>   drm/msm: rearrange the gpu_rmw() function
>   drm/msm/a6xx: Add support for using system cache(LLC)
> 

Hi,

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
