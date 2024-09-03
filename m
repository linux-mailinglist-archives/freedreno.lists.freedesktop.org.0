Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F269691D8
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 05:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6D910E3DA;
	Tue,  3 Sep 2024 03:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EJ/iQbqA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C602710E3D7
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:03 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f51b67e16dso54947041fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333782; x=1725938582; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hlHosw42irjAE4eSpgL5tq+xOsmfq1L7o+p8smAZqg8=;
 b=EJ/iQbqAI2C2cQC7bd9WZyo+nKCROO7edPNgig1cksH5OOAve97keqlqigowfSVHC3
 s+SJDeXu4iJWbQ6QaHPYeavcvfw/aSeCkmeMukeot4mqDhDznnu/xiLWZOFlb0ilINP6
 UGhQ4N4kdMV0f6YD0VzkEgb3dAOvqz98rxNGJFVoEk4ySwAhSk9WWFeYBwS6wj6jxaJD
 GiQ1X0FuFak6yJ3a1HKYpbHw4FGJQ3696CIGHTm4p9eOGofpTJiKkaYA3/H8Ov/FGL9E
 o8mXp3Z4XtfGTJCgLvrI9TDDF5cdEz6wzam+sjxJBrKkX8ADGJryyD/qJ0BL4UuFiOfo
 AdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333782; x=1725938582;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hlHosw42irjAE4eSpgL5tq+xOsmfq1L7o+p8smAZqg8=;
 b=YWY5PjzrKvW6xVozHv5TREJXtk3vavxMeI2q/4eAvzP8QbG8yQ4JKRvlR8HjBUfX9X
 ZdL664cMRyvbRC6N/UNtFRoWJw34ATXCCXWvkVJgWthw5b1nMG4oIpmSx7UzSIysfUik
 5EfixXrIKM3fBLMF4QytBSlR9IbzUg1wzm0RjtT6VuxQWZVcMO7kkS0mlMnaGulCHEZp
 rPwyGItc3qfdzPw7ITFXvTa1qrdB8UHFylW76UaNT7SAr/ybyj/RMJePL37QtDxT8vgm
 1npYPxlVt2QuLQKSmsdalPOC59f1fTLJcSxtrnYNj2y8o4ZDtJxFrvMbgIBT5usnVLc9
 uEQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO81EhFBVh3omT3/XYlS4jbvCh4iEwK7TAXw4+jmr3a0Ga0Yy4XXXSGx6uRLYqN/3tylI7cinUhtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/+juIb6NaGBeJV4OkSvBCBDdPG3BMKhJGpNVYqafIslmkP1OB
 ArkjV6NcmrQabQh2p+JYx24RR4pjIxzCnIK3Gr6NNsWXPivRzBYzPrPjSYCaIt4=
X-Google-Smtp-Source: AGHT+IHVewIoZZ8n+zPcMtvkRlvtaleNA01F5L/r0rIdgnc1Z8JG7qzJyhoMRSVLWaabgJF8kPzmYQ==
X-Received: by 2002:a05:651c:551:b0:2f5:ce9:14df with SMTP id
 38308e7fff4ca-2f6108a77ebmr110733631fa.40.1725333781342; 
 Mon, 02 Sep 2024 20:23:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:53 +0300
Subject: [PATCH v6 10/15] drm/msm/dpu: split dpu_format_populate_layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-10-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6392;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y8DgJCrh+hdjgmNdEpxMNgSg4lRIgEqSrkB+B0sbClU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEMLVq9Y9+wRcd2UNeNzdRcTJPj97EXNA9Kb
 u1dkcHgsxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDAAKCRCLPIo+Aiko
 1WeuB/4pximPIk9C0is6iCXqSCjlezCGOdRpGU5uyFGOP68LIsG5ORmmmwX3DjvykNqQ2UuC6Qb
 e5hWuMLgVdJlI3MKGG9VuUlPFlBS1khwMz1YWspM9UpoQxgLL3cYezE3EHtDhG68kexaehni8Zr
 U+NKL85xWmVPGrKw3roH1+1ogxr6hEQZh9Leljd7ouqdpe5tOUc/20+GZ+FFlSThUE8XkRBkrqx
 1mzdkkYIuiK59WZRDsVi+ySesGA1hNBz4bJCyzP5lFA13hOyYBJGUW2N50f5cpzXaX8SsPl4O1C
 a8/GuQwEpn9R0rXT6OWxkgT5mvV3WYwRXh/AQ5S2MQDEjsRF
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

