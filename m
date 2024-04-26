Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FAA8B3F57
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE46C11A7A6;
	Fri, 26 Apr 2024 18:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PmQyyMnY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4D011A713
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:34:22 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2dd64d6fe94so27255341fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714156460; x=1714761260; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MNeWNMU4iC0fR64E8ENW7UV7ElqWg5SI0xQxIgkRybU=;
 b=PmQyyMnYxTgj81LqGdkey15YIoPc+ox+R5rdHXNm3sQzz0qwu2tDfl6YUMYAcrvP5G
 s/59ze5r/l8lPhfI30A9dRDuK9cVZO++2BX1uoYgp+FPAeHOJyZRmVySj8KyoRXOnybY
 YuzNguNN6hAcMUYq2thRMVsqlWZkUZ+CBbGdXWOtd7Mpz0Xqs74xtpL9vYNJc5LIBJFe
 F0UqWxzGGJ5UR+LNDu8ivI0EU1Z2KiRhBzi9Y8C6ICzdXCwEr1PfvJekm+TAhrKwSIJF
 ZUsmpRk12oDr6J40b41I7YjYf+rU4cWs7rNGYUtq+bpDJK+WeBxK77FuLCLidQYxvegx
 eVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156460; x=1714761260;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNeWNMU4iC0fR64E8ENW7UV7ElqWg5SI0xQxIgkRybU=;
 b=In3P2QxBqDAGNedJRd0FciBr9NtO8BivzTQoT2ApOCicXQRsODIADawiRcK5kdZOXs
 WDdwuxC36DiytUv8nkWdOJhUh3HlTcvAp5eabYPtgCjLpXxhOs3EoSNdUkW4TThbU3Hw
 PxI8o85Zhykjk7P7D5qaHba22eT/rYBgdYBU39lvrkt8sGOD7EVDcW6wCxQWRfWiTuPq
 9+wBnizJ7JK14TINtKR81T9HFAVLxZXwd8hf6NYmni6/6QuU2mFvzlToYTte/0ELBcq2
 qnNOjb++MBc9AULgepPP7m4vnH74v1R3Nd67mMeuq2OQ4Owf9si7ipnugRRGW/4vM85f
 v6hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg0457M5WfhxdxYlU8YbXEeIWy2RA+2UwhhSLhlPhH/9OZRvaHmv9RS5NJ7bKcdJiOtwXvusGQKfcyMrax9CX3llktHMbMkRQoVwVt50h6
X-Gm-Message-State: AOJu0YxRLCz8itidzrNyI8TTnbkX7VCRp21rbdvjhzrKAPjw5iJ7AbUH
 msKvk2ytmaMsGlywaxd0XZp8PsYfQcjgrxiSz1baRlfwcy6/52qg
X-Google-Smtp-Source: AGHT+IFvv+lFVf7ctbMBgdPnE62NbP8Wy6WaIebn1+xIGY49rrJMfTGwVYmEDlV2mh9m21deiF3ujA==
X-Received: by 2002:a2e:9186:0:b0:2de:bae:b306 with SMTP id
 f6-20020a2e9186000000b002de0baeb306mr2307110ljg.8.1714156459506; 
 Fri, 26 Apr 2024 11:34:19 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 11:34:19 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:34:02 +0100
Subject: [PATCH v2 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-4-562ac9866d63@gmail.com>
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156454; l=5638;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=FB4nUm7s1SV7x38lz19WasOXdX8Zxsy0GVCFLqwM5nQ=;
 b=mIzn5aKn9u7Lp70e876ok753DBDaJj3YB4/iiM4G65nYqkftFQ7ez4jqHZL9Eqm7FtQjXy/SI
 suTWxZSmrOUDlCp31Dg3CvfMpRi+uWUD/Z1fbvt5Ni+BUk8hSukZr7M
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

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 88 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cf0b1de1c071..4a3b12b20802 100644
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
@@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
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
+	/* Ignore FASTBLEND violations, because the HW will silently fall back
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
@@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
 		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
 
+	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
+		a7xx_sw_fuse_violation_irq(gpu);
+
 	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
 		msm_gpu_retire(gpu);
 
@@ -2525,6 +2550,59 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
+static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	u32 fuse_val;
+	int ret = 0;
+
+	if (adreno_is_a750(adreno_gpu)) {
+		/* Assume that if qcom scm isn't available, that whatever
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
+		/* On a750 raytracing may be disabled by the firmware, find out whether
+		 * that's the case. The scm call above sets the fuse register.
+		 */
+		fuse_val = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE);
+		adreno_gpu->has_ray_tracing =
+			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+	} else {
+		if (adreno_is_a740(adreno_gpu)) {
+			/* Raytracing is always enabled on a740 */
+			adreno_gpu->has_ray_tracing = true;
+		}
+
+		if (!qcom_scm_is_available())
+			return 0;
+
+		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ);
+	}
+
+	return ret;
+}
+
+
 #define GBIF_CLIENT_HALT_MASK		BIT(0)
 #define GBIF_ARB_HALT_MASK		BIT(1)
 #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
@@ -3094,6 +3172,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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

