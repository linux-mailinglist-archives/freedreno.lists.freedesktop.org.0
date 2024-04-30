Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983E8B702C
	for <lists+freedreno@lfdr.de>; Tue, 30 Apr 2024 12:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45E610E984;
	Tue, 30 Apr 2024 10:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FgXv8xzp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751110E975
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 10:44:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so44717415e9.2
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714473856; x=1715078656; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=swuWmjFhwBOQQWEST6sVjksYDm7049vHTM6meYi4ink=;
 b=FgXv8xzpJuCq0EWEqtIrACwRJ/kQcUq2CDaeqlfpwkAa4ME2v99gdHEZVnzEBhqU20
 OPd3qKWTs4UB5vmtfwaVXy93kmdMxIdM0vj/jWq79thd3Tnr5ZXy7kx7O9ZrbVV03xQM
 Lzz0YkowV9AsgFPsiGddwkSPJiJW5nFg33CaJO+RFMaOKH1LyqHtFKQjrIRjK4EEC7OB
 L9y2IY5lVjVBRCNG4xc9vq4388WXVSL1ybJiAJIMlw6mffp2shrPv0yIVy/mS51IwWm+
 0eMTP1O/rz+2Yop4MWI2phY0Pu93NUdn4WadnrfXAb/YEWG+nZS/MfSpNzS4kFo4KRch
 K2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714473856; x=1715078656;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swuWmjFhwBOQQWEST6sVjksYDm7049vHTM6meYi4ink=;
 b=Rlv3hYcnqYMpr2i2klXNpEIV3Zv2zyNIZY+b2nQLcG83UIRSrXXPiq+mD30JmV5Bwx
 bCSFhl7LlVr3VS9ELzY597w1zndWfS7E3dKLTQ7uX08xFBKyDB8dY98mirc/Ny1dRCp6
 XkheNHAKo9PZFy1OhyXhbUsffuINzPhmObGKloykP33AEK0Dll+kdeKUNoNcu1dp4tk9
 AP5r0RJU5IP8UmJOoMrLmjVaBGkQ+K25rOwbOzk1Ap0NIHnA/9VSbamqeUke6eWGJKlC
 tjzj0DrQOODu5IfO1HNSlW4TJa1SFOdBYUSxf9JoWoLiFuKXk78Ozur4yq/9KAQX1Oh5
 B0RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrRB8+N51QCUhRY9nkLKq0qE79P9SougX9Kr+eCwtooJXxOdLlHDiQPfYZ5ZD1b/dm+7eRsRyoBmAiWfKPix9TQbchHgA6c/u8PmozkoIQ
X-Gm-Message-State: AOJu0Yx3ssUYbO5jJ7qflJX/CvjxXiAGtEXPNrg39IHcmC2k7UeQqMav
 xZ5wwld9IfqVxiek7dRIer/ELEhW0IwA9K8BEAdGSdhEveTACroA
X-Google-Smtp-Source: AGHT+IFi6+edvCSxnzf227DMOGNourKZAJBz19Un/ND/aUahCcDGagndZMi5CpKzrvoQAAm0Jy+d0w==
X-Received: by 2002:a05:600c:1910:b0:41a:e5f5:99f8 with SMTP id
 j16-20020a05600c191000b0041ae5f599f8mr14083300wmq.18.1714473856345; 
 Tue, 30 Apr 2024 03:44:16 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:44:15 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:18 +0100
Subject: [PATCH v3 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-4-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=5711;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=xF43mVMcs8MO8ap+Pvdie9rN2riFcwBreI/fz5B9u2E=;
 b=ml+XbxWc/FevhKhPUQSK8jdB1mGNA2fFpD01wXiUnSIYZHZ6sq7FvLSvSG36tiMBS7cdJCShB
 YemrvM2Rp7ICLQjBrk5Y1QiuSBFR7nkmwrRoukFJUbucVTkkbyCNgUu
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

On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
initialize cx_mem. Copy this from downstream (minus BCL which we
currently don't support). On a750, this includes a new "fuse" register
which can be used by qcom_scm to fuse off certain features like
raytracing in software. The fuse is default off, and is initialized by
calling the method. Afterwards we have to read it to find out which
features were enabled.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 91 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cf0b1de1c071..52b080206090 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
@@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
 		       A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
 		       A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
 		       A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
-		       A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
+		       A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
+		       A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
 
 #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
 			 A6XX_CP_APRIV_CNTL_RBFETCH | \
@@ -2356,6 +2358,27 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
+static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
+{
+	u32 status;
+
+	status = gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
+	gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
+
+	dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=%8.8x\n", status);
+
+	/*
+	 * Ignore FASTBLEND violations, because the HW will silently fall back
+	 * to legacy blending.
+	 */
+	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
+		del_timer(&gpu->hangcheck_timer);
+
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
+	}
+}
+
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -2384,6 +2407,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
 		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
 
+	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
+		a7xx_sw_fuse_violation_irq(gpu);
+
 	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
 		msm_gpu_retire(gpu);
 
@@ -2525,6 +2551,61 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
+static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	u32 fuse_val;
+	int ret;
+
+	if (adreno_is_a750(adreno_gpu)) {
+		/*
+		 * Assume that if qcom scm isn't available, that whatever
+		 * replacement allows writing the fuse register ourselves.
+		 * Users of alternative firmware need to make sure this
+		 * register is writeable or indicate that it's not somehow.
+		 * Print a warning because if you mess this up you're about to
+		 * crash horribly.
+		 */
+		if (!qcom_scm_is_available()) {
+			dev_warn_once(gpu->dev->dev,
+				"SCM is not available, poking fuse register\n");
+			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
+				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
+				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
+			adreno_gpu->has_ray_tracing = true;
+			return 0;
+		}
+
+		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
+					     QCOM_SCM_GPU_TSENSE_EN_REQ);
+		if (ret)
+			return ret;
+
+		/*
+		 * On a750 raytracing may be disabled by the firmware, find out
+		 * whether that's the case. The scm call above sets the fuse
+		 * register.
+		 */
+		fuse_val = a6xx_llc_read(a6xx_gpu,
+					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
+		adreno_gpu->has_ray_tracing =
+			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+	} else {
+		if (adreno_is_a740(adreno_gpu)) {
+			/* Raytracing is always enabled on a740 */
+			adreno_gpu->has_ray_tracing = true;
+		}
+
+		if (qcom_scm_is_available())
+			return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ);
+	}
+
+	return 0;
+}
+
+
 #define GBIF_CLIENT_HALT_MASK		BIT(0)
 #define GBIF_ARB_HALT_MASK		BIT(1)
 #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
@@ -3094,6 +3175,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
+	if (adreno_is_a7xx(adreno_gpu)) {
+		ret = a7xx_cx_mem_init(a6xx_gpu);
+		if (ret) {
+			a6xx_destroy(&(a6xx_gpu->base.base));
+			return ERR_PTR(ret);
+		}
+	}
+
 	if (gpu->aspace)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..4180f3149dd8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -182,6 +182,8 @@ struct adreno_gpu {
 	 */
 	const unsigned int *reg_offsets;
 	bool gmu_is_wrapper;
+
+	bool has_ray_tracing;
 };
 #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
 

-- 
2.31.1