Split dpu_format_populate_layout() into addess-related and
pitch/format-related parts.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 32 +++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  8 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 15 ++++++++--
 4 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index c4a16a73bc97..ede926d30285 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -579,7 +579,13 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
-	ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
+	ret = dpu_format_populate_plane_sizes(job->fb, &wb_cfg->dest);
+	if (ret) {
+		DPU_DEBUG("failed to populate plane sizes%d\n", ret);
+		return;
+	}
+
+	ret = dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
 	if (ret) {
 		DPU_DEBUG("failed to populate layout %d\n", ret);
 		return;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 4d17eb88af40..abe3a1c0e409 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -93,7 +93,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 	return color_fmt;
 }
 
-static int _dpu_format_get_plane_sizes_ubwc(
+static int _dpu_format_populate_plane_sizes_ubwc(
 		const struct msm_format *fmt,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -170,7 +170,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	return 0;
 }
 
-static int _dpu_format_get_plane_sizes_linear(
+static int _dpu_format_populate_plane_sizes_linear(
 		const struct msm_format *fmt,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -244,12 +244,21 @@ static int _dpu_format_get_plane_sizes_linear(
 	return 0;
 }
 
-static int dpu_format_get_plane_sizes(
-		const struct msm_format *fmt,
+/*
+ * dpu_format_populate_addrs - populate non-address part of the layout based on
+ *                     fb, and format found in the fb
+ * @fb:                framebuffer pointer
+ * @layout:              format layout structure to populate
+ *
+ * Return: error code on failure or 0 if new addresses were populated
+ */
+int dpu_format_populate_plane_sizes(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	if (!layout || !fmt) {
+	const struct msm_format *fmt;
+
+	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
@@ -260,10 +269,12 @@ static int dpu_format_get_plane_sizes(
 		return -ERANGE;
 	}
 
+	fmt = msm_framebuffer_format(fb);
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, fb, layout);
+		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, fb, layout);
+	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -377,7 +388,7 @@ static int _dpu_format_populate_addrs_linear(
 	return 0;
 }
 
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
@@ -398,11 +409,6 @@ int dpu_format_populate_layout(
 
 	fmt = msm_framebuffer_format(fb);
 
-	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(fmt, fb, layout);
-	if (ret)
-		return ret;
-
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index ef1239c95058..2f2bff14c0db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -32,7 +32,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 }
 
 /**
- * dpu_format_populate_layout - populate the given format layout based on
+ * dpu_format_populate_addrs - populate buffer addresses based on
  *                     mmu, fb, and format found in the fb
  * @aspace:            address space pointer
  * @fb:                framebuffer pointer
@@ -41,9 +41,13 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
  * Return: error code on failure, -EAGAIN if success but the addresses
  *         are the same as before or 0 if new addresses were populated
  */
-int dpu_format_populate_layout(
+int dpu_format_populate_addrs(
 		struct msm_gem_address_space *aspace,
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *fmtl);
 
+int dpu_format_populate_plane_sizes(
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout);
+
 #endif /*_DPU_FORMATS_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 93ac5afb623c..39ceb7b65318 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -675,10 +675,19 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		if (pstate->aspace)
+			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
+						pstate->needs_dirtyfb);
+		return ret;
+	}
+
 	/* validate framebuffer layout before commit */
-	ret = dpu_format_populate_layout(pstate->aspace,
-					 new_state->fb,
-					 &pstate->layout);
+	ret = dpu_format_populate_addrs(pstate->aspace,
+					new_state->fb,
+					&pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		if (pstate->aspace)

-- 
2.39.2

