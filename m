Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57691589D
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 23:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9B10E581;
	Mon, 24 Jun 2024 21:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pIAcDp0W";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A05D10E266
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:55 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ce6a9fd5cso1335950e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263633; x=1719868433; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cXiVV87C7egKKo/oKQCbPR7p6Dyhi+8Wd+RPKOL1+cA=;
 b=pIAcDp0WndRxiPyzv1T9FNLpbEK9/VgHuIlamQ7S240VIBYspsgLpScaBVfU/Ie1Fn
 YSKA3mPMh1dufmUUCtVM2DrGe81+IUuvtec8oTwvkZeq7orlSPbjKMV2Qh3x1t14GjOZ
 W22nFTHhCHeNGUmg+FY8V/IxJih/KRSoiQgXO47C9DNicjyL/yItmO1gFiypyrilvpbM
 Ir9oMSGzmZU5lcBca2jXrMebcqEcVkU36tOvCWWZuAwruwTbZJJVhiyafum1Ij1Y+hm7
 EsjU0jwXJD5CrJezXpeiKm64GPth5rTTcnYTS8uteUwpMvkf5shF3rEwbtQo4lS6gLMU
 rP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263633; x=1719868433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXiVV87C7egKKo/oKQCbPR7p6Dyhi+8Wd+RPKOL1+cA=;
 b=X3Rd52FKei7LcB2wF884ZtY+lzgtm2OLQJBC4jvoG4QorBk+Q/NgG0l9SQolrGp3yB
 KTl3U9A2D7uZ+5rR0qkFruTJiiCGn23hXvJDhQaJe5PQPlRsp17e3i5XeugT2gBwtsUK
 KDL2UvAMuzm0Xq8OkaYygMggbef+b58b30EexhX0DSAn9UyPcH+xtIqx0DAJnbp/GGDl
 /2IOMv5nfIgoUU9piFtlNXEKKTSqPVC0wbfhH7oqVtdngrQS1Vk8yj6FxFBF+Yn8WNFJ
 i+H2ADCGvyniRiK/wRDgSUGJPn4jmvam/TnyuI/E7A8o9GcIHnMkO4WZL2YIp2LiOX4k
 VzjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxmy86DCP2BM5Tfg3/OZjUXABg7QsGAI5qTr+9jeWAtnj5xq+6lJHyKoUykXQfEjcf+O6Cp95Qdtsa897S350hbz0NWZUo+O2izlRQoBar
X-Gm-Message-State: AOJu0YwcO449aU6s3mvvEALxSxd4hoz2TZi0CLUzVQ+tyG3btdqeJd/c
 ZR88d0vHrm9K5iXmxlH4mZIMMCOx6RfH1v9ABMs3UYm3MGugLcJwRbVjliMtV49tf3UrHPnnJWD
 BL2w=
X-Google-Smtp-Source: AGHT+IFrnIpDZgkP7y6H7BTVxwu85K6IvesChUCQcKOzhKixAVLyJck212RPQw7QISbMxyYtgL49dQ==
X-Received: by 2002:a05:6512:e95:b0:52c:8a3a:fe2c with SMTP id
 2adb3069b0e04-52ce185d049mr3843315e87.45.1719263632882; 
 Mon, 24 Jun 2024 14:13:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:49 +0300
Subject: [PATCH v5 09/16] drm/msm/dpu: pass drm_framebuffer to
 _dpu_format_get_plane_sizes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-9-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7789;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bp6A68kJPDBcsi8eZULofLfrBBdJDRmZZyWTdQOEhY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGIwzbLTAsfFmiI2P6P05NPGjUe5AyrxDACr
 LjvmxiGqb2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiAAKCRCLPIo+Aiko
 1ZjSB/9AcpvZqbp20Zhiaj9faz2xHE4Rc5/tsrtW2/LViAcvxgE2XdLNDDUBbHRjtMC5EJJ3fv0
 XLbktIMqOJxHlcBKIpninS1Wb8Sh3ptrMlxEcbsvTMbyMJ3tzwVUwWRG5B+uZyq2IMUPanquN4U
 FMWEXWx2+A0YONhroJmAMFeWHYA8j0BRimPxKxyh3lob8Q3/IhOcmMIftSOrQ9H+CvNBueAcbVA
 rco2swrmq4it38bLqQRKdpnmTv3G+9ZMZKkAKhY/Ceel/omcPHIl/GUFsXEnDMHJxRa/edGBpUR
 oNyHrn6n9Ug9Yz1WmAh1Orbr5AMiu944UNwuaYAWAY1ES6Y+
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

Instead of passing width / height / pitches, pass drm_framebuffer
directly. This allows us to drop the useless check for !pitches, since
an array can not be NULL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 73 ++++++++++++++---------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 46237a1ca6a5..df046bc88715 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,8 +95,7 @@ static int _dpu_format_get_media_color_ubwc(const struct msm_format *fmt)
 
 static int _dpu_format_get_plane_sizes_ubwc(
 		const struct msm_format *fmt,
-		const uint32_t width,
-		const uint32_t height,
+		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
 	int i;
@@ -104,8 +103,8 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = width;
-	layout->height = height;
+	layout->width = fb->width;
+	layout->height = fb->height;
 	layout->num_planes = fmt->num_planes;
 
 	color = _dpu_format_get_media_color_ubwc(fmt);
@@ -121,13 +120,13 @@ static int _dpu_format_get_plane_sizes_ubwc(
 		uint32_t uv_meta_scanlines = 0;
 
 		layout->num_planes = 2;
-		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, width);
-		y_sclines = VENUS_Y_SCANLINES(color, height);
+		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
+		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
 			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		layout->plane_pitch[1] = VENUS_UV_STRIDE(color, width);
-		uv_sclines = VENUS_UV_SCANLINES(color, height);
+		layout->plane_pitch[1] = VENUS_UV_STRIDE(color, fb->width);
+		uv_sclines = VENUS_UV_SCANLINES(color, fb->height);
 		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
@@ -135,13 +134,13 @@ static int _dpu_format_get_plane_sizes_ubwc(
 			goto done;
 
 		layout->num_planes += 2;
-		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, width);
-		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, height);
+		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
+		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
 			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		layout->plane_pitch[3] = VENUS_UV_META_STRIDE(color, width);
