Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954B71723A
	for <lists+freedreno@lfdr.de>; Wed, 31 May 2023 02:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9AA10E44B;
	Wed, 31 May 2023 00:03:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B98910E44A
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 00:03:05 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f3b9755961so5754731e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 17:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685491382; x=1688083382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8NJTpbaQkrMxS2HcO+vhGH2r43mf2msf3vlTqsDsrs=;
 b=CfLqFjRya6Gg0gewkoHtTOTOPWt5xFicxmeUjTWNgBK9zhjUQd3SJi9Ki3XE8EK4BH
 3JhbZQamgTZDhaPRlFk2PM54dJ5BXO8NCURL1gyo9DivOJ+CL8m+S2zfChn58cSIlzdb
 RcgxdcNjdKynQovtpAPUAtFkB9ZTgEJCbIiZ9fJXR7BaIdr1VuIVepC2AGMris0sEyT4
 li+8RvgM1FnjQ8V9X3pi79tzwZQXh335ZfQ2i67QGc/AHhlZlReM8sg2OkSioCJ1XRYC
 vp5RPV6ykaH9r59fS/4Ne4s0dKLEg7HsWCQeS1tupSPrpA3fGNMcZ56doLE2N2iWUhgJ
 CROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685491382; x=1688083382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8NJTpbaQkrMxS2HcO+vhGH2r43mf2msf3vlTqsDsrs=;
 b=BL8kV+h/Nkjz0+pRmRa7eYNJy8oo8a9SAnUoQYW4irykFHLpp5PrPti/MoHQvK8O6E
 XtTAHrLQUtKRIcOkGr9XFBOcruRhgtchoO5HZr21qHFKxxmJmITciqFVSUwQ8QQUsnYZ
 v5dJCkPmKNfxtlwJH8BCQm/QNgK0jAFdbmJFbF9vceDqkw/G74wz7O7moNQ2AY/9O6Z5
 lRtqnrAuac4nhoVfpRf0hnDYDL78JQJufakUzFipe8QZVQfJK05cwBqRh8TvfUdZQ/Sf
 XaxdanToT8oFiguX+YapslG9SFfu6u/lx1+Vf6CBs3STZZYrbm75C+LoI3BhfIcYajHz
 PzYg==
X-Gm-Message-State: AC+VfDzFrXY/W6ScE4T8vnbqhgIH1Wj674cMsFcbb8L1AHqypc1vogJH
 i4OcKx0erQnX8etERyjLuwC6zg==
X-Google-Smtp-Source: ACHHUZ4csy4cdPHwFI+wHSO7+qXFUhUWtUEym1DlRU0bXVto5XpmcOoglREwyFuhg9xmS1PApDQnoQ==
X-Received: by 2002:ac2:485b:0:b0:4f3:b49b:e246 with SMTP id
 27-20020ac2485b000000b004f3b49be246mr1777043lfy.5.1685491382403; 
 Tue, 30 May 2023 17:03:02 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 d30-20020ac25ede000000b004f13eff5375sm490388lfq.45.2023.05.30.17.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 17:03:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 31 May 2023 03:02:57 +0300
Message-Id: <20230531000259.3758235-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
References: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/3] dt-bindings: display: hdmi-connector:
 add hdmi-pwr supply
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the dp-connector example and add hdmi-pwr supply to drive the 5V
pin of the HDMI connector (together with some simple glue logic possibly
attached to the connector).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/connector/hdmi-connector.yaml  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
index 83c0d008265b..3ee8f9225984 100644
--- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
@@ -36,6 +36,9 @@ properties:
     description: GPIO signal to enable DDC bus
     maxItems: 1
 
+  hdmi-pwr-supply:
+    description: Power supply for the HDMI +5V Power pin
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing HDMI signals
-- 
2.39.2

