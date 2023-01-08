Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E76616FD
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 17:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD2A10E1F6;
	Sun,  8 Jan 2023 16:57:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7C510E1F0
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y25so9521766lfa.9
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
 b=au5mlBLngo5aQphj6Qo5sCvsVWk3KrTubxzRUEKvMm2OUTgpH26AdjgZemt3YxW8fm
 VsouXPpNz7Hyyjrp7CFOEqIJzfFvfst8AtVNf8e3PmfI8J/H6zoBM0HQrB4ImO8mtbjf
 WI7tvyCjRBWohgsNfRkG9jiwcelexz2eugv4vAtQL51of9SR5JChUjoCLiyzOOXdq4T1
 9M/pHYgjBSa2e5RrbJ+fZpd+q5aTKLbJqBmGAEvroA/Xko08nZf28p/TBvCfnW3o3iPf
 yFUHlucVkSezVVgqOoeSluDpK6rSYqm+v3nG2kKCLjQ3Pencj+rYLTV2zF/llVMgCSUm
 SCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
 b=GPVv46BJkqU95pUjRbQaGTo6ObzqhbeLLd/4oKhiMeFIZArSsZ7yl46cutga8qj577
 FG1VMG80lb3yKBp9MLeOPdubtxV2p9zK/G7vlqcRcvYSliZSdnRQCUY2TM3FEKRfwY6S
 9PV1LlbEjVa25O+s7Tm+EmG6FOMRICSAT8U2bBLy5LzqJDHPgHGFRctABaLwKdp3DKs4
 V06aEK0tky9TfCtk9s/vuaR27YwmO7IIqkqp8jpj6U0U6nPx/exu17TnYPzNChCtne93
 /Dgaie2KHwpunpYmEhY/27QAZpShXi4wDIf8ip/IGD3+kkWhErv4ZG9kOXhnQBd8U4CZ
 pGeA==
X-Gm-Message-State: AFqh2kq+ni9KMaa1h71nspd5ZEYlpmkzz4YjcyUENjTGWzsMV66JUNqw
 8p8kU6JB35LKFH3adnV/lVeTJw==
X-Google-Smtp-Source: AMrXdXs9tehp0AeUOGWV0u7MoShAVtbfl2A4h8VIPWPLu41zitPoXPnm0P+YDLpkJ2d9/trIymatIw==
X-Received: by 2002:a05:6512:22d3:b0:4b7:66:8231 with SMTP id
 g19-20020a05651222d300b004b700668231mr20113767lfu.58.1673197022219; 
 Sun, 08 Jan 2023 08:57:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 18:56:49 +0200
Message-Id: <20230108165656.136871-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 06/13] drm/bridge: lt9611: pass a pointer to
 the of node
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

