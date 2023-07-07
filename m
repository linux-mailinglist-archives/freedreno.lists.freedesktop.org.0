Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AABCA74B814
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 22:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0E510E60C;
	Fri,  7 Jul 2023 20:37:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FE310E5FE
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so3785945e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762253; x=1691354253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJZCo+Qt7gE7l1ShQuf3LZCI3Z5wl4+iSR6a096SvjI=;
 b=sHHxdmup4Z2u8y3PBO+GMRckSGmKLerei8gBJSTjHGo+l4LvGkO9jQaRU5/nBPsFs1
 P7ywZatz6/jK+7zoJP/azP+uo/5nd9r1XK0/eTPDa38Q0XNzhsWVvxaphTQaTpSNfto/
 OdH3G1jGwvdmsa2rE5st5Ucrb3aI4iikJtnpeBUaZxvALNguPdJT6QzPs/1bujVW62+i
 Uql6vygteHXbTT1L3ENmg4HMUj2R31KGD1i4KQwnZ+nUKegx/Iph1jW3g6n3XJ8ho+02
 zw2nbqDjiQR2LXTj0luJ71XvmpPp5P2EdktxRnGek3d9vCjyMxiKMwE841FpbR+73HOB
 ftvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762253; x=1691354253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJZCo+Qt7gE7l1ShQuf3LZCI3Z5wl4+iSR6a096SvjI=;
 b=ThZ+MgvUIu7OA05JzWEZBMxnSxfdJGPD4pGOPQl02qfH6mN56C4iagVzLyzq+PgOfL
 2rxOgMSG7riXlSRlm9/uCg4YWgGLyKfBZvONLeeNlkvNKEiKFD4J/3jHu470OfLHZsQX
 vjXL0TbYgi7aiuToSHFqWqYiuAjcbrOK/L/QwvMrshpG2kzyVA50isv+DObgeM5rkRTo
 81wXbCBTLugQuKt65fNgbPjkM1i/H3lhAyQXVemOo8CkvrUkUq1fkgz9zb1mUkCLPGrv
 m/gZhf40NBovF+DkPvwcSMITpNOxTLtPKfVoCohSP5u2/mvsZxxm8Ed5yN9KtQ26y4Il
 c+BQ==
X-Gm-Message-State: ABy/qLZR2x+RwEQn5rZI2AQBEQcXxt7mcBx9jd2cxnzuRVjdCpg1+Its
 9BWCMFWrxal1FhobYUMRzeUIqA==
X-Google-Smtp-Source: APBJJlFjLrnMYE5rZlWtdKMLlkyxmLmT7Qm7lUqHLnVmn4mtWYD72yXzRx09g2+hbFYef0u2xxk7qg==
X-Received: by 2002:ac2:4e8c:0:b0:4fb:61ea:95dc with SMTP id
 o12-20020ac24e8c000000b004fb61ea95dcmr4352844lfr.7.1688762253582; 
 Fri, 07 Jul 2023 13:37:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 23:37:24 +0300
Message-Id: <20230707203724.3820757-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 13/13] drm/msm/dpu: use drmm-managed allocation
 for dpu_encoder_virt
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

It is incorrect to use devm-managed memory allocations for DRM data
structures exposed to userspace. They should use drmm_ allocations.
Change struct dpu_encoder allocation to use drmm_encoder_alloc(). This
removes the need to perform any actions on encoder destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 ++++-----------------
 1 file changed, 7 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b42176ce4a3a..fef66c6cb488 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -443,23 +443,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
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
@@ -2365,7 +2348,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
-		.destroy = dpu_encoder_destroy,
 		.late_register = dpu_encoder_late_register,
 		.early_unregister = dpu_encoder_early_unregister,
 };
@@ -2376,21 +2358,14 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
-	struct drm_encoder *drm_enc = NULL;
-	struct dpu_encoder_virt *dpu_enc = NULL;
+	struct dpu_encoder_virt *dpu_enc;
 	int ret = 0;
 
-	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
+	dpu_enc = drmm_encoder_alloc(dev, struct dpu_encoder_virt, base,
+				     &dpu_encoder_funcs, drm_enc_mode, NULL);
 	if (!dpu_enc)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
-			       drm_enc_mode, NULL);
-	if (ret) {
-		devm_kfree(dev->dev, dpu_enc);
-		return ERR_PTR(ret);
-	}
-
 	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
 	spin_lock_init(&dpu_enc->enc_spinlock);
@@ -2399,8 +2374,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
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
@@ -2426,13 +2403,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
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

