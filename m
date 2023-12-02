Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A64801EC6
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 22:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E5E10E0CB;
	Sat,  2 Dec 2023 21:41:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CFB10E22F
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:28 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9f7fe6623so3192641fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553227; x=1702158027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UEUdpBDlfJF5bEBFkoPoPa0EASGcRjNZPjCcs1U5LqQ=;
 b=o5J0JnMgXfnmapiGZxVpab87h5ybPdWxkQ2lYMMiG2mj2ixgUyV2geIXEopOP7sNAg
 D78Ezl4sPK2KchD7oMbClq5/m7x0QSRipjJc2jMjqTvTAzLTyaC6HkmICURtrUmIT4zK
 5ji55U3UhONW4XRnK6hXrY3LlTnKW82LCgkyWXwSix+ScYLR3rhEDSI1P2wvYnPHQQF3
 KN/zjdh5D2IxYrrtaNmjPYcX8Ab73ym+ggu02dyvCtfgl1PRtG1MGgsMiHfWoQoi3uRy
 U8oW1aas1iTo5O47KdVJK+AT4wmsv2tL8OWJGcCZkrgj2/rXF/IhGt+CyzzmQH3usBoE
 WprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553227; x=1702158027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UEUdpBDlfJF5bEBFkoPoPa0EASGcRjNZPjCcs1U5LqQ=;
 b=Ridcx1AcqJENcsUIfI7DPTykR86e7c/Imq6BgNK7F6Kd646AmvN1CXWQkZygiHkXYs
 H2oVa36ikFVsE3jLS/9o687qRViw1NHSIte3gc8Jo1uloyS19Yf1iRyEa+ohG1olEMOB
 HGWM6rgWOSoh0JdIoIEmvU2rjJFnloffXvm/iFh0zrbh6vnFELtBhdm7mHo5H0hRSuEZ
 RY5GAU9jpgXkIlM4DCJBSFTQ5BuI/t2WZ19VViWyqFkzarihT34DqG/O6wV2mBXrGwNr
 mMoASVVWA+w92mSrJQ5QjkYUe5PyT0zbzMY5j85rNlP8+gsmfneCccn1DTXqf4kx0FzE
 1Ozg==
X-Gm-Message-State: AOJu0YyLBZ/t7itjIkcwXz9+tkDVBk5QtNsJrDXoKclMcTjYX1xSwCnD
 2NyOoLgRFuAp/bP0voaRv7eItg==
X-Google-Smtp-Source: AGHT+IF6ps0GaZvKqh/l64to2wptxOBNWlqgLFrJSHL56cc9TgDVBl9ZClF2djte3jbWO007xNV5fQ==
X-Received: by 2002:ac2:5f43:0:b0:50b:d764:2911 with SMTP id
 3-20020ac25f43000000b0050bd7642911mr1019593lfz.169.1701553227206; 
 Sat, 02 Dec 2023 13:40:27 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 00:40:16 +0300
Message-Id: <20231202214016.1257621-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 12/12] drm/msm: drop msm_kms_funcs::get_format()
 callback
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

Now as all subdrivers were converted to use common database of formats,
drop the get_format() callback and use mdp_get_format() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c              | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c            | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c             | 1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c             | 1 -
 drivers/gpu/drm/msm/msm_fb.c                         | 2 +-
 drivers/gpu/drm/msm/msm_kms.h                        | 4 ----
 8 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index bd3ab2ab6515..bf7eb70ed2da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -267,7 +267,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
 
-	fmt = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
+	fmt = mdp_get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
 	DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index cef6066c0d3e..c1ec514e73d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -622,7 +622,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
-	wb_cfg->dest.format = phys_enc->dpu_kms->base.funcs->get_format(&phys_enc->dpu_kms->base,
+	wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
 					     format->pixel_format, job->fb->modifier);
 	if (!wb_cfg->dest.format) {
 		/* this error should be detected during atomic_check */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index faff3aaf1029..4977269fbe57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -981,7 +981,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
 	.check_modified_format = dpu_format_check_modified_format,
-	.get_format      = mdp_get_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1d7e0068e9c3..a8ede71d84de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -659,7 +659,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * select fill format to match user property expectation,
 	 * h/w only supports RGB variants
 	 */
-	fmt = priv->kms->funcs->get_format(priv->kms, DRM_FORMAT_ABGR8888, 0);
+	fmt = mdp_get_format(priv->kms, DRM_FORMAT_ABGR8888, 0);
 	/* should not happen ever */
 	if (!fmt)
 		return;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 4ba1cb74ad76..6e4e74f9d63d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -151,7 +151,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.flush_commit    = mdp4_flush_commit,
 		.wait_flush      = mdp4_wait_flush,
 		.complete_commit = mdp4_complete_commit,
-		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp4_round_pixclk,
 		.destroy         = mdp4_destroy,
 	},
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 48f447f4e183..18670ea40a3a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -267,7 +267,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.prepare_commit  = mdp5_prepare_commit,
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
-		.get_format      = mdp_get_format,
 		.set_split_display = mdp5_set_split_display,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index e3f61c39df69..8326150e5e0c 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -181,7 +181,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 			(char *)&mode_cmd->pixel_format);
 
 	n = info->num_planes;
-	format = kms->funcs->get_format(kms, mode_cmd->pixel_format,
+	format = mdp_get_format(kms, mode_cmd->pixel_format,
 			mode_cmd->modifier[0]);
 	if (!format) {
 		DRM_DEV_ERROR(dev->dev, "unsupported pixel format: %4.4s\n",
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 44aa435d68ce..2b2f3d359709 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -92,10 +92,6 @@ struct msm_kms_funcs {
 	 * Format handling:
 	 */
 
-	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
-	const struct msm_format *(*get_format)(struct msm_kms *kms,
-					const uint32_t format,
-					const uint64_t modifiers);
 	/* do format checking on format modified through fb_cmd2 modifiers */
 	int (*check_modified_format)(const struct msm_kms *kms,
 			const struct msm_format *msm_fmt,
-- 
2.39.2

