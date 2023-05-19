Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA35709F2D
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 20:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C625610E607;
	Fri, 19 May 2023 18:40:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A2C10E600
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 18:40:27 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af29e51722so4760501fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684521625; x=1687113625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8NJTpbaQkrMxS2HcO+vhGH2r43mf2msf3vlTqsDsrs=;
 b=w96081i/Sr0UNRO05ZM8yBIa714IRprJfTI2+2T1hTsUcPNYRrjKxfbiWlMhk3Bze4
 wmilfOPhv7Z290X0rQqVh9F+w71TGwCilVdHH1ILY9TJ36RYNfwDmIH2S7FffCzHGGlE
 zAyt8+ssopYeoXyxABNbZp9QNrEbDUpz81SCJzp+3zG1++wJBUCqavKQ1+sjJk7XJCHK
 jrg0cb0g3N+jJdbaTrH0SW4L8aduzO2jAV7uRip+rpQTqlFjrSkuSUNyWvAIPM8WPZyH
 uOoTSqSi0g5Zm+xkyeetSjQX3pat6Kqii7BPXS83gcuMMu3u0sQQAIN+g8AFJ6SWxtEU
 RPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684521625; x=1687113625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8NJTpbaQkrMxS2HcO+vhGH2r43mf2msf3vlTqsDsrs=;
 b=KC8UZTmsmfmSRqJuEqZw2MDBGMqzA77RJzach2p6IvQ9CR9gYROgUIem0BNs4gDsdF
 vz5LVzvMgBGd8KL9Jn1GUqp+0OZapR4YS6FSxcq1Z1yKxx1JLXmiOaTi1Dw8G4MQieOj
 7N0Nb65vuiVM97cW27ZBHGxBDveckuwJ0t6lNYSxah8Udm/OUvBSwOCHcTDDZWGb5KON
 y+qEa4gDS999g/cr1eP8w2mu4Ij36VGiw5pbU1x7zhN7MONOlfXTiINsPrWN142fTtpb
 DQ3ISehYgf5cKeq3nDGW2m37r3/bxz502WFqeNOgp9b/80tmvqiOQHYHbc3Yxr2GdBnw
 CzNg==
X-Gm-Message-State: AC+VfDxmnZzy/6P3cYoMZZipsqr6HjD9WH7mnpwfEnIKztfaNyPMqW90
 mQ/1DopTGkSyCBoXvrll0ZX9Kw==
X-Google-Smtp-Source: ACHHUZ4f62Y0UoZLVYtNqHXRT/v14mYuJUtSH+wU3eLo3ZCW15UhZ5VkvHxoDO4OBra/hdi/wEGMzg==
X-Received: by 2002:a2e:b209:0:b0:2a7:96bd:9eb3 with SMTP id
 l9-20020a2eb209000000b002a796bd9eb3mr1073425ljm.3.1684521625511; 
 Fri, 19 May 2023 11:40:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002ab59a09d75sm932493ljj.120.2023.05.19.11.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:40:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Fri, 19 May 2023 21:40:21 +0300
Message-Id: <20230519184023.3943362-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
References: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/3] dt-bindings: display: hdmi-connector:
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
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
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

