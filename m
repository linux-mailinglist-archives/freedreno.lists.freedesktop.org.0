Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18E38D785F
	for <lists+freedreno@lfdr.de>; Sun,  2 Jun 2024 23:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C05B10E13D;
	Sun,  2 Jun 2024 21:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DCFlMBms";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294CC10E0AD
 for <freedreno@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:54 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b976b5d22so600736e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364392; x=1717969192; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Axn0CffF4ZXu41BfYhRYHrbH241ZyeeHoXr5qagjCJ0=;
 b=DCFlMBms7OqoBH7fWub4TM/CiMBclO9KQ2LJkcfvMw8PaaJuTTGz/5fZRnSrFo2x1Z
 uUuSLk/C5EqirGfmXu9Hok8A/c3O8Wb5ljCE8jMp7QCsiSgFwmm3kTgZvKX7a7T+jczX
 t7GxQ8mPVeh++y4kC5GngC51IQGXW+pi/zfmlfJwCvxJXMLZOlCs/eQcQSF7pwYH7RXF
 kk3P7rcpy29GyBq0ZbByqRPUEG6Um1S21bUiVsZVK1KI2cbrUvg/vcVHLE1zhADZeheT
 e82JlZFhsuTwUVbf9qbfH+PFP3uUtez2wyxRefk2y+LOCyz3vhnhdTKDULIuLqPKxg6x
 j5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364392; x=1717969192;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Axn0CffF4ZXu41BfYhRYHrbH241ZyeeHoXr5qagjCJ0=;
 b=TrazlLpjwa4xLhbxv4H0GwkTq9SoGy+xR7WXZUMC6gl32HBexCmOxb4d2be1C8dSuO
 L13cw5j40ou/ETW6XGRmcpPYg105FPTwawL7itXTeoCCNtvQ4GdE0r4xBcXpvH90MF19
 jLEw/FyNn9wpkMlN9bRm632fQXyGpt5JcFCOWWDNNczKvUs3DWu3jklp5tpVVRDCXjuX
 88JOL178nMUeah000clSAmioIfF2vBV5oa7MWZCjqWmAQv10B/zs5PlNSIIn7aI02X4z
 IhIAaNBim2OI2Ep7dd7FfkHrgMG/YDQygm6XzCUkfduPKPgw++vay1Y7xvCtXGjOkr6F
 zTow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/r9Rp17Ll8w8zA+L7Ih0zI4rHTA8G/z2qgM8jrfkFupU137ess3N1976iqs17N2vfn64KTH285kiOWNu/1gRAMKzpLkUJdFILHrUNxL7q
X-Gm-Message-State: AOJu0YzpCIZtleemhUh412TNJzXSJ7t9E7FYpM0rS9YTWq6lES6bq7P9
 p5AztDG8m5pHAQvKiIgBYm3uDt21+9FUYqgon/Y0JVvzDSVXZ4TFD0U5UcuKfgA=
X-Google-Smtp-Source: AGHT+IFfReYRhO/HiJhMNiFndyCOAnoEs/0TBIkJ4a6aBxNSnQZ3JaNQvEPnqjZNZRCjA4ePM7CNwA==
X-Received: by 2002:a19:ca17:0:b0:528:649b:d7bb with SMTP id
 2adb3069b0e04-52b8949e1a9mr4408779e87.0.1717364392118; 
 Sun, 02 Jun 2024 14:39:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:47 +0300
Subject: [PATCH v2 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-1-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4184;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nHy/s501BKISDY/viUTlwbtLfmlHRF5tf45zr5mVRjI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOakbZRQAWT1SrHe2d4rp3wBk6oRcDx5dtv92
 q7JRPvfocyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpAAKCRCLPIo+Aiko
 1T+5B/935Z6X8ffnw1vTDzVAMCOqiaH0eDbY03Q5LjZT49O5xZEuZe15kolZhjlB6mgWpF5PbR/
 CSI4fUcTPvN9h4v6TOkwldQJXXV+PcUBprbMFuMOD/9T3O5SL+aLJIKnw9mwGZmWIqXLcePiFyq
 0MFiprqUusppYPnWSB2aAJgbu6ExTjTBPxYWZq33Um+qKGl9ls32tW+HnA1EObepxmn67ef7Nzk
 wd6gM5mVXWbZwq/dNEOGSYHZ6bDF7bfNfRCHBSh6GQD1BbHGC9JSzo7puXZpNOLpMyyf2MtYEGV
 Eq4nfvxZo+KvOEQGdB5h03JDeX5Q3y5pU2n/ptJVmW7daxAh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The msm_kms_funcs::check_modified_format() callback is not used by the
driver. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 43 -----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 16 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
 drivers/gpu/drm/msm/msm_kms.h               |  6 ----
 4 files changed, 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 6b1e9a617da3..027eb5ecff08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -423,46 +423,3 @@ int dpu_format_populate_layout(
 
 	return ret;
 }
-
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos)
-{
-	const struct drm_format_info *info;
-	struct dpu_hw_fmt_layout layout;
-	uint32_t bos_total_size = 0;
-	int ret, i;
-
-	if (!fmt || !cmd || !bos) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	info = drm_format_info(fmt->pixel_format);
-	if (!info)
-		return -EINVAL;
-
-	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
-			&layout, cmd->pitches);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < info->num_planes; i++) {
-		if (!bos[i]) {
-			DRM_ERROR("invalid handle for plane %d\n", i);
-			return -EINVAL;
-		}
-		if ((i == 0) || (bos[i] != bos[0]))
-			bos_total_size += bos[i]->size;
-	}
-
-	if (bos_total_size < layout.total_size) {
-		DRM_ERROR("buffers total size too small %u expected %u\n",
-				bos_total_size, layout.total_size);
-		return -EINVAL;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 210d0ed5f0af..ef1239c95058 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,22 +31,6 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-/**
- * dpu_format_check_modified_format - validate format and buffers for
- *                   dpu non-standard, i.e. modified format
- * @kms:             kms driver
- * @msm_fmt:         pointer to the msm_fmt base pointer of an msm_format
- * @cmd:             fb_cmd2 structure user request
- * @bos:             gem buffer object list
- *
- * Return: error code on failure, 0 on success
- */
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *msm_fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos);
-
 /**
  * dpu_format_populate_layout - populate the given format layout based on
  *                     mmu, fb, and format found in the fb
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1955848b1b78..0d1dcc94455c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -981,7 +981,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.complete_commit = dpu_kms_complete_commit,
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
-	.check_modified_format = dpu_format_check_modified_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1e0c54de3716..e60162744c66 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -92,12 +92,6 @@ struct msm_kms_funcs {
 	 * Format handling:
 	 */
 
-	/* do format checking on format modified through fb_cmd2 modifiers */
-	int (*check_modified_format)(const struct msm_kms *kms,
-			const struct msm_format *msm_fmt,
-			const struct drm_mode_fb_cmd2 *cmd,
-			struct drm_gem_object **bos);
-
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
 			struct drm_encoder *encoder);

-- 
2.39.2

