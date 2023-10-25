Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81B77D634D
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 09:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE9110E580;
	Wed, 25 Oct 2023 07:35:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E0510E579
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 07:35:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32f5b83f254so140280f8f.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 00:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698219316; x=1698824116; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4jR7NrXl1SeB1IvQAtGBWEHsBiiSiMqnsq0ZbHv10QI=;
 b=yoL3cdMVv/3LE91WjCArggxHGKPsGN73+e7q6gPtWciU6qkqps9ARuydaHC1Ny21Jn
 bk3UTn+wtmGLibISS4s+wFgBjkLx+llKptfufjOmrVVflSb1BNI1oJFGwDfGWq4C5lWN
 ibPuPvIgsnMp1zTJjynRRIEUvAcwQwmiYe8O34U8jDp3BFiOvvYpulL+JyZPQA3XameS
 Kyc1NMjF2SnL1vBeWQM86tm/H8DBtRuoFgpPZ4QkoDowieOJFNPkPqZdlu9EfpxIXJDE
 PHkHlTJgi0dAck8wcwlp81v/rWupnGl1qQIP/HH19FLz4tvf+5fYTuq0BWQt4rmqSQnz
 lXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698219316; x=1698824116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4jR7NrXl1SeB1IvQAtGBWEHsBiiSiMqnsq0ZbHv10QI=;
 b=oMgIaIG7lnhQSVcyv1EpbP+EsAgVN/5AVWseIo8hGlQmKqAvlmKIJeLYwQvCE9vrQE
 L3yQhozoKHCqsNSmtgffhKSAg2u2TPgjfIbBdCVQ20Cww8GPZMc+W0Y3nIIdMWBfMgKb
 VbPhiGgR1AVElB23CcRsukszMDzNixWKKm6RBLJUBHYzNriqHV449DG/3mu0f2WJX0Rf
 Lfy1yLR8Q7xac5miBMiIllaZKLI/vN8D+jJBEW2qaJkM++b3ZYr2uOfDKjVCifT5Pnuo
 x3EGILyLXNQ7CzEkQcz3hYAFV0/u288KQ+VZNb/r559/EAZCgPV3qvMPNodc/SViZYfG
 WIEg==
X-Gm-Message-State: AOJu0YyfQs73iJaar7OyAT76UOgX6TU5zXyzdjF3tPH455JFipLIVrAu
 wvDB/GsWbG8YpM/EOlBcppz0Rw==
X-Google-Smtp-Source: AGHT+IE+cFxN7Yp1+LHNmO10HWCDN1BOTiGX6ngQCgwAqv73Mjax/cnxErJ82gFJVWZXeYCdPpv1Hg==
X-Received: by 2002:adf:efcd:0:b0:32d:ad4a:bcef with SMTP id
 i13-20020adfefcd000000b0032dad4abcefmr10074431wrp.2.1698219316108; 
 Wed, 25 Oct 2023 00:35:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a5d60d2000000b003248a490e3asm11449058wrt.39.2023.10.25.00.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 00:35:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Oct 2023 09:35:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-mdss-v1-7-bb219b8c7a51@linaro.org>
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2994;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XWO1ll/O5SAbsuSLybzrQH6wpy3r8i5/kE9ugk0FOCE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMUoUEmSR+ZjythCe+M+cI29X4ttEvQXEp6dyj/C
 WxVnTQSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFKAAKCRB33NvayMhJ0el5EA
 DHEoaO3OBaAsJwX/60zizjdw9SpfauMYI0hCcnezms29KLu4zki/fTD5kK+k9rLJeanPonoa/BDI/5
 0Xk0eocLGavmDN7QHEH+YuzFWmvBJBjN2KP7FFdgbWjOfiaq1B4ggyVyZEJs+T7RSOOIf2l5oUnZKL
 FsnZosL2NarIjFz8lrSR3DU7raixkOKMpM3nYFhol0hOtANk3J+wv5j6bCkqcVxkmeRzbDdqiok7JB
 j5+1cDBcBfUi1+AvfAOrJ/cHx50u3umFiwZ+TtGx/4A931fuhtgTHQxatrhs6L5bqnQHN3CghqOBcO
 1S4+y7bCbTlbQ89lw0gr2d2yp3A/5EYd5v5O2CTZ1UYml5YlDuyIEfFJlBvQeoIgKq4Lzkh4wBvRUI
 eon4nB0Mn2xULLzH7bkI8+QFQfBHmdAfYSJ2TpM2Lfdh1D7AcCPkttY7kFnqOEQQf41FKwKuKSAf9b
 7knWyor266jdZ0b0S+fqyCmADy6q6kaCtlAcs1kRWTGv6VXW82jw256NizuYoFOLOzxboljA981oeb
 zbWwVjWcvtGcL3MnOeFA2zvvNmYW73iPaThGUKpjMkypolvWLGkTb0ceuJRUIz/VWdOq6D8Uy1sF4d
 WXiS9b+Z6r17Obic5KAD6I7x/QuMtNuX3UcBPhT7Vyyrxks9I113eXB4BXbA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH 7/8] drm/msm: dsi: add support for DSI-PHY on
 SM8650
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

Add DSI PHY support for the SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 27 +++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 05621e5e7d63..7612be6c3618 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -585,6 +585,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_5nm_8450_cfgs },
 	{ .compatible = "qcom,sm8550-dsi-phy-4nm",
 	  .data = &dsi_phy_4nm_8550_cfgs },
+	{ .compatible = "qcom,sm8650-dsi-phy-4nm",
+	  .data = &dsi_phy_4nm_8650_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 8b640d174785..e4275d3ad581 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -62,6 +62,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 3b1ed02f644d..c66193f2dc0d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1121,6 +1121,10 @@ static const struct regulator_bulk_data dsi_phy_7nm_37750uA_regulators[] = {
 	{ .supply = "vdds", .init_load_uA = 37550 },
 };
 
+static const struct regulator_bulk_data dsi_phy_7nm_98000uA_regulators[] = {
+	{ .supply = "vdds", .init_load_uA = 98000 },
+};
+
 static const struct regulator_bulk_data dsi_phy_7nm_97800uA_regulators[] = {
 	{ .supply = "vdds", .init_load_uA = 97800 },
 };
@@ -1281,3 +1285,26 @@ const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000, 0xae97000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
+};

-- 
2.34.1

