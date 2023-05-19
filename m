Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A9709F30
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 20:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB09E10E60B;
	Fri, 19 May 2023 18:40:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C6010E600
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 18:40:28 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2af1ae3a21fso23320041fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684521627; x=1687113627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdeMqeqre4AjsZFIDUGQvvW+NqfBSGJehYAYRYCniPQ=;
 b=sTJLoPFg+OiE6lhCMR1yLbbveKVtufudQflf5N6LOv+dxTHo74zxCGmwx8jOOsMWcV
 2/xDAxUf+B2X0CicYeqLK4mxHEH1o3iGGYvDswPdCJ1qifeG4MghZTtXr5DwKY6IqSMy
 grQfybGyFhZQQ233JqOW5uWHKAjrh/W9pjPeV6iG3tanoYdMTYNKptBzx2wiFYUzBMQS
 FQbfk7UJWvsHLMk2vj45gTtuvAABoIqU8O4V3EDVesifT8BFVPDqIfdfOBybXHjKKE8Z
 EXpnc5na1dUFxUmbsiHFSJ4bmaB5ATfjfxQBcUGhO/gtlGGPxfo0EtnycpZkUwUNvmsm
 sd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684521627; x=1687113627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdeMqeqre4AjsZFIDUGQvvW+NqfBSGJehYAYRYCniPQ=;
 b=OkBzxVV1bOZzdJYmKeIi4hdbVM76/iwfCHXJR7Gy8upjLKK24gy/60kyKVtwWaJhwR
 rBOnplDWeaBCUZRkuC5Fovo95C+N0V6kM/GZMKlryUdS69ZUTp68zGh26jh+0uN8pS++
 wwAgc9/DZ89V3cnLTBzjCDKQQhQIH3P6QkpR0K4l9hNfRQMauZJ8Aq4SrYvfU70CxgCe
 OXWkS1D77nJj++8o+bBdwG3uXUE8dOr2IibBHchkOT3VvwEdndDBAXKCmz+WjA4fazms
 gERSr54rOegSibdTjFQhZGv8rVEXga5ZyhXodtooahC4IEjpORK3x3ZVD2zbqhNoifxi
 VpvA==
X-Gm-Message-State: AC+VfDx8pY0NWhLj8oLmvzK6wxhbrP3bmwOKIxONZea+R0Alfr/b4VTh
 snrU60jgJDd4mQzL8rDQQboWkg==
X-Google-Smtp-Source: ACHHUZ5NLZpCegeAxAXaFRIQFgyz43RVDJkfwCEIbkHlt4+tMLF0o7t55vbQW7YFeNX4T8akzOyMfQ==
X-Received: by 2002:a2e:8601:0:b0:2af:1a67:d52 with SMTP id
 a1-20020a2e8601000000b002af1a670d52mr1365981lji.37.1684521626833; 
 Fri, 19 May 2023 11:40:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002ab59a09d75sm932493ljj.120.2023.05.19.11.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:40:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Fri, 19 May 2023 21:40:22 +0300
Message-Id: <20230519184023.3943362-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
References: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] drm/bridge: display-connector: rename
 dp_pwr to connector_pwr
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In preparation to adding support for the hdmi_pwr supply, rename dp_pwr
structure field to the generic connector_pwr.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 9a12449ad7b8..1d37e57242dd 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -24,7 +24,7 @@ struct display_connector {
 	struct gpio_desc	*hpd_gpio;
 	int			hpd_irq;
 
-	struct regulator	*dp_pwr;
+	struct regulator	*supply;
 	struct gpio_desc	*ddc_en;
 };
 
@@ -319,14 +319,14 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
 		int ret;
 
-		conn->dp_pwr = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
+		conn->supply = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
 
-		if (IS_ERR(conn->dp_pwr)) {
-			ret = PTR_ERR(conn->dp_pwr);
+		if (IS_ERR(conn->supply)) {
+			ret = PTR_ERR(conn->supply);
 
 			switch (ret) {
 			case -ENODEV:
-				conn->dp_pwr = NULL;
+				conn->supply = NULL;
 				break;
 
 			case -EPROBE_DEFER:
@@ -338,8 +338,8 @@ static int display_connector_probe(struct platform_device *pdev)
 			}
 		}
 
-		if (conn->dp_pwr) {
-			ret = regulator_enable(conn->dp_pwr);
+		if (conn->supply) {
+			ret = regulator_enable(conn->supply);
 			if (ret) {
 				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
 				return ret;
@@ -389,8 +389,8 @@ static int display_connector_remove(struct platform_device *pdev)
 	if (conn->ddc_en)
 		gpiod_set_value(conn->ddc_en, 0);
 
-	if (conn->dp_pwr)
-		regulator_disable(conn->dp_pwr);
+	if (conn->supply)
+		regulator_disable(conn->supply);
 
 	drm_bridge_remove(&conn->bridge);
 
-- 
2.39.2

