Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191409691DB
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 05:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2555910E3E1;
	Tue,  3 Sep 2024 03:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cqVgvDmW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8623E10E3CB
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:04 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f3e9fb6ee9so60001381fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333783; x=1725938583; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NflveyYnYovtLQMxEVFjp15kyCZCViM9R8H2odXJ1rY=;
 b=cqVgvDmWMz6fgmSnVUEIJDSARgu7Ab++KxsEeNOU4REhW0At2vJGgjes5z0kjgolAq
 HJH3TPAJkiASt+zuQ7huydKzO1Gb/mtmGIRlLTDG1v+IT84YB9qKMu5pHROP2Ax6H7GX
 IizvJVRtZii23l49A/IonJ74xrw7fkzfNZMsde3Lx+qwVlK6tACOoHiwOrvH+sJQCZ7D
 ArLZEeK8HrgC8RpK4yR+QmUpzlEkAEiWQ0Bsa6xDBLrcSyxbomMC3CzS2ZBIyS+FfVIu
 flpGqATAndOFd4C7UQnGnzu8pAbPVvAF/4dKAZRcv+Yx16HDR7nzG/QlY967yc7izFje
 Ui9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333783; x=1725938583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NflveyYnYovtLQMxEVFjp15kyCZCViM9R8H2odXJ1rY=;
 b=FM1RtgQU72r5SL0D8S78e5B+rFFzQT6v27ww3pG35MK2MoVa/MX/d6u6PYyX3dOy3X
 wDZ+5cvVxAEvPKbW0YKF4AE/0pZLEE2bYAyS3wrL2U3xKrUlPMSLObjW3wInsm47/Ag1
 YIPlyAnht59++wFdll9BakuLmIFmsKC0fIoRSMOXp5FL8B4eu7GxSOFFqqlrckN1nscW
 rPy13Ufbm/rlmbgz5sDwQNQJ6WcaRzaDCdYugSRU1u1HItzckgnK84wcLBC/6aDlVUN3
 bx9MYkEU85TdrcJFwL0ObjFgShhDsNqPZb6IgsrdkhAUUo/W7s8tVwtlDhm1gQ6jX4um
 hUdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDQOJN9Y8ATUz/1YxbsBgE5mB2V+FQMPMF/Hp89PR3tDnPLXPWcXyl1vY5pEKGR5iZhgCXNUPj5Gw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYfSZVrw2B8YgziVYlQB+P20XLjJPAJ9xmyq0IzVddjLSU0Eor
 DSILahBe+sJ6bvHWaN/oHdL9bK/WONRjZ0vCrF1Dzd3m95LY6LMPQ7qoV1piVAw=
X-Google-Smtp-Source: AGHT+IHmpDXUO/+323A+Df6iLkPew0fV3iI32Kjgczv5HI9HhabWequ+lZjuah4Bc4penrDsvq/srw==
X-Received: by 2002:a2e:b8c1:0:b0:2ee:7a54:3b08 with SMTP id
 38308e7fff4ca-2f636a032acmr41569391fa.3.1725333782059; 
 Mon, 02 Sep 2024 20:23:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:23:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:54 +0300
Subject: [PATCH v6 11/15] drm/msm/dpu: make dpu_format_populate_addrs
 return void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-11-617e1ecc4b7a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6556;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=a5YA8kACmUxKYMvgtfD3Fq4LeNyE8luDzWDo6+BmD4A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEM8OcZxI5bpAzLdNY54tTkPNftNTdkiKfh3
 lBMJrBGKnCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBDAAKCRCLPIo+Aiko
 1W2uB/wKOAr5v55fqCfpkkEHSiCrgHg+oaUC4J0w0jNenqrAcG69R0J7ITByRh8QGM+zAzHwjup
 AmdwjnuqH8/BZiaAxc20y3gZBiW3g8yyFee1CfyI+BewRJaAziwnG3jpclJgYT9Sc7dbf3HaSs9
 140VEx6iGol1pVGF/VMCiz34Sbd2cxohDGOPIz4q41w04zJWkxaSdyDP7afKKatqeqLFIc/r5Ze
 CwrGs//dn1cKKHhfHIpta+dOd9fw7rvI249FaUYuMlZdagQpaEZhWrOl77WNBmPOKTpwunrosHb
 TJoSMKpr7JoPv0qCkkQDWXPOttS/B8081LMuIKRtA1TzMNP1
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

