Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D23677518
	for <lists+freedreno@lfdr.de>; Mon, 23 Jan 2023 07:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA6710E30A;
	Mon, 23 Jan 2023 06:24:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA04210E30A
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 06:24:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d30so16636660lfv.8
 for <freedreno@lists.freedesktop.org>; Sun, 22 Jan 2023 22:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zmjULO6Lx2bWV6pkSSEDxjddNWaKTXCc+6Tq6pikP+U=;
 b=YutDh5WeB6NfXcZ3hcWQgq2dByaVsZ7vVHG+GdUSj3u28nImaDR7qbiJyk5Uz9myWT
 AIAAkzE3HWrAx3EgDduZmPtOQMJgRct5gkB/UX9zhCIuavgp3HidywhNEU9GLpWEl2Ea
 FgdbO8mCFOkVx42WPWp3YREJrW8pyKtqITeTn6UdxK1mt0ZNxSDJTWUoykyY7UebDsSw
 h2+CgCOfL5GRLoYzNl3MqeJTDfrqc8X8z5ne0a1/+9DKUoizMeggOZdmdMf2Q3AsyxQH
 u4jzVWmdGlaq1BpbJs4WkAivQ+wOl0QCymxOEdN3dZ3CzheMHNYgOsUHLx0Wg9U+H4w3
 ik6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmjULO6Lx2bWV6pkSSEDxjddNWaKTXCc+6Tq6pikP+U=;
 b=0MgLdYAcaCaWQtwoktfDlKGP/g+XYVaWcNWuzHAkNz/9ZSdRfMqOA02o5LpEoltSro
 v9JsMZ9ODJrMDO8UH7EmGevEFVotGJ1xqw6Od0Vp1G8RgU7Gvnnopl/SJjh9tqrYiMJr
 i7JIl+dxJ9WF0ZbH3+vtre3MD0ec7E8XCq5yNX5/hD1i0Z/I0wHslGWmjHbSgIefRSrR
 xILZ6AZY2HL5GF+zcLrStj06LanpeExnGCfvNmmzEvkls4QzUyBLCch6SycnHK07yaKY
 RS4AQx0vU/Es2dQvIKbd6cFzipJ2iQlSQoc2Gm/knPyJy8wS104D1ODGBJ1mx9+mCX5i
 SWkQ==
X-Gm-Message-State: AFqh2kqaBRGdkgIkH1RAU1O4nz37bmMi9j+xnSKTL4Q+ZScK32PfRvhH
 d03+Sbk40A5eshCcWofbuNExug==
X-Google-Smtp-Source: AMrXdXsuF1OLKO3i/Z0WsolPfPCIAUQJ/ZfsfaSUltkM+91LW8idP/MFE+s9DJZ6rvMmKcmp+StWHA==
X-Received: by 2002:a05:6512:2305:b0:4b5:b87a:3264 with SMTP id
 o5-20020a056512230500b004b5b87a3264mr7370328lfu.56.1674455057129; 
 Sun, 22 Jan 2023 22:24:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056512118700b004cc885ea933sm4807775lfr.192.2023.01.22.22.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 22:24:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 23 Jan 2023 08:24:15 +0200
Message-Id: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm/dpu: add missing ubwc_swizzle
 setting to catalog
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

Use the values from the vendor DTs to set ubwc_swizzle in the catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Added data for sc7280 and sm8550

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e45799e9fe49..b16e550fc4b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -580,6 +580,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x7,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -593,6 +594,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -649,6 +651,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -675,6 +678,7 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x2014,
 	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -711,6 +715,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x4330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-- 
2.39.0

