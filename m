Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E71565BE0
	for <lists+freedreno@lfdr.de>; Mon,  4 Jul 2022 18:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA65A10F8B2;
	Mon,  4 Jul 2022 16:16:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E72010E1B1
 for <freedreno@lists.freedesktop.org>; Mon,  4 Jul 2022 16:11:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e12so16525098lfr.6
 for <freedreno@lists.freedesktop.org>; Mon, 04 Jul 2022 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=33SMaLh1eoDBAxmhXTjcVQWnyDJ3mzNy1PP5WaC9dV8=;
 b=rspOa5EajZPOfNl0ESTchvhQgYhmUu8/ueOoPO44oe2+2Wog+oNj1fpANVwPGESYrF
 5XvBIRqQLRYgoJfdxt/vk4TpyHZd/ZEG3sxCaKFGtFfeS7whXyDPggGmA71CDY9s6915
 2IXUgtBd9BuBTr7dW+Vb0erOlBGKLD9G+mUSlioCNwkwLtOpcyOPF/h2BL/lC0s1St6n
 xSs7vPhyOP4B4CEwjE8N+BvQHR3TqjV/3JDffKSzfuBG2SCG/3t7D65UOJLTD/pdI1dC
 7/DNB/IFANuvTq/u4p1D+IxF+djQM0Lg8QSBwGoja6RbCIA6rpxflr5DfuZTRdhECOd0
 lwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=33SMaLh1eoDBAxmhXTjcVQWnyDJ3mzNy1PP5WaC9dV8=;
 b=F0OyBIbmIMozND/W2z3DHQgLSqmL4AEMsL4z/BiIXE/LPJnheVi0kefIaibv+g3fcB
 AStNrpLCyg+hnUSEiF2r45Q65rS4y2i+PHmgwPUr9u48YGVtnProhxvqxr14FOk2SRvs
 rtIf3UV/b99P/Y2ezMnwIhOLdeC8Bdy7hmJuGJ5yaqPOaTgvmjaRP8FQiCiw1dtYJOxC
 McRODaq2rWPOZpmegVADariRkzGi0um7xj/y4G/UMQPPIcxIWzFFzD1+0IzNYWdLYDkh
 f05oaPkx3PqIL3plGhMVAVg6pmcb7rFxpDP57ghoH6y7Hbn4eMQrNvc9IFVyt+Yzz6it
 yG7g==
X-Gm-Message-State: AJIora9XhyfGn7bXDvY5UVxzKN5OSUW2aHFQ/tV4aaxOsCk8yzUKU+ah
 TN5Vl72fX1dTgBvSWituRwyoBg==
X-Google-Smtp-Source: AGRyM1tME+0Mf2I5nShZjoogNnmb77dv/j/FemxX3GyQsTed1mGiCD2xsSlfShkpWOGQKuQxOnKESQ==
X-Received: by 2002:a05:6512:3b9d:b0:47f:7712:3ece with SMTP id
 g29-20020a0565123b9d00b0047f77123ecemr18483411lfv.127.1656951110999; 
 Mon, 04 Jul 2022 09:11:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 bj16-20020a2eaa90000000b0025d254180d7sm381273ljb.113.2022.07.04.09.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:11:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  4 Jul 2022 19:11:46 +0300
Message-Id: <20220704161148.814510-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/3] dt-bindings: phy: qcom,
 hdmi-phy-qmp: add clock-cells and XO clock
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As the QMP HDMI PHY is a clock provider, add constant #clock-cells
property. For the compatibility with older DTs the property is not
marked as required. Also add the XO clock to the list of the clocks used
by the driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml           | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index eea2e02678ed..83fe4b39b56f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -28,12 +28,15 @@ properties:
       - const: hdmi_phy
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: iface
       - const: ref
+      - const: xo
 
   power-domains:
     maxItems: 1
@@ -44,6 +47,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -75,9 +81,12 @@ examples:
                   "hdmi_phy";
 
       clocks = <&mmcc 116>,
-               <&gcc 214>;
+               <&gcc 214>,
+               <&xo_board>;
       clock-names = "iface",
-                    "ref";
+                    "ref",
+                    "xo";
+      #clock-cells = <0>;
       #phy-cells = <0>;
 
       vddio-supply = <&vreg_l12a_1p8>;
-- 
2.35.1

