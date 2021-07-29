Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C793D9CD4
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 06:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD296EC77;
	Thu, 29 Jul 2021 04:39:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6D16EC77
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 04:38:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627533544; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kEfEwT/ODxxc08E2cVLUhKxwnEHlWMj0LfLS8lLCtPU=;
 b=l89qCYAVsv7UGvTuwZVb+4xP7aehOGm7zllxK9O29f67dCOJfB4kV2jH/W7aTiLfmZZ0d9g/
 1oEcEL+fJTtfJqb4AiyChEntt9DzlbG6qKy9aWyu2JY3ao7X33zv2x6gKiJPweFkl20Z7l81
 +PpBq2F0J2KvZLGAHoZOmYXch0Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 610230bfe81205dd0a5514fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 04:38:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A591DC43144; Thu, 29 Jul 2021 04:38:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DFA3C433D3;
 Thu, 29 Jul 2021 04:38:22 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 29 Jul 2021 10:08:22 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20210728140052.GB22887@mms-0441>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
Message-ID: <8b2742c8891abe4fec3664730717a089@codeaurora.org>
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
Cc: isaacm@codeaurora.org, Rob Clark <robdclark@gmail.com>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Kristian H Kristensen <hoegsberg@google.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Georgi,

On 2021-07-28 19:30, Georgi Djakov wrote:
> On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
>> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
>> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
>> the memory type setting required for the non-coherent masters to use
>> system cache. Now that system cache support for GPU is added, we will
>> need to set the right PTE attribute for GPU buffers to be sys cached.
>> Without this, the system cache lines are not allocated for GPU.
>> 
>> So the patches in this series introduces a new prot flag IOMMU_LLC,
>> renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
>> and makes GPU the user of this protection flag.
> 
> Hi Sai,
> 
> Thank you for the patchset! Are you planning to refresh it, as it does
> not apply anymore?
> 

I was waiting on Will's reply [1]. If there are no changes needed, then
I can repost the patch.

[1] 
https://lore.kernel.org/lkml/21239ba603d0bdc4e4c696588a905f88@codeaurora.org/

Thanks,
Sai

> 
>> 
>> The series slightly depends on following 2 patches posted earlier and
>> is based on msm-next branch:
>>  * https://lore.kernel.org/patchwork/patch/1363008/
>>  * https://lore.kernel.org/patchwork/patch/1363010/
>> 
>> Sai Prakash Ranjan (3):
>>   iommu/io-pgtable: Rename last-level cache quirk to
>>     IO_PGTABLE_QUIRK_PTW_LLC
>>   iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
>>   drm/msm: Use IOMMU_LLC page protection flag to map gpu buffers
>> 
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 3 +++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>>  drivers/gpu/drm/msm/msm_iommu.c         | 3 +++
>>  drivers/gpu/drm/msm/msm_mmu.h           | 4 ++++
>>  drivers/iommu/io-pgtable-arm.c          | 9 ++++++---
>>  include/linux/io-pgtable.h              | 6 +++---
>>  include/linux/iommu.h                   | 6 ++++++
>>  7 files changed, 26 insertions(+), 7 deletions(-)
>> 
>> 
>> base-commit: 00fd44a1a4700718d5d962432b55c09820f7e709
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
