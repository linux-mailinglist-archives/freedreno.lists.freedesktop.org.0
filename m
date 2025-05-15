Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F17AB9062
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 21:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E363110E962;
	Thu, 15 May 2025 19:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ftpBTU20";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D1410E95E
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 19:59:44 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6ef0537741dso1889996d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747339183; x=1747943983; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CXRAlEAkp/v2H222njYW3lOGT6rTudruLVTCXUshl+c=;
 b=ftpBTU20NBmHpltGaG7Q79WzelXmc9f9qWJFYnW6/mYYw5YAKuI9EwEnX+kLo+CTj/
 Zw/y+kLKcqVlDidXtk+lr3osEPVWgU1cbWloS4LPiwWmiKPMFDP+yulL0oOjJeLMNHnb
 pbqNnGmtuclH48DdG51R40XfC1v4pD2OcAbbqJxrj4Hh67H4SN3WUzgdhXXjXtMYw+Zk
 WmakEyykj187WoV27W68l7Cw0ER95KX403QD7KhRGv9mogeQkB8BR7N9Vgerwi4WGyNy
 XnKolJSv7b1hd+V04letyWk4nEmS97WIMEiN598y3jjBpqC8hDru2jy/OZjkuJdVG3Cd
 UPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747339183; x=1747943983;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CXRAlEAkp/v2H222njYW3lOGT6rTudruLVTCXUshl+c=;
 b=w0W17WH/oF8B2o6a3PVGp1O2Ts+O78ha48Pueyp8gbng01T8GrM9ZvgDUGQNPwW8xN
 CWQ15a6OoFr8YK9R6ZprglGDQog7j+Itc6dwrUHrXxla2XQWCp551TLQSJ06WS+X01xY
 pX/QJms7254l2GVBgnCCI7fg1QG/77CeIsXG/CpdM8Okf3XBzsPqWEeaPOllglHkBzjJ
 pDydc6+SestgIT1f5lrpr6nx9W2niYaBKHeFKdXHpKP3b0eqTuoc/x/xuo/fsoeH/T9t
 QLKBGoiYp7UmrH3pwMiqtp9Kwn+4Zl31CzYCMI6PiIBCDRtHM9IIboftylbGhiPIpIlY
 J37w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLYOrM2bTBxJO6j9lnUVeHZyhyHfU0Bj/3ceWs8AbR0I/sudGB2gJKR1hUR157QhRMUWo9NPcKJ9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTiaIegGsprRFCKm1HeKW7fpkKb82SHqMWx77bJkCNL5Af8Xg6
 W3ItSSqPl7NmPtzgD3WwH9/hgnYWUWAZ8LFBTZHwbghiqKEEgizZniB4
X-Gm-Gg: ASbGnctSNA/xHZj/+SyK0wL7dhKlQcc4ZRYZL6WkKVu+oYRPQi0EoNThk7O5YFe1AXe
 znOo15XkJFCiyes+VcJ0guap9U6DvPS+8c6FLnRnq3nPvFVM2q9vAkkfa0LahYxCkQIOf1drUN2
 YuZzo9NRnjEil71g9X5ENOiz4RNIVokFPJ/OX0mkjhl3r40vKL+z1edyNDoFch4VqtLnhGJA6rD
 E6VHB2QOOYRqyatblkO4swqt5rZxKG+L9r2y6ibepU4b0hyUiF0GvOKcTQu/475cE+YYEuANmnH
 Qx9pU1jIyFihEc3jRJJ1VIqWOvLvoT9RtxnIaeV99FTXGFPs4P+iGkteC8UVj2Rw9IBjQXk8chC
 3vgOHtXt3ttcrSEtcU1s=
X-Google-Smtp-Source: AGHT+IHON1Ci4ArRCi8J9fIgnvSIH3M28UzX9E4XnN9n89/XqiNa63YZ+YYjbAguQ3rvFJAVU38Aqg==
X-Received: by 2002:a05:622a:19aa:b0:473:884e:dcff with SMTP id
 d75a77b69052e-494ae4539b1mr3915141cf.13.1747339183019; 
 Thu, 15 May 2025 12:59:43 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:59:42 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:47 -0400
Subject: [PATCH v6 5/7] drm/msm: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-5-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=3253;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=Qq5k1GBVvpOoe3vbf7lHYuU1s8ow91pqey8KnhArgxI=;
 b=/yM3pG9E+DokL/lrL3Cl3ogv2uxixtq/MENaQRhh9mJ7nye6cSJOdpS0NZNuJb+oTQewG5E6D
 ++dtz6vH3kzBvtRX4KSQtz77NW08TMP7QhhfQ5z4KlxpGJRz/i6wi0U
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
index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..c6fed9bcb0021a5ad25d8487db1cc05869668c3e 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -323,7 +323,6 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
-	struct msm_mmu *mmu = &iommu->base;
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
 	struct adreno_smmu_fault_info info, *ptr = NULL;
 
@@ -337,20 +336,9 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 
 	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
 
-	if (mmu->funcs->resume_translation)
-		mmu->funcs->resume_translation(mmu);
-
 	return 0;
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
@@ -398,7 +386,6 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
-		.resume_translation = msm_iommu_resume_translation,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881f2a6789ae2d03e1c02d10046331a..f118de637b1b35acba76a92c2cca1de9b2fad5a0 100644
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

