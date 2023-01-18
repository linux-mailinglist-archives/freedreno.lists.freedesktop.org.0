Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912106715F9
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 09:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5F710E6CE;
	Wed, 18 Jan 2023 08:17:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776E10E6B6
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:08 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id vw16so18136308ejc.12
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z21qabX0zA0LOCrjyd5BOA9oMNili5LM3YkrVmBV2Eo=;
 b=miHFnkPBaZGBZf/Q+RwZ03zBxicSB0GC4It/AoIceWlaEUI3cB/wA8NvOSz78BmNR5
 R/BFzSoHyY7rSq5HDWmm8qXH7rSOihIbgusOus+AQSFdokZMIOM8fauF5pjGcXscgyCG
 yFf9eXa2FimHCNRBjYhLJ33HwHi0scOQcuWSKa5/Sc2I9JPEY2FxeFIAwABOL28SNWBP
 KvXK7ewf13f2QlTzY3kLLb3VywOZWmrOK2axqdSu5RnJ0J0K9HGVhG2pvAJpEXXNMCnc
 FlK/xF0bLFZLBzeatC5lsPaGfWZKOP+M9kUmDxbGHat+33jcnLX3pjwEDDhxk3xN7X9y
 ogFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z21qabX0zA0LOCrjyd5BOA9oMNili5LM3YkrVmBV2Eo=;
 b=T+zcrc7yOO4DuCq+vWc2FTuADCb58kcVOw3278h0vzzUUU1+L07q0HgoJgR96a1jWj
 ee3rvbFH44CM8R4kXeSyuBh4eLJOF69x9TODLe6qFKQ1Guhc7EpdheBylMcz2uW4qdeJ
 j+VExm2TA1dEsnXTIMdfXz6nFdz91g1z6c1iVeLb/zN3KBRCbW0pNe3XYP1hztiVQpe0
 S70+ly5Y6AFDSM46cfm+TlJAoiCpbK10w8BivxVZOrsy9ZN4Rr8zjcj+o+ahiaQ6siIn
 Xdza3gJ6rTdxOzGXMWKRCMjXK7VZLpA5k0MHI02OZEqZJZslnaPJ+cicWZINo7nD1sR6
 ayQQ==
X-Gm-Message-State: AFqh2krMw9wjwQmLzTpXpvbYEpWl8kyvt/f3cEW3hLVg0j1MBkIhC6Al
 al9x5bqkA8OKe01qAYHBkjR4Ww==
X-Google-Smtp-Source: AMrXdXv54Cd9vgBkUt9dwbHyzGs5tvEicxpFcmTNq4XN69Jnw66LcHPusI+mYcTMN6hVRR35tkYctA==
X-Received: by 2002:a17:907:8d16:b0:84d:43a0:7090 with SMTP id
 tc22-20020a1709078d1600b0084d43a07090mr6629133ejc.77.1674029826804; 
 Wed, 18 Jan 2023 00:17:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Wed, 18 Jan 2023 10:16:51 +0200
Message-Id: <20230118081658.2198520-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 06/13] drm/bridge: lt9611: pass a pointer to the
 of node
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Pass a pointer to the OF node while registering lt9611 MIPI device.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index e2799a0df8f8..3b77238ca4af 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -769,7 +769,7 @@ static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
 static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 						 struct device_node *dsi_node)
 {
-	const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
+	const struct mipi_dsi_device_info info = { "lt9611", 0, lt9611->dev->of_node};
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
 	struct device *dev = lt9611->dev;
-- 
2.39.0

