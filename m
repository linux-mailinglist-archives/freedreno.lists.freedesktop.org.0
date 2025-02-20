Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656FDA3D7FB
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 12:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10810E945;
	Thu, 20 Feb 2025 11:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EzdAdZ/J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142FE10E94A
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 11:15:09 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-546202d633dso851015e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 03:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050107; x=1740654907; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=atkE0DuTwytlFBGYlZ0GLoUvtN43x5D45gLKOUS3e3I=;
 b=EzdAdZ/Jj/jx+N8ZHaw5roWqy54sNMrM2DYegOXxJvzXmnA3jF69mYn9HuhegtHDOR
 xnaJgI2JgKW/zjLuiFtOe7Aovv12molYz/XNTmTvFWvZIuedPwy0SISzZYLRq86/Sogc
 LelsFnhC75sO8X78AIE+5Nqizy5vTqKLJqQ4R1d3NHv6bB7MkL1G1TQi+dFv3jhvfMnC
 goHRNYoVhFRDF22AWgFq91Nr3AxtiFhdmn8b1qIvDqYZWPRgqSJrjexmbFi0qg6zzMjS
 OV1KSEA5gALYba+Xm+cT6ezmxfLp6O2tVl2m21fY9xqqlD0On1/IEE3gKXsQiAsj1BjT
 H9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050107; x=1740654907;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atkE0DuTwytlFBGYlZ0GLoUvtN43x5D45gLKOUS3e3I=;
 b=EweRRxYn2TASbZXXu2hLFYQPxsadLCCxrIY1nWcpF4wzAh5QtbcDZvDwWk4cbMozR7
 RLqWirdsAHRREac9I8Jc4ses5ubTVWdwyIOibgpmqZnxweU28klbkqICY9mIkE4f//2J
 qEJNbuhgQezLKyVDRlnRUq+/4w8M7SPhvxsnDsadwV0oqw1CL3v3GG2svPnfnH0u9X9k
 KbfTy32h1pH67aWUYEhmXPLGrdAck3/Je2SfEllDTS1MnxOUzno0DJsFCMjX1Ke0HWg2
 JGKrwmR1uzbhb6o+sfs8BF7mZuC54rgPN2Chl2UaZbhLtwg+x4b+HxjP0R9S+YGrEIty
 NLoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQWJ3tEo1H4aBONDYkMUo8MOZAbfUalANjyemNk4ed7YEqCdELkxg1YepS78F/w66o0sZLOZ4wJp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZsXAPFtgpzaY5DT2G9RN5/uIooxb9TV9/50dEjL3Xe9FfzGwv
 pDQgbtekjzqtvKLQT3sGxnuY4ahQoTVgcQiAKFjcNPlzONQ2Ckv9g/TsC2+bfTE=
X-Gm-Gg: ASbGnctpom1YiFsOfastpHZOfDYoFLtJb8Dd6vURhOnmc+mCqm+CFFhH4Cg6a7u0gpc
 sjX8aErpoo4IxKTYx3YOWhoazrYuTh3S7tnUcdFSSFpRJa0CflQXjvfDu6YjH9sNegAJcLoX/6V
 u1jq+Rvtlh+PQZwVROdHhVfU+B3Hn0RfYzvZMjhYq0aov4nzSWrl/Ys1b4+fJhdcXlL4qp+fwzb
 0IAlFtt8woZQn3ROMErf9XWFAy7yDXzkIe76kVAx9VQEn89s4orjqazYJNCchHyPWR45IkU/EGG
 c5g9xtKG/3sLj/lqiMCDPEQ=
X-Google-Smtp-Source: AGHT+IGeL3hIO5IEL/UFM93w49MRwYtCVueI+BviXB8wj/vAF/fCqwh+GCrLx80hGd4UkPc4SzjieQ==
X-Received: by 2002:a05:6512:e97:b0:545:56c:36c7 with SMTP id
 2adb3069b0e04-5452fe86dddmr6819562e87.41.1740050107328; 
 Thu, 20 Feb 2025 03:15:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:15:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:47 +0200
Subject: [PATCH v2 5/7] drm/msm/mdp4: move move_valid callback to lcdc_encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-5-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4269;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sd81US2AbqPojIDQwuSaetI1ujs5Ko+pXwBs3VRaHGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rTPm+AqJ3Oe00AJ8yppJULkHQ9dKbM/18U
 NNC9+ZJDDaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1UEECACKjmUdHIogEsc92biZ7CHLmnmFDJoK5DYBGMrRoc0gq30rOLHn/DGpybnuVUOoTRhcCQ/
 srxTbAtPHYKz5GPZ6HU0nzSuZXLeXlZa/Ai98jYxQvVyvkSayLovY3UkjzoHNOyXfwc38FLIPvM
 UIMP/EawAuFJbkq5PFnq1nTdWXtjlEIS+cmao+5TlRnb4Gbgw5l6KI1unJiMLewApO8qtZaYaGI
 3Qr0lVOLugDL+admaJR4HlV1P6LFCZnMPDwaYuDVzuhgww34I9LV303cDXMY2wBVZnDFH5d14j0
 WWj6ag03DsV2nNjKI2J0brnn0vx8z7++w82J9fjQuvZwj+rQ
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

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index b8bdc3712c73b14f3547dce3439a895e3d10f193..e0380d3b7e0cee99c4c376bf6369887106f44ede 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,7 +191,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index db93795916cdaa87ac8e61d3b44c2dadac10fd9e..cfcedd8a635cf0297365e845ef415a8f0d553183 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -348,19 +348,32 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static enum drm_mode_status
+mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
+		const struct drm_display_mode *mode)
+{
+	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
+			to_mdp4_lcdc_encoder(encoder);
+	long actual, requested;
+
+	requested = 1000 * mode->clock;
+	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
+
+	DBG("requested=%ld, actual=%ld", requested, actual);
+
+	if (actual != requested)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 	.mode_set = mdp4_lcdc_encoder_mode_set,
 	.disable = mdp4_lcdc_encoder_disable,
 	.enable = mdp4_lcdc_encoder_enable,
+	.mode_valid = mdp4_lcdc_encoder_mode_valid,
 };
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	return clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, rate);
-}
-
 /* initialize encoder */
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 52e728181b523cc3380d7718b5956e7e2dbd4cad..4755eb13ef79f313d2be088145c8cd2e615226fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,26 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static enum drm_mode_status
-mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-			       const struct drm_display_mode *mode)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = mdp4_lcdc_round_pixclk(encoder, requested);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -87,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */

-- 
2.39.5

