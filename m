Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E007F9FA3DE
	for <lists+freedreno@lfdr.de>; Sun, 22 Dec 2024 06:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801FE10E2CD;
	Sun, 22 Dec 2024 05:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uhTxINFe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5CB10E2CD
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 05:00:53 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so3303585e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 21 Dec 2024 21:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734843652; x=1735448452; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N19A2AjG3Q/s9SAFMXdSh2+o269dpLqgKum0CI5lc8s=;
 b=uhTxINFe39O/gv587RjtviTwQsl1aVWI5rAauCsodkM7jw2bg/P03CH9t91E8k31Ct
 WhjhOXESbEZRqFw4oiZ+Kbz8mgpU07nAZTXMQBLUBbCgpv3r1HH0fL/xTDws6/QjCKO4
 qe81HVD/Oe6jqphMq9A4G4xzhGRkt/GbUnDEbUaxvWtnjp1pj7IB7JgyJKqUINTDngpv
 DhtelQ6+6ZRM6qZ/VuhfJNPq7zXURZjOdmQC9rn8Y7NdJ0kBNZy6PThwnKp+PKivfzjo
 NXC9mCI9jYpr+HPxxOvQ1Mao09tFlk8wbi922FWLWLr9BT7jVJ416ZXziuavdloT2eLl
 eyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734843652; x=1735448452;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N19A2AjG3Q/s9SAFMXdSh2+o269dpLqgKum0CI5lc8s=;
 b=Ky7fLfo8gSCBTekVwjMhnDnH1718QMWXXFmdmQQcObhi3StmleKZ6aQxWu/7mbo8NN
 w5Dms+b2frKGHjn6Vexc9F5NwN2xkbal8U75eJXFIsDu7e/QOT72lAHGC/GdukoD+KVY
 zUDQa1xfthJpF2lVmuKnye88+e59YgMXOxpUfQQHKjm9QGG1GDgcYcjY++t79lwoZvQY
 MI+vyW+W1zSSXsX9Thu3Tvh06VmakgqBpwNXHKQa68tWJl8VHPSLy/bD6RFZI4sKJ2CI
 qOvlzvemDxknem00mLOvy/gYJyOxEGHgODh84O6bdcw7VQkfJ8OvhDDNBgCd0AJ+5zG6
 f4IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQro5WhL/93dqJkA69D7C+WCxNNx3YMVmqQdokaXzyNKqTG/MRINZ0PNbgS0csm5zjcVqwJMKeA1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeRp+qYtWgwh2MReTyY+mAiw3AeBEkJL05i9aR+VRjcHuhjyv0
 38KTMK5t4sCEC3Z/VRQjtbwt+4v1DDvBNMHjgCyF66CXlRgxD0BOqbIDj6n57J0=
X-Gm-Gg: ASbGnct3bzVRBsM2un9ZPoMI97aGaceQakBYZ0WcqrZ2uh4tQLBQMBYnRUBiZgsVOKR
 LKQ0y/dOM7ip2Q8zoFi/aY3aBNUyd/Vu/OUhWgIPlxPgi3hUA/SUqZE0rsEaqKBU+tsB1PiNiL9
 8NKzHOZ3GE3uw/TjEH43uUHURswDaUNpskjJwOq6iChjsK+uzXAB106FUlkNjHVA5g9KHR/T5sI
 c44srAQToAPv6T397tAl2ShK46rNiyZcnrONglXX5jDDKFoPUZK0SweuNqU1u5l
X-Google-Smtp-Source: AGHT+IGWOF5L9r9w+Rvx/sxvEH8+CLwrVoF+t4m8SvJw+iSDzew6q+z2eYxXwXHRCkDsVxu6XZXCJg==
X-Received: by 2002:a05:6512:e8c:b0:53a:1a81:f006 with SMTP id
 2adb3069b0e04-5422953fedcmr3014188e87.31.1734843651614; 
 Sat, 21 Dec 2024 21:00:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 21:00:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:42 +0200
Subject: [PATCH 2/6] drm/atomic: prepare to check that drivers follow
 restrictions for needs_modeset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-2-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8180;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rWS0KFUVLvGb4ozb2+QIr1gzxcTnVRN9cNSrdc5NX8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z71Xj3vDZ5ZQ9k5EaVm/6pV22nfsxOppXU8
 urExzv+o8yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1eDjCACEaoaRFJsbhJHmjd3uHaWnQCQA3aWQKHzRvFrDf7Em7z0Gao1tpDPETltMg4hGw9imGF/
 PtpGBoPGrff7Mf6/fSkZQKcBzyk2nds6Pmm41ImFPilCfg57s70TvJ8b+yRs7SbYd5G+gxE3MYU
 voHPno59UMWls4TEyjlcckMmilATWZhT4Cj08xSb97FrGuAV9e5lrX4zzr1U3eyh5LCkSiI51XI
 xi2ZSJf2Kv+8y9J1HtkLW5kPgrILGaBg3asKa4+mIqDhnDxCFNZK1MtdHv6AHrqXUA+gI/jpJit
 nXQgHSxtMdjeuCSaRaKgyoclkm4lYv7wxwWyAT9xRjrT6Gst
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

