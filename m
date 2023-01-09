Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F636622C8
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 11:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBF310E3C5;
	Mon,  9 Jan 2023 10:15:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0412B89F63
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 10:15:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6215816wms.4
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 02:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0s4VZeBOMQpwWZj/4UqywYFSz3/oNjsiCGTdYmq+Ed4=;
 b=GYyFyKRThdUuyM5II+3FAt3nJ8Gmur5flJvLmSDFeEuHUMV6Rx16E1IASpmdxVmyzi
 eUy1ylnZvSoAbOdPybwXVyLF5oogC4ex72+7vkNfORUc7T5flOHc6D92OpejMWV2Ojf4
 UzR9jCrRdJwUfcdIZ5D962ti1CNLfpEoo7QoeD3qK+EochicpUJdUXaZ/w3BpVEZfEHg
 s8TqpyeMy+cUMZgGGGIIrQrjP5l5YeUJLArSfBjYHM0W6qS2CvOSmAG2s5LHb/bCIGZL
 yypkgAcMjheq/Cs57uPERG6WLr99Iunek/WIEM0Ozoj0pYaVWkQW/FNNXrwNQUzBh1CM
 N3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0s4VZeBOMQpwWZj/4UqywYFSz3/oNjsiCGTdYmq+Ed4=;
 b=vaGltwkYciM+wLfTxWT/okrPvMkRJNSwmM511a7KJsPHHuzS59OyuWgZrNqoZobQvQ
 WLuA0L4IAUsKKaW5uGaxpUFGdnnjMRSKKhzLWKrlpB146rWGF9c9kR8VPdMTNcAYKdu6
 5tMgw2o3LwWxeF6PjuJGV83Gqmu9adhr9MvGqFNYS4SZQQwwv9cO0TLcHs/fPSt+hS4c
 VKQ/ONoPa9zOyf2EO8WhSOn8ejtcGNBMuFrnyxuZRiWWvbzNzJ1DJOdEa+SKkn065AUs
 dc/EVOhdURu9SlyfHcZG+UZF8W+AKIlFKsNb9eqcKEmI9p02b8VOGeqV72o8X1z6V9TI
 eGcg==
X-Gm-Message-State: AFqh2kovOlUMLkzTrPxxf0PhNvQ/2Hl/aXHqRuStf+6YhrpHJby7sxbW
 +Wa8+th1rRrMPMfFlwydDKXfGuQBue5QROag
X-Google-Smtp-Source: AMrXdXsULA5FZYk37OoBQDVDPxjQ4tDTvg8N0Nbd9sVY6dWWU21YUlejDZ9tl3AEmq6iGU7Xk0IWRA==
X-Received: by 2002:a7b:c3d2:0:b0:3c6:e62e:2e72 with SMTP id
 t18-20020a7bc3d2000000b003c6e62e2e72mr46579909wmj.13.1673259327514; 
 Mon, 09 Jan 2023 02:15:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm15815376wmc.13.2023.01.09.02.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:15:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 11:15:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v3-7-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
Subject: [Freedreno] [PATCH v3 7/7] drm/msm/dsi: add support for DSI 2.7.0
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for DSI 2.7.0 (block used on sm8550).

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 59a4cc95a251..33884ebd2f86 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -181,6 +181,20 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.num_dsi = 2,
 };
 
+static const struct regulator_bulk_data sm8550_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 16800 },	/* 1.2 V */
+};
+
+static const struct msm_dsi_config sm8550_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8550_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
+	.bus_clk_names = dsi_sdm845_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
+	.io_start = { 0xae94000, 0xae96000 },
+	.num_dsi = 2,
+};
+
 static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
 };
@@ -302,6 +316,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
+		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 95957fab499d..44be4a88aa83 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -26,6 +26,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
+#define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 

-- 
2.34.1
