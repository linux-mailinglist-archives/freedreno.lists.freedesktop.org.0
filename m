Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B936E3C36E1
	for <lists+freedreno@lfdr.de>; Sat, 10 Jul 2021 23:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA416EB60;
	Sat, 10 Jul 2021 21:15:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C3F6EB5F
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 21:14:59 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f13so31660444lfh.6
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 14:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4AmShtUExT/X2IMI12DZIepufDigquREmXxv5omVfw=;
 b=f992x9ky5aa2YA8e65TLIO7lIyCkjyoWUYPC70KgCbIEbZDS/m4FIqrX6En0SbSXii
 j86yqvmUDEqG8uKCqXIx7/THsXwfaOT1JncYKkbaag4XyBIbWDzVI9qP68tLJlQxK86p
 SG3c1PWGjXnzp6WLHGf9LL4Kbh0WCN0QnBRpynGvapNT386Mz85AFyUVZGWYSwD7zjua
 3KUu+fPKtvxsIqCj9P13E/Bgr6AmMFx3uXsUJUZ+YlSmMS0j4cF2klYpeOgdc2hfWHww
 R2BBarilZTaZMVMp6LN5yLIrCqg3g1KGZciqyRUkhi+13Omy1GT1yhxV9UXjO7N6qEqh
 fpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4AmShtUExT/X2IMI12DZIepufDigquREmXxv5omVfw=;
 b=ae+PnpOkkgu+s2BJc27+c1hfiyW0VB9uW6Bs86bbbBrU2I41cgCViyBfjldj7IoQqZ
 BcijqJZAP+2lqEZ+iI+PESOb5IG8lmTihxd7gfd0LHy+xmLNzud4UU28QzpulIJCazc1
 snf5vb5s081IWCLcnLZJC2rqiJPyYaLxdqPYng2b1lWj2HET+Ls0Lz7PoQqNi1K7Vi/I
 fjPhcrVI+bdIuO5WaHUAwjLWf0i21zbDmJnKsoJJY8zHqX0pZy265+gj3s+bni1E8zCS
 Wcj4ZKXq6QPLd85jlMvrPClnX2ZtJqxikyeUwdD6nH0FDgICnRmiWOxrna1zWaMsylfH
 qqYw==
X-Gm-Message-State: AOAM531hNRAHTkcuz+KsGVXjbJ6ibZup/+Uptfj6IeA2QGh1Bu+fAIxf
 GCTwm6BKQWZMt+dMW4B5x8yMBw==
X-Google-Smtp-Source: ABdhPJzxFXw8V2uCz57CpQHODNn5GftrkFKg05ZpY9gWKBbyD/vwZas6gK4yO+toVdYIk5orx9bYGA==
X-Received: by 2002:ac2:596a:: with SMTP id h10mr36574686lfp.305.1625951697808; 
 Sat, 10 Jul 2021 14:14:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b13sm788116lfv.89.2021.07.10.14.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 14:14:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sun, 11 Jul 2021 00:14:56 +0300
Message-Id: <20210710211456.1233042-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: reduce usage of round_pixclk callback
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The round_pixclk() callback returns different rate only on MDP4 in HDMI
(DTV) case. Stop using this callback in other cases to simplify
mode_valid callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  7 -------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  7 -------
 drivers/gpu/drm/msm/dsi/dsi_manager.c     | 22 ----------------------
 drivers/gpu/drm/msm/edp/edp_connector.c   | 11 -----------
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c |  9 +++++----
 5 files changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1d3a4f395e74..5bf66d885af3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -659,12 +659,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	return ret;
 }
 
-static long dpu_kms_round_pixclk(struct msm_kms *kms, unsigned long rate,
-		struct drm_encoder *encoder)
-{
-	return rate;
-}
-
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
 	int i;
@@ -861,7 +855,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.disable_vblank  = dpu_kms_disable_vblank,
 	.check_modified_format = dpu_format_check_modified_format,
 	.get_format      = dpu_get_msm_format,