Some drivers might fail to follow the restrictions documented for
drm_atomic_helper_check_modesets(). In order to catch such an issues,
add the drm_atomic_state->dirty_needs_modeset field and check it in
drm_atomic_check_only(). Make sure that neither of atomic_check()
callbacks can set that field without calling
drm_atomic_helper_check_modesets() again.

Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c        |  3 ++
 drivers/gpu/drm/drm_atomic_helper.c | 77 +++++++++++++++++++++++++++++++++----
 include/drm/drm_atomic.h            | 10 +++++
 3 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9ea2611770f43ce7ccba410406d5f2c528aab022..202e4e64bd31921d0a4d4b86605b501311e14c33 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1449,6 +1449,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 		}
 	}
 
+	WARN_RATELIMIT(state->dirty_needs_modeset,
+		       "Driver changed needs_modeset under drm_atomic_helper_check_modeset()");
+
 	if (!state->allow_modeset) {
 		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f26887c3fe8b194137200f9f2426653274c50fda..2c62840416f4b807d6a880b5c30ae024a16af528 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -433,6 +433,7 @@ mode_fixup(struct drm_atomic_state *state)
 
 	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
+		bool old_needs_modeset = false;
 		struct drm_encoder *encoder;
 		struct drm_bridge *bridge;
 
@@ -451,6 +452,9 @@ mode_fixup(struct drm_atomic_state *state)
 		encoder = new_conn_state->best_encoder;
 		funcs = encoder->helper_private;
 
+		if (new_crtc_state)
+			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
 		ret = drm_atomic_bridge_chain_check(bridge,
 						    new_crtc_state,
@@ -479,6 +483,12 @@ mode_fixup(struct drm_atomic_state *state)
 				return -EINVAL;
 			}
 		}
+
+		if (new_crtc_state) {
+			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
+		}
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
@@ -574,6 +584,36 @@ mode_valid(struct drm_atomic_state *state)
 	return 0;
 }
 
+static int
+connector_atomic_check(struct drm_atomic_state *state,
+		       struct drm_connector *connector,
+		       struct drm_connector_state *old_connector_state,
+		       struct drm_connector_state *new_connector_state)
+{
+	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
+	struct drm_crtc_state *new_crtc_state;
+	bool old_needs_modeset = false;
+	int ret;
+
+	if (new_connector_state->crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_connector_state->crtc);
+	if (new_crtc_state)
+		old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+	if (funcs->atomic_check)
+		ret = funcs->atomic_check(connector, state);
+	else
+		ret = 0;
+
+	if (new_crtc_state) {
+		bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+		state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
+	}
+
+	return ret;
+}
+
 /**
  * drm_atomic_helper_check_modeset - validate state object for modeset changes
  * @dev: DRM device
@@ -628,6 +668,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	int i, ret;
 	unsigned int connectors_mask = 0, user_connectors_mask = 0;
 
+	state->dirty_needs_modeset = false;
+
 	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i)
 		user_connectors_mask |= BIT(i);
 
@@ -683,8 +725,6 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		return ret;
 
 	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
-		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
-
 		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 
 		/*
@@ -710,8 +750,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 				new_crtc_state->connectors_changed = true;
 		}
 
-		if (funcs->atomic_check)
-			ret = funcs->atomic_check(connector, state);
+		ret = connector_atomic_check(state, connector,
+					     old_connector_state, new_connector_state);
 		if (ret) {
 			drm_dbg_atomic(dev,
 				       "[CONNECTOR:%d:%s] driver check failed\n",
@@ -752,13 +792,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	 * has been called on them when a modeset is forced.
 	 */
 	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
-		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
-
 		if (connectors_mask & BIT(i))
 			continue;
 
-		if (funcs->atomic_check)
-			ret = funcs->atomic_check(connector, state);
+		ret = connector_atomic_check(state, connector,
+					     old_connector_state, new_connector_state);
 		if (ret) {
 			drm_dbg_atomic(dev,
 				       "[CONNECTOR:%d:%s] driver check failed\n",
@@ -994,6 +1032,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs;
+		bool old_needs_modeset = false;
 
 		WARN_ON(!drm_modeset_is_locked(&plane->mutex));
 
@@ -1006,6 +1045,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 		if (!funcs || !funcs->atomic_check)
 			continue;
 
+		if (new_plane_state->crtc)
+			new_crtc_state = drm_atomic_get_new_crtc_state(state,
+								       new_plane_state->crtc);
+		if (new_crtc_state)
+			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
 		ret = funcs->atomic_check(plane, state);
 		if (ret) {
 			drm_dbg_atomic(plane->dev,
@@ -1013,16 +1058,26 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 				       plane->base.id, plane->name);
 			return ret;
 		}
+
+		if (new_crtc_state) {
+			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
+		}
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
+		bool old_needs_modeset = false;
 
 		funcs = crtc->helper_private;
 
 		if (!funcs || !funcs->atomic_check)
 			continue;
 
+		if (new_crtc_state)
+			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
 		ret = funcs->atomic_check(crtc, state);
 		if (ret) {
 			drm_dbg_atomic(crtc->dev,
@@ -1030,6 +1085,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 				       crtc->base.id, crtc->name);
 			return ret;
 		}
+
+		if (new_crtc_state) {
+			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
+		}
 	}
 
 	return ret;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..7b0dbd3c8a3df340399a458aaf79263f0fdc24e5 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -408,6 +408,16 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @dirty_needs_modeset:
+	 *
+	 * Indicates whether the drm_atomic_crtc_needs_modeset() changed in an
+	 * unexpected way. Usually this means that driver implements atomic
+	 * helpers using drm_atomic_crtc_needs_modeset(), but mode_changed has
+	 * toggled by one of its atomic_check() callbacks.
+	 */
+	bool dirty_needs_modeset : 1;
+
 	/**
 	 * @planes:
 	 *

-- 
2.39.5

