Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3570B66912A
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 09:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E125E10E9B5;
	Fri, 13 Jan 2023 08:37:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F3910E9B4
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bu8so32086546lfb.4
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vjftwjhD4kJUBhEbIXBGxN3hN3yT4gTPCKO2c+I+EQ=;
 b=Ov+CMBjcq9K8JUg//pZnc7mlcW9/B3/2qXzmx0NvvRnoe780UdUZZArlzWXkcVKbxC
 FPUtDs3b92b+pu+dxiGUHAUgH5druo5bMSihb/O0MUQGZzGluMVX8ngTmVNU3JGcqq9n
 MGn777cXnxfkVNL05NzJwxWwIFEA0frBHmOrN19A+uKf1NTxnJc2drpCDu7NJLfbi33f
 0Kq9/SdjV+Nrat74Mjz+wn/A8rdxHgoVGntR1IL7gqM3VN1BFZCTJBC3ydT+sn01QJ6j
 FRBg+F1MeIKMaMTYSr0e46TL4e5sGDZpeq11E/VnqMuNXrFpiDl3Pcmg5ZEi/8hGObx1
 FRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vjftwjhD4kJUBhEbIXBGxN3hN3yT4gTPCKO2c+I+EQ=;
 b=0r+LAo8N61uf4qWpLXVp5Aw3EWBiRSLdnaVfHxmm22fwCEw5JRYAKGRa0aTBiDL9ks
 VQY55M4PTWMb6uh5zgqlAbPx0v0FbsxeZtJ5qifnYlGG/8QLJxOF0PVtRpWoReMVOZ01
 +u2rOpLwmBW8OZxV6YvAAJwWx69Cu17RCpI2soRPONO8pwwNRF7gRcRMkXeeykeMo5NZ
 4EVV9kK5/txCdoSl8sUsUTTphm7KVXxZwaArYbZbElTacGgyp8Qvwzg11J61sP7P7+5y
 wPuaORj0+4H4u1R3JrEkSHraX0vq8koKunN7zzVLWFlAi+xj3PJ9wkMGhmUyZ437HCCf
 2JUQ==
X-Gm-Message-State: AFqh2kooMDhun1JaANlMgeD6Oq43KGhLgWHemEKHhuk7p9PnTH5Sv8l/
 95JtM/Hb10ulPWtZ/LZHUsEFgA==
X-Google-Smtp-Source: AMrXdXsv7gBk2XhBFShtLjM0EV3+ZNyVziizBg7ippowT1dR/iKA3FyF6YutZ2UW3P7gVBerA6SVoQ==
X-Received: by 2002:a05:6512:6d6:b0:4b4:9068:2c0b with SMTP id
 u22-20020a05651206d600b004b490682c0bmr32935732lff.2.1673599050084; 
 Fri, 13 Jan 2023 00:37:30 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 13 Jan 2023 10:37:14 +0200
Message-Id: <20230113083720.39224-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 05/11] dt-bindings: display/msm: rename mdp
 nodes to display-controller
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
index cb7bf48c3a58..ef461ad6ce4a 100644
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
index 6fda819f0189..7685d3406dc7 100644
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
@@ -186,8 +186,8 @@ examples:
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

