Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8337C74BAD2
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0128110E640;
	Sat,  8 Jul 2023 01:04:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248BA10E63F
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:20 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b701dee4bfso41054621fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778258; x=1691370258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMK+UXJaKO6+rmNMoQGWliUVQWYiOUx8RDuCq0/YlR8=;
 b=hADVcbMxB5i4niDTPO8hymDYlCggJ/1+XUW+XqXb1s4p7c/wbuZwp6qo7dI7DaMLNz
 IdU296iCfKxHqxOxOdJfYdmh15cA947f7uHMKWOnmuckv9xIYrgeHvOpSdqAjL2Bfqp1
 18ampq+AOa+fkhZ4UOnnRoW/d96G9zztuW6m2f1ZK85vWymaWXg2t6Aurisj/Crs3WfM
 e3Mwuzl5Q8feqCAR6XeE22METAs+kEcu13pfatkwc3PD+9iPZuvfpS0QPCK4Aav1rY91
 wL7Pu0havj52qoERtYQi+pJAQKSkl+TQezPtTrK3O5a2eJhC8gf6kEI7jc4JUy3I6G/E
 GSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778258; x=1691370258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMK+UXJaKO6+rmNMoQGWliUVQWYiOUx8RDuCq0/YlR8=;
 b=ac/x3UL/pz8BJmgsvWh999gpgxt05PDc/AHvyUhv2L2q3wvB6fwWAPaHw7/Exi6ung
 ZaYrC2P+JC/1MCWOXt2zBVhIQjbfAjbAo2oLcbdeHv+othz3Qx9BFHs0ZhJa1JBVin4X
 tWSDr6KYnQ950K6NIPWXy0JJwXjSwGxzD+2NUEX5S1iUwhBY6ChfLIa+67JGCuz6aXgf
 3qEk6BGT1xkY2bGqlUaEYgU2pELiFyXmtSMsTtfYdAagCVoCjdZ3eJMKWKePX7E16UKR
 TgJ270Ch4Hht+pOXYqu+aV//mFbDwkvJM9VqP1/2/Y8uqkpgicn8gw+ckLNJWI/ffKLT
 XuMQ==
X-Gm-Message-State: ABy/qLbdsLBx8osl+mgrk0cBCUKSBuXHLjdnKsH4/Dctih4fsLU1kZHz
 0dpKk2QI9BVoBt8+X3WJh99KOQ==
X-Google-Smtp-Source: APBJJlGHUaLV/N8oD1BWoHwtlBB1ouem4jAwhyhatCkgm7xfOkm/QihHG+3n274QtbwqYiozA/wN2Q==
X-Received: by 2002:a2e:88d8:0:b0:2b6:cca1:9760 with SMTP id
 a24-20020a2e88d8000000b002b6cca19760mr4910237ljk.27.1688778258491; 
 Fri, 07 Jul 2023 18:04:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:04:04 +0300
Message-Id: <20230708010407.3871346-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 14/17] drm/msm/mdp4: use drmm-managed allocation
 for mdp4_dtv_encoder
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

Change struct mdp4_dtv_encoder allocation to use drmm_encoder_alloc().
This removes the need to perform any actions on this encoder
destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  | 37 ++++---------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
index 88645dbc3785..3b70764b48c4 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
@@ -25,17 +25,6 @@ static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp4_dtv_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mdp4_dtv_encoder *mdp4_dtv_encoder = to_mdp4_dtv_encoder(encoder);
-	drm_encoder_cleanup(encoder);
-	kfree(mdp4_dtv_encoder);
-}
-
-static const struct drm_encoder_funcs mdp4_dtv_encoder_funcs = {
-	.destroy = mdp4_dtv_encoder_destroy,
-};
-
 static void mdp4_dtv_encoder_mode_set(struct drm_encoder *encoder,
 		struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
@@ -173,41 +162,29 @@ long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
 /* initialize encoder */
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev)
 {
-	struct drm_encoder *encoder = NULL;
+	struct drm_encoder *encoder;
 	struct mdp4_dtv_encoder *mdp4_dtv_encoder;
-	int ret;
 
-	mdp4_dtv_encoder = kzalloc(sizeof(*mdp4_dtv_encoder), GFP_KERNEL);
-	if (!mdp4_dtv_encoder) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp4_dtv_encoder = drmm_encoder_alloc(dev, struct mdp4_dtv_encoder, base,
+					      NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (IS_ERR(mdp4_dtv_encoder))
+		return ERR_CAST(mdp4_dtv_encoder);
 
 	encoder = &mdp4_dtv_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_dtv_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_dtv_encoder_helper_funcs);
 
 	mdp4_dtv_encoder->hdmi_clk = devm_clk_get(dev->dev, "hdmi_clk");
 	if (IS_ERR(mdp4_dtv_encoder->hdmi_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get hdmi_clk\n");
-		ret = PTR_ERR(mdp4_dtv_encoder->hdmi_clk);
-		goto fail;
+		return ERR_CAST(mdp4_dtv_encoder->hdmi_clk);
 	}
 
 	mdp4_dtv_encoder->mdp_clk = devm_clk_get(dev->dev, "tv_clk");
 	if (IS_ERR(mdp4_dtv_encoder->mdp_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get tv_clk\n");
-		ret = PTR_ERR(mdp4_dtv_encoder->mdp_clk);
-		goto fail;
+		return ERR_CAST(mdp4_dtv_encoder->mdp_clk);
 	}
 
 	return encoder;
-
-fail:
-	if (encoder)
-		mdp4_dtv_encoder_destroy(encoder);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2

