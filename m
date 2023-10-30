Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE667DB84B
	for <lists+freedreno@lfdr.de>; Mon, 30 Oct 2023 11:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6BA10E299;
	Mon, 30 Oct 2023 10:36:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5667310E299
 for <freedreno@lists.freedesktop.org>; Mon, 30 Oct 2023 10:36:54 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c6b30aca06so21010961fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 30 Oct 2023 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698662212; x=1699267012; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DA6PVD1pNqlF4BUixIYFQIvuTNht/64ah3v95olbiNw=;
 b=fwGTt0jMnjf7Txab/2NahDrz6SofRAcHYl/CtknIGUwaJ8pdz5ezzHmEFLRpjoVb2U
 7K3Y6fQ2HPnfKVhow7EywfYHBtOPxfn+kZzZjDlh60W7Do+LYuGV8HaiolAsBFEdlf7F
 p97gtBQ+7DCodtbHxVskKVs/WEbNW6yyRzHbnIxa3+R6Nl7t6QMw9pSuOIfK3DkYdD7x
 lFodhkks9a42rrkhoNJrPvksHUEF7VQXSH259fuuVvSptLz/Cm5yBzY/hMwIonto3D44
 sLxDNEK+LqggPUOAuhYMZP+KcnG81DrjRF3Ry927WjbpjsLcd7ATL8jBZ0+jo99yp0WD
 qMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662212; x=1699267012;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DA6PVD1pNqlF4BUixIYFQIvuTNht/64ah3v95olbiNw=;
 b=TF3xiMDmWZ/UkMPR9gI1e1a5EizGJUuiyBJ9RtHq6lEj8bA4HbblgS78EB55dpAXXi
 Xri++VFF+I4zeVFNFO0JdZVJaKq1vLhpoo8VF8LFYXS7mF1dBCiY3ftgFDJYFcXDpXn1
 XfzlZUfmqDkyIckUUtYulXUIisW+DLV/Khuxu1cS1XBDpP/uZrvx7bIq3dDQK3PRfATD
 xyperrtVuiq82qZg3RTregFmEUIlwcxOpk4A3t99rtGS54OTTcl5lGh+plRjuSKj/ryM
 kv1BA89fXjKhOkdydjL4quT0I0fYSoud9E/GNSHo5Cci8EeUv+e94zaQltu7FDbaEOik
 rOGA==
X-Gm-Message-State: AOJu0YzVkbDnckeA1x0kpCCgWHp+Sask2uiA12HbdWw12vC9z3XXY5mc
 Rr+JkyiG3pzIwnu7AKHveJOqKg==
X-Google-Smtp-Source: AGHT+IF5rt60Krlu4XkRUEi0s9/CrfpATLDmDfv9/0Mtg2XZ+mRpHAfn82dZyCp8UC9qcW9Jh7dTgQ==
X-Received: by 2002:a2e:9184:0:b0:2c5:1ad3:7798 with SMTP id
 f4-20020a2e9184000000b002c51ad37798mr7355852ljg.52.1698662212627; 
 Mon, 30 Oct 2023 03:36:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:36:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Oct 2023 11:36:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-8-43f1887c82b8@linaro.org>
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mOPAs9fZnFHnWKWTDzyDhJJvT1b82KyCyg4RUEyUBOc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c5PQd/l9lmI/IHAedI22CO88us5G1Wn2T2zHiT
 u5TkJDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HOQAKCRB33NvayMhJ0UeID/
 9C5ihJ8N2WmdSPfB9UUSO2RACNYSosGJIIQpZ72sH+3Auc1eatlQdp1J18OmS0v1EUfueyLFztzgYc
 PYvL85QlipzQGnRsAmC18sFZA29GDdawbLS8Qv3069TT2yqcYyAKOTGv901sGOufbaByEYJIUCe0aE
 jnt+z+pjQraQO28jQWdHASBrEUkbIvGMDw+9x7AsoEWNx9LfNDRDuwaCCHRuMzM4FVtPeBUVUiOEk/
 6D0B5+T7JUOmGXHVuSHcvTso/IUtWBn286L2SAT/LAAiwDY293STD/+6pCfxuUgpVEROWO/egsgUHe
 ANamWpRbaqB+QoGhpw3lhdsFwign4mUbsvGi5Pt6USLP8iMA8tczyAlB0RYGUqabEDohRViQidlz6W
 7LGXucKOq3Y1TpwXqVTOUyLbElyMRQ50IvXW2QjeF3pzp6tnXgp6CMdKMG4iaMSwXOAvNmF0qk0yfW
 mbXbzqiJPYLWYSNjF48l38FDvSAjKkfwR9fuSw4de5EzpyCfhbWeArpxbBUir6roVqxn7Pi2dgoCQA
 496W0TlQLXpPBmfX+PAe6FCipIcCkP5FXt14chJO8fW5paxLIFl6Q1zlduX7geIIaS+w1rdv9DZayd
 r6flv/2ILTbe2krxEigZWGNKZAEIYCtTclv+m3DXPzYtq+p5gs604uw3arSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH v2 8/8] drm/msm: dsi: add support for DSI 2.8.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add DSI Controller version 2.8.0 support for the SM8650 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 1f98ff74ceb0..10ba7d153d1c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -190,6 +190,21 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	},
 };
 
+static const struct regulator_bulk_data sm8650_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 16600 },	/* 1.2 V */
+};
+
+static const struct msm_dsi_config sm8650_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -281,6 +296,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
 		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
+		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 43f0dd74edb6..4c9b4b37681b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -28,6 +28,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
+#define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 

-- 
2.34.1

