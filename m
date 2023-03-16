Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D36BC9E2
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 09:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D1510EC6D;
	Thu, 16 Mar 2023 08:51:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5A410EA60
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 08:51:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a32so837115ljr.9
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U+jIZB+lOj7L713dwYSMYXhpa9ZO/qMAXKk3i/Uz2ak=;
 b=zb1fzDW2I5O1rNUfE2gydP1wBIaJYKdQEHvmzxxvjF5Nh3CyuFTHZSoGyCFgfyV4hV
 eeU2n4lcwk5Ny30ZeRRz1+FNgYNcue+nmYUaOfob6DhXDE9pwXtIX0zraKeP0+pOb/uQ
 n3loVcBvmgngySunL9GLc2/H4MaNMk3s/f+Xk+IRpcsqSYSNvZsg/OGE6AzwQahKnpl+
 YAITLco3BpajTgiXjg4upMJ+RajTyAPszyoA9/VDPvGEUdAIMRlY2UOnEEx9a024nxxZ
 HjV3wJd+Q38TBGkMESLrRYwOfim2mSKibmFm9/yVq/Z2Wf4itp5u8+IfRnaiS60t4CtZ
 T4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+jIZB+lOj7L713dwYSMYXhpa9ZO/qMAXKk3i/Uz2ak=;
 b=EX+7CX6+Xtpj3jYEhDCnoE8SSEuqqnxwc3uSiFLjU3tOjIGwsc5sWKaLCtTTlo4d31
 teWNW35AUb5Q56DujtIbdcIRH68+7yMIbCmg4IpxcCm3YhPiEYcQfpo9uSWTtnv/NdnC
 saJYzKVLOsWgW2m2fgpcrJGj+ovP6Et3WTVG6kENJ8CUuabPI7/Fy8205uEnvAYjil1m
 2ks8toGrvrQQV4BP5/Ztc32hAxQlC7iWSxBGrzxs8us8molKdUuyzWzK0dNw4rsxSo0Y
 KhJZ6obyMQ9N5Yz0aJcVZd+yMxVrKT2rtJ8eovQ4X0ZdTTgWjvNvbpjo6bCKKYfPXYo6
 g8mw==
X-Gm-Message-State: AO0yUKWYoLUPIA8T5ZXqpqFibPITdcjaUY0QMcy2OZYQIWHGCVBVyhXV
 egkddgiaCZZP3InEXKr5Z9YHKcb8WAjQcTJr4GU=
X-Google-Smtp-Source: AK7set/fAtr/UAAosa5LPWjja2gKST4qxaY/VlSBcaAgWWxIHbWAn7vrd+KTN5PJ3kCa2TJqtk1l2Q==
X-Received: by 2002:a05:651c:505:b0:295:b0ed:ee8 with SMTP id
 o5-20020a05651c050500b00295b0ed0ee8mr2513288ljp.46.1678956684963; 
 Thu, 16 Mar 2023 01:51:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:51:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 16 Mar 2023 09:51:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-9-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=2355;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TH3q3Ed2aw6dX9xtVNq6VpDwcDDpJoS9emOd9LF1Zus=;
 b=7bputgfOyj/s6G7stHLz2GE2CCEIxcZYAH2PFB9jcjNmqnGD2xL5pDyWBfoKsaOMYa6o9id207J3
 BFTZno1ODpsNzWNG2uGZG/bzlWAV/D+XAokYcUu/tD4sFlzKLecO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v5 09/10] dt-bindings: display/msm:
 dsi-controller-main: Add SM6115
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add a compatible for the DSI on SM6115.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   |  2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml      | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ecc89011bec4..c8884a84e73d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -350,6 +351,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
     then:
       properties:
         clocks:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..b9f83088f370 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,13 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        oneOf:
+          - items:
+              - const: qcom,sm6115-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - description: Old binding, please don't use
+            deprecated: true
+            const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -114,7 +120,7 @@ examples:
         };
 
         dsi@5e94000 {
-            compatible = "qcom,dsi-ctrl-6g-qcm2290";
+            compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x05e94000 0x400>;
             reg-names = "dsi_ctrl";
 

-- 
2.39.2

