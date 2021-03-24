Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3E347B62
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149496EC76;
	Wed, 24 Mar 2021 15:01:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CF76EC53
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:46 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r20so30618659ljk.4
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InxB8LW00zB5UoFHTCsqm7Ebz3Ngcyc7bbqEDUAHS2E=;
 b=f5bNMXa/zhnBJ1YDuk4EwV081W0yUX2F6G0S73I3Qj2+wCqTQFjLy3f51+T9eOBxDJ
 kjmFubN/MpCdTjx21EhK9kQNtrzmLALB+5RrMAWnVhMdYEIuwMsnS17kvfaE7S0aFt7O
 Vn4xoKbKTRNHUxwRTzzZ31y3+cwDOoyUl+l4ggY4H6QKJBwdtKdJTnr/d7KowTmBbhPm
 3WQ468Wb7aobtpxGCtm6cMSFhpafOQi5iO0t10IXUKN5l0ksIDnTJXN64T0hF2GOB1qd
 llkxvZ5sNpscxQo97C+pUN5nEmbGYAcs40tcUUv0OXT9xQiyniYJiKjjEyOg3ocdHuYk
 OJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InxB8LW00zB5UoFHTCsqm7Ebz3Ngcyc7bbqEDUAHS2E=;
 b=Dro71gbxhFIRB+75elt5f1Fydc4yFb0mqerrxE/UMpUpKBBHnvSiDBEhOTixxrTaZj
 wU+tSvuUo8ih3rB+zLNZzMgQDO2nFWKYbKuw16qXAWZ6s9z7AzMsFIskYEWJO1B+tUzJ
 mvclq02qCXjluMID00w1xC0Kk8R6E9jFRYokufZ08LTC7Gvw+fSjXn1Hb+aAsSrqQ6Um
 NpC5t/h4sojpk1kkA3KHTlTZXp/Jy0/FWss0ZV62PGEUijRXVNWUN/ZtrRGFRcAyV6+e
 r3TvYmO/mINwDcDuhAP6wEN/Ogqi33CNq/XAP/ZO6RPh6Vpdp4AMyHrTkYXN+i+zFAIP
 CWUQ==
X-Gm-Message-State: AOAM531XwEC9zJt+gytpNBqUnNOehj8iGoQpWxDcv6eAvVn1BD4l8SX2
 KC2j12wUYU3T2s2uWLZZDtBTm5fg8umZBw==
X-Google-Smtp-Source: ABdhPJwmTkykf0MLHiVcPBQgtPtjq0/TeGKif/1s6wyjV7Rl6VlCjHX1VZrdFZvUep3sAUo+JDZIeQ==
X-Received: by 2002:a2e:b047:: with SMTP id d7mr2305388ljl.348.1616598044960; 
 Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Wed, 24 Mar 2021 18:00:15 +0300
Message-Id: <20210324150024.2768215-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 12/21] drm/msm/dpu: call hw_dspp ops directly
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Replace dpu_hw_dspp callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 15 ++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h | 19 ++++++-------------
 3 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5a0a6741a431..bf3048e44001 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -462,14 +462,14 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 		ctl = mixer[i].lm_ctl;
 		dspp = mixer[i].hw_dspp;
 
-		if (!dspp || !dspp->ops.setup_pcc)
+		if (!dspp)
 			continue;
 
 		if (!state->ctm) {
-			dspp->ops.setup_pcc(dspp, NULL);
+			dpu_hw_dspp_setup_pcc(dspp, NULL);
 		} else {
 			_dpu_crtc_get_pcc_coeff(state, &cfg);
-			dspp->ops.setup_pcc(dspp, &cfg);
+			dpu_hw_dspp_setup_pcc(dspp, &cfg);
 		}
 
 		mixer[i].flush_mask |= ctl->ops.get_bitmask_dspp(ctl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 977b25968f34..c17f2bf3324f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -22,7 +22,7 @@
 #define PCC_BLUE_G_OFF 0x24
 #define PCC_BLUE_B_OFF 0x30
 
-static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
+void dpu_hw_dspp_setup_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
 
@@ -33,6 +33,11 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		return;
 	}
 
+	if (!test_bit(DPU_DSPP_PCC, &ctx->cap->features)) {
+		DRM_ERROR("called for wrong DSPP block\n");
+		return;
+	}
+
 	if (!cfg) {
 		DRM_DEBUG_DRIVER("disable pcc feature\n");
 		DPU_REG_WRITE(&ctx->hw, base, PCC_DIS);
@@ -54,13 +59,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -108,7 +106,6 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 	/* Assign ops */
 	c->idx = idx;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 7fa189cfcb06..e712e3e4c67b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -36,19 +36,15 @@ struct dpu_hw_pcc_cfg {
 };
 
 /**
- * struct dpu_hw_dspp_ops - interface to the dspp hardware driver functions
  * Caller must call the init function to get the dspp context for each dspp
  * Assumption is these functions will be called after clocks are enabled
  */
-struct dpu_hw_dspp_ops {
-	/**
-	 * setup_pcc - setup dspp pcc
-	 * @ctx: Pointer to dspp context
-	 * @cfg: Pointer to configuration
-	 */
-	void (*setup_pcc)(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
-
-};
+/**
+ * setup_pcc - setup dspp pcc
+ * @ctx: Pointer to dspp context
+ * @cfg: Pointer to configuration
+ */
+void dpu_hw_dspp_setup_pcc(struct dpu_hw_dspp *ctx, struct dpu_hw_pcc_cfg *cfg);
 
 /**
  * struct dpu_hw_dspp - dspp description
@@ -65,9 +61,6 @@ struct dpu_hw_dspp {
 	/* dspp */
 	int idx;
 	const struct dpu_dspp_cfg *cap;
-
-	/* Ops */
-	struct dpu_hw_dspp_ops ops;
 };
 
 /**
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
