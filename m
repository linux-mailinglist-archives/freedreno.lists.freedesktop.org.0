Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA0ABE205
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 19:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3880A10E5BE;
	Tue, 20 May 2025 17:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cu6z7o2b";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D0110E5BE
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 17:45:07 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6f8c3de60f2so5617246d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747763106; x=1748367906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
 b=cu6z7o2b3Zoq9ZOK/4Jc5SYdig18vKir8QQYIirUdBzSHHmB+k/RPF6tsiiHnD48ps
 4fXK5GyCF8HWKn2iFuTxF2CbbJ1eCJXBM3KimA1NK9CBIWx4QJZgcb5CI1cSsp5wx70i
 ESjtrc2wxOqTVYvnVBG4PUKcwqXUVsQikJLSXiGY2bNMAdtNt1SU7DmzcLRjLbbnryhI
 Xdx+qhwZksbNcCZiDvuVERBy2+Bpq4+mjiJn1FQVJNk0reGoYzcBbr2pWPWNBLJ9pyff
 M814rUfGuR8DPhfaG09di19LcPbEYPzEbhUU9vz0/GdGT+4PicXN84Ql9R8WQ/R+uh6c
 7ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747763106; x=1748367906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
 b=FC7WdYRMkcI6QZClWX89HB3iwE1LLyXvCc22uCH0QEmAcoXMpPexMuGK9z5OEXa70v
 It+jbJxBntSfwOYj2H8lM6wbW82CwAIplWeR3M4UabIgtPNHzTAMXnPa+pf1hT/68zK4
 C9dIMtGfjz4j+/o8r37DXJVnmDPT1VtgTRxxWFzNswZZFWeNMseB4Dl86RxS07dEP/UG
 xCC12wmwFoApG+Cmbk2jKetw0GA5fD9dWJxNtH+NugMbUPdCWE7yRBO4i+JN4vyOm6X5
 WzanzcWsh/Y4SiHbFJzdOM0S3MNbEAnw6X3P3b4Xtp6WkorSMnR+QDNmEeX2LUGnwwez
 fY4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw9f2pwV8KNUzskz5rmISavm1XqEpWHO2YImNqEjA7TX8RFeFIbISYiuSIW8ukXJxbqXVIu4P6pkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5BEEWbj9bvENOxVKGaMGCI6zevXUhAlqdD7Kp4SqabsbLNFeY
 KyTOIvPBPKhlk8WJHtgrL0t1Qy4tI6/spL2WWzZKvBwc7ez0Lj7YfpFL
X-Gm-Gg: ASbGncuv+HfpBCqQ7GdUS2ovIdBLQeqGOYDIY+69IIz9gxWrJksFmvQaPzSuedCJav1
 U2WDLWb2tQ/eet/cTW0ZYOX7vN9LsL/4hrKiatNZr47rs31mKTZHnkaLjZPbWnGlH9guGwK2e0x
 aDarMf57TybgfWRL23VvVuUZWnKBZ9Yx5Dujz2YNfy43x+vSbtJ9uNoU5UrBLh0oy8k92oj2s/n
 6V/k91SW0EfgWAPlTRx+aTBVq6uYlX3FGfrAvacEJIT9LOeMfmlZmH317ZFGVVN0c6i8cWEgA+d
 ZKHDqohyMiE4Zq07AIvVI1MALMGrnuCE1FILwvpSF3q8n5GQsF+v4gHdB401FY64V243JukR8dl
 9SMyvmQXJUVQ1foG8esQ=
X-Google-Smtp-Source: AGHT+IF/kqZXAuJjPUcZYWB5r6Qr7iOAsFvxKah/Zq78HNCB/e2Q26OWxJdFiR2AvAYDpvo1c5xq6w==
X-Received: by 2002:ad4:5941:0:b0:6f4:c603:588c with SMTP id
 6a1803df08f44-6f8b087eb22mr85100926d6.7.1747763105993; 
 Tue, 20 May 2025 10:45:05 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:45:05 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:54 -0400
Subject: [PATCH v7 5/7] drm/msm: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-5-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=3387;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=IRNUvyOjaxw/F2ca+hPqiQkWq4EHwHVBbpQuon23Uj4=;
 b=bb1ikhMcSzxMlK/2NMm33STv5kLCmibVErhj4n18dSnT3mDibLINSPR9ac7QKmBAKJFyLjFcr
 bATA0iAywjqCx5qFhoAISP9lr/FgSu8Zo+BxW+MrAxNgLZ4CwVNSho3
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