The function msm_framebuffer_iova() can not fail, it always returns a
valid address. Drop the useless checks (that were already performed at
the time) and make dpu_format_populate_addrs() return void.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 62 +++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 10 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 14 ++---
 4 files changed, 21 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index ede926d30285..30d87ff3c227 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -585,11 +585,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	ret = dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
-	if (ret) {
-		DPU_DEBUG("failed to populate layout %d\n", ret);
-		return;
-	}
+	dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index abe3a1c0e409..095bb947f1ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -277,25 +277,15 @@ int dpu_format_populate_plane_sizes(
 	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
-static int _dpu_format_populate_addrs_ubwc(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,
+					    struct drm_framebuffer *fb,
+					    struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
-	if (!fb || !layout) {
-		DRM_ERROR("invalid pointers\n");
-		return -EINVAL;
-	}
-
 	base_addr = msm_framebuffer_iova(fb, aspace, 0);
-	if (!base_addr) {
-		DRM_ERROR("failed to retrieve base addr\n");
-		return -EFAULT;
-	}
 
 	fmt = msm_framebuffer_format(fb);
 	meta = MSM_FORMAT_IS_UBWC(fmt);
@@ -330,7 +320,7 @@ static int _dpu_format_populate_addrs_ubwc(
 			+ layout->plane_size[2] + layout->plane_size[3];
 
 		if (!meta)
-			return 0;
+			return;
 
 		/* configure Y metadata plane */
 		layout->plane_addr[2] = base_addr;
@@ -361,60 +351,36 @@ static int _dpu_format_populate_addrs_ubwc(
 		layout->plane_addr[1] = 0;
 
 		if (!meta)
-			return 0;
+			return;
 
 		layout->plane_addr[2] = base_addr;
 		layout->plane_addr[3] = 0;
 	}
-	return 0;
 }
 
-static int _dpu_format_populate_addrs_linear(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+static void _dpu_format_populate_addrs_linear(struct msm_gem_address_space *aspace,
+					      struct drm_framebuffer *fb,
+					      struct dpu_hw_fmt_layout *layout)
 {
 	unsigned int i;
 
 	/* Populate addresses for simple formats here */
-	for (i = 0; i < layout->num_planes; ++i) {
+	for (i = 0; i < layout->num_planes; ++i)
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
-		if (!layout->plane_addr[i]) {
-			DRM_ERROR("failed to retrieve base addr\n");
-			return -EFAULT;
-		}
-	}
-
-	return 0;
 }
 
-int dpu_format_populate_addrs(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *layout)
+void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
+			       struct drm_framebuffer *fb,
+			       struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
-	int ret;
-
-	if (!fb || !layout) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	if ((fb->width > DPU_MAX_IMG_WIDTH) ||
-			(fb->height > DPU_MAX_IMG_HEIGHT)) {
-		DRM_ERROR("image dimensions outside max range\n");
-		return -ERANGE;
-	}
 
 	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
-		ret = _dpu_format_populate_addrs_ubwc(aspace, fb, layout);
+		_dpu_format_populate_addrs_ubwc(aspace, fb, layout);
 	else
-		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
-
-	return ret;
+		_dpu_format_populate_addrs_linear(aspace, fb, layout);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 2f2bff14c0db..256ca25c37a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -37,14 +37,10 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
  * @aspace:            address space pointer
  * @fb:                framebuffer pointer
  * @fmtl:              format layout structure to populate
- *
- * Return: error code on failure, -EAGAIN if success but the addresses
- *         are the same as before or 0 if new addresses were populated
  */
-int dpu_format_populate_addrs(
-		struct msm_gem_address_space *aspace,
-		struct drm_framebuffer *fb,
-		struct dpu_hw_fmt_layout *fmtl);
+void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
+			       struct drm_framebuffer *fb,
+			       struct dpu_hw_fmt_layout *layout);
 
 int dpu_format_populate_plane_sizes(
 		struct drm_framebuffer *fb,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 39ceb7b65318..df95377b98fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -684,17 +684,9 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		return ret;
 	}
 
-	/* validate framebuffer layout before commit */
-	ret = dpu_format_populate_addrs(pstate->aspace,
-					new_state->fb,
-					&pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-		if (pstate->aspace)
-			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
-						pstate->needs_dirtyfb);
-		return ret;
-	}
+	dpu_format_populate_addrs(pstate->aspace,
+				  new_state->fb,
+				  &pstate->layout);
 
 	return 0;
 }

-- 
2.39.2

