Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB1F857AED
	for <lists+freedreno@lfdr.de>; Fri, 16 Feb 2024 12:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5D10EB1B;
	Fri, 16 Feb 2024 11:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o/np2EIM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B49910EB10
 for <freedreno@lists.freedesktop.org>; Fri, 16 Feb 2024 11:04:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4121b1aad00so3988135e9.1
 for <freedreno@lists.freedesktop.org>; Fri, 16 Feb 2024 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081439; x=1708686239; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L+fXQpNXys7p6pXfZBQpQvrvkqt8y/igppueslu3480=;
 b=o/np2EIMXE++VXQWN2CMOCBlQSSACqzEQStXah4qu9tY4er6Y1AuqdWRIA4jcHR3xx
 RhHMfRJhnbIqnTWnsNTNCQCrKrEMMBgvhkceyQMwemploBlsvVBPq3MupKoVUJz7z6uf
 yStMTUq5gR+jHgsj1zV+4HBApwiFUM5zpjiFWsB935TGrmg4s2lTzkCPbP2HWF41Hf2K
 zW0LzTDOnujaNNTE7KKrU7ntdFjYBieQ0ijA33rRJQJchnyfpItcFBUjiUNdbDO8f076
 Ywyoqt5HFqR6jtx47o/r3mszg+IiVF/NrmF0aXc2Fszlu7M9YbVJEOkdkKa1GMvCjybW
 5isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081439; x=1708686239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+fXQpNXys7p6pXfZBQpQvrvkqt8y/igppueslu3480=;
 b=n9iJzciCCjdW9YjQT8cYjo+v2/HRVLxPdp+nc0lB6J3+6mHa4koMrJBvLuA7LiTVPH
 +E4inCJ/80x2UOgVlPuY2/UU0z19FXg4gOZkCos0x1/Lh7IcKImc9Db2jp+hihifZETL
 QQeduTdZtI98Q0i7Vp9PybpmjeIXLQBmgVaXHrG9Sl3bKXSjkgenqzcZXtcxAn1PYZjq
 QO+LM4hbyjvpEYIgzVrwLZ3pWMCSwy848oulm+cvaG5/pddM/aJsBSjxG43FU+fTUKht
 qPYDnb08/C68he+zaQIXTddYEIqNMLj/C4q6ffvjlrK85uZbM9MUEXT25lEw8auYE/dZ
 oJXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYQ2cBn8ag9V/IgpaorHEbViGb7x1zt3d7zsje3ONEM9IUk1JejnrLdCjgoSy63b+gyTHPxCSEGkgykRufhSh8tt3ql258ra//MUqbFJVg
X-Gm-Message-State: AOJu0Yx6ObKgLC/JUdPe0Rn1KzyITwFy6RhlHaEKUu6ZKjYj+MyT6C9I
 xPSIxUTBGCbSD2/E/RIVDxX2gw2Hne9B5rSTSa5x+xVLyneK5HwfNNbyur8Q2KM=
X-Google-Smtp-Source: AGHT+IGGHfYk38OmLP6ZxKG4wt9HgniAWPkqDvqOxJ8sV5vVtrFa9vXdBrfZeDickxiaWibY/6XQ2w==
X-Received: by 2002:a05:600c:3515:b0:412:17dd:a227 with SMTP id
 h21-20020a05600c351500b0041217dda227mr3578215wmq.15.1708081439551; 
 Fri, 16 Feb 2024 03:03:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm1993174wmq.37.2024.02.16.03.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:03:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 16 Feb 2024 12:03:52 +0100
Subject: [PATCH v3 5/7] drm/msm: add support for A750 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-topic-sm8650-gpu-v3-5-eb1f4b86d8d3@linaro.org>
References: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
In-Reply-To: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5340;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pFChiC7/A7TW5nPKOIPDG8EqGL5V1pHjmT0keqleygU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlz0EWdFVecwUHFQbFbUD4McTTV0rxugK3zYhW9YDL
 6tIc6YeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc9BFgAKCRB33NvayMhJ0ULoD/
 9qGqDv/JN9u3v7z1bukxgAiCgTVdL7BRdF+3GLlHfDViaQCCC23UIgmRlCJDVFL/8ZGS5qWGOiJA9f
 gRvjGWhJRgc2TlF8CC9ZS/2dlTZHbeBNsVSGbexGNa+y1c5IAvplEb7F7B4jZEIZnHNxxxZa4EhhvO
 /K5Qv+KGoRBbHIZZo080D8bIa4mutec/uv5wYsIyj6x8gpnHSjMs3RYOgU4mOt0j9BPCB4TKBqvsdq
 SKOSdtjpAVe9uhbBwM7nQzpDpBfnCN8aK/ZHqpcHStLkAqgH+X/SJ5TAYLJYRK34LTX2qhMdXcOOm3
 i1ehpvHQGKsMGCSZcDhJWTtUNp6TcHcCUHu3RaDOlioDC4AfBkZv5vIvMY/aU4CVtcwX4urL+eyuCh
 pPbacCzQipbL2RTNZthLiU+tHwu8EnLl3VQjUmeaWpPAQWJ1IiBesYUY4gYInTYNr5Fr6FkeX/xOss
 R20DYUir14nB1numCQF40b5xBnTyZ6lQGzjVsf/HRANbaV/+yfu9ohRNqL3mqexALk/O5yRiVx7EWt
 nLUyTyBBgIaXES239C/i45bu7HEElFxk+W1fXxPVYu7vpwxWX8DTINPObpG7E98Qfs6xXB8Ycx0fvw
 SmmLypJVBDyn3ySzwt8sTlA5XAEts3rXYaZ5qi5b4GbGmsHR5WfXgTaUEaVg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Add support for the A750 GPU found on the SM8650 platform

