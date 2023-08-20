Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0197A781CDC
	for <lists+freedreno@lfdr.de>; Sun, 20 Aug 2023 10:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748CF10E10B;
	Sun, 20 Aug 2023 08:05:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF50410E10F
 for <freedreno@lists.freedesktop.org>; Sun, 20 Aug 2023 08:05:48 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ff8a1746e0so3422036e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 20 Aug 2023 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692518747; x=1693123547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0FBq4YTR+0Eb6sKOYr6I2bt6IPGuv4RF8Oj9v7H5bKY=;
 b=FHCJb70x6bgYq7af5DTY604C3eCpKukIc5sgg7haKJ4ua8rxdXJuvyocaw1yuQcugD
 0gDj8xVX2Cobul2yuq5N9QJs86IDZgiiAEJAzhND9QIr4a/6N8QL3GxbEKR2md8A3kIG
 8rEtxyNh7KNArT4z9Ec6c+B69BH+I7bYmKnFOjJ//SpYsWIwJnAkivpgv5vynzEy96KU
 0WsmLZDrWzgvPsc72k4ZqgUVBorcvCGQrUbnctVv2zXznuodrTaIgXV0H63DUHu1JbkE
 sabbZdDLBSVBv06/UJnd421Oi8mURK6cKtmhPpBcYpD1oIuI+ov/mdMCRbwDMXvYRsQR
 Q8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692518747; x=1693123547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0FBq4YTR+0Eb6sKOYr6I2bt6IPGuv4RF8Oj9v7H5bKY=;
 b=gspDlereFCJsOnwyryKYwEtWZIxdQJdZnalQJcBD2e0OrT9WwUzBDQLD1oj3ABoj+j
 WiigYAUpkbpz2Wgo10RZwA+kX3mf+H8a9azjid0+gJVWQAW19+R5MihAsLcv+dfKR2c1
 KD1Q3bgyxd0f5tcbjMj1FM2MOzPFludtZhUFJcnOx/s/pKB/6QaxV6uwhO3HAR1uzK8K
 iA8rsguGEeXCVooi78UiUYbDp3rTfc2rrFKINPi77DH8A6QiiV0QOIioS6r+ZMG14JAk
 9Z/bHFQX3UIXS6itZbqrUQoSNS2sDnNoOF+owYN6kco2L3IPwgOKGD7Lg8TGjeSXW1B5
 D+HA==
X-Gm-Message-State: AOJu0YyTOHEWrpTArGdvppR6OCak70k7lFaCnxMxeGSQkT4I2f8ng9N+
 SDsvj0Gpl4y6ft0lUdbXREuizQ==
X-Google-Smtp-Source: AGHT+IHVSKGunxzyjKs8EiRSL/Ef32A4iymXe6Uj4pISjyjeo+J1tZB61PFmnIeT4X7LrodP9G30VQ==
X-Received: by 2002:a05:6512:3196:b0:4f8:5d2f:902a with SMTP id
 i22-20020a056512319600b004f85d2f902amr3217400lfe.60.1692518747125; 
 Sun, 20 Aug 2023 01:05:47 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 b1-20020aa7df81000000b00528dc95ad4bsm3256338edy.95.2023.08.20.01.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 01:05:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 20 Aug 2023 10:05:43 +0200
Message-Id: <20230820080543.25204-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: display: msm/dp: restrict
 opp-table to objects
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Simple 'opp-table:true' accepts a boolean property as opp-table, so
restrict it to object to properly enforce real OPP table nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a31ec9a4179f..f12558960cd8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -80,7 +80,8 @@ properties:
 
   operating-points-v2: true
 
-  opp-table: true
+  opp-table:
+    type: object
 
   power-domains:
     maxItems: 1
-- 
2.34.1

