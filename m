Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAC59F1886
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C12410F0FF;
	Fri, 13 Dec 2024 22:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Agr/14Yy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991E210F108
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:27 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ffc76368c6so19431101fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128126; x=1734732926; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8IMh7/4gtGTqxqOcfJiGtP3qp8XYO8UDdVvlSG68eLU=;
 b=Agr/14YyZ97sMHemDUSQXhR4DtkLfnFPAqpRU2fDZggm+s5v5X8QNHS2RG1bmxn0N0
 E+N6IoJirviGILGWEEpX6keJfRnr2R2ewu0r3VHndKYoHtwBQsS0gpAgROmnQ9h4XGlZ
 kXUWyS382c66S6CGQA1heuaLWvN+5uEhizWHtAFkgZnVK273QulUALlgtS9rJnSHr48r
 PPv2EASOvzmdmpULSixrLXyk8EyLDl4f8GD1tfDhDuHesxTb4aXh625UDieI4s+V/mBO
 54SrTchz13lmkMZi+SOx5uvvjWGqGy7EC6rpCjHiLQ3ENp1Wih05xDUG4fFBtUkKpgUU
 9uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128126; x=1734732926;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8IMh7/4gtGTqxqOcfJiGtP3qp8XYO8UDdVvlSG68eLU=;
 b=VhwrPq6xCuc9PGOKQkJ8b47yTtielNPP54zHhTQRY94FRgtNBvp34KHqkyTJYIkJJl
 SIbgrmeNqL7ZfKy4gReqNCmf9+SPGPm0op8LwQYQDc3msA+pMqVv2iEMSgVhGJFUQetC
 pzXhOy2x/RFwYvdNN5+9wg/7v5fNSGCA0q8X8+Z0CKQJk3IdcVplQK7XZO6AO9cttJA7
 xFxJ4Rxm2p46ryKGPAA+KCmud1lEpiPi541QXypk5eFRBkoAZpsGK3kB4oAbexIb7Feb
 oASDirD7N2XeSM8utDYzFrlVTEH+OOO0kVEwN5fykrDWFZsz/PWxvolC8doOjR1AGvyP
 gVwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWURD9GbEWRsd2+JHjOpsivd4Cxo2T74mxDTee3Exndm4velf2thfshrYJJsiHwzo3l1duSiZ0h5QI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrZXwLwe9yO9Q9hwr5WbmGEoYyUSrDVVXCp/S/qM/3RSInEjpb
 DSKcK+FES2sSnyddkYLp52LO58OozZ/J4bi4nTYT+DrZZYXl8y0vdpnfaUQqqX7CC1VlN3xmun7
 ahEh3nw==
X-Gm-Gg: ASbGnctlwc/7MI9B4NwdYLJloJ1O2wfT8shV/Uls8VZ6RjYqyJtQWWq44T7p4hJxWMz
 KMtRMXY/r+D9mwfULV9BfAdh3lBqaZP6PNWhMJQI+JF5d71h+5m2TMJ9NK3KK1LkmaFL15+F36+
 xfji5fWc39QzDmBtcuuOV5f9hpMcoX3AafrvteabXfZcmNrWEKLhyUpypSEi7DTKlSox99cWyYD
 3HzI8vkaFLfwRP9zUieDiYwrh8jAAlsGJ4kFKJ7g7IgtsDKuAtoLGUb/y2x3D9H
X-Google-Smtp-Source: AGHT+IEdPww9zO4cq8UV3Cq0e844sYPXBa2014yPUHELvGt61EfOGPB1KKCReO0W75FAjtqHxce+Ig==
X-Received: by 2002:a2e:a581:0:b0:300:3de4:ff72 with SMTP id
 38308e7fff4ca-302544cd51fmr18332481fa.27.1734128125652; 
 Fri, 13 Dec 2024 14:15:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:37 +0200
Subject: [PATCH 21/35] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-21-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7266;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mdU6BLhaFlUHEbrTxcm7+kblF4pf8IwbOLmxqXRgd1U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHHxuBunNqav1puk4B1dF9KKlnXxNXrSNsnV
 /XDcw04GCKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxwAKCRCLPIo+Aiko
 1RZzCACgmUzJ3CEYdnS9OmoIs8WzOvkL0omd1pCBVXxZ+QQSVOtndBRd/hjjWiwI9WNq2c49ncw
 ztNb9hd1ThcWJBMvylUI6sWc2WC1qBJ3m0CvnwFVeWlNZBLD/5yhlgk0fPyhpSD3eNtUtULjp7V
 GlQRhoJ7BunoGOTW1Fbtct1gUOK+HRuv/3d9Fu4JjAmgO1ySlbH8vDokpA/aSVgbJmUSexpSV04
 v4auZX0icLmIxMa7UFlnBd3tSBKbJP21eW9MaIZNG1UCgl0A7JkuB+W03qoyQq6XugTmWnHTgM3
 Ersl/hxCx7jFOkfIeucTyFAuw1/21FDB9hy3afdSEWo64VTX
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

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_PERIPH_0_REMOVED feature bit with the core_major_ver >= 8 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 9 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 080d1fb70a9af67b0616316885cf366aabbd848d..910abb0fbf597b8a1ac557c486c3fcdb50a77da5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8650_dpu_caps = {
 static const struct dpu_mdp_cfg sm8650_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 7dda3cef9db2fff9f870d1767ac76f13fb8c9758..103edbdd8066c9969f06cffcfb7184f173ebca8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a13207b556cd9d00c40d87b7e8c7247dcde54d63..bc177ffd5a30370db4d7dbfb843f9d3364404342 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 static const struct dpu_mdp_cfg sm8450_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 6baa0592f91ead9d789d6cde189abcc572460d20..e8f235b46ccd0208037ec9b847ab2b0aed7fa45c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sa8775p_dpu_caps = {
 static const struct dpu_mdp_cfg sa8775p_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index be17b04c2a15f04cde4bf5afc122d279aa04231c..a170e2c69f472ba425a9aec6be180d4a30ee18d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 static const struct dpu_mdp_cfg sm8550_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index ba30615b6187328d99b1f299994ca737c9f92e7e..00071b89d9893c7147baa1bc39e92c69788e8114 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -20,7 +20,6 @@ static const struct dpu_caps x1e80100_dpu_caps = {
 static const struct dpu_mdp_cfg x1e80100_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 566ae15413a60894dae82abafa50bdc8c02a9095..8d03b33dc707497e5756d8632f267e925aeeea3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -32,8 +32,6 @@
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
- *			   in a failure
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -41,7 +39,6 @@ enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
 	DPU_MDP_AUDIO_SELECT,
-	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cebe7ce7b258fc178a687770906f7c4c20aa0d4c..c49a67da86b0d46d12c32466981be7f00519974c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	if (mdss_rev->core_major_ver < 5)
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
-	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
+	else if (mdss_rev->core_major_ver < 8)
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ca4847b2b73876c59dedff1e3ec4188ea70860a7..a2c962fbb038dd2b456d6b8cdd3a0b3102cfab3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -994,7 +994,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, cat->wb[i].name);
 
-	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+	if (dpu_kms->catalog->mdss_ver->core_major_ver >= 8) {
 		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
 				dpu_kms->mmio + cat->mdp[0].base, "top");
 		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,

-- 
2.39.5

