Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB64C9A5F
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 02:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDCC10E93C;
	Wed,  2 Mar 2022 01:27:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D063B10E642
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 01:27:39 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso312516ooi.1
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 17:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knKff9m1SSa1i2Jf9YTF9j12Lvs6C0dJTe/yY9EehIE=;
 b=JKVAG8VNOqbdpBasGXOclZzoF4HHztXmyufblKs9S+8MzQg09t2La3l2aemOnatttM
 ruvsh9OD9Bwj47/d4GLD9VfqIsP0KKYBXYxHratz3WFOQvAykgAmjJ6n3LbzCe2l/Vi8
 LOVoXWBi7WWLZ9aijWHyAFr4j4WMbW9wn1AfT47EE+F1VKLmZSgx9+XT1nwx/Jec6JHv
 TNq+SebN8j6GNN9ySAHPQaz49P1d7sasEmZ/Jui5lKR/TummVcZioNFU92cL4j3hZCdI
 uBQAYZ9tEw76VPgUW6/UD1O7SWwy2BZfJOFS90YcMu03FR1XBhZHysMAqLcBnbzP9mSW
 98dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knKff9m1SSa1i2Jf9YTF9j12Lvs6C0dJTe/yY9EehIE=;
 b=ctOrpk5Jz71LKyphfgi5KP/2gaYJ/7bNz4rMaE8LfLBYZbuQRMM0huGmRM79JLUQZw
 gP5oHal+ptfHcCxBtdH+915ZupRrlvbJWqK0z9V30kOsAtRNPkrpM1w9uNkJ4XbHqEXX
 yxKFVi10/YjQRE4q9zJz5FTw3GclF3uPGSupEnfkgwWGN1cVZ5y95m9rgdX+fooh9eP5
 KoTUANkVMkeU/Sf3GmsHeolSH9SgrNa0mUejvhupJPbdqP6mIGEsjYftqEPsNYiKpn5s
 KJj43Tx39DpKJWcTN+ixuy7wyqS/+xR0lYyfYGIta8IRLw5Nse5IicfP8IKQH5BIzAui
 MjuQ==
X-Gm-Message-State: AOAM531v1WVa2pobQceYvRrWDffIRR8pEx0WLQcKU/A1FhcDi1M2P6mq
 7x+32rKSLCCiASxoZo/KRz/jOw==
X-Google-Smtp-Source: ABdhPJxixOFh3lm/h04oBLu7zQ0+6NPTfLFIsCxfmBOqi2YYi85+e8re5ihk2kbh5qJLy2J+D+JM8Q==
X-Received: by 2002:a05:6870:9a29:b0:d6:bba7:970f with SMTP id
 fo41-20020a0568709a2900b000d6bba7970fmr13678368oab.166.1646184459005; 
 Tue, 01 Mar 2022 17:27:39 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056871054900b000c53354f98esm6728948oal.13.2022.03.01.17.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 17:27:38 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>
Date: Tue,  1 Mar 2022 17:29:30 -0800
Message-Id: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] dt-bindings: display: msm: Add optional
 resets
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add an optional reference to the MDSS_CORE reset, which when specified
can be used by the implementation to reset the hardware blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New approach/patch

 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 8766b13f0c46..965027fe205c 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -66,6 +66,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 12a86b1ec1bc..b41991eaa454 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -65,6 +65,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index fbeb931a026e..6e417d06fc79 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -64,6 +64,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 0dca4b3d66e4..1a42491efdbc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,10 @@ properties:
 
   ranges: true
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-- 
2.33.1

