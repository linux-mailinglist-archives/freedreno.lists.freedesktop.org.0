Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C53371723B
	for <lists+freedreno@lfdr.de>; Wed, 31 May 2023 02:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B0310E44C;
	Wed, 31 May 2023 00:03:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7539410E446
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 00:03:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f3b9c88af8so6062464e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 17:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685491384; x=1688083384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3OEmXr21pqF/DhjjsNsj2jQ6ewL1wVXkcJUB2jONab0=;
 b=hZN+kfDdoHLAt9GaIgZHuFu6HKXzZ3Ktc6kJP8d49Cw/arvaoOyLntl3lVChaxWKSU
 WnyRHNtTlmbX/Ci+j5APLM7eM7uEFY7GktDA8loVPNYMEDJqTSpXMrL6GMnA+8ZP5i6p
 TJgpVij7aDHfAGjGO8wEnGN18G+4+p1gn/8+EJrsAx5aEKU9fSutn4y+33/icfXzsWYA
 KcsV2pwFMizAFnyhffeFoEUK9GOhFzORMy5guBrOB2evko0PNrC+PJFWYEuRPIQddLSn
 dWBZR4p6JZCXtH+Lfwd78UAr6lnvHcywtKO6TgeiD7KWl4j502ltQC9DuP20ZIBywgA/
 KaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685491384; x=1688083384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3OEmXr21pqF/DhjjsNsj2jQ6ewL1wVXkcJUB2jONab0=;
 b=OxJPSEK10JKoy+6wYCcz8TyPYF6jfGjjHT2rbeqOa8XvhNFDbLhvBhuYjTkkA/twCO
 HBbz8lbks+NfpTdW7clRKt43qP4yfT1nP3ZQBC2YLCkRHe+wx1yi08uquCazOxa0BS16
 JUyZVQhqhb1cFTxl+T3UJMlYJEfuL9NSBXwKxS/f42FG8eIjN4L2Ws0VI6Je/xLMvpam
 CPZh7a7dUFJL6x4YLk89Izq98qusTGR0qFf9wxIBamVgWVW/lQVaVDaylxVY16/yGJfv
 ackneas6XbUamt/F8nIXozGl9dinLZwq4nbdjC7CoptbIkAfbxbipQ89MUeHDTQi9r3n
 eHMQ==
X-Gm-Message-State: AC+VfDygwfEVsKtK7s3LCfoW9OMDT1FkVcQqo0k5m2ZAkNNG0yVKggcE
 JuETBifsX31Syl7GCJrtEnmbCQ==
X-Google-Smtp-Source: ACHHUZ7S8cGW6Oy5Se6ClqJ1RTus/DPNFHmu81b1xTiPY1WGRF6SQ9zHvno/ZAHf1nqswW6tYzBp7w==
X-Received: by 2002:ac2:5491:0:b0:4f2:579d:6867 with SMTP id
 t17-20020ac25491000000b004f2579d6867mr1546144lfk.20.1685491384301; 
 Tue, 30 May 2023 17:03:04 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 d30-20020ac25ede000000b004f13eff5375sm490388lfq.45.2023.05.30.17.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 17:03:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 31 May 2023 03:02:59 +0300
Message-Id: <20230531000259.3758235-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
References: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 3/3] drm/bridge: display-connector: handle
 hdmi-pwr supply
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On some devices the +5V Power pin of the HDMI connector and/or the ESD
protection logic is powered on by a separate regulator. Instead of
declaring this regulator as always-on, make hdmi-connector support the
additional hdmi-pwr supply.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 55 ++++++++++++----------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index cad3105ab186..f7f436cf96e0 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -191,6 +191,18 @@ static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static int display_connector_get_supply(struct platform_device *pdev,
+					struct display_connector *conn,
+					const char *name)
+{
+	conn->supply = devm_regulator_get_optional(&pdev->dev, name);
+
+	if (conn->supply == ERR_PTR(-ENODEV))
+		conn->supply = NULL;
+
+	return PTR_ERR_OR_ZERO(conn->supply);
+}
+
 static int display_connector_probe(struct platform_device *pdev)
 {
 	struct display_connector *conn;
@@ -316,36 +328,15 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
 		int ret;
 
-		conn->supply = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
-
-		if (IS_ERR(conn->supply)) {
-			ret = PTR_ERR(conn->supply);
-
-			switch (ret) {
-			case -ENODEV:
-				conn->supply = NULL;
-				break;
-
-			case -EPROBE_DEFER:
-				return -EPROBE_DEFER;
-
-			default:
-				dev_err(&pdev->dev, "failed to get DP PWR regulator: %d\n", ret);
-				return ret;
-			}
-		}
-
-		if (conn->supply) {
-			ret = regulator_enable(conn->supply);
-			if (ret) {
-				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
-				return ret;
-			}
-		}
+		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
 	}
 
 	/* enable DDC */
 	if (type == DRM_MODE_CONNECTOR_HDMIA) {
+		int ret;
+
 		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
 						       GPIOD_OUT_HIGH);
 
@@ -353,6 +344,18 @@ static int display_connector_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
 			return PTR_ERR(conn->ddc_en);
 		}
+
+		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
+	}
+
+	if (conn->supply) {
+		ret = regulator_enable(conn->supply);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to enable PWR regulator: %d\n", ret);
+			return ret;
+		}
 	}
 
 	conn->bridge.funcs = &display_connector_bridge_funcs;
-- 
2.39.2

