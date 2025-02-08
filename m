Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E9FA2D207
	for <lists+freedreno@lfdr.de>; Sat,  8 Feb 2025 01:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1A510E346;
	Sat,  8 Feb 2025 00:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VMH7sJa7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB26210E11F
 for <freedreno@lists.freedesktop.org>; Sat,  8 Feb 2025 00:27:11 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-543d8badc30so3072842e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 16:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738974430; x=1739579230; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EJv47DTctbXXdHSD+jRLQExhlN8LdBAo21I9zEUehiI=;
 b=VMH7sJa7KQ474gTOrJvz8HF6Vfo9HdgUFIZfZtDBxZTwccC3G3g4GFr4erN8DKZTUf
 iq89H0ayNdYOJI81qQuyFQsX3G0xkHJYLoc4372LQ80rLG7F5B+RIZeNIvinltlVSQfp
 k9AhbeIFx2yIiSntkCwwlpC5aEMkQlDE7Db5cYhGn133Vx9hROK5okHOV4CkghuzGnjL
 2D8gUFr4dPCdyUd9bXYyIRTopSdHZ/BWkVFwUYMQ94Ph69SCF+UfG/ibY7ltikl69jyt
 D5jAqc/vf8mCc3o4TWUM3Uo614ovRH4qgCtFElUkcDnpKg8+SDvQPI+kjUGleFD6FVsU
 rtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738974430; x=1739579230;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJv47DTctbXXdHSD+jRLQExhlN8LdBAo21I9zEUehiI=;
 b=LdiqeItMTrivvBjmIj0CkIyyXOQXGMVCkYShQM/UtrqVHDq5klzoJDk4D1tjxTFAVH
 Lp8XZHwxYHSTkGcydD3dVejZP9h9gTj4zPeA00tAOuw2OvM+y0gUaRqNneFDkE3fB12X
 YyFSApsditdptBDFHV8VjqC39FoGp/iStIqlnmSUuje6d1tO0Q/NdCTx+lD22vmbv/hA
 GYArn0BL2ApZzDXNwt2L5CWa8OhsYld6NU5JU+dSOuuKPqzLey3RDD5xZUXMbssYo7WH
 XpICjrEXrhJsATTPXoC2oNpD2Nx0o4QLvtYUXwb1/32XxXIOqMVwicDw7UwxvqX3y/+R
 9yog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuQeD5ggK6KagOhQRiA65lgEgsbVphZKS8agD2VLjEd3PWqCNXYCLPzgc7J1rpjFurbLnVjEVPBOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvKUtAoX8ipiRI7fx7ZbWpI0WvMipdeca2OwNM6bSGEQy+X5Ge
 DhUs0RgHIJ/HBKcV1/fx4a2Z9pdF8NvIAIDcpU0jyGjfae07np2rBo15xhOxv8I=
X-Gm-Gg: ASbGnctuP0vczx7X5NtNLWvTTkvyAOAvlrmRfl3I0Y76KMBVamJe5ht8gTqp0QdowjD
 fpysPfxAOVlHeV1/V0ggwBoWk/zXIpdKGQUDqK9i//QlV+1uStXhkjLqFiFaEqo+RWfR4XZEtcv
 XzeLXh52v8MZvIEyxTCcauJE/IHfEtYu46W1YS4OKopQpX+JyQmORJHOk6xk3gqqINxthcDO0Y+
 JQcxwrvd9ZJ2wfKTa0S4h8RRMbKpwlAUsUQAmzQsMob6naVx6XC+IukGh41iV5mb6Vz+2aCT9rO
 AP/1gqquPMHcUa0ij9FkaVE=
X-Google-Smtp-Source: AGHT+IEv2KWiExZyTc5a9/5Vv3GXcJOM2vKT9sfUvK+wfRQHsUp2vZ50Doyn8pe87sWe1wbZx0diNQ==
X-Received: by 2002:ac2:4ec9:0:b0:543:baa3:87ab with SMTP id
 2adb3069b0e04-54414b0637fmr1626318e87.47.1738974430078; 
 Fri, 07 Feb 2025 16:27:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:27:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:01 +0200
Subject: [PATCH v7 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-2-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uXKldyyUShxj4mE/w041cBnXe/6hXGA3PeMnMd+IOm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTVlnCUwmyS4BLskQiI3ujrk6aTTc1xPgxB8
 0lAqt09hFeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1QAKCRCLPIo+Aiko
 1ZPqB/9UXLPdqs36l78Rn/gBwSRg+eQDbC3+ok/lZf6TRsodmlfH0bXiG1vEU05/tNSELtUSN69
 ppXuioe3dimrADpDMnkEONgBIlV8qNm6JgVshm+J97UgAxflc4QQFSep692Sn2SWzHrY9p5eua6
 vdKyeRjSdnnOAcsYCs4ZHDS8rufeFzOUEYQHEKGYbF+/CGgHZeqS65OtJpDBPmm2STZ8LnTaJ7J
 y59FuKiWooiNGeBrDuLwVwctVj/0eZVC2lISLJCzo/PbmLqwWJG2L8Rm855sCt/7aGR/P+vJFcp
 7/WhQ/DWCcYE/CrGYNcf8tE/4O59UHaZhSIoe27xhdBxJ16m
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

The mode_set callback is deprecated, it doesn't get the
drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
that HDMI timings should be programmed after setting up HDMI PHY and
PLL. Rework the code to program HDMI timings at the end of
atomic_pre_enable().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dcdc3b020fcbba8d698d58ee7fc749..bd94b3a70f0e5e457a88f089b491103a8c09567b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,15 +126,29 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
+static void msm_hdmi_set_timings(struct hdmi *hdmi,
+				 const struct drm_display_mode *mode);
+
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 
 	DBG("power up");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+
+	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
+
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
@@ -177,17 +191,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	}
 }
 
-static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-		 const struct drm_display_mode *mode,
-		 const struct drm_display_mode *adjusted_mode)
+static void msm_hdmi_set_timings(struct hdmi *hdmi,
+				 const struct drm_display_mode *mode)
 {
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	int hstart, hend, vstart, vend;
 	uint32_t frame_ctrl;
 
-	mode = adjusted_mode;
-
 	hdmi->pixclock = mode->clock * 1000;
 
 	hstart = mode->htotal - mode->hsync_start;
@@ -306,7 +315,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
-	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,

-- 
2.39.5

