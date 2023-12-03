Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1EE80237F
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FA210E2AD;
	Sun,  3 Dec 2023 11:53:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9A910E2B3
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:53:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9f099cf3aso13099401fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701604397; x=1702209197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PFTAGc3QYVoqFp9AbmYvGSRKwFC60GWNWgRVZciPMt0=;
 b=idmu/thjGfno4nCVXDgbuhWXLozeIwXuMzRCT8GhWSVLqKpA6g9f2F7RG17rGYhSzi
 nJkzZZ7FHiXJFHACRtAYdDeaimi0GJQ67emc55CvU+Q9u9lt0a9oJ2AEDinnaHVYpmIY
 /6uPFTq1skd6JqFytSN3rXrzmNT7X/5/shkQTja8IhSJbtvu+raeqQ1hA9ULXLxNI/+7
 TTcxbQNmlkh9BoG2KKY92NbhLGEj1NoB4IRwwI78nm+k51daGfPYLFW1X9RM175lNGt5
 z42+jtDvRwikPiuSKh2pEpvd7UD7imULcjguVIxfozufBout5LdWMmgvwNjquPZ6OK2R
 e6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701604397; x=1702209197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PFTAGc3QYVoqFp9AbmYvGSRKwFC60GWNWgRVZciPMt0=;
 b=ekDFStej0Mw+2TrpBkP+iChXOBRRjGfYVr+e7FWrBRt0dSem0RqFZElInkVp3Kq0EN
 pYvHeQvvHEFDPkfhRa0T5zbe0ZZDwSTaFwdPTIc1T2JSnmGwnZa0SRgeBQOoxrrYJl3A
 h6s0QUCtHab02PbtWtoH7NNF7/uwETwPB8kaRkosPFP5yjZ8PE9P693do5HCQp6iK3+1
 kr6YXRw0it+AOyEBJALeOOVXRLRVVpUNMxn4Q9sfEbIw2kdMKlXfszhp8pntHW2paekX
 PtmFqCKLlpOWa+03KGKudwbkMGDOXDl83YNGvuMIIpZnr/j2QvU6Smkg4j0YT8ca5HAD
 vH0w==
X-Gm-Message-State: AOJu0YzE6UlDCH7MKtUkY/RUTaVUpTwOD3pZMi3DZV8VqyorpVqiM5Vs
 CclcTqiEmKYNruoYtdJhADAS7Q==
X-Google-Smtp-Source: AGHT+IE1JbuQykvUlHXzEkDJGTB71/B6UID4Fjv0wbt4uqD2s0mo8BjQyYyfsjFKJwEypHjQB+K47w==
X-Received: by 2002:a2e:8e99:0:b0:2c9:f60f:6518 with SMTP id
 z25-20020a2e8e99000000b002c9f60f6518mr676861ljk.65.1701604397438; 
 Sun, 03 Dec 2023 03:53:17 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e9645000000b002c9c21d01c2sm900437ljh.101.2023.12.03.03.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:53:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  3 Dec 2023 14:53:13 +0300
Message-Id: <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND v2 1/3] drm/encoder: register per-encoder
 debugfs dir
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_encoder.c  |  4 ++++
 drivers/gpu/drm/drm_internal.h |  9 +++++++++
 include/drm/drm_encoder.h      | 16 +++++++++++++++-
 4 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index f291fb4b359f..00406b4f3235 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -589,4 +589,29 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
+void drm_debugfs_encoder_add(struct drm_encoder *encoder)
+{
+	struct drm_minor *minor = encoder->dev->primary;
+	struct dentry *root;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "encoder-%d", encoder->index);
+	if (!name)
+		return;
+
+	root = debugfs_create_dir(name, minor->debugfs_root);
+	kfree(name);
+
+	encoder->debugfs_entry = root;
+
+	if (encoder->funcs->debugfs_init)
+		encoder->funcs->debugfs_init(encoder, root);
+}
+
+void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
+{
+	debugfs_remove_recursive(encoder->debugfs_entry);
+	encoder->debugfs_entry = NULL;
+}
+
 #endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 1143bc7f3252..8f2bc6a28482 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -30,6 +30,7 @@
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 /**
  * DOC: overview
@@ -74,6 +75,8 @@ int drm_encoder_register_all(struct drm_device *dev)
 	int ret = 0;
 
 	drm_for_each_encoder(encoder, dev) {
+		drm_debugfs_encoder_add(encoder);
+
 		if (encoder->funcs && encoder->funcs->late_register)
 			ret = encoder->funcs->late_register(encoder);
 		if (ret)
@@ -90,6 +93,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
 	drm_for_each_encoder(encoder, dev) {
 		if (encoder->funcs && encoder->funcs->early_unregister)
 			encoder->funcs->early_unregister(encoder);
+		drm_debugfs_encoder_remove(encoder);
 	}
 }
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b12c463bc460..7df17e4b0513 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -194,6 +194,8 @@ void drm_debugfs_connector_remove(struct drm_connector *connector);
 void drm_debugfs_crtc_add(struct drm_crtc *crtc);
 void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
 void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
+void drm_debugfs_encoder_add(struct drm_encoder *encoder);
+void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
 #else
 static inline void drm_debugfs_dev_fini(struct drm_device *dev)
 {
@@ -231,6 +233,13 @@ static inline void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc)
 {
 }
 
+static inline void drm_debugfs_encoder_add(struct drm_encoder *encoder)
+{
+}
+static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
+{
+}
+
 #endif
 
 drm_ioctl_t drm_version;
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 3a09682af685..977a9381c8ba 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -60,7 +60,7 @@ struct drm_encoder_funcs {
 	 * @late_register:
 	 *
 	 * This optional hook can be used to register additional userspace
-	 * interfaces attached to the encoder like debugfs interfaces.
+	 * interfaces attached to the encoder.
 	 * It is called late in the driver load sequence from drm_dev_register().
 	 * Everything added from this callback should be unregistered in
 	 * the early_unregister callback.
@@ -81,6 +81,13 @@ struct drm_encoder_funcs {
 	 * before data structures are torndown.
 	 */
 	void (*early_unregister)(struct drm_encoder *encoder);
+
+	/**
+	 * @debugfs_init:
+	 *
+	 * Allows encoders to create encoder-specific debugfs files.
+	 */
+	void (*debugfs_init)(struct drm_encoder *encoder, struct dentry *root);
 };
 
 /**
@@ -184,6 +191,13 @@ struct drm_encoder {
 
 	const struct drm_encoder_funcs *funcs;
 	const struct drm_encoder_helper_funcs *helper_private;
+
+	/**
+	 * @debugfs_entry:
+	 *
+	 * Debugfs directory for this CRTC.
+	 */
+	struct dentry *debugfs_entry;
 };
 
 #define obj_to_encoder(x) container_of(x, struct drm_encoder, base)
-- 
2.39.2

