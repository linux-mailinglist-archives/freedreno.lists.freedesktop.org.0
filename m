Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F4094790FC3
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 03:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F127810E274;
	Mon,  4 Sep 2023 01:53:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3817410E273
 for <freedreno@lists.freedesktop.org>; Mon,  4 Sep 2023 01:53:44 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bcde83ce9fso14959911fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 18:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693792422; x=1694397222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BTtKn/J1k9sfk/fyOsFRulPqHOclNW7fP9voBuBEnyk=;
 b=OZr5Q6NkjA1CpWdr34K3pdU8ZAe8LMC3tY1Sf6nvATlqVL1BePERniaQFzrHV8aXNm
 eqHfzUWJ+uxOqpj5EYyqeHtE//cNiONt64BpUEv/OcgJFSbyDHuC3EydNQSLIhxI571F
 O2kJiYxbcV/TZ44bBDnjlLjguTn9ZV6XNqrTECBoWhv50h5by7NN91y9b9l+fX08d2+e
 xOuz6le6tp70Hwes0FXaCiXI/QaBqW5I7ESYqcy5jtPUsd242KVge/KG09PmENiZdgKa
 QHoQpejObT9Gp8K/8pdIPn3xlFjRzpjxaZb+kSPzwDvCceOWuVd7ke8Gvli+gcr6Oott
 aXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693792422; x=1694397222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BTtKn/J1k9sfk/fyOsFRulPqHOclNW7fP9voBuBEnyk=;
 b=kpb4918HPGCOpydMSXqKkaUKRvG2H3TKOSeuYSw3AspSZJBuQefUTw6aSHwecl0Vq5
 gsuUGCTzHVqi3ZnIzqbV/aqZ8tbNTanVJSWINjpENElvjigZxKEbJEeQuWnnZFBdAuJq
 QBlspx9rrvFPT9BWFuUYOuNvX73rjL4bm+pgMO22howliJ5JqVn69ZBOw02dHPg4UKIg
 FAQ6Mn7mwIcg2Z03s7EG+SikYON+O9rTRiiS3U/7RLZKAomcUpIX11im7+EwrWaXilZW
 gqZVjpVHsZwG71gTvXmjXJyIEy4biLXHvET9sE22qo5hKfkiNROcy5YIhvITe3rZoSSU
 ze6Q==
X-Gm-Message-State: AOJu0YwU780Eo3E4L/ERDX0WXUfk/MlZBTLGy07Nsul7WIcVPMwAM1TQ
 +MuvJTnA0BptqbPcdn2kzufLAQ==
X-Google-Smtp-Source: AGHT+IEvwjnbDSz8/au6NJ2uDEmaZAs1o17IPKjclpVWzd/6tjjypwk2exCpVbKLsi4YDfdMLPVKyg==
X-Received: by 2002:a2e:9215:0:b0:2b9:3883:a765 with SMTP id
 k21-20020a2e9215000000b002b93883a765mr5662698ljg.31.1693792422145; 
 Sun, 03 Sep 2023 18:53:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a2e9b4e000000b002b6d68b520esm1736657ljj.65.2023.09.03.18.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 18:53:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon,  4 Sep 2023 04:53:38 +0300
Message-Id: <20230904015338.2941417-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
References: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] drm/msm/dpu: move encoder status to
 standard encoder debugfs dir
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Now as we have standard per-encoder debugfs directory, move DPU encoder
status file to that directory.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d34e684a4178..b219382d1153 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -184,7 +184,6 @@ struct dpu_encoder_virt {
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
-	struct dentry *debugfs_root;
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
 	void (*crtc_frame_event_cb)(void *, u32 event);
@@ -2096,7 +2095,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
-	struct dpu_encoder_virt *dpu_enc = s->private;
+	struct drm_encoder *drm_enc = s->private;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i;
 
 	mutex_lock(&dpu_enc->enc_lock);
@@ -2118,48 +2118,16 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
+static void dpu_encoder_debugfs_init(struct drm_encoder *drm_enc, struct dentry *root)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-
-	char name[12];
-
-	if (!drm_enc->dev) {
-		DPU_ERROR("invalid encoder or kms\n");
-		return -EINVAL;
-	}
-
-	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
-
-	/* create overall sub-directory for the encoder */
-	dpu_enc->debugfs_root = debugfs_create_dir(name,
-			drm_enc->dev->primary->debugfs_root);
-
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
-		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
-
-	return 0;
+			    root, drm_enc, &_dpu_encoder_status_fops);
 }
 #else
-static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
-{
-	return 0;
-}
+#define dpu_encoder_debugfs_init NULL
 #endif
 
-static int dpu_encoder_late_register(struct drm_encoder *encoder)
-{
-	return _dpu_encoder_init_debugfs(encoder);
-}
-
-static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
-
-	debugfs_remove_recursive(dpu_enc->debugfs_root);
-}
-
 static int dpu_encoder_virt_add_phys_encs(
 		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
@@ -2343,8 +2311,7 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.destroy = dpu_encoder_destroy,
-		.late_register = dpu_encoder_late_register,
-		.early_unregister = dpu_encoder_early_unregister,
+		.debugfs_init = dpu_encoder_debugfs_init,
 };
 
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-- 
2.39.2

