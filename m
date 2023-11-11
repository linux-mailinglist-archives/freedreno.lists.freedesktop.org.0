Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4047E8B2D
	for <lists+freedreno@lfdr.de>; Sat, 11 Nov 2023 15:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846F10E28F;
	Sat, 11 Nov 2023 14:20:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8356210E0A2
 for <freedreno@lists.freedesktop.org>; Sat, 11 Nov 2023 14:20:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9dbb3e0ff65so442236266b.1
 for <freedreno@lists.freedesktop.org>; Sat, 11 Nov 2023 06:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699712421; x=1700317221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D+rGHu4+hJGBcXxtLJ4Rwqvl52gGeDFd9pbxtP6MGM4=;
 b=oohAEha369MBHuQvh7J6mUK855D+y2NJAQMcIdd2rNrwQ/zNwntNbcRm/M4fhfgBE0
 YPT5mjxNZ/kEJ2HE7pGoSfckpwelKnClHzHJ6Q49vVm4lySlzVWCaDOCdY3T/sXJl8Xm
 ukzcVD4PoqFcBFj375vmG1cA8YSD8ATRYBCVs9bsu/LKUGHj809SjWs7Bz93CFW3zYTq
 GdY57/NA7ftfjgj+bs5Xho4Pi2QSNgEvjcu9HrZEp114rqqErJFPnxhqjWwlS78Fjovh
 8mCdAPgA2Che0ruTlF1BeovvTLKxaATAdHZt+ZJkqS3D96DYdIPc9Uxg2NIYHbhccxL0
 VsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699712421; x=1700317221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+rGHu4+hJGBcXxtLJ4Rwqvl52gGeDFd9pbxtP6MGM4=;
 b=E+damxzu70IRlkLZEEnu0POnJV0etFTpqyhQRunvDcj8mSDfrzcbpYaGKQOZ/CZeup
 qMEuiFtZwCLBSxNX8UT+D3DZJ+FXGnUp887nrNZS1ffdp+2pkJwZXUVvt+2Fjo3UhOEi
 YLdAo97Mq3xUKPV4JUGkDPSN3ji50aUmamGMqMzMgPX4cyCz5L+x5/9M53sHwglj+Jah
 b0KjCYaJ7X1hm3Yxj6bvMOA8OoyzBQE0F9XmsFMDswgl2y6R1C8obd6smRjhZgaqeg/F
 UNw3c5nPO4K4wTf7o4mj9G0Gch0dMVGA+pNoO9qBcv+eBk9qjzXlot/oNR5LSjiKu06S
 voww==
X-Gm-Message-State: AOJu0YwOR1Q9eColmrgzeuAenfxTqHbHJQxvrbZpRswyW2pQS3Ao5xPu
 +Ph57wq2cXeJt4XjCQVPmeXLNQ==
X-Google-Smtp-Source: AGHT+IECfXbaxOyC0p84OSUFRchWp6f0l4rtPfq/72J6ycLCYhXwSvjyroaayvZVZLq2Q1VBC7meaw==
X-Received: by 2002:a17:906:b30d:b0:9bf:4915:22c4 with SMTP id
 n13-20020a170906b30d00b009bf491522c4mr1123508ejz.67.1699712420937; 
 Sat, 11 Nov 2023 06:20:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 gl11-20020a170906e0cb00b009b9aa8fffdasm1136125ejb.131.2023.11.11.06.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 06:20:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 11 Nov 2023 15:20:17 +0100
Message-Id: <20231111142017.51922-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: display/msm: qcom,
 sm8150-mdss: correct DSI PHY compatible
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

Qualcomm SM8150 MDSS comes with a bit different 7nm DSI PHY with its own
compatible.  DTS already use it:

  sa8155p-adp.dtb: display-subsystem@ae00000: phy@ae94400:compatible:0: 'qcom,dsi-phy-7nm' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index a2a8be7f64a9..c0d6a4fdff97 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -69,7 +69,7 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,dsi-phy-7nm
+        const: qcom,dsi-phy-7nm-8150
 
 unevaluatedProperties: false
 
@@ -247,7 +247,7 @@ examples:
         };
 
         dsi0_phy: phy@ae94400 {
-            compatible = "qcom,dsi-phy-7nm";
+            compatible = "qcom,dsi-phy-7nm-8150";
             reg = <0x0ae94400 0x200>,
                   <0x0ae94600 0x280>,
                   <0x0ae94900 0x260>;
@@ -318,7 +318,7 @@ examples:
         };
 
         dsi1_phy: phy@ae96400 {
-            compatible = "qcom,dsi-phy-7nm";
+            compatible = "qcom,dsi-phy-7nm-8150";
             reg = <0x0ae96400 0x200>,
                   <0x0ae96600 0x280>,
                   <0x0ae96900 0x260>;
-- 
2.34.1

