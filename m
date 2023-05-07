Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446226F9B4B
	for <lists+freedreno@lfdr.de>; Sun,  7 May 2023 22:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DA710E2E5;
	Sun,  7 May 2023 20:12:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B35210E028
 for <freedreno@lists.freedesktop.org>; Sun,  7 May 2023 20:12:22 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ac770a99e2so41952831fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 07 May 2023 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683490340; x=1686082340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j0oMlsF5SDEEhMdl19tTEuihoDClf/oQeFjFMxkZlVw=;
 b=Nujs+2jVtS4Fi7A+d9silFA5mT0hVc+aJooQZeBH56r0NWGqw/nK7f/sjW/zVXhEpj
 /ROAtdzIPNoCCOwhZX/Mam96PCUpV8Yu5q/SGa8uai5d0RhnVNX/563mIaV/lXXUN3PM
 6xULqnez+2wmw5+0h/4A4QbZFQOeihgnO5wUG4b2WkHC0lw4bbrVflH61+lQznBj2fsS
 JI7xSoHkj7Bhx5VzxHEz0D+uMRzGhj4L7OJVhPbWY5HvMSQqVHVyGaSFPyMIgtdyLn4G
 klMqddp/TZT+7ik7OkfSk93z0kEugZgK/1ZsWgZa/e9d7YITuwodAgFfcF8HFA9kP1sn
 dleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683490340; x=1686082340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j0oMlsF5SDEEhMdl19tTEuihoDClf/oQeFjFMxkZlVw=;
 b=Dt3CcaytYJdiLfnyDazLxrQDCuTguW9RodRTWueA2l6SKvDcECKoAgBOrJw4f6lVi+
 M3NPkXIbFuZdhhjugVx/a/Ghzqxfga929bwdC0eOZD1BTcCJPxFmTahz1zzkXTvdqZwn
 6HeRFNIpLWufe5LLdgriOHPJgzwPQf9uSK95yct28CWo2Frs/MwOTZ66R3x+EGjK7rbt
 XVVegyw92t3/RMaEAU7PzsQw1aC99z7E7nhYlAA8uq67WVaiGrkrRuqtcz0NbT9AtNin
 OfShTcwoMb1E9ZEu6f6ZMjJskR4BGIKUEQaw2iXUbui69NPQEZJ5awFlRtkVLIUf1S5v
 Oz/w==
X-Gm-Message-State: AC+VfDzk4VIrywWIqeGIfXjAzKgwI2AjReCCn4FSOKqUw3Y7ZbMa30Ct
 Q4ZJLqZjYfIgE59OxDFi9qfffw==
X-Google-Smtp-Source: ACHHUZ4r+iKmYkjdqdIeo1Qb6z/OceIsCUnTkyWhYC/0f4Xy5LlxAS/aaMJKPowEHPW3ounu1CxBmg==
X-Received: by 2002:a2e:9e0f:0:b0:2ac:78b0:8aef with SMTP id
 e15-20020a2e9e0f000000b002ac78b08aefmr2034252ljk.16.1683490340263; 
 Sun, 07 May 2023 13:12:20 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f5-20020a2e3805000000b002ac74f5f022sm916522lja.0.2023.05.07.13.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:12:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun,  7 May 2023 23:12:16 +0300
Message-Id: <20230507201218.2339014-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
References: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/3] dt-bindings: display: hdmi-connector: add
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
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the dp-connector example and add hdmi-pwr supply to drive the 5V
pin of the HDMI connector (together with some simple glue logic possibly
attached to the connector).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/connector/hdmi-connector.yaml  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
index 83c0d008265b..94f75359c6ff 100644
--- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
@@ -36,6 +36,9 @@ properties:
     description: GPIO signal to enable DDC bus
     maxItems: 1
 
+  hdmi-pwr-supply:
+    description: Power supply for the HDMI 5v pin connector
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing HDMI signals
-- 
2.39.2

