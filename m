Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2661802019
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E33110E241;
	Sun,  3 Dec 2023 00:32:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C77F10E241
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:32:08 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so1822284e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563526; x=1702168326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0C9JIY3GCJCSUXtT2mszaRF/C74fxdUxFphdfFtUxjQ=;
 b=eky1O2uRW3Spkm1vS80YrDxlW48RtKvuGYZ6oPe56A21WWKpFKoA/xDFFB/OhA9Vw2
 W7ehc0RuXWgyzBunAPCmzuf1PDSFGdpVQbuekP50jUzYq+Zyu4iujIbDA/pmpsMlDvUz
 JqebR8mWy6dkFcJLXIO505chVa+6+r5ZJKCMjuESA29iZnaoXliROyNei/GRuUJkuNYe
 t+Wm3EqE4CetDWFFNVJUMTewXkZbDGkfpnbdfp+aDt0fLAxCD73WdQfqEiSUiWQuBx6t
 bEKU6lr//ISZaNOJJq7WIW1cVIPKytbJFsy9rVWJUehbmHJUKawtpHj33VxUCHwtllxu
 mSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563526; x=1702168326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0C9JIY3GCJCSUXtT2mszaRF/C74fxdUxFphdfFtUxjQ=;
 b=WPU+wbIHen+fhGanuMWMS8TUracvACh+dciNda7PqURvwFn6mDQd9LcurrnC0ZHIz4
 sLBz6FtIXz5U509AZzBHBt+H3KpS3cnDjbCHnLy/FJNjBdpuW2J524VWVXEqDVZdaaGx
 6aPFDShTYx52QQNQnmszIqRqrlW9P9m3UZHSbPJBqtmbixRnntFNwX74e1h9vJNjFJgH
 eKOojzhRixPJSt/iUW2P+vgHnUf4bAfdC16hCkLR6YstOJWPLcs7bzi8b8u3Os3Dr5X/
 asxGQkdZnaySvhRuBZpHN8ldO92+WNIAb/cEn1M1M3j8qTchNWEpnTt8QeCJA+2wO1Il
 d5iA==
X-Gm-Message-State: AOJu0YzGj5h+6hLdKfCOZjU4inBvEzPIZ0hgvFOfrwlpbjG+Og/jYxtb
 lq8e1Z0Kgg/B8nT5sMD7ChY/oA==
X-Google-Smtp-Source: AGHT+IHZY5lfzqNBQ2sQQka0ULP8B/jhtDVtHjo4ZC3ymr6KOGt1SoLOCi/yWR+HkNAzq6rwseUwgw==
X-Received: by 2002:a05:6512:398e:b0:50b:e5a9:a467 with SMTP id
 j14-20020a056512398e00b0050be5a9a467mr939319lfu.88.1701563526621; 
 Sat, 02 Dec 2023 16:32:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:32:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 03:32:01 +0300
Message-Id: <20231203003203.1293087-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFT PATCH v2 2/4] drm/msm/dpu: enable writeback on
 SC8108X
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
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 9ffc8804a6fc..d4b531752ec2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
@@ -298,6 +299,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sc8180x_wb[] = {
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
 static const struct dpu_intf_cfg sc8180x_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -411,6 +427,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.pingpong = sc8180x_pp,
 	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
 	.merge_3d = sc8180x_merge_3d,
+	.wb_count = ARRAY_SIZE(sc8180x_wb),
+	.wb = sc8180x_wb,
 	.intf_count = ARRAY_SIZE(sc8180x_intf),
 	.intf = sc8180x_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

