Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA28B230E
	for <lists+freedreno@lfdr.de>; Thu, 25 Apr 2024 15:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD97611200C;
	Thu, 25 Apr 2024 13:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CK7Rvp0z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7F011200B
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 13:44:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41a0979b9aeso6658455e9.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714052689; x=1714657489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rTihIX8sLmoVIkXH5QcNahk5MX8P8s9owUap3i41n88=;
 b=CK7Rvp0z4LAwRbM96pIhc0tAOPrit0LKOwwdWJ1ezzebc6nifjF7DUYDO1PCEN5eQ5
 Ze4H3uQIrw/5DvOfqJGnq/cZH8M+oWn6N6MyqWgVi7mjTkfRxqieB43Z1QhrMuw7rQSu
 Aamv9OvgkBMSI3cKOBOhlMQw35lnM5hO0rCzS0rRkwP0nPRuEf06AnDILofxMCWs6iOg
 Eg/Sg1kLOUJaM2D007rLdt/TJKbzuQVwIJxCI+G6gdGZQR5YNLjip1N5WU7RCDmnk0yv
 AQVzRDVJ3KgItkZB3cbmWQAm5c2fv+wqw+cCZGIXlbygcqCSVtRaDPZcn/xWl/lvzc3r
 zWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714052689; x=1714657489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rTihIX8sLmoVIkXH5QcNahk5MX8P8s9owUap3i41n88=;
 b=twa5YJe5qSzSqb0qLhQZq1vPHk8W6a8BAwo536DNEo1wkEJCj5c02+b7uzDvAo2oSa
 Ts1xRFaM9Jw16vvflBtDe7iYujFIQRyFrDusmNme2NOro2TERduz4jTJlhuPih2AUidn
 HhdYIAqf93zCT2s2dYzTBmRvcsOHiMHc2JX+ZNQr4Nrf9MtN88ZU6wtwdRFPDFWbCo4E
 ZGi3K4MkF13cVRFD76m5o1Yes5jME41AEtKi0EVYwOVJ6b9AZaSW1aqyi5Yg4tKtP1Rz
 vC5Gv4njmbvwvAeb4y9lYj+hyG904sueWnFOJhXIcLXJpwQ0qprF+LBEIriEuM85Uuti
 /CHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULZ3jqT8skoKuMnHwUqqPAi9Bv9cODisUiwNoEFYBhxn5JZA8u4ekUpW0dlee3p2iEg4k3EpmmV/xtin4JkbU45vM4iX4lMzqQV+dKxKQS
X-Gm-Message-State: AOJu0YyDfNnNliHhFxlNrNyGY/Yl/XN1ngH8RmfZhKWY98hCkhKBIWDj
 FDEGR7+zRxaIEcecWXeS81ATQcJXiw7faqPchwgNHJSvz34hQH5M
X-Google-Smtp-Source: AGHT+IFZ92tOkIQrO4aXjKukSWhhCUnA1Xin4NMwCj3oY3AYnvdhKhxqz09eLcO+ejeKoynapqIDTg==
X-Received: by 2002:a05:600c:4691:b0:415:6daf:c626 with SMTP id
 p17-20020a05600c469100b004156dafc626mr5654356wmo.21.1714052688603; 
 Thu, 25 Apr 2024 06:44:48 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net.
 [86.12.82.21]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 06:44:47 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
Date: Thu, 25 Apr 2024 14:43:52 +0100
Message-Id: <20240425134354.1233862-5-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cf0b1de1c071..fb2722574ae5 100644
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
 
@@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
+static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ;
+	u32 fuse_val;
+	int ret;
+
+	if (adreno_is_a740(adreno_gpu)) {
+		/* Raytracing is always enabled on a740 */
+		adreno_gpu->has_ray_tracing = true;
+	}
+
+	if (!qcom_scm_is_available()) {
+		/* Assume that if qcom scm isn't available, that whatever
+		 * replacement allows writing the fuse register ourselves.
+		 * Users of alternative firmware need to make sure this
+		 * register is writeable or indicate that it's not somehow.
+		 * Print a warning because if you mess this up you're about to
+		 * crash horribly.
+		 */
+		if (adreno_is_a750(adreno_gpu)) {
+			dev_warn_once(gpu->dev->dev,
+				"SCM is not available, poking fuse register\n");
+			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
+				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
+				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
+			adreno_gpu->has_ray_tracing = true;
+		}
+
+		return 0;
+	}
+
+	if (adreno_is_a750(adreno_gpu))
+		gpu_req |= QCOM_SCM_GPU_TSENSE_EN_REQ;
+
+	ret = qcom_scm_gpu_init_regs(gpu_req);
+	if (ret)
+		return ret;
+
+	/* On a750 raytracing may be disabled by the firmware, find out whether
+	 * that's the case. The scm call above sets the fuse register.
+	 */
+	if (adreno_is_a750(adreno_gpu)) {
+		fuse_val = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE);
+		adreno_gpu->has_ray_tracing =
+			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+	}
+
+	return 0;
+}
+
+
 #define GBIF_CLIENT_HALT_MASK		BIT(0)
 #define GBIF_ARB_HALT_MASK		BIT(1)
 #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
@@ -3094,6 +3173,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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

