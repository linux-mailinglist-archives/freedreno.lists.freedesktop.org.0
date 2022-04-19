Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC4C5072E0
	for <lists+freedreno@lfdr.de>; Tue, 19 Apr 2022 18:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC47910F0ED;
	Tue, 19 Apr 2022 16:20:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFECC10F0E7
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 16:20:35 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x33so30350066lfu.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+IqESpVbYQMIs3/UNg1efkYZ25dyhU/pKqEFiMBiHA=;
 b=iMMXOE8bpDkXu1hdFEglP503Z/oSOHQqccelcs8L/im79ktblqP3P0UP03h9tGcNEM
 tSi68fhV4NLXO56Iv/o26TIeovz1tzwUjHc0B+QvW4sbvj4YuJmVUqZyjD8IrUVqsxT7
 9KsDqZjWTHW7AZR2+QQscSFIb/VdZsjjPskQwO9IrWABjCY058S3zDKoK9rAzDZMPgsS
 +10murCPoi48oMcqj21qDspvu5bm++1kOtNMcSY9MmJX2FnmRwq+I0cL6IKqiHPqQkni
 HZS6bQLw8nG0reXwazKq+04p+b+0AzJllRdIOtPt7RNmcFku6yFbLF8GD843lH9qeZRh
 nEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+IqESpVbYQMIs3/UNg1efkYZ25dyhU/pKqEFiMBiHA=;
 b=ouV/6YIJqFLO2Fn0NQfbAhCYhHs2rbrGYWVU1IXYVotuVg6j8pTkFepNuOWAIwxD1U
 b/kDv9+gBexUodfWRUt/0R4Wq9Xltp2jPZRMiYajsuRHXBekhBy/BEdAzfYcqpUXEJQA
 X9XjCAxxdECSJKLM11poAdaL907Zlnx9TQEWGBvEMDhDYBFuYygQj+jPDqg7eZlAIOuq
 D4rq6BhYIkYUrfTbrR9/4bu06+ybuZlFlELdrRfRyyZ3Ofwjixp2zahj9aIt9gKRadag
 E8hSrcPY2hAPkubrKzp7Y+w3JEE2JEVrAC5ROsxwZ3dWDKzz1nmOmu+FrLoPAQeKbhrm
 X0Cg==
X-Gm-Message-State: AOAM533hdG2KlWyscdLdb7MbP5KsT1/Ev0y9O5CKenkgaQ7k+wVRA6qI
 y9XdIvAPtuNrzsBh5cjgb+rRUw==
X-Google-Smtp-Source: ABdhPJypdtKfWZWWolYsiHN8EVAztc3JJ1ntZpnrtbwbkFP7zZEIQPewUWY09qYHHbbWQfA/8nBBOQ==
X-Received: by 2002:ac2:5fa9:0:b0:46b:c39e:7034 with SMTP id
 s9-20020ac25fa9000000b0046bc39e7034mr11431320lfe.608.1650385234081; 
 Tue, 19 Apr 2022 09:20:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1495153ljh.45.2022.04.19.09.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 19 Apr 2022 19:20:30 +0300
Message-Id: <20220419162030.1287562-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
References: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/3] drm/msm/dpu: drop VBIF indices
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We do not expect to have other VBIFs. Drop VBIF_n indices and always use
VBIF_RT and VBIF_NRT.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 36 ++++++++++++-------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a4fe77cddfea..32a05db92f8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1205,7 +1205,7 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 
 static const struct dpu_vbif_cfg msm8998_vbif[] = {
 	{
-	.name = "vbif_0", .id = VBIF_0,
+	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.default_ot_rd_limit = 32,
 	.default_ot_wr_limit = 32,
@@ -1234,7 +1234,7 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
 
 static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	{
-	.name = "vbif_0", .id = VBIF_0,
+	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index bb9ceadeb0bb..598c201ae50d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -254,11 +254,9 @@ enum dpu_wd_timer {
 };
 
 enum dpu_vbif {
-	VBIF_0,
-	VBIF_1,
+	VBIF_RT,
+	VBIF_NRT,
 	VBIF_MAX,
-	VBIF_RT = VBIF_0,
-	VBIF_NRT = VBIF_1
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index a18fb649301c..1305e250b71e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -19,6 +19,18 @@ static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif v
 	return NULL;
 }
 
+static const char *dpu_vbif_name(enum dpu_vbif idx)
+{
+	switch (idx) {
+	case VBIF_RT:
+		return "VBIF_RT";
+	case VBIF_NRT:
+		return "VBIF_NRT";
+	default:
+		return "??";
+	}
+}
+
 /**
  * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
  * @vbif:	Pointer to hardware vbif driver
@@ -50,12 +62,12 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
 
 	if (!status) {
 		rc = -ETIMEDOUT;
-		DPU_ERROR("VBIF %d client %d not halting. TIMEDOUT.\n",
-				vbif->idx - VBIF_0, xin_id);
+		DPU_ERROR("%s client %d not halting. TIMEDOUT.\n",
+				dpu_vbif_name(vbif->idx), xin_id);
 	} else {
 		rc = 0;
-		DRM_DEBUG_ATOMIC("VBIF %d client %d is halted\n",
-				vbif->idx - VBIF_0, xin_id);
+		DRM_DEBUG_ATOMIC("%s client %d is halted\n",
+				dpu_vbif_name(vbif->idx), xin_id);
 	}
 
 	return rc;
@@ -95,8 +107,8 @@ static void _dpu_vbif_apply_dynamic_ot_limit(struct dpu_hw_vbif *vbif,
 		}
 	}
 
-	DRM_DEBUG_ATOMIC("vbif:%d xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
-			vbif->idx - VBIF_0, params->xin_id,
+	DRM_DEBUG_ATOMIC("%s xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
+			dpu_vbif_name(vbif->idx), params->xin_id,
 			params->width, params->height, params->frame_rate,
 			pps, *ot_lim);
 }
@@ -141,8 +153,8 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	}
 
 exit:
-	DRM_DEBUG_ATOMIC("vbif:%d xin:%d ot_lim:%d\n",
-			vbif->idx - VBIF_0, params->xin_id, ot_lim);
+	DRM_DEBUG_ATOMIC("%s xin:%d ot_lim:%d\n",
+			dpu_vbif_name(vbif->idx), params->xin_id, ot_lim);
 	return ot_lim;
 }
 
@@ -242,8 +254,8 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DRM_DEBUG_ATOMIC("vbif:%d xin:%d lvl:%d/%d\n",
-				params->vbif_idx, params->xin_id, i,
+		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
+				dpu_vbif_name(params->vbif_idx), params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
@@ -263,8 +275,8 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 		if (vbif && vbif->ops.clear_errors) {
 			vbif->ops.clear_errors(vbif, &pnd, &src);
 			if (pnd || src) {
-				DRM_DEBUG_KMS("VBIF %d: pnd 0x%X, src 0x%X\n",
-					      vbif->idx - VBIF_0, pnd, src);
+				DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
+					      dpu_vbif_name(vbif->idx), pnd, src);
 			}
 		}
 	}
-- 
2.35.1

