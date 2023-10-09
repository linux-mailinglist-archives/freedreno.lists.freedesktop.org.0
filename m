Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4A47BE795
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F92210E29C;
	Mon,  9 Oct 2023 17:18:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6369D10E291
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:18:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c1807f3400so58406551fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871883; x=1697476683; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D+M8hrUb+u/XzpJ6qoH9Pb/8miMIjbd1ZgpYuYEGZ78=;
 b=CGFcZyGQVGry3kQxISf91QRH9TgnYaWUJFoi7SjQBGgAoY3wQgtWP6ADP0S09VjceV
 NnIY7y6nCyi3iWCtLYjR9MZcR/5rOM67kNNcVqPmn7G8BNmWxNFSwwFk/CEPZUxhzLXu
 iYlQoyOlYjwuEkkI/5sr2Dqeib5UiBuiS/rmxmquJQmMjUSCZdWSXEK2p0ICc1VRZoLn
 ji1zBX7WZ8FL3diiOEgxGK3ctxMF7GHj95VVaifc2wI4v90gBkIzd6wIysLg368SXJEU
 +GSdJI4DbakIoe1KZcR5dnzVFt4f8tUQHK/iBr30enYtqab7BXSZRJGSxrkgXeEPzEES
 G5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871883; x=1697476683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+M8hrUb+u/XzpJ6qoH9Pb/8miMIjbd1ZgpYuYEGZ78=;
 b=eUyA083AOjWkJBBSW6SI0XSihiPk1HHCuEKkzZBJBZgO8x5YNxsNBLhctfMD9+JZ2E
 h5/ouEtbxQUefkuPAJ3bUfRcRkGcsNaXT+FKErnZOj88NKgRCjojcDepbjHk/ipdPVDf
 Nc78iymSScojZtU/iJanqGFxM9MqFX/5eQ8oyJgOrW/LqbsRQTMZysTHi0ckOt+hNchW
 ME/Plllgo7osYlDkvQY5N08sVW+d/HNwQe6lYFyk5c+6hb+n/n4yQgWGb1qnak9M6Y5H
 L1M0VGUxLykXvXIU+n+Kbq2+RZqsn2qc+z09fqFGyno8HrR0/D2IeNLiUjBSVjkMuXfI
 V7oA==
X-Gm-Message-State: AOJu0YyMEkSycd80X93SMV2s7dE47Blb80GfvPIOk5VyK4bMpS3cffaa
 NSBI/ve2Ta0TYzP+9NhpWygktQ==
X-Google-Smtp-Source: AGHT+IH1NT1m/e250wIAJtsyFe63IKbaoF3hiLBrzHBN/C99UBBxtv+az0vLuWUjD65N5IK+mHt18Q==
X-Received: by 2002:a2e:b4b3:0:b0:2c1:86da:3f61 with SMTP id
 q19-20020a2eb4b3000000b002c186da3f61mr9085547ljm.9.1696871883614; 
 Mon, 09 Oct 2023 10:18:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:18:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 20:17:59 +0300
Message-Id: <20231009171800.2691247-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
References: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFT PATCH 3/4] drm/msm/dpu: enable writeback on SM6125
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
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 2491eed10039..c1b31a063a6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6125_mdp = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -141,6 +142,21 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6125_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 2160,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm6125_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -213,6 +229,8 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.dspp = sm6125_dspp,
 	.pingpong_count = ARRAY_SIZE(sm6125_pp),
 	.pingpong = sm6125_pp,
+	.wb_count = ARRAY_SIZE(sm6125_wb),
+	.wb = sm6125_wb,
 	.intf_count = ARRAY_SIZE(sm6125_intf),
 	.intf = sm6125_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

