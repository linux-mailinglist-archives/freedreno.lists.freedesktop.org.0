Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EF5616B42
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 18:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A9D10E51A;
	Wed,  2 Nov 2022 17:54:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F7910E515
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 17:54:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g12so29504800lfh.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qGs3xdkj5R322xMg8tXB2/8CS2Bz563Uq9iq+lvKvak=;
 b=cNNTYXRArKL9XTTBhlipyq5PeqREVBhxNAbCpjeW8mRPx8Mw+WZjtyld6abTAOBYsB
 33ekkNqNxnNVINJTq4MwV8zSyulbs5kB4iXwkxkeItXMIVlYz9/KvARze2IJdht2b7y+
 09/q/hn+0UnOwNoAe7g1qcQQQoMb7EeMK0CLRJxZJxmTpK3B2YTGa3hGMjTXzibtLVMS
 Ev9E06w9qm2CarHVOrk/vVAYnd7L2sxK7Y8rmIfNqVJgJ7XM6GA83g5AWimJBpZ3Yv/5
 isk8aZyu+53PCUE5/fijzuRO8Yj7K3wuC/JEaszgnzVDa96p+Cm3p20DaMLBo1TpYI3x
 QCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qGs3xdkj5R322xMg8tXB2/8CS2Bz563Uq9iq+lvKvak=;
 b=V/DQ6lJ/EX6LH1ANSJdalT4PtdHPOtcAja1F5ytd5s78M4Ww7iqZKtvxQcMDIc9wsY
 oLJ1K3RDrPii4ZpxbIDv1EyDyXfgF6u7ON8cPaMixHnW16wmfcXLWMR4CN1v0VhHIIZw
 qsLyKiLhz8bkDRViUp4rRQfOdQkTXfhTK0jfWsSTFc3ZsGWSL07OH7mqcf259o8N0wiD
 FPk4NVhZ7yxLwRjQYkl2O7Yd2HaX5vtHdQjsdMPY96iilYeME20bBWMZLOiOjftjnaLf
 kz7myfjIya4n9Wpzp6JH4DE6SF/u/74Vxx187fCsGCZWNI5kBxB76l5i8Vh0QXW6lgiM
 bXMA==
X-Gm-Message-State: ACrzQf3+00Uojlttrx8C/sQYbXc36doTMJjQYoLaIb8x28TzTWESNhxf
 N7n+kFqhYSxemvTYuNR2xcwQuw==
X-Google-Smtp-Source: AMsMyM7Frc3ydcKsmOwTCndNBhm/J9S03SvyZqC5rgkbLmvhWMjLazDSV8UzDY8ylW0/0Q4OjR4+bQ==
X-Received: by 2002:ac2:5469:0:b0:4a2:6e4c:35da with SMTP id
 e9-20020ac25469000000b004a26e4c35damr10595937lfn.191.1667411691704; 
 Wed, 02 Nov 2022 10:54:51 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00492c663bba2sm2087625lfs.124.2022.11.02.10.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:54:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  2 Nov 2022 20:54:49 +0300
Message-Id: <20221102175449.452283-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102175449.452283-1-dmitry.baryshkov@linaro.org>
References: <20221102175449.452283-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 2/2] drm/msm: remove duplicated code from
 a6xx_create_address_space
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The function a6xx_create_address_space() is mostly a copy of
adreno_iommu_create_address_space() with added quirk setting. Rework
these two functions to be a thin wrappers around a common helper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 28 +------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 +++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++++++-
 6 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 2c8b9899625b..948785ed07bb 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -500,7 +500,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = adreno_create_address_space,
 		.get_rptr = a3xx_get_rptr,
 	},
 };
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 7cb8d9849c07..2fb32d5552c4 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -635,7 +635,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = adreno_create_address_space,
 		.get_rptr = a4xx_get_rptr,
 	},
 	.get_timestamp = a4xx_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 3dcec7acb384..3c537c0016fa 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1705,7 +1705,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_busy = a5xx_gpu_busy,
 		.gpu_state_get = a5xx_gpu_state_get,
 		.gpu_state_put = a5xx_gpu_state_put,
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = adreno_create_address_space,
 		.get_rptr = a5xx_get_rptr,
 	},
 	.get_timestamp = a5xx_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index db4b3a48c708..e87196457b9a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1786,10 +1786,6 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	struct iommu_domain_geometry *geometry;
-	struct msm_mmu *mmu;
-	struct msm_gem_address_space *aspace;
-	u64 start, size;
 	unsigned long quirks = 0;
 
 	/*
@@ -1799,29 +1795,7 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
 		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
 
-	mmu = msm_iommu_new(&pdev->dev, quirks);
-	if (IS_ERR_OR_NULL(mmu))
-		return ERR_CAST(mmu);
-
-	geometry = msm_iommu_get_geometry(mmu);
-	if (IS_ERR(geometry))
-		return ERR_CAST(geometry);
-
-	/*
-	 * Use the aperture start or SZ_16M, whichever is greater. This will
-	 * ensure that we align with the allocated pagetable range while still
-	 * allowing room in the lower 32 bits for GMEM and whatnot
-	 */
-	start = max_t(u64, SZ_16M, geometry->aperture_start);
-	size = geometry->aperture_end - start + 1;
-
-	aspace = msm_gem_address_space_create(mmu, "gpu",
-		start & GENMASK_ULL(48, 0), size);
-
-	if (IS_ERR(aspace) && !IS_ERR(mmu))
-		mmu->funcs->destroy(mmu);
-
-	return aspace;
+	return adreno_iommu_create_address_space(gpu, pdev, quirks);
 }
 
 static struct msm_gem_address_space *
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 12d0497f57e1..12a964dc3b8d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,16 +191,24 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
+struct msm_gem_address_space *
+adreno_create_address_space(struct msm_gpu *gpu,
+			    struct platform_device *pdev)
+{
+	return adreno_iommu_create_address_space(gpu, pdev, 0);
+}
+
 struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
-		struct platform_device *pdev)
+				  struct platform_device *pdev,
+				  unsigned long quirks)
 {
 	struct iommu_domain_geometry *geometry;
 	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
 	u64 start, size;
 
-	mmu = msm_iommu_new(&pdev->dev, 0);
+	mmu = msm_iommu_new(&pdev->dev, quirks);
 	if (IS_ERR_OR_NULL(mmu))
 		return ERR_CAST(mmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 707273339969..5d4b1c95033f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -335,8 +335,13 @@ void adreno_show_object(struct drm_printer *p, void **ptr, int len,
  * attached targets
  */
 struct msm_gem_address_space *
+adreno_create_address_space(struct msm_gpu *gpu,
+			    struct platform_device *pdev);
+
+struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
-		struct platform_device *pdev);
+				  struct platform_device *pdev,
+				  unsigned long quirks);
 
 int adreno_read_speedbin(struct device *dev, u32 *speedbin);
 
-- 
2.35.1

