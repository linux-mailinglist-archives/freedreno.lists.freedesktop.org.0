Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7D3661E3A
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D64410E274;
	Mon,  9 Jan 2023 05:14:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E914410E270
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:05 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m6so11244918lfj.11
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6j3S7ZfZt79laxcOO2PFYBLa/Z6A+qmxeC1KDED7sL8=;
 b=oSyQG4xjghAFe5BeNAxkXrPHviyt2PqKW+Ydrulyja+wQRiM4a2yljXPu1wpgeZNI2
 JNbmB7OxB6v9P1zX4ugqS249veH4ZksCgaWuaUX8O3vlyceDaziXumO3QZCPeUGukCqh
 LYjCQSZ8exPZaLvWl0KThLL38DK9mOEZSp0BHYiV/ksdUcPX1Xb59anr+34U82kNMOSj
 37wfYHpHeLcmyQH0w7uq3zx3UU4XHbNefRv4BwV7meqaXP2sqwYJjIbR9Ar9GTSWCQ+F
 XYm7DWgr427XkQEC/DoSZiPYfiA3JYqrQneZgAlnXyHuvDSYZADt9onIq5m/duYMggzu
 RahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6j3S7ZfZt79laxcOO2PFYBLa/Z6A+qmxeC1KDED7sL8=;
 b=a8CifCGdrBU+twat6VNAeOQHxobT7t1PezQ/AHi/MkgE7z4XWgBDmGEHq8J7uFE+pK
 /DW+LEcaAkBUb2kqPvxzqFIQS870pROQsSmSqiO0yoiwr754twn25t2/aNnwVyGNC+i4
 eSKuC2Sp7p6LF07ZLWov6O97ZB4056CeahndsztyLuayyAPmGj2AYkXvUfnCMm4c2nk3
 digH6uYuQGxmiufVgXuPTG8kUVie4jrAiAGm03YR0ULbkU0w6VomFf03Kh4XaPI6K+qq
 w28ujYMPP2vOS1V9939l64Nw7NyL7fJeCB9MK/BUveYcptjQxC129pF0xsNXwGcQNhQW
 ScYA==
X-Gm-Message-State: AFqh2koPwHcCDcDRpJausiQ65XtusaHVYS186sJAjJN29zvzGRtJSY0/
 SHTlU6G/hBjMi017g/S0SeGGxQ==
X-Google-Smtp-Source: AMrXdXu0isL5foK19ys8/rnpFm9CLtEupl4pSAdxmmS6kYIT5Rkrj89T3++VRmHu4Q/xP9vkzzEVCQ==
X-Received: by 2002:ac2:5088:0:b0:4b5:688e:ee10 with SMTP id
 f8-20020ac25088000000b004b5688eee10mr18850976lfm.16.1673241244314; 
 Sun, 08 Jan 2023 21:14:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:13:58 +0200
Message-Id: <20230109051402.317577-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/6] dt-bindings: display/msm: rename mdp nodes
 to display-controller
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the 'generic names' rule and rename mdp nodes to
display-controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-common.yaml       | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml        | 3 +++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 6 +++---
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 870158bb2aa0..3f953aa5e694 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -13,7 +13,15 @@ maintainers:
 description: |
   Common properties for QCom DPU display controller.
 
+# Do not select this by default, otherwise it is also selected for all
+# display-controller@ nodes
+select:
+  false
+
 properties:
+  $nodename:
+    pattern: '^display-controller@[0-9a-f]+$'
+
   interrupts:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 681d6ac48d33..cbe4d3597f26 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -33,6 +33,9 @@ properties:
               - qcom,sdm660-mdp5
           - const: qcom,mdp5
 
+  $nodename:
+    pattern: '^display-controller@[0-9a-f]+$'
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 47fde9b6779f..1a2f639f8a9a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -105,7 +105,7 @@ required:
   - ranges
 
 patternProperties:
-  "^mdp@[1-9a-f][0-9a-f]*$":
+  "^display-controller@[1-9a-f][0-9a-f]*$":
     type: object
     properties:
       compatible:
@@ -180,8 +180,8 @@ examples:
         #size-cells = <1>;
         ranges;
 
-        mdp@1a01000 {
-            compatible = "qcom,mdp5";
+        display-controller@1a01000 {
+            compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
             reg = <0x01a01000 0x89000>;
             reg-names = "mdp_phys";
 
-- 
2.39.0

