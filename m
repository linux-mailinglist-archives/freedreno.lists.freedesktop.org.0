Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10874802010
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2150310E241;
	Sun,  3 Dec 2023 00:32:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD4010E24A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:32:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso15408e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563526; x=1702168326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AjlZ6WQ4BOO03gr4n9ZYpinJkeVX9iUFc0IE12rIVWc=;
 b=mrGS1teIBunazZCR/4zaVMKYnZAgfyY3RLsM+lrV3Eocs7go2r3AQiwYhQESZ1g2nr
 RIgSBkkLCXeAvYbNtZKrw/BydPj+AkVHUIaWVJXdRJ1/7BniwdiZOokHSQ+tddytAipf
 UhDMSe0MoPJoRLVnNDgCPvT0gOUdF/ZmK8LxC7csFZSvpYxsS9kFV3/y0sLNjxe9tqZd
 IBXqQAdRgHyTaYI7V+DKyhy7duHTUu1X4VIRXuE50E0+SKjEGlPHntiOTGft7sItXJg0
 3c56JsNs7zfDMwgO7d8FOHjYHdc7s4d7aujEAsLB+HwvdMIDmBQgJwl9lAUKVMDtwT/m
 7aHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563526; x=1702168326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AjlZ6WQ4BOO03gr4n9ZYpinJkeVX9iUFc0IE12rIVWc=;
 b=RxaivbFrXqyo34Fn1j3e0jc0mML287/usnNqXLVneCiNvVbaDgg2SWPpHb5kh8dn2r
 JWdsJboY2RuoGmBi5oKb7o84EYDPKeKPPX5s/kqc69nDbZ4/bRA17r2UHkz/gOGhZ2Ck
 Grk/soT+r1LWEc1GOu8x3SYpK9mVqYYfABwWAmIsPyDNuiDuhU0T16gV7Bz6fDnseo22
 Siu0BylGW7cVH+2oGJwmXOxkgrB8sthti2DL/r1QlV5TmcOYeGNVd25JazfXkiDIzeYo
 PR+YN73GgJCwwoTRtucBef+KKy17F3rQfNcDzygfOjijHijytjk3tdVFseaR0olpot3u
 Ot8w==
X-Gm-Message-State: AOJu0Yy+7aHhZIaNM9hRnxc4ZTAPpm5Bk7JTxhcjTWEzCYLGlfV+sW0E
 LOjmW/qfeqmJVWcwmWTPe/GNXA==
X-Google-Smtp-Source: AGHT+IEO96VwvP5rnAVCPO+mFh1U6q/eFqagFnB+Ak7L+DqphZJ3tV6+/mMGxGdl0c91k1iwnC+pkA==
X-Received: by 2002:ac2:5472:0:b0:50b:c164:8481 with SMTP id
 e18-20020ac25472000000b0050bc1648481mr1765696lfn.36.1701563525862; 
 Sat, 02 Dec 2023 16:32:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:32:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 03:32:00 +0300
Message-Id: <20231203003203.1293087-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFT PATCH v2 1/4] drm/msm/dpu: enable writeback on
 SM8150
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
 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 9392ad2b4d3f..62deedb206b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
@@ -291,6 +292,21 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8150_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -385,6 +401,8 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
 	.merge_3d = sm8150_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8150_wb),
+	.wb = sm8150_wb,
 	.intf_count = ARRAY_SIZE(sm8150_intf),
 	.intf = sm8150_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

