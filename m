Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB419A2D205
	for <lists+freedreno@lfdr.de>; Sat,  8 Feb 2025 01:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C94F10E344;
	Sat,  8 Feb 2025 00:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L6HhdN+m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448E110E11F
 for <freedreno@lists.freedesktop.org>; Sat,  8 Feb 2025 00:27:09 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so2858494e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 16:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738974427; x=1739579227; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
 b=L6HhdN+m5k7SzS91hROuIYg7C4Rd1tP3t6j233/ftTbdalYaRxM7znQre19w+0PFd2
 mUy78nBoLb2C6cUu9Kxb5IsfN1TGcP52HNbwIxSbKZa8CqAAbmx3RGmTTkYtYHzT6xOJ
 5ncgX1nkwY/I7G1S2loYiGZek22ph+22tX2CyO6NrNIvWR01U85SsfRYH/dSCx+Tk+Lc
 GJ5IDNn6CytFMFPwxCUS3TzcintOwat5y7K78mnEcE/OFDyuB+ybk829OqtzXvVuVXOn
 1h7acT7g9D7YnmSaoosdeKCLc1Vc1aPyqwUdyuAUoa2AIeQWeq/ZxOzuegN9c2+UFpHL
 pr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738974427; x=1739579227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
 b=fg/ZgXTj5IYq6voEk9g9H/nBpYvkegIb2mliVEj2DU30NntnkpORnWKmhuChU0k7Lk
 HFjnyd1x67aIsFBAj4K2uOu8eNjSJWkUPBUt4J3POiFo7tR8M7YIsa2EzsPgujsjEhba
 yyEnfJnzemeYXyioED4MyKF9sQAcuQoRYE+2HldH4jJoKRmNV37UrUEhOmDkyPV0kKwt
 R9n1zNhgD61xbPMaUu0wKvc1FNlZoolB/NQ/hf2vdVKbH9CczAndGcsIZ2SAptemTVJV
 HPCCEwf2GXIRpH5j8SJTifucRYHKfYCzBCI4BIJ3B5DEWT2wQlIG9VM67021OhE2gPZv
 dRIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR1uiYObWoxgcjUFqfrwNx+zprV/kbFWk6U4K8ZdFSBxl8cxM0kpvAlNCY1k14Ivrqe/E6PmGUCJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeGv1QieyZ8i4G3wzYXX2PNbcvFuQp+Vvsf0fRufxaeKWju3w/
 NN0uNOvlvwm/pKUqh17+RWDBdHrnYx1zj3CJgVFZqg7HTVKxWATgBOjks/o6z2I=
X-Gm-Gg: ASbGncsp4pY/Yc9FTvHGlhWVCfCehO2zkgKJESJQZ6ugR87magd3H4CoOckvhXKr2o8
 1vlCEEk6VzLqENy5ePFEXPEum5obD3BhCphhHwCJ9qqtdOZVmbzK9JEyANzAtOh51Ou/uT4PF/t
 fFFVgTw2IIR/5D/k1mG6Xq4lxbtAgU2O3jwxdit2D6uTuh9J6Q2j02zDgzAmw55mxGFzr9vMXHa
 3nRIM08ySp9ngf/24Sp734AqEdMNrH7kK9Lb8gyti5YNILteh7obyfsThFDvSi0zKkaUXykgbMq
 F3NJUqSuO3CHLIpknkNdeHE=
X-Google-Smtp-Source: AGHT+IEVFsKGgciuBhusWj1+JHw/cRfA7URw+89fCpLGUhjS8WQcgx8wyX3jcJd3Ar8ldB/wtMcXDQ==
X-Received: by 2002:ac2:5f47:0:b0:540:2122:fae9 with SMTP id
 2adb3069b0e04-54414ae5d0cmr1280495e87.46.1738974427575; 
 Fri, 07 Feb 2025 16:27:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:27:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:00 +0200
Subject: [PATCH v7 1/7] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-1-0c3837f00258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=f0rJpJCum+b7lqaI4sn4V9SXHt/v6K6WBKvJft3vbro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTV+ngwC+ACTteXyvBnI3bH+dIJQoFPCjJDF
 bdcCD7e1eOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1QAKCRCLPIo+Aiko
 1b/OCACZQ3v0Ts8EKLagTT66fPO5tTexGqVfbvMnhWXrmd/Fm8ZlKpGUwiHKnNtH/55Z/2FPLOW
 OZmTLAebTJaVrpVBZSjEVNCtS2QLuU0esefSHzCgztQ9OL6mHk7xlSqE8Red9GQ3wmiiy2AAuI8
 9Wx4zZLTLObMnwKmfqX5XLMNG8L497pFhUBf1cQncq/TfC8nJEk8+bN/abXEDkp78L58S11hVq7
 3wkMXYOleYaJrfuv9bJI4yEmhg6SfOMlu4lPDg6Jet6wAeTmdNwDXKrppEMjJFcegll30LPnfrl
 CocmH5b5d3mZuEckB17X4qpOHJDAX9VBk3XEaWh6KWXVpFQ9
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

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f516dfc4279d0f319ec1e5b17f240..d839c71091dcdc3b020fcbba8d698d58ee7fc749 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.5