Unlike the the very close A740 GPU on the SM8550 SoC, the A750 GPU
doesn't have an HWCFG block but a separate register set.

The A750 GPU info are added under the adreno_is_a750() macro and
the ADRENO_7XX_GEN3 family id.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 28 +++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++++++--
 4 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8c4900444b2c..325881d8ff08 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -842,6 +842,8 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		 */
 		if (adreno_is_a740(adreno_gpu))
 			chipid_min = 2;
+		else if (adreno_is_a750(adreno_gpu))
+			chipid_min = 9;
 		else
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..475b601a48ee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -961,7 +961,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	unsigned int i;
 	u32 val, clock_cntl_on, cgc_mode;
 
-	if (!adreno_gpu->info->hwcg)
+	if (!(adreno_gpu->info->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
 
 	if (adreno_is_a630(adreno_gpu))
@@ -982,6 +982,25 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 			  state ? 0x5555 : 0);
 	}
 
+	if (!adreno_gpu->info->hwcg) {
+		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
+		gpu_write(gpu, REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);
+
+		if (state) {
+			gpu_write(gpu, REG_A7XX_RBBM_CGC_P2S_TRIG_CMD, 1);
+
+			if (gpu_poll_timeout(gpu, REG_A7XX_RBBM_CGC_P2S_STATUS, val,
+					     val & A7XX_RBBM_CGC_P2S_STATUS_TXDONE, 1, 10)) {
+				dev_err(&gpu->pdev->dev, "RBBM_CGC_P2S_STATUS TXDONE Poll failed\n");
+				return;
+			}
+
+			gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 0);
+		}
+
+		return;
+	}
+
 	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
 
 	/* Don't re-program the registers if they are already correct */
@@ -1239,7 +1258,9 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		count = ARRAY_SIZE(a660_protect);
 		count_max = 48;
 		BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
-	} else if (adreno_is_a730(adreno_gpu) || adreno_is_a740(adreno_gpu)) {
+	} else if (adreno_is_a730(adreno_gpu) ||
+		   adreno_is_a740(adreno_gpu) ||
+		   adreno_is_a750(adreno_gpu)) {
 		regs = a730_protect;
 		count = ARRAY_SIZE(a730_protect);
 		count_max = 48;
@@ -2880,7 +2901,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	/* gpu->info only gets assigned in adreno_gpu_init() */
 	is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
-		  config->info->family == ADRENO_7XX_GEN2;
+		  config->info->family == ADRENO_7XX_GEN2 ||
+		  config->info->family == ADRENO_7XX_GEN3;
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2ce7d7b1690d..e2582c91d7e7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -522,6 +522,20 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
+		.family = ADRENO_7XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen70900_sqe.fw",
+			[ADRENO_FW_GMU] = "gmu_gen70900.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "gen70900_zap.mbn",
+		.address_space_size = SZ_16G,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index bc14df96feb0..9e9415df2cea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -48,6 +48,7 @@ enum adreno_family {
 	ADRENO_6XX_GEN4,  /* a660 family */
 	ADRENO_7XX_GEN1,  /* a730 family */
 	ADRENO_7XX_GEN2,  /* a740 family */
+	ADRENO_7XX_GEN3,  /* a750 family */
 };
 
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
@@ -423,12 +424,17 @@ static inline int adreno_is_a740(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x43050a01;
 }
 
-/* Placeholder to make future diffs smaller */
+static inline int adreno_is_a750(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x43051401;
+}
+
 static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
 		return false;
-	return gpu->info->family == ADRENO_7XX_GEN2;
+	return gpu->info->family == ADRENO_7XX_GEN2 ||
+	       gpu->info->family == ADRENO_7XX_GEN3;
 }
 
 static inline int adreno_is_a7xx(struct adreno_gpu *gpu)

-- 
2.34.1

