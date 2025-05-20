Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33775ABE360
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 21:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1129D10E643;
	Tue, 20 May 2025 19:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eZ/QwNSN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7B610E62A
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 19:09:06 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-49b10db2f22so746781cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 12:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747768146; x=1748372946; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
 b=eZ/QwNSNEK4XLkmY35QGg9IDwQHAWHMA2JGocX+9c3GgKU54YCu3HhasSSsLv4ukfI
 WPrVi6Q9xQsRWDYmy+9+lrqkPAXLwmxcATBfneFHaZtvIEKbC6dLVAxqAgxf2RgBuIOF
 5gFAyLQ37NVOaukLzMiTN7ruDfJ+SGih+I0wFZpjX/ZXsuHAzbm1TlCG7aj129R323Ed
 t2xyVBQulmuYKmQJofSJSFw9n5/Iu+p2tUJSDToaiF5bbqp6BXzvfF5yztqLJ9avo+jA
 24cxvGmhR88MvJneAL5J1L+mMgb7Vt8wyDGvLNDgVn1YXLIonn0Wl9rVr3G+RR39qf68
 cBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747768146; x=1748372946;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
 b=oJuNab7/42vW8n4toPfV/OM20TL6fy5x5SPWnNnao7yUyRttX7tQCteUYb6Enn4v3j
 rJUxGKueTfU+9082iiMDqmJbbwTa2HwCoRTiIGykmiLRGjpq89UfXWD1OTBHRlPCaKm7
 I+ZcyVEUKPcxzEw0lxLj4C3I74wkU7/uTTUjixLhHRir/TEt2gEVK3jEgxZjwnjxrkV5
 KYsK1YThPWYo9YqVpOat18pERCYaeig5BM+KDHr5t1E5feUPyAd5Q8jZKv75u0/VFtvJ
 IfrSeNqwyk+B9C04WvRhLnE9Ef2FyVV8iT0+mkfJajYXsJpfTKRvWGlmT4zc4SSFEBeP
 iVug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbhljlkClZCRhxPiqVLaxdRlzC752m1WwBI/gjiHx/ROqwLfcpWC1B/NQNN4qqROe+LV5MXIXZGro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjvBC3fD5khXFydiZ/Dr3YdqSGRIKUDqt5wnXR9RO+Z9uGxvVR
 RFZaSdniF8J07awz2cAAPSOJUrHRJIbdWu4YxH3kWF++OBawxS9dm8t0
X-Gm-Gg: ASbGncuJ4NfsUgfdp82KaMVecyJ0qkp/Du+LmxeYJA9A6P+1g5GH5G7rLEMqn6QO3Ih
 E3MXhZAArP4PT/CX8CqKoubb4nhpvCTBZORiKSoNpPX+RwEpsTmZi9004HdZihYtP01xVOuxBZO
 fTxtcMCudwGr9i7ky/YQZ91JwkKXysySPalG4EvZOqc928gDtf5EDT0pfRRLzR63T6K6qz6kc2Z
 QLwggwSkeXC3uvNKcydP8IH2kMXpYzrytrZGFMG12ycI+0JQU2pxw11NB7hY319lkwtO4FbmNZg
 QZZciAk87KcJsLmBf2Fkafy7W5Rt2UZJkadjN7xNp6+VsMHvni+RllIcoRZHDbv8tiXpLhVKMu+
 aSEZ4i6fQmiGm8AqlwKo=
X-Google-Smtp-Source: AGHT+IH/sySa48mHF1j+xGqwAb4OUN56/osDwaowVOBbvnddvZtTNPPLhnoNhpJNu3NLmENNp9KeEA==
X-Received: by 2002:a05:622a:295:b0:474:e213:7480 with SMTP id
 d75a77b69052e-494ae4557f3mr113963491cf.15.1747768145897; 
 Tue, 20 May 2025 12:09:05 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 12:09:05 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:58 -0400
Subject: [PATCH v8 5/7] drm/msm: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-5-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=3387;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=IRNUvyOjaxw/F2ca+hPqiQkWq4EHwHVBbpQuon23Uj4=;
 b=5d0rxfRs5HCrkUIw2Arap8ZqFIuAGJ4FzZ6nBN1RaYGc2iwrZQL0YnVpt1p+/vjsJdBWdGDLK
 wKpde4hDDxRAJWeKAxM6zuLjWRz2y2+sHM1RYmSEmKQLnJbDbCP4lc7
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

Unused since the previous commit.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c |  5 -----
 drivers/gpu/drm/msm/msm_iommu.c          | 13 -------------
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 39641551eeb66d1441810c9691708ef448192578..4280f71e472a4130a62ba74e936870905ca260bb 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -71,10 +71,6 @@ static int a2xx_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 	return 0;
 }
 
-static void a2xx_gpummu_resume_translation(struct msm_mmu *mmu)
-{
-}
-
 static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
@@ -90,7 +86,6 @@ static const struct msm_mmu_funcs funcs = {
 		.map = a2xx_gpummu_map,
 		.unmap = a2xx_gpummu_unmap,
 		.destroy = a2xx_gpummu_destroy,
-		.resume_translation = a2xx_gpummu_resume_translation,
 };
 
 struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index fd73dcd3f30e75878364cb28dd26475c2ff80a85..aae885d048d0d2fd617d7b2a16833da25f5e84cc 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -345,7 +345,6 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
-	struct msm_mmu *mmu = &iommu->base;
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
 	struct adreno_smmu_fault_info info, *ptr = NULL;
 
@@ -359,9 +358,6 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 
 	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
 
-	if (mmu->funcs->resume_translation)
-		mmu->funcs->resume_translation(mmu);
-
 	return 0;
 }
 
@@ -376,14 +372,6 @@ static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *de
 	return -ENOSYS;
 }
 
-static void msm_iommu_resume_translation(struct msm_mmu *mmu)
-{
-	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
-
-	if (adreno_smmu->resume_translation)
-		adreno_smmu->resume_translation(adreno_smmu->cookie, true);
-}
-
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -431,7 +419,6 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
-		.resume_translation = msm_iommu_resume_translation,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index daf91529e02b6c491d624e9de686173eeef86a9b..c3d17aae88b0a57b3c7d1df3351b39ec39bca60a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -15,7 +15,6 @@ struct msm_mmu_funcs {
 			size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
-	void (*resume_translation)(struct msm_mmu *mmu);
 };
 
 enum msm_mmu_type {

-- 
2.47.1

