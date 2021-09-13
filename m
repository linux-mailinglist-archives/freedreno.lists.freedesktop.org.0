Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C0409B61
	for <lists+freedreno@lfdr.de>; Mon, 13 Sep 2021 19:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1325C6ECD3;
	Mon, 13 Sep 2021 17:58:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFDB6ECD5
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:04 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id m21so11505495qkm.13
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aVRHavvdXp8kughgWZ1OAatFhA730INDVN5wXIaGF3U=;
 b=cmMtN6l2908CeGSOykw8fV78f5SkgCpw/39AIKEYghvXTeUdc78jQYXqJUSbBzCx7o
 EmjsUUWjhRYNDGpk99pX88+IdCz5Q5RnhuRhu8ujjo7GsN+E13tqKp2Wg6U8QIqD83ec
 MUpB95Y2lxVNVHN5BvhBaXlTZWzqFhFieOR6xgzTmGDIycBeLMVC14VmzUlG9Gl38phe
 r++pHlOMDAp2jGltTcfjOQWXJQ4zKeTZSh2yAQGbBsVEPVXxqPAROCj03ueYUS9nnTV3
 TxO7vnvAkyzT/bqTs9TgVbp562V7ktIXh/HBoraTB5QvzB3tUwDO7dVQfQbWcbGDRvIs
 xL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVRHavvdXp8kughgWZ1OAatFhA730INDVN5wXIaGF3U=;
 b=Zlf/Aw747Eulxn8W30OeHOxIPBpEHT1wg/z79FtVAarfxlIDKExc10mj61xoqLMaaJ
 YlYhN9rgpE562F3tUD6WuiRV4ajAGYEihPUp37Qe1Ux5XbhrQuAHAOf9T4vRWaZkR3Bg
 dHyuJ2tOr/rFVh5CGtqeUoea7RF7YE4y0dzTxhrvteHcG26XAiezeFVM//F6vdgjIuZ2
 zGjSa90HcL0q88BulUu9JYSiBgeAxgQkjEC/FzZ4ak6DVPkdmnpS1FigoBo4w4P15jWL
 unLucZ3t9iQSs4QBuWl7iqP7vzdg82hMuj8ez1udJh9wN5GgeStPyL29WjK8MAa6UMjp
 VHOg==
X-Gm-Message-State: AOAM533ZxmLFrH+/DtSUg229P+FEA3cYxClRU2/jb95e+pqF5oYho0MI
 ZWES6F3jN42d21xFMex7QbsGog==
X-Google-Smtp-Source: ABdhPJxU+hX5NaniucdZrxC3GG7d8mCDhveCsI6dxEzr1SOCk8FvZ320k9Q2RVQyEr775W2Hc0kzIA==
X-Received: by 2002:a37:a4c5:: with SMTP id n188mr833819qke.273.1631555883565; 
 Mon, 13 Sep 2021 10:58:03 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id n18sm6033506qkn.63.2021.09.13.10.58.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:03 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 13 Sep 2021 13:57:33 -0400
Message-Id: <20210913175747.47456-3-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 02/14] drm/hdcp: Avoid changing crtc state in
 hdcp atomic check
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

From: Sean Paul <seanpaul@chromium.org>

Instead of forcing a modeset in the hdcp atomic check, simply return
true if the content protection value is changing and let the driver
decide whether a modeset is required or not.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_hdcp.c                  | 33 +++++++++++++++------
 drivers/gpu/drm/i915/display/intel_atomic.c |  5 ++--
 include/drm/drm_hdcp.h                      |  2 +-
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index 522326b03e66..dd8fa91c51d6 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -430,11 +430,14 @@ EXPORT_SYMBOL(drm_hdcp_update_content_protection);
  * @connector: drm_connector on which content protection state needs an update
  *
  * This function can be used by display drivers to perform an atomic check on the
- * hdcp state elements. If hdcp state has changed, this function will set
- * mode_changed on the crtc driving the connector so it can update its hardware
- * to match the hdcp state.
+ * hdcp state elements. If hdcp state has changed in a manner which requires the
+ * driver to enable or disable content protection, this function will return
+ * true.
+ *
+ * Returns:
+ * true if the driver must enable/disable hdcp, false otherwise
  */
-void drm_hdcp_atomic_check(struct drm_connector *connector,
+bool drm_hdcp_atomic_check(struct drm_connector *connector,
 			   struct drm_atomic_state *state)
 {
 	struct drm_connector_state *new_conn_state, *old_conn_state;
@@ -452,10 +455,12 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
 		 * If the connector is being disabled with CP enabled, mark it
 		 * desired so it's re-enabled when the connector is brought back
 		 */
-		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
+		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
 			new_conn_state->content_protection =
 				DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		return;
+			return true;
+		}
+		return false;
 	}
 
 	new_crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -467,9 +472,19 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
 	*/
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
 	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
-	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
+	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)) {
 		new_conn_state->content_protection =
 			DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		return true;
+	}
+
+	/*
+	 * Coming back from disable or changing CRTC with DESIRED state requires
+	 * that the driver try CP enable.
+	 */
+	if (new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	    new_conn_state->crtc != old_conn_state->crtc)
+		return true;
 
 	/*
 	 * Nothing to do if content type is unchanged and one of:
@@ -484,9 +499,9 @@ void drm_hdcp_atomic_check(struct drm_connector *connector,
 	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
 		if (old_conn_state->hdcp_content_type ==
 				new_conn_state->hdcp_content_type)
-			return;
+			return false;
 	}
 
-	new_crtc_state->mode_changed = true;
+	return true;
 }
 EXPORT_SYMBOL(drm_hdcp_atomic_check);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 1e306e8427ec..c7b5470c40aa 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -122,8 +122,6 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
 
-	drm_hdcp_atomic_check(conn, state);
-
 	if (!new_state->crtc)
 		return 0;
 
@@ -139,7 +137,8 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
 	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
 	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
-	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
+	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state) ||
+	    drm_hdcp_atomic_check(conn, state))
 		crtc_state->mode_changed = true;
 
 	return 0;
diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index d49977a042e1..e6e3d16bc7d3 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -301,7 +301,7 @@ int drm_connector_attach_content_protection_property(
 		struct drm_connector *connector, bool hdcp_content_type);
 void drm_hdcp_update_content_protection(struct drm_connector *connector,
 					u64 val);
-void drm_hdcp_atomic_check(struct drm_connector *connector,
+bool drm_hdcp_atomic_check(struct drm_connector *connector,
 			   struct drm_atomic_state *state);
 
 /* Content Type classification for HDCP2.2 vs others */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

