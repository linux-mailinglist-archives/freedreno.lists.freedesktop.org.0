Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D627BE794
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0837910E29B;
	Mon,  9 Oct 2023 17:18:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0646810E291
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:18:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bff776fe0bso60857871fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871884; x=1697476684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CEblOIocXlow3cb9XQyMsSKR9zDBhqpUmKljUztzkSU=;
 b=QltQiY34VaFMNgesPhftD4xlPCX0DJzmb1hfTHnqR6wst7mcUjIVZcRESPqLpMdSF9
 GHcLLLezU5mFDOe0BFgAUpzqQnBfkXf+0CVnlMZX/ChpDkrBetNCsObzYS+vGcpYQmt2
 efoRtNAlZ7R3tf+HGi/cccX9V9/0zFGdBmzT5e4FGCT906Ke7K9SSm4piN5p0MGFtbMm
 LjK+g4mG7HzApCIeUhtwkX/1fgM3NmBiI5xJ0OsUPCNMgJXbyltwzP+pn4ejoOx5gabk
 y8137L6TyZSCFtGCccQAxrXreo3ueA47t6CvwTMVYW+q7mA9uP2wl0P4OBwnuL42x6pI
 Zxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871884; x=1697476684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEblOIocXlow3cb9XQyMsSKR9zDBhqpUmKljUztzkSU=;
 b=NuOcKralMwdu0x1jNW/Tm4X6040v6MPpehSvbKqYSbZ4p5rOewLfRtfXF7ta6DkQlf
 c7ZTtkRdpLLfcYRdEdR+rDIaLQG8cenRzFEcPoNW1dFleI6j3agHvyzg1O1gC8pKLLRt
 hdF/CB5fvVwoMY1rzlDOeIJl1qwvm45A6EOUvI0krDTLW0GvdtE77UKLIWzmOI23MVwQ
 CU4AGV9vWBIDTSDpoOdnX0ebOHaHy35x2kTbBRMwmO//TLuMpQsmd27ES7t0lWBiCj87
 Kat3RmYogYp338sqrU80aMTrDDO2Kdh/nznWNQH15Kkta2IhX2jqAxy4rEN6fCvj4eLu
 sXew==
X-Gm-Message-State: AOJu0YwkA/PoT/Zc8S8ZKmIQWXIConTUuG4Pq7Wt6e2djc+aUyiokJPq
 B/itSE39iORxAOyA+0eGx2GR4g==
X-Google-Smtp-Source: AGHT+IG4RdCPzZlKt6l4Watu6D2W7vlq+2/tsr/8tE/NcaZWsglRlppVXo11VIt0pfqpBekhWpNfEA==
X-Received: by 2002:a05:651c:87:b0:2c0:a2:77d7 with SMTP id
 7-20020a05651c008700b002c000a277d7mr13038278ljq.24.1696871884288; 
 Mon, 09 Oct 2023 10:18:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:18:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 20:18:00 +0300
Message-Id: <20231009171800.2691247-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
References: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFT PATCH 4/4] drm/msm/dpu: enable writeback on SM6350
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

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index cf5db6f296bd..206ee16acb86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6350_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -148,6 +149,21 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6350_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 1920,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm6350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -222,6 +238,8 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.dsc = sm6350_dsc,
 	.pingpong_count = ARRAY_SIZE(sm6350_pp),
 	.pingpong = sm6350_pp,
+	.wb_count = ARRAY_SIZE(sm6350_wb),
+	.wb = sm6350_wb,
 	.intf_count = ARRAY_SIZE(sm6350_intf),
 	.intf = sm6350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

