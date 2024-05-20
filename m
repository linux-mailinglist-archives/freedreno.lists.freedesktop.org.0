Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F908C9CFD
	for <lists+freedreno@lfdr.de>; Mon, 20 May 2024 14:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF54310E2AE;
	Mon, 20 May 2024 12:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wgVzhkri";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CD310E651
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 12:12:53 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51f0602bc58so2392645e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716207171; x=1716811971; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M8rKQysuLyUxJHz0JlgckR0sJmCMpy02kHDsRfWeHc4=;
 b=wgVzhkric4BDONPmBDuAonArX0RM8MTBRXwLjNkcXBd9YXu+CLHVrctro5xfKfpAp7
 LehS3I9yf9JcoxJ9Hbg0Ary1mpI0muHTs8tLz02+ubnW0OMXca9upr3mZ/1jGuWC3Q7u
 ihTDvia0gJZ7k6UKGpC9Jew6qxQ1k0OeACNWaEI9XYM1+IpZRyMP8Wzmx+V4YD9rBXPG
 Urano43rszooXpnm7eBIMMt7H9OaBvsiCtVyHMCOlYT8Z3/s2octNhA7t44VDduWm3Dj
 kY5jB3eVI1NJCpgy5eKgI5mDAaxOA7ZWt5CozKlkTuhOuge5tga4RPYUr665iWk/mM1v
 Pa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716207171; x=1716811971;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8rKQysuLyUxJHz0JlgckR0sJmCMpy02kHDsRfWeHc4=;
 b=L06qWKMwiZlDieHe7hBGuC7VB6uBbgTWZWrwpfRu2ADrN+dJIsmJoTaqYdZlKcqo6W
 atsy+ifwweJu1nNhpD9Pf9XYREj994Hvl1++Ns3mmHEaptZHFZuMuQoE6S0L8FgyMGAb
 bnElynd+5uWMoqlsa5S7CprI0rJJRbfQTlUrqABkGSrnPZcpRA+ISJ3Si+WrhH9lNSJ9
 WGqT3Uj9udeRkwh/7FSW81eE1c9izPTa/0kQUCvR35f/bB5rcMEPdlQCc11cBFB+uz0T
 rIFwkhEq2ayndf9XQcscu/xMJcBRFyjnTjz5wpoi90AJhM8u7PkfwjZDIlYDtPCKeL9p
 mEkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfwDNYZuNbKPtQ0bGJ/Qsxh+peSOSwTcm+InInFGVrf+AGvGH3Jhx+Z8PNxvgRMN/Pbc9TTFZuI3TmYap33cFzQEWpTfI1zQ7St2NDo8Xj
X-Gm-Message-State: AOJu0Yx0bfiZwdRo/JXHSwITMOVVFwqpFpdLiXUoNEDY0naYX1MUBQoU
 S63elSXLZrlLq+8b7/OpboOJu8hzHxbt7WnWKAFFXt7EUeler1ILZyKqbRqdKZ0=
X-Google-Smtp-Source: AGHT+IEM/5lq5VbrxVRGPP3AdsXOfhy3gr/csJTCN6F5pjX5h0TynyHAHhOnBhGhqp1xs6FUoZ7GUQ==
X-Received: by 2002:ac2:514d:0:b0:51f:5f6d:3fba with SMTP id
 2adb3069b0e04-52407cddc4amr1877945e87.27.1716207171391; 
 Mon, 20 May 2024 05:12:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:12:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:48 +0300
Subject: [PATCH 6/7] drm/msm/dsi: parse vsync source from device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-6-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZrM9buBF+7o6VFKWXROwO7MpIS2e3+tniUIcYb9S9j0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5q3ne28q6Hfv7c8rj08x85Nxo/r11EX3Z6/SY11z/L/R
 2+84vurk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAX4WL/7xS82iIlxvv1T6cf
 XYuZVFeEqqfvfCe3vrsj/bzLtdUXTq2wMfrVtnvZk3OCOlZF3i5GH/d235rE8tzPSJTh2sRzJyt
 1CiJk1ixNifbU/P1uTeVD3Z3had/ydmpND952fNkRoe7g9Nnvbol17Fud+WZxtlHVdoMDKxRuTn
 9+KURuhka6lmHf7XeTI37aWrZH8N6NXPPbjmX7PQFtFoOzqRUPD/G6JezJ+quT3PHw78eQ6R8Ub
 zamxIVOfDHNoP+Curp4XT3P/53vdPw/hspvUHKNSGDTCWP+ntV334J5Te4WxXkcClw/TmQxWjNH
 qMb/vFV477ennjx/8haJoPqProWPP95QOi3CL5ay7VoJAA==
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

Allow board's device tree to specify the vsync source (aka TE source).
If the property is omitted, the display controller driver will use the
default setting.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 11 +++++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  5 +++++
 drivers/gpu/drm/msm/msm_drv.h         |  6 ++++++
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index afc290408ba4..87496db203d6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -37,6 +37,7 @@ struct msm_dsi {
 
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
+	const char *te_source;
 
 	struct drm_bridge *next_bridge;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c4d72562c95a..c26ad0fed54d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1786,9 +1786,11 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
+	struct msm_dsi *msm_dsi = platform_get_drvdata(msm_host->pdev);
 	struct device *dev = &msm_host->pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *endpoint;
+	const char *te_source;
 	int ret = 0;
 
 	/*
@@ -1811,6 +1813,15 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		goto err;
 	}
 
+	ret = of_property_read_string(endpoint, "qcom,te-source", &te_source);
+	if (ret && ret != -EINVAL) {
+		DRM_DEV_ERROR(dev, "%s: invalid TE source configuration %d\n",
+			__func__, ret);
+		goto err;
+	}
+	if (!ret)
+		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
+
 	if (of_property_read_bool(np, "syscon-sfpb")) {
 		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
 					"syscon-sfpb");
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 5b3f3068fd92..a210b7c9e5ca 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -603,3 +603,8 @@ bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 {
 	return IS_MASTER_DSI_LINK(msm_dsi->id);
 }
+
+const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
+{
+	return msm_dsi->te_source;
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 912ebaa5df84..afd98dffea99 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -330,6 +330,7 @@ bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi);
 struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
+const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -367,6 +368,11 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
 {
 	return NULL;
 }
+
+static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
+{
+	return NULL;
+}
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP

-- 
2.39.2

