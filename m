Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3387FE92
	for <lists+freedreno@lfdr.de>; Tue, 19 Mar 2024 14:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6599310FA97;
	Tue, 19 Mar 2024 13:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t/DNKSrx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B42E10FAAC
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:04 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so6227520e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854522; x=1711459322; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+fNq+ljFUI7fcqD7OFiXNswdwfx8fClPGMRPkyoFRqo=;
 b=t/DNKSrxf6oSEnE21H/yb8RzoJv2/H3nkSG4bsdqjBUn/2Q99ix8Ve2z9x/A1K60kF
 ZCMCs87a5yY5TPMTrUyyDNJAyZpvHTL1M3HGu5zZpSAIkEoiDjh0RPuy//seyr8QC0cs
 CRIpeq9JZPsl4T2WdNuR43jEobq2PVoXnaeiur5lvQMVE6JA02Pv+lbRzzDvAaJ/yNDw
 Dzibt2wiWblnjdmP5P/NypFrHy+eMkNwzHbQNLIEOz31NWHtXAIO9I/a+gmtnpuMtzZL
 jfyeCj+hk9Ajy+mzP6GSuZ194gQ+qDckZsxyXyyGF5+IFR4lw7VdpPAZW4NfAYQS3TF9
 5iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854522; x=1711459322;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+fNq+ljFUI7fcqD7OFiXNswdwfx8fClPGMRPkyoFRqo=;
 b=SMADQYmebwUOsncjoEnkyKNFKzsRsDUcWgCGDGHNTXoNLqqWofHP0vJR0S5jy1BEY7
 Azg6Sw9+BFOs/NXk4VYdxvLLCeLaaDPwaaJOgxOENf8UyD0jggKfXCMyvRbniJvYPuW3
 Kg1HaVGfAFvDYhg7QKwFSeysQUfGqhsQ3rFl5sL0QgLEeZOToNvpQb6unsXDD7ZhkU+y
 d4qIEXZIEZmcLYVGuBtSYqqd84pI381EPopKrsaNwi/KD4hXt9vIjv49M1bFED00/4cL
 7ZV4rLh3+bzQ3JFFrvS8DhZej+z14wz9hF5AMC/CvlkkWK5NnN/Xydty8glegXZ3M8cW
 V3Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE42Bd+V1PW1bXJsGzSeKXGK7cXuSL/afDQARiHok6roAz34m+06Ph9K2mI+yxhfRCgwGsgTH2S7FjCS51lhzK2G1bqXmIji1fKNa82rlw
X-Gm-Message-State: AOJu0YzcBOkOQKHoOhk82ZwopitLOrAuLe8SbEc1ISazpLh0hYYs6/mQ
 FoicavKm3eju/4IHvfykEwyCoGkGymyKv+Yb93i5wfMKD8SKWTfCVzKw44F7bHA=
X-Google-Smtp-Source: AGHT+IECaHeIQblFB/9SyDMHi/valk7FklMHNymPDDVkWfEGdE2IkDgDfuLPcEW+m6WpTHKUAEujxw==
X-Received: by 2002:a2e:7004:0:b0:2d4:93d3:11ab with SMTP id
 l4-20020a2e7004000000b002d493d311abmr6365302ljc.6.1710854522316; 
 Tue, 19 Mar 2024 06:22:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:21:59 +0200
Subject: [PATCH 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4389;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NmZ9EICiCbbTtUxJRhya/PBGKcbwZZCO3QzN71dugWI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3TOFe2Gz3tn4gkOTJDpz5y1bhM28EHGZbH
 oezmXRP0ZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1RirB/wKPBpr/8QFMjPQ4Rnlfp7u0uSfs2gg71A/I9TIebeW7Q3gzrVNj0AsNj2nMNxZyF4x6fK
 M1+A3CFSjqpWZQHHLGYL06VAQKR/F7WYAkgVyO8fnM9/Z/hWjhcAJIWsoAXWu0ciRuHYafIkU/4
 UA5x0ICEEYUwxJCSaV31YxTLQrcyd7chk3/A4mYTs5MCzq+QMiwCqdyrBWCLuBTzrV9iKTJA17O
 9ymJklyBmfUXZGXVQNykhVwNzj4Ka/+nUR3eQmKu15aPbE1JgQloKjPv4mzlDPSWDCbv8jzXZpr
 Lx+jcdovA8ilQ4jn+29e4FMdV0Z5mrTgFT2bfDdmv4deiKpK
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 45 -----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 15 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
 drivers/gpu/drm/msm/msm_kms.h               |  5 ----
 4 files changed, 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index e366ab134249..ff0df478c958 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -960,51 +960,6 @@ int dpu_format_populate_layout(
 	return ret;
 }
 
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *msm_fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos)
-{
-	const struct drm_format_info *info;
-	const struct dpu_format *fmt;
-	struct dpu_hw_fmt_layout layout;
-	uint32_t bos_total_size = 0;
-	int ret, i;
-
-	if (!msm_fmt || !cmd || !bos) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	fmt = to_dpu_format(msm_fmt);
-	info = drm_format_info(fmt->base.pixel_format);
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
-
 const struct dpu_format *dpu_get_dpu_format_ext(
 		const uint32_t format,
 		const uint64_t modifier)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 84b8b3289f18..9442445f1a86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -54,21 +54,6 @@ const struct msm_format *dpu_get_msm_format(
 		const uint32_t format,
 		const uint64_t modifiers);
 
-/**
- * dpu_format_check_modified_format - validate format and buffers for
- *                   dpu non-standard, i.e. modified format
- * @kms:             kms driver
- * @msm_fmt:         pointer to the msm_fmt base pointer of an dpu_format
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
 
 /**
  * dpu_format_populate_layout - populate the given format layout based on
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a1f5d7c4ab91..7257ac4020d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -969,7 +969,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.complete_commit = dpu_kms_complete_commit,
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
-	.check_modified_format = dpu_format_check_modified_format,
 	.get_format      = dpu_get_msm_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 0641f6111b93..b794ed918b56 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -96,11 +96,6 @@ struct msm_kms_funcs {
 	const struct msm_format *(*get_format)(struct msm_kms *kms,
 					const uint32_t format,
 					const uint64_t modifiers);
-	/* do format checking on format modified through fb_cmd2 modifiers */
-	int (*check_modified_format)(const struct msm_kms *kms,
-			const struct msm_format *msm_fmt,
-			const struct drm_mode_fb_cmd2 *cmd,
-			struct drm_gem_object **bos);
 
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,

-- 
2.39.2

