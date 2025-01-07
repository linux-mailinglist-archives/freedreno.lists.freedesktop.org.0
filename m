Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD80A040B6
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 14:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B5110E16C;
	Tue,  7 Jan 2025 13:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fhl4JNkD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B11510E6E3
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 13:20:17 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-435b0df5dbdso46735e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 05:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736255956; x=1736860756;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=;
 b=fhl4JNkDQeQgD/NeIBfY5ORnP1VyW5/CysUFqY7SlSSN65nAc77PNWQsaI/zVSUUJP
 PwlsXqDb6C4jZjBXjwaaV87SbgxuFD87hcgR4QfOa6axG0KhiGhW0svW4nPFhkEV+/NU
 ktODumCxUPD/xVz+envnTPD+b9X7PvNrmAOt9k+s1wJTzx56/PIaYxmLcmmT8+uR+c8f
 W8lgNNkN4X2z6bRcQNA2DjOmNMWTbPEszhHndgElxELwiA24Aly+GhmhO9sBs9JJMXZp
 Ur9us+9HsrytVLDZml/36P0u99t3UkAws2E/C72ClSToGdP4rKAGleF9z8251Shz8OuI
 mGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736255956; x=1736860756;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=;
 b=tbzrHwVSXAApU/24QMEpPuIKb18P2H7TYxWF/d3VdM3eSDiyCYRPHNsVziB1AyQ4ZL
 DQ9IamLj8XjniCm896jWHNpVNExNk1MkGXG6DeyWm/r9Kyg9u23yt6JVszdm02EtbR9o
 gJzAa5uOs5vM2EWv0TQQeq1f08++YphlVs2uvpzbZcZbtg9aPtvLOyJGe6HnPwvkVE9o
 4HzY0DNXkWZCb8dCB4R4FboZiFruyNBqArcHOV5Gnq+MR2P7CcXSv7z6/ym32bEf5LuL
 CwrnOouxn86UT13BGbdfqostaRjSw1vgj5wj8E0RctwBac/aPJc/Vx+cdTt+b3pFu8O8
 ajFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7LIWvug+74+7lVfnXPwZiEfIKh5QyxAoubhozctD+SYymWCVxEpWlxWd3s/rvZxV8oMFgqoDu8pc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUjTTivrk7I/77mOA6Dx3Jk2x5skrSGanr8PBdOgATCQOuMl12
 xkVT1pw0LBKRsd4l7tAFEtVoWlm9iNUSDGEPV8RKkjIJB2z6+AiRMeCyy2fAl7ccU4A/wqWfCZ2
 5Bw==
X-Gm-Gg: ASbGncsG4ezq6Norn0BAztdLcT3NNboSdKdtQCdnKs8nk16v7hm1kq/jWzn/VxKnHlE
 J0xWJD40uJ0cJF97uFeWzb7Y+iIeNFw+/5wkiFDtUtQn7I6nd39QttXD2ZK/J+CXxVqfYsu6l3X
 MS4tILLfDlFhoD79o6LjOsnZqYh37ypaFmkhP4nIQ0ew1L750fTZ/mVy9mTyoV0giU/BAhn66Ql
 lhIGgw65ylKh4cPcZxOwaMRAheYyAWJN6u/4+M4rjMeAes/lKWMWt78ozfSTMejZqvLO7F0f9ij
 KXCGBRtza5bjDazuwbE=
X-Google-Smtp-Source: AGHT+IGshgYKYU49AS8Yt3DzTbm9jzfDb1zOfiYsDlqWPz/kk/iuG9opzk/qyzVKRNqNypOg626I8w==
X-Received: by 2002:a05:600c:4f8f:b0:434:c967:e4b5 with SMTP id
 5b1f17b1804b1-436dcf7356fmr901395e9.1.1736254559456; 
 Tue, 07 Jan 2025 04:55:59 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a2e25edbbsm42740762f8f.110.2025.01.07.04.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 04:55:58 -0800 (PST)
Date: Tue, 7 Jan 2025 12:55:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <Z30kWxVxwJXO_z2_@google.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
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

Hi Rob,

On Tue, Dec 10, 2024 at 08:51:18AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> v2:  Fix an armv7/32b build error in the last patch
> v3:  Incorperate Will Deacon's suggestion to make the interface
>      callback based.
> v4:  Actually wire up the callback
> v5:  Drop the callback approach
> v6:  Make walk-data struct pgtable specific and rename
>      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> v8:  Pass pte pointer to callback so it can modify the actual pte
> v9:  Fix selftests_running case
> v10: Call visit cb for all nodes traversed, leave the decision about
>      whether to care about non-leaf nodes to the callback
> v11: Adjust logic in 3/4 [smostafa@]

I see the level initialization was not removed as it was in the diff[1], so it
seems to me that’s redundant as the level is set anyway in the callback, and
actually looking at that I see it’s not used or printed from the driver,
so may it can be removed all together, anyway that’s nit that may be Will can
fix it up while merging.

Otherwise, For the whole series
Reviewed-by: Mostafa Saleh <smostafa@google.com>

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index ed3ba47df350..a884af8fb101 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -731,7 +731,6 @@ static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 {
 	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
 	data->ptes[lvl] = *ptep;
-	data->level = lvl + 1;
 	return 0;
 }
 
@@ -746,8 +745,6 @@ static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
 		.end = iova + 1,
 	};
 
-	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
-
 	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 }
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 0f17a38a304d..c62e344a4058 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -190,7 +190,6 @@ struct io_pgtable_cfg {
  */
 struct arm_lpae_io_pgtable_walk_data {
 	u64 ptes[4];
-	int level;
 };
 
 /**



[1]https://lore.kernel.org/all/Z1AtDgLD0SDUxDHl@google.com/

Thanks,
Mostafa

> 
> Rob Clark (4):
>   iommu/io-pgtable-arm: Make pgtable walker more generic
>   iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
>   iommu/io-pgtable-arm: Add way to debug pgtable walk
>   drm/msm: Extend gpu devcore dumps with pgtbl info
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
>  drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
>  drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
>  drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
>  drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
>  drivers/iommu/io-pgtable-arm.c          | 157 +++++++++++++++---------
>  include/linux/io-pgtable.h              |  15 +++
>  7 files changed, 167 insertions(+), 57 deletions(-)
> 
> -- 
> 2.47.1
> 
