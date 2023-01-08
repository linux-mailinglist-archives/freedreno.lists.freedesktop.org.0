Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344336613EF
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 08:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F4610E1E6;
	Sun,  8 Jan 2023 07:26:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3986F10E1E5
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 07:26:01 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id cf42so8343598lfb.1
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jan 2023 23:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
 b=ZQe4KJDz4ptondq++o4ifOMaqWPCx8dqCv/EBBlz1pUl/CXtvA4TVX8b58inFkMQiV
 xEZ9J7W59nw4Bu2UyLe2zLEi2I4z9P8ZPbDPxZRkK2GYhlvAHEyMN3Pu5KQzvVU3BPij
 uEj0Ly0EsuBhuZTNgn3t4mpN0wjiOF7FFXcSPIWYCZg/7ulPBpURZQ3E9yeI3VCl00mN
 c9gXxbbphvs1VvE5wKr9/I5/4EAsXNN/jOCphCbCz7LMk2Lsje2QV3J90eYRoalzIiYZ
 m/O2Ep73ZXqCpT8hpsHniyWPnxydCYam29Oaptph5/qHOAyovtY6VZv4ErIFIuy73qWI
 Kibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
 b=WKQUOWDa7tTOWe4wsP1Us7s5fYl/6gtFIHPWt7KydGo9iT8NMoVx47MrDmq1gM62Ec
 XYYZa9D4P0ytAkZQQdcem/lLQz3mK+gR9MKmMzLzhv7zQhU4IYMrTZDzqCcW59rC8s08
 U3beyDCd23Bw+UGV57HGDQ2QGzzTIGrLDNen5drZ18VKoK5Xpm9ZHm8buXKXmxsTBd9S
 jkVB/2Ou26ZNc+0q4Sxe3LUsAp8wZql4vYRHN6GX87xM6QIKqryBHdyujplW7jcP1OFj
 ZzV3a55jPl+nTPWBxs4MQStqw/mZoeToD5aVF0TcBWD4M4MBLvH0wauIrCNWvXrSJq4v
 cY7Q==
X-Gm-Message-State: AFqh2kqpVKy85hKxnHEvDyut8jD+G++rG/inx/2gCCnOGkREIuEtoWPf
 SdS3s/G5Xw+9t5gh3MRCKUZ4PQ==
X-Google-Smtp-Source: AMrXdXvFBev112O5sYS91DrRbcayDdq+LFoKfun7pxSfD9QGpC6eQaXo2u/E+mSxzuZpeSXR1YNORg==
X-Received: by 2002:ac2:446b:0:b0:4a4:68b9:66cf with SMTP id
 y11-20020ac2446b000000b004a468b966cfmr15491687lfl.26.1673162760795; 
 Sat, 07 Jan 2023 23:26:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:26:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 09:25:49 +0200
Message-Id: <20230108072555.2905260-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 06/12] drm/bridge: lt9611: pass a pointer to the
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

