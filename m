Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7F80152E
	for <lists+freedreno@lfdr.de>; Fri,  1 Dec 2023 22:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BDC10E979;
	Fri,  1 Dec 2023 21:19:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E48410E968
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 21:19:04 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9b8363683so32836591fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Dec 2023 13:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465542; x=1702070342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92I2VC77Jo/d7ZlTpIZWS29l3+Yi7ot/5rEINGGwN8k=;
 b=Van20c1n1KFgSWJ9o+UMgoZE3ETGzTxtXyy6sJUFA3GOiD2MVqSdxqrYLZ8aUlDkdn
 I+lwPv7G4toTkiRhPs/6Ksdo3XF9AvexF1VjEZ0gr6wBTJw+vjJV4BEp7Wu/GRpDCWZ8
 7QGfJ2suEyUCLEpEUtflSoQjH1t6VhFxEvyVfJlD92g04CjusKm+bMhKY8lGIGMR1SFp
 WQnB8XUakmc66fLUu7Dgf/27nXXtnigDMAacBZS+c3YDIVRgdMX46sZJ6LWoWLIzg5EH
 rs/5ENSi+jWMviJddjdnXXatfKMO6Y6M3i2GSBspIwFux+5+dCjsPfA6AAUe+a5R7z7V
 1ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465542; x=1702070342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92I2VC77Jo/d7ZlTpIZWS29l3+Yi7ot/5rEINGGwN8k=;
 b=aku70VuAF7DgS6kJj00ViToV7vpOVo32cLLyoNsxav8UfXApAMH8j2m6uqcjFmm3t+
 gLRqTlFzcOdbiWoZFiz1KmJty03sWGg6//hQBOt68POLe9bvdFuTcNnq6AwB994aGaxu
 bwkcN4sMNecYDM3kzTeW/mQadnffXykG75WfX2PXVroypq8lpZ3u++lhT0zRDLNnrYqH
 9bzP7EMYlbjEacmKL7Mk+K0czoLXQzJpWlhe70sOjk/kkcCgCL47EhkPO0SYKkb9W/On
 FyIfQCarBuJ83aKWN+wrpmSgRVeJEkNELWCEpbq4PueTQrjtf6C/AZ0pwivXPY9cq24K
 FEFA==
X-Gm-Message-State: AOJu0Yx2LXsKrHLQ7g5wc/P7PD/CjF2daj4QTMmPn0yyRYKMHrU+GCNb
 8NJKpEJzlbJQNrKUaC4wE2fl4w==
X-Google-Smtp-Source: AGHT+IG0PapX2DW0mtcM2sBe+j3d8cEdosKjbPwmq0gmlCAeOni9lcrGN5Jprl6ze8zi30UCvPHYZQ==
X-Received: by 2002:a2e:8693:0:b0:2c9:cadb:f9c5 with SMTP id
 l19-20020a2e8693000000b002c9cadbf9c5mr1281931lji.0.1701465542472; 
 Fri, 01 Dec 2023 13:19:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:19:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  2 Dec 2023 00:18:45 +0300
Message-Id: <20231201211845.1026967-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 13/13] drm/msm/dpu: use drmm-managed
 allocation for dpu_encoder_virt
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It is incorrect to use devm-managed memory allocations for DRM data
structures exposed to userspace. They should use drmm_ allocations.
Change struct dpu_encoder allocation to use drmm_encoder_alloc(). This
removes the need to perform any actions on encoder destruction.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 50 +++++----------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0dc74e315a9f..3383ab708ec4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -439,23 +439,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
 	return linecount;
 }
 
-static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
-{
-	struct dpu_encoder_virt *dpu_enc = NULL;
-	int i = 0;
-
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	DPU_DEBUG_ENC(dpu_enc, "\n");
-
-	drm_encoder_cleanup(drm_enc);
-	mutex_destroy(&dpu_enc->enc_lock);
-}
-
 void dpu_encoder_helper_split_config(
 		struct dpu_encoder_phys *phys_enc,
 		enum dpu_intf interface)
@@ -2337,7 +2320,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
-		.destroy = dpu_encoder_destroy,
 		.late_register = dpu_encoder_late_register,
 		.early_unregister = dpu_encoder_early_unregister,
 };
@@ -2348,20 +2330,13 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
-	struct drm_encoder *drm_enc = NULL;
-	struct dpu_encoder_virt *dpu_enc = NULL;
-	int ret = 0;
+	struct dpu_encoder_virt *dpu_enc;
+	int ret;
 
-	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
-	if (!dpu_enc)
-		return ERR_PTR(-ENOMEM);
-
-	ret = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
-			       drm_enc_mode, NULL);
-	if (ret) {
-		devm_kfree(dev->dev, dpu_enc);
-		return ERR_PTR(ret);
-	}
+	dpu_enc = drmm_encoder_alloc(dev, struct dpu_encoder_virt, base,
+				     &dpu_encoder_funcs, drm_enc_mode, NULL);
+	if (IS_ERR(dpu_enc))
+		return ERR_CAST(dpu_enc);
 
 	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
@@ -2371,8 +2346,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	mutex_init(&dpu_enc->rc_lock);
 
 	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
-	if (ret)
-		goto fail;
+	if (ret) {
+		DPU_ERROR("failed to setup encoder\n");
+		return ERR_PTR(-ENOMEM);
+	}
 
 	atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
 	timer_setup(&dpu_enc->frame_done_timer,
@@ -2387,13 +2364,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	DPU_DEBUG_ENC(dpu_enc, "created\n");
 
 	return &dpu_enc->base;
-
-fail:
-	DPU_ERROR("failed to create encoder\n");
-	if (drm_enc)
-		dpu_encoder_destroy(drm_enc);
-
-	return ERR_PTR(ret);
 }
 
 int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
-- 
2.39.2