-		uv_meta_scanlines = VENUS_UV_META_SCANLINES(color, height);
+		layout->plane_pitch[3] = VENUS_UV_META_STRIDE(color, fb->width);
+		uv_meta_scanlines = VENUS_UV_META_SCANLINES(color, fb->height);
 		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
 			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
@@ -150,16 +149,16 @@ static int _dpu_format_get_plane_sizes_ubwc(
 
 		layout->num_planes = 1;
 
-		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, width);
-		rgb_scanlines = VENUS_RGB_SCANLINES(color, height);
+		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
+		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
 			goto done;
 		layout->num_planes += 2;
-		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, width);
-		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, height);
+		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
+		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
@@ -173,23 +172,21 @@ static int _dpu_format_get_plane_sizes_ubwc(
 
 static int _dpu_format_get_plane_sizes_linear(
 		const struct msm_format *fmt,
-		const uint32_t width,
-		const uint32_t height,
-		struct dpu_hw_fmt_layout *layout,
-		const uint32_t *pitches)
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout)
 {
 	int i;
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = width;
-	layout->height = height;
+	layout->width = fb->width;
+	layout->height = fb->height;
 	layout->num_planes = fmt->num_planes;
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
-		layout->plane_size[0] = width * height * fmt->bpp;
-		layout->plane_pitch[0] = width * fmt->bpp;
+		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
+		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
 		uint32_t v_subsample, h_subsample;
 		uint32_t chroma_samp;
@@ -199,7 +196,7 @@ static int _dpu_format_get_plane_sizes_linear(
 		_dpu_get_v_h_subsample_rate(chroma_samp, &v_subsample,
 				&h_subsample);
 
-		if (width % h_subsample || height % v_subsample) {
+		if (fb->width % h_subsample || fb->height % v_subsample) {
 			DRM_ERROR("mismatch in subsample vs dimensions\n");
 			return -EINVAL;
 		}
@@ -207,11 +204,11 @@ static int _dpu_format_get_plane_sizes_linear(
 		if ((fmt->pixel_format == DRM_FORMAT_NV12) &&
 			(MSM_FORMAT_IS_DX(fmt)))
 			bpp = 2;
-		layout->plane_pitch[0] = width * bpp;
+		layout->plane_pitch[0] = fb->width * bpp;
 		layout->plane_pitch[1] = layout->plane_pitch[0] / h_subsample;
-		layout->plane_size[0] = layout->plane_pitch[0] * height;
+		layout->plane_size[0] = layout->plane_pitch[0] * fb->height;
 		layout->plane_size[1] = layout->plane_pitch[1] *
-				(height / v_subsample);
+				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
 			layout->num_planes = 2;
@@ -232,8 +229,8 @@ static int _dpu_format_get_plane_sizes_linear(
 	 * all the components based on ubwc specifications.
 	 */
 	for (i = 0; i < layout->num_planes && i < DPU_MAX_PLANES; ++i) {
-		if (pitches && layout->plane_pitch[i] < pitches[i])
-			layout->plane_pitch[i] = pitches[i];
+		if (layout->plane_pitch[i] < fb->pitches[i])
+			layout->plane_pitch[i] = fb->pitches[i];
 	}
 
 	for (i = 0; i < DPU_MAX_PLANES; i++)
@@ -244,25 +241,24 @@ static int _dpu_format_get_plane_sizes_linear(
 
 static int dpu_format_get_plane_sizes(
 		const struct msm_format *fmt,
-		const uint32_t w,
-		const uint32_t h,
-		struct dpu_hw_fmt_layout *layout,
-		const uint32_t *pitches)
+		struct drm_framebuffer *fb,
+		struct dpu_hw_fmt_layout *layout)
 {
 	if (!layout || !fmt) {
 		DRM_ERROR("invalid pointer\n");
 		return -EINVAL;
 	}
 
-	if ((w > DPU_MAX_IMG_WIDTH) || (h > DPU_MAX_IMG_HEIGHT)) {
+	if (fb->width > DPU_MAX_IMG_WIDTH ||
+	    fb->height > DPU_MAX_IMG_HEIGHT) {
 		DRM_ERROR("image dimensions outside max range\n");
 		return -ERANGE;
 	}
 
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_get_plane_sizes_ubwc(fmt, w, h, layout);
+		return _dpu_format_get_plane_sizes_ubwc(fmt, fb, layout);
 
-	return _dpu_format_get_plane_sizes_linear(fmt, w, h, layout, pitches);
+	return _dpu_format_get_plane_sizes_linear(fmt, fb, layout);
 }
 
 static int _dpu_format_populate_addrs_ubwc(
@@ -407,8 +403,7 @@ int dpu_format_populate_layout(
 	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(fmt, fb->width, fb->height,
-			layout, fb->pitches);
+	ret = dpu_format_get_plane_sizes(fmt, fb, layout);
 	if (ret)
 		return ret;
 

-- 
2.39.2

