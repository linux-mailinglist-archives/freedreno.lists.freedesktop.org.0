Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E84474BAD0
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DDF10E1A2;
	Sat,  8 Jul 2023 01:04:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D0010E63E
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:20 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso3148163e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778259; x=1691370259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idQIMC+YR2nmMkM0m4ALMkscbHs+Nx7/h/osKrqHwbc=;
 b=MUN4ONGt0l7S2m6I92F3w78jQJVUUPaSyySVd29j6SwY+TRpvHSXCIlI6tyoiSbJzi
 AmJJOEne0EilwMlzlS3/Ts6+0iI/4az2iJxLAAU36RXQ5aahETCvlNVtCU7deNwEkSce
 zfT25j2ttkWAMeskVJn6cjkNATZ7JqnFvceYM5hvBzIuJ6/GQliIG4bIOzgws9QJXmXk
 fpfQNw4PA0LxOYj+gRW4rIzFInQF82y2BEZtebkJjBtRggMbJUSTl1Brzct/fK0vo5pH
 z5YTMQXOk4cmIYceQ09sHWEd8o6Hpoehq1CgSCottjcRGz2/fCdutHpsxEJoaURc7mHy
 2KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778259; x=1691370259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idQIMC+YR2nmMkM0m4ALMkscbHs+Nx7/h/osKrqHwbc=;
 b=TTmYhUyvkS2e2YzwBEUlShCJhwDApo3gzOxHyj7M6sHUFoZ2lTJAew4lXWmusirboO
 tyM4SmdnAHMCzMHtw+HppAkSnup1roawcngk+hNWpEJPlTfYUW6nmzrxz5HWYysQK/rE
 7fd1hS2tThSV3xWLUNQEwPPx6NN5uUp4rzZhsvppqDD2SZIuTaks2dggjwRYSP05oTKA
 Tus1oyCX1ruNaP8ZmVns89124O4xhrpBVwl2hThYshouIG3fI0iO1zTgLbcQ+C4Swb+N
 VI903Fn5imB7UuKZzGi4UigJRW3oD/R30wxIfEbrz+xBjZfsAAxN4aAMIJR0RXysysK4
 Dg/Q==
X-Gm-Message-State: ABy/qLaumu1ih4XNxd0huOw+mtZfNOVtO/gvhMB5YaakGHCHcDEMaoKa
 ZslYCpphqB10MpAs3JBXuwMd7A==
X-Google-Smtp-Source: APBJJlHx3+Wj9QPkDTp7zL5vUfkVS+q6SfT9Y1KhD1grDLUF6HpCThBoiXc4lC9MvU7nyr9kjBJtjw==
X-Received: by 2002:a05:6512:e91:b0:4f6:2d47:274c with SMTP id
 bi17-20020a0565120e9100b004f62d47274cmr3228873lfb.15.1688778259122; 
 Fri, 07 Jul 2023 18:04:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:04:05 +0300
Message-Id: <20230708010407.3871346-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 15/17] drm/msm/mdp4: use drmm-managed allocation
 for mdp4_lcdc_encoder
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Change struct mdp4_lcdc_encoder allocation to use drmm_encoder_alloc().
This removes the need to perform any actions on this encoder
destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 36 ++++---------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 67c118bb30ca..576995ddce37 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -30,18 +30,6 @@ static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp4_lcdc_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	drm_encoder_cleanup(encoder);
-	kfree(mdp4_lcdc_encoder);
-}
-
-static const struct drm_encoder_funcs mdp4_lcdc_encoder_funcs = {
-	.destroy = mdp4_lcdc_encoder_destroy,
-};
-
 /* this should probably be a helper: */
 static struct drm_connector *get_connector(struct drm_encoder *encoder)
 {
@@ -377,30 +365,26 @@ long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
 {
-	struct drm_encoder *encoder = NULL;
+	struct drm_encoder *encoder;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder;
 	int ret;
 
-	mdp4_lcdc_encoder = kzalloc(sizeof(*mdp4_lcdc_encoder), GFP_KERNEL);
-	if (!mdp4_lcdc_encoder) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp4_lcdc_encoder = drmm_encoder_alloc(dev, struct mdp4_lcdc_encoder, base,
+					       NULL, DRM_MODE_ENCODER_LVDS, NULL);
+	if (IS_ERR(mdp4_lcdc_encoder))
+		return ERR_CAST(mdp4_lcdc_encoder);
 
 	mdp4_lcdc_encoder->panel_node = panel_node;
 
 	encoder = &mdp4_lcdc_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_lcdc_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
 
 	/* TODO: do we need different pll in other cases? */
 	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
 	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
-		ret = PTR_ERR(mdp4_lcdc_encoder->lcdc_clk);
-		goto fail;
+		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
 	}
 
 	/* TODO: different regulators in other cases? */
@@ -412,13 +396,7 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 				      ARRAY_SIZE(mdp4_lcdc_encoder->regs),
 				      mdp4_lcdc_encoder->regs);
 	if (ret)
-		goto fail;
+		return ERR_PTR(ret);
 
 	return encoder;
-
-fail:
-	if (encoder)
-		mdp4_lcdc_encoder_destroy(encoder);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2

