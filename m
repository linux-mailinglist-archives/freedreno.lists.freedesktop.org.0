Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ABE74BAD4
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD98410E644;
	Sat,  8 Jul 2023 01:04:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813C310E634
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:19 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b702319893so38641881fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778257; x=1691370257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+38nzESfvK4pAHEPkhscE79q4Wrbr+it00jhvW61XWI=;
 b=sdozM2tVW3hK0v7eXNQ7BGK8KprAd0AhB7gnwUkjTdZ3pTBbo1Cml7nBUMjDOPvFiL
 N6SMzCYOfJ5ITbKfZfQpOEwKUcnWINgq3ORCaxzXdCttCSLv/XVw+XexHE0dfdGFgKA7
 Rrehiext1h/4f5MRtS1MD3ed7lP/ZhRVZyYoYJpPMYX40pepmJkQ/W28W7r8BLHiIV/a
 myvF3bqZLPuKt0Nysf/lslB/BVSMo9vA/YkbPcRl/smsrX2mdHGxBdk+hh6wADynFwu8
 exHv4EeC1+45bMLYIRw9yHPJI9RDn/HPhn301z8UHUbo5IvQiOF2gB00DFWrXGF66qxf
 N39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778257; x=1691370257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+38nzESfvK4pAHEPkhscE79q4Wrbr+it00jhvW61XWI=;
 b=fSChsfTzzsIjQX01TsDIxkuZMA3UQRH7YBiQmCpY0r2L3U4lgAbjiOlB6+U/t+DV7F
 IR8ibUp7BpgK+GYolcsahHKR3bij07XjtQ2vIsS0mFeqYthLb6i/zwupiK6jNUyjoamV
 od/M4SH5bUivmh30wgM2UfJm0BsILftw47ys1dkKiEnyQj6vAubXNsJsThkm2Q9mNK4p
 vkVWg1WHMvKouvt7FgoVP6Nrj+OC5RBTrCW/16OMo6bkLtDuM+bNK+CHZJZk7w0N+l1f
 dL5RZGjXqb44h00k/fQRTigxgbc1ElY4T5kyQF7r53wc9fUqD19HVCIUs13HljRDHU8q
 f4rw==
X-Gm-Message-State: ABy/qLY4Khb23K5SjucNXqe74ULaHrdY75uUAUOLDRC4In/JXXqHBttO
 HUVldNjRfKd9nB6kFd3Uorx4eg==
X-Google-Smtp-Source: APBJJlHbuJdo+mqG+TrLe0BOwo7bSXkWhe4D9znTTjr7ZZzdYW2HQcpr3aNIwJmBjk2wFDHl+KmLVA==
X-Received: by 2002:a2e:854c:0:b0:2b5:974f:385 with SMTP id
 u12-20020a2e854c000000b002b5974f0385mr5181028ljj.9.1688778257827; 
 Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:04:03 +0300
Message-Id: <20230708010407.3871346-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 13/17] drm/msm/mdp4: use drmm-managed allocation
 for mdp4_dsi_encoder
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

Change struct mdp4_dsi_encoder allocation to use drmm_encoder_alloc().
This removes the need to perform any actions on this encoder
destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  | 32 +++----------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
index 39b8fe53c29d..74dafe7106be 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
@@ -26,18 +26,6 @@ static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp4_dsi_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mdp4_dsi_encoder *mdp4_dsi_encoder = to_mdp4_dsi_encoder(encoder);
-
-	drm_encoder_cleanup(encoder);
-	kfree(mdp4_dsi_encoder);
-}
-
-static const struct drm_encoder_funcs mdp4_dsi_encoder_funcs = {
-	.destroy = mdp4_dsi_encoder_destroy,
-};
-
 static void mdp4_dsi_encoder_mode_set(struct drm_encoder *encoder,
 				      struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode)
@@ -148,28 +136,18 @@ static const struct drm_encoder_helper_funcs mdp4_dsi_encoder_helper_funcs = {
 /* initialize encoder */
 struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 {
-	struct drm_encoder *encoder = NULL;
+	struct drm_encoder *encoder;
 	struct mdp4_dsi_encoder *mdp4_dsi_encoder;
-	int ret;
 
-	mdp4_dsi_encoder = kzalloc(sizeof(*mdp4_dsi_encoder), GFP_KERNEL);
-	if (!mdp4_dsi_encoder) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp4_dsi_encoder = drmm_encoder_alloc(dev, struct mdp4_dsi_encoder, base,
+					      NULL, DRM_MODE_ENCODER_DSI, NULL);
+	if (IS_ERR(mdp4_dsi_encoder))
+		return ERR_CAST(mdp4_dsi_encoder);
 
 	encoder = &mdp4_dsi_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_DSI, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_dsi_encoder_helper_funcs);
 
 	return encoder;
-
-fail:
-	if (encoder)
-		mdp4_dsi_encoder_destroy(encoder);
-
-	return ERR_PTR(ret);
 }
 #endif /* CONFIG_DRM_MSM_DSI */
-- 
2.39.2