-	.round_pixclk    = dpu_kms_round_pixclk,
 	.destroy         = dpu_kms_destroy,
 	.set_encoder_mode = _dpu_kms_set_encoder_mode,
 	.snapshot        = dpu_kms_mdp_snapshot,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 15aed45022bc..40831f091c29 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -190,12 +190,6 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 		mdp5_smp_complete_commit(mdp5_kms->smp, &global_state->smp);
 }
 
-static long mdp5_round_pixclk(struct msm_kms *kms, unsigned long rate,
-		struct drm_encoder *encoder)
-{
-	return rate;
-}
-
 static int mdp5_set_split_display(struct msm_kms *kms,
 		struct drm_encoder *encoder,
 		struct drm_encoder *slave_encoder,
@@ -285,7 +279,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
 		.get_format      = mdp_get_format,
-		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
 		.set_encoder_mode = mdp5_set_encoder_mode,
 		.destroy         = mdp5_kms_destroy,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 4ebfedc4a9ac..e9fa96ca9fa5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -327,27 +327,6 @@ static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
 	return num;
 }
 
-static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *connector,
-				struct drm_display_mode *mode)
-{
-	int id = dsi_mgr_connector_get_id(connector);
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
-	struct msm_drm_private *priv = connector->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	long actual, requested;
-
-	DBG("");
-	requested = 1000 * mode->clock;
-	actual = kms->funcs->round_pixclk(kms, requested, encoder);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static struct drm_encoder *
 dsi_mgr_connector_best_encoder(struct drm_connector *connector)
 {
@@ -579,7 +558,6 @@ static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
 
 static const struct drm_connector_helper_funcs dsi_mgr_conn_helper_funcs = {
 	.get_modes = dsi_mgr_connector_get_modes,
-	.mode_valid = dsi_mgr_connector_mode_valid,
 	.best_encoder = dsi_mgr_connector_best_encoder,
 };
 
diff --git a/drivers/gpu/drm/msm/edp/edp_connector.c b/drivers/gpu/drm/msm/edp/edp_connector.c
index 73cb5fd97a5a..1dc6c7333c5a 100644
--- a/drivers/gpu/drm/msm/edp/edp_connector.c
+++ b/drivers/gpu/drm/msm/edp/edp_connector.c
@@ -60,17 +60,6 @@ static int edp_connector_mode_valid(struct drm_connector *connector,
 {
 	struct edp_connector *edp_connector = to_edp_connector(connector);
 	struct msm_edp *edp = edp_connector->edp;
-	struct msm_drm_private *priv = connector->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = kms->funcs->round_pixclk(kms,
-			requested, edp_connector->edp->encoder);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
 
 	if (!msm_edp_ctrl_pixel_clock_valid(
 		edp->ctrl, mode->clock, NULL, NULL))
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index 58707a1f3878..94318d8ef303 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -386,15 +386,16 @@ static int msm_hdmi_connector_mode_valid(struct drm_connector *connector,
 	long actual, requested;
 
 	requested = 1000 * mode->clock;
-	actual = kms->funcs->round_pixclk(kms,
-			requested, hdmi_connector->hdmi->encoder);
 
+	if (kms->funcs->round_pixclk)
+		actual = kms->funcs->round_pixclk(kms,
+			requested, hdmi_connector->hdmi->encoder);
+	else if (config->pwr_clk_cnt > 0)
 	/* for mdp5/apq8074, we manage our own pixel clk (as opposed to
 	 * mdp4/dtv stuff where pixel clk is assigned to mdp/encoder
 	 * instead):
 	 */
-	if (config->pwr_clk_cnt > 0)
-		actual = clk_round_rate(hdmi->pwr_clks[0], actual);
+		actual = clk_round_rate(hdmi->pwr_clks[0], requested);
 
 	DBG("requested=%ld, actual=%ld", requested, actual);
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
