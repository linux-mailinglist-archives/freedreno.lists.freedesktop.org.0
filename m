Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E554DDCD
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 11:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D0F113BB9;
	Thu, 16 Jun 2022 09:03:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD4A113BB1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 09:03:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y32so1227652lfa.6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kWEg3qKQ7Suf9K5vJw6s6X7vzMoYVIAYuI4zZZJqDTo=;
 b=Y3riwIpAM2iIU/hX5yfy2hJLoLXc2eVsvqBz5J/HPfEm9R7mPOxVbj3hnD0a0sS2UE
 GAQw8868YRHX1Fjkoohlndz0Mjqk9srWEneE2dKvhXqE7US7tc0FHRWOj1PhZNiwo0oe
 kYat/gsfFBdTcGTtrGU0wKjxzp4zv6mse69Pl4Mf+6cYg9zMPLD5/14P8Mwuh2u/YgXo
 /qyXHlfALdRhJIO1Lx8Hn7Hik+5vQKIveWgG4uYGQUtfTf6MtLkvJtwOH26CvJmRh5n0
 f+3wcXdzKf42K8UfEpTrl0TCfuhdeVDbB8HvB6MaveajTCdbvzID5p0HdqNNG/wdd/nN
 O2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWEg3qKQ7Suf9K5vJw6s6X7vzMoYVIAYuI4zZZJqDTo=;
 b=xN5F2UWvXgsywCjPD3o7onpsC8R8AlaO/MEXzgjudc70NBGJw9VwIcjQUFBMTzYDmn
 y9N6UY/l7KCHAEt1/C8fZY/RbwDyB1UINyR0sh46Dn1iu1d6hcKqdBpaY3BNkjCxmuUr
 UDRFjahQUQVifTMJU8swTGwnpqsIwx/f8IuelitKkdQ6hPewfZzmxDTvdEmDaLV/o+pW
 /QaiXY6G4ZYjhk8leDb7j9uI/UgU1LNq9D+BKcjhk/pN24TLeRlniC3GyQikg/3Az59+
 XNVUEDEM1ZLvEjD4O3S69okxy5Q/zUq/nMWUzA4Vr4CuVP3Vrsqs3l4FE7EGXMHmPOeZ
 EzRA==
X-Gm-Message-State: AJIora/4ohVX1lUs5OvnC6irYyIKzPSDZnmvteNsURKxEeBmQAUsyahz
 xCBdcLwJOyfSXtO8TUmuOR1qEA==
X-Google-Smtp-Source: AGRyM1sJd/hJj6+kBa8lG/oP1fzLl5O9w8ImTr+6IK3JzwaOublnKhnxn0YOYGPyQKguDCqpcQTx4Q==
X-Received: by 2002:ac2:58e1:0:b0:47d:b1fa:d09f with SMTP id
 v1-20020ac258e1000000b0047db1fad09fmr1926144lfo.213.1655370203866; 
 Thu, 16 Jun 2022 02:03:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j9-20020a2e8009000000b0025575338c41sm172573ljg.127.2022.06.16.02.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 02:03:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Jun 2022 12:03:20 +0300
Message-Id: <20220616090321.433249-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616090321.433249-1-dmitry.baryshkov@linaro.org>
References: <20220616090321.433249-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 1/2] drm/msm/mdp4: move move_valid callback
 to lcdc_encoder
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  1 -
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 26 ++++++++++++++-----
 .../drm/msm/disp/mdp4/mdp4_lvds_connector.c   | 20 --------------
 3 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index e8ee92ab7956..d27fa761bfc2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -197,7 +197,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 10eb3e5b218e..341dcd5087da 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -366,19 +366,31 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static int mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
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
index 7288041dd86a..4755eb13ef79 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,25 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
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
@@ -86,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */
-- 
2.35.1

