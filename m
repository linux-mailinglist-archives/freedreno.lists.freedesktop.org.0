Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648CE6EAF14
	for <lists+freedreno@lfdr.de>; Fri, 21 Apr 2023 18:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868C410EE73;
	Fri, 21 Apr 2023 16:27:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411A10EE6B
 for <freedreno@lists.freedesktop.org>; Fri, 21 Apr 2023 16:27:57 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-b9246a5f3feso3217386276.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Apr 2023 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682094476; x=1684686476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQvRknvrozsjgOo+aHdUqHX5mEjM0UqwOQuOkiFPD1Q=;
 b=JPm25DCMJnNaNKhW7hh/fij7HnfsUar5DduuEuxULReqGwM5ogEgarTjySO2KgOwOu
 DCb+J7VDL7+MKhkMVF1RS0S9bLjSsX8hPwukzDyFiSg3Li4LT48u+M8P22HmL1xc1sN3
 pbbLV4jG0gMqlJ7D7sGcAbnYxSTxofyD1BsXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682094476; x=1684686476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQvRknvrozsjgOo+aHdUqHX5mEjM0UqwOQuOkiFPD1Q=;
 b=h47KmntvZyfi/CoXPU3oZxnG3QUboFVXaCTUh85Y/JZnR2rJvTm65z08An6lWnFYL2
 DdiBzlqkAKQXggR1JWlu/2I5VKejxWwquSL8jMIvvA+z5Hi1bHh7yE7xWzVLEs3dle/y
 xDBdnOEoW2jg9ImBDC/f3cibLvpNhJJg+ZXkuvZSqLOArcNPkZHKTPnp5BWuxFtm/O55
 mOEXUpUfOqEUGQ+ZaZpyIDiFoK766+u5d0eDLfqERrWKEvCiCTJ1T3HPJjALkD5RheCN
 xqFuuPSVF5OcG/lky2GCbe7nTG2LsxIB6eqKfxa3BgzDjgFSY9/v/6BlzpzqvFFRKXJx
 TDfA==
X-Gm-Message-State: AAQBX9eS7soaV8yca5TOfEZdrj8ss352PF4BWjBOXYde1qnGABZrcxsP
 sgoLR603TLjuMUyVy/Kx/srSlA==
X-Google-Smtp-Source: AKy350YWdHbjJWt/68J0CiZQY233okaVKUD2d51H6vWplrPeugjfJQTbpP0cfqyQsM2ezDODf2HRDQ==
X-Received: by 2002:a25:e785:0:b0:b8f:3293:8e6 with SMTP id
 e127-20020a25e785000000b00b8f329308e6mr2684306ybh.38.1682094476523; 
 Fri, 21 Apr 2023 09:27:56 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:25e5:2115:c97c:bf00])
 by smtp.gmail.com with UTF8SMTPSA id
 m132-20020a25588a000000b00b7767ca747bsm1010963ybb.24.2023.04.21.09.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:27:56 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Apr 2023 12:27:48 -0400
Message-ID: <20230421162749.360777-3-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230421162749.360777-1-markyacoub@google.com>
References: <20230421162749.360777-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] DRM: Create new Content Protection
 connector property
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
Cc: dmitry.baryshkov@linaro.org, Mark Yacoub <markyacoub@chromium.org>,
 seanpaul@chromium.org, dianders@chromium.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

[Why]
To enable Protected Content, some drivers require a key to be injected
from user space to enable HDCP on the connector.

[How]
Create new "Content Protection Property" of type "Blob"

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 9 +++++++++
 include/drm/drm_connector.h       | 6 ++++++
 include/drm/drm_mode_config.h     | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d867e7f9f2cd5..e20bc57cdb05c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -749,6 +749,11 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->content_protection = val;
 	} else if (property == config->hdcp_content_type_property) {
 		state->hdcp_content_type = val;
+	} else if (property == config->content_protection_key_property) {
+		ret = drm_atomic_replace_property_blob_from_id(
+			dev, &state->content_protection_key, val, -1, -1,
+			&replaced);
+		return ret;
 	} else if (property == connector->colorspace_property) {
 		state->colorspace = val;
 	} else if (property == config->writeback_fb_id_property) {
@@ -843,6 +848,10 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->content_protection;
 	} else if (property == config->hdcp_content_type_property) {
 		*val = state->hdcp_content_type;
+	} else if (property == config->content_protection_key_property) {
+		*val = state->content_protection_key ?
+			       state->content_protection_key->base.id :
+			       0;
 	} else if (property == config->writeback_fb_id_property) {
 		/* Writeback framebuffer is one-shot, write and forget */
 		*val = 0;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 7b5048516185c..2fbe51272bfeb 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -896,6 +896,12 @@ struct drm_connector_state {
 	 */
 	unsigned int content_protection;
 
+	/**
+	 * @content_protection_key: DRM blob property for holding the Content
+	 * Protection Key injected from user space.
+	 */
+	struct drm_property_blob *content_protection_key;
+
 	/**
 	 * @colorspace: State variable for Connector property to request
 	 * colorspace change on Sink. This is most commonly used to switch
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index e5b053001d22e..615d1e5f57562 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -887,6 +887,12 @@ struct drm_mode_config {
 	 */
 	struct drm_property *hdcp_content_type_property;
 
+	/**
+	 * @content_protection_key_property: DRM blob property that receives the 
+	 * content protection key from user space to be injected into the kernel.
+	 */
+	struct drm_property *content_protection_key_property;
+
 	/* dumb ioctl parameters */
 	uint32_t preferred_depth, prefer_shadow;
 
-- 
2.40.0.634.g4ca3ef3211-goog

