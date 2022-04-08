Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10B24F9E7E
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 23:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BD010E31A;
	Fri,  8 Apr 2022 21:00:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF0610E1DA
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 21:00:35 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so10978075fac.7
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 14:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f8JKuamLlG+jVMNtvAkq4wZJiZp3w7kpyzKbDeN8Fnw=;
 b=NLO9SLAPT58rbnIklDh7wm66wgY8PpYlyEhH8yN94D6RQ4oNojHPhLWkid7T60WtR8
 vmLvgJwMQMNgOTTcBFt2lNsma5aRvRim2DUeaxMORvS6fC1Lisw65k290IW7lWGmtnRo
 mxUs3O4nGCkIP7NS7IFGbrgK+cDPc11Ig2N2C8d5HggIFMcQV6BiFaOuR9l8KyubQlFO
 X/vI/47rplgg3y0SZTHhGhFf54/uhB9DKbyOPuTImDOXmqPJ7nK3W28bs1LgHM6EwHI0
 MEVssq1u8Sj79Ai+yE++qTCNUhbWG/V2Yz8hrOvHjvKXHGWXWdtU1opjzEHLsC3JOEPj
 GH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f8JKuamLlG+jVMNtvAkq4wZJiZp3w7kpyzKbDeN8Fnw=;
 b=lo3kwCy17i+MAbDc1m+hTYm450oNtA5c9KgQpALigJTVfwqHxISK7LEKIuA9KK16Qk
 fhDMJI3fIifj2fTxsq6+UWGeJAa7agvUDMD21i/zH6yQmoo4kgk3iElBghrYSNiTUrkG
 RX/gMlcSTYKAia4ydTu8uGKucjiqXPl2f+WggBM1wLhYNDTUlhLY7IxLfg13zglA0caG
 OB/ElYl0oobsA+ZLvfC1s+Qbnfty/5kbvM4oOxF8MLA5DGhVcqyZ7PkJATD0ROa9qWFD
 bUvyZ23zrkX72dIvfIQi1GH6vT/RJx9ejXgwK3y0P4PLiaqIAQk1hNxGJn9qG3kv2wpZ
 0l8Q==
X-Gm-Message-State: AOAM531ZLmoZto7m9DXgEO4DEF2k+3ya8mzKtLfhCjEBZ8qNPDus5slH
 aJxBoxzMzvlU68H2Fqhy6b1coA==
X-Google-Smtp-Source: ABdhPJyI+VIO0rEHSz94ZWi70PoGLTvBLc0XQ2Fxj6aiFvF8KexUrGX3Jl09zX+KRsIqz8mRmFwviA==
X-Received: by 2002:a05:6870:9611:b0:df:200f:a6dd with SMTP id
 d17-20020a056870961100b000df200fa6ddmr9166367oaq.299.1649451634423; 
 Fri, 08 Apr 2022 14:00:34 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm9160490oif.22.2022.04.08.14.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:00:33 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri,  8 Apr 2022 14:02:52 -0700
Message-Id: <20220408210253.581337-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add an optional reference to the MDSS_CORE reset, which when specified
can be used by the implementation to reset the hardware blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 6fb7e321f011..734d14de966d 100644
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
2.35.1

