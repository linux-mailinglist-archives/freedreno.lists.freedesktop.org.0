Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59514AB9064
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 21:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF0010E963;
	Thu, 15 May 2025 19:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jQ+UYZOU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5555210E961
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 19:59:46 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7c5a55bf777so16474285a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747339185; x=1747943985; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W9GO00zbxnFbKyoYKR1MGg1EYQGaCXyOc2lNqTvdH6I=;
 b=jQ+UYZOU1Yx/egWboPjRQoQqsStsQlCDSTqKgrTwhVcf8FbiMbNNixTKKhQL8d8vz2
 I2Y2CexWPz3mANbAWqhRdT/s2DHtNk7/RIuP7AIJhWzEkt05NH0LMNc8dPf7Z35xy4hm
 VWLWlxEqG5KEkrApX5GSB/MYyzZz9sV9m90BsWzQZ6+4bhJqbrahFasm54LXXExD/fIz
 Hp1hU30f0mum4xrDEYqvBvug/jP7mdeerO+B3uvV21evbepRVf/Vr76BQG0Fj5NWIgoS
 nhEyKe11YegiujiLWg3esnLpICSh1SqYv35z61TKD/4k2+T5xtD2CMZTbgjGpmTM5+x+
 WH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747339185; x=1747943985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9GO00zbxnFbKyoYKR1MGg1EYQGaCXyOc2lNqTvdH6I=;
 b=KKFf3Nm10wqUM3zy2tjO2dvQZikyaPNlT6Tmm62wWC7wV4Gm5x98+ajNHBxVwREikd
 HLZouCI6OPOVaKQZYu2dfbwZYpStOLfo0RMKpgHN+CtdpzLAi8GhQ3L7zkxrO2Gs6f+z
 PF19ubmqywjPnkMcC6xt692E9zxoCkUabTD6wzCS4gR3zlmdqG1kvUnNsyyDHMyiKAb2
 XtrJVvom5cR744KXFugwZe8HIdUSXmT3+N319bB1CMs7lblMKqx9CeYBfhp+tDtHdy73
 kOIiiUUpsKUehQjmTwP+9DL3+bI+mL0Ja7E/93OqCL5MogyegDX6JmeIX+xqfwtssgZP
 E57w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd3i7yZbtTxbcLOaV9pqRbvMsDHGE1zw1qsVKL3JsrnVRX2RbDWWen3deB+jEPUtAA933nxzYOEuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfMFrM/0hXK96Ctyx0BpWVRLddUDM2HJZj098OLRuXYhpUk52Y
 p2oOnCxBQPLCWVB3OnYK4kFN4I7SgUkDmp3ZXuyfwGNtADi3fcLfbMb8
X-Gm-Gg: ASbGnct84QtlKZTyO1TBSYfun0RO8nSuX/T+cyC0Yv2qmqcXA1mqnqLhgyw3pRiP7ao
 QFB+UPvqdYi0W6FMkMFBD13qzTb0cy/W3/V8M8a0xaGC8DRxx2eF3rFVHm/pc9v6z/d5jNYDdGr
 h6mgzDV2KJs4uucxDxPBImnPESEmtj6bZsnMfK30l8IBQkx4vDzIg8KLNJYXESGjXnz4TFFjs2y
 pn5X1q/twB3zBcsdmnXNXpFCfSuhaJXsyeKEVGu5HfspFmC4+t/TYZ3Fkm+wyFkNKV+QEimMurB
 U7i+hlZy0pcyexMVI7EYBCt2Cc/wQHTzNoZi+APXLWL4HLKjWGOqs1xJVxlOKhl0ezFdBPdk+6J
 PZ1TsVd4GSXm2NExESQw=
X-Google-Smtp-Source: AGHT+IG6CqnqToKilBZg3d95WbqLz8tctrzr994PFqGigAXmx649QoHO+YFYQoHsNTC0rhdZ3luaSQ==
X-Received: by 2002:a05:620a:2803:b0:7c3:d1b9:e667 with SMTP id
 af79cd13be357-7cd4671faaemr58332985a.5.1747339185205; 
 Thu, 15 May 2025 12:59:45 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:59:44 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:49 -0400
Subject: [PATCH v6 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-7-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=1531;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=aRsZmjoGo/cSFHXwutiwXX9pdz9qjGh+q+3C5UDfQvg=;
 b=+pdVVw82/z0eIgzgC6o+AzTuVq7FlJ1dneFaBpTdAtknFxz/eSWyUdXaQGcHd4MoAd4oA8kti
 e6nMCOZKmtuBM8tRS1ISKqELZJCTLF3R76A1EnTAP8F/VIbPZJpnnUk
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

Unused since "drm/msm: Delete resume_translation()".

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 include/linux/adreno-smmu-priv.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index 8ed94fb39e6ec6a3d8e6fabe61ff142682f1764c..80bb36e09f07901fd73c522ec077b0b3211adc50 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -46,9 +46,8 @@ struct adreno_smmu_fault_info {
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
  * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
- *                 stalling on fault is enabled, the GPU driver must call
- *                 resume_translation()
- * @resume_translation: Resume translation after a fault
+ *                 stalling on fault is enabled, the GPU driver should return
+ *                 -EAGAIN from the fault handler if retrying is required.
  *
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
@@ -66,7 +65,6 @@ struct adreno_smmu_priv {
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
-    void (*resume_translation)(const void *cookie, bool terminate);
 };
 
 #endif /* __ADRENO_SMMU_PRIV_H */

-- 
2.47.1

