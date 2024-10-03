Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AA98EB33
	for <lists+freedreno@lfdr.de>; Thu,  3 Oct 2024 10:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE0710E7D8;
	Thu,  3 Oct 2024 08:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iSIYFYhO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA6610E7D7
 for <freedreno@lists.freedesktop.org>; Thu,  3 Oct 2024 08:14:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42e6dbc8c7dso1123865e9.1
 for <freedreno@lists.freedesktop.org>; Thu, 03 Oct 2024 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727943279; x=1728548079; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1rwyEFJ4idpDb4iBRYg6Jk2ZQkdCcSf0YAokuJ1SzVA=;
 b=iSIYFYhOjN7MLu0c87qPRsGctfOfIB5XNla+g+on+r5RVTqDyMvZ9MzCLxduguclXw
 4wJJr5c1i/rxtwBkLawXMGvGiQRXTs4GaPuTD7AK0GqLTPlpGQ2NsPPvgmRlJ9giVYUh
 KK4D7fbPZqsRA2dYqO8XscD6gB7836lfikmdoEOs5R3g0OGSsY+wR+s6Dmeek20bCeUs
 mtCR9IMaCNBmvwjZ4I9sZyXW73ANljPtOnRcfKjqTtGGiM0y/ozq7A9q4BSYeXJ0OsxT
 Y+EbcCtYR6qQskXs2cUOZ6YGt3c8BBjy10I68jwYqOSWYaydoKsNuT97Dh5QXSL533/d
 qeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727943279; x=1728548079;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rwyEFJ4idpDb4iBRYg6Jk2ZQkdCcSf0YAokuJ1SzVA=;
 b=kpWujirve5qQuCmsA75QOADO46t9fSO8eV83nvOdZkDwcXBZOSjfAKDz6u/W40+ksI
 bMI8mg01Mlc/8LqfydsUemHqsilUhu2PLtw86+rC8r1LG5PoCT1wwdZsLE7f3blPEQpw
 qXd8VXiUo8WGluMlpqZKzVgGtk3YdoaH1gy6D/z4Yh7Z13TrYzRB8gwLADql92Y2gjXh
 k5l393pT9GLggKC+NG5kLa5JfROdGfjlPWUk7a1uEkFeB/MatPT4X4Il6hGBNKOPnwW8
 HXtQqIf8EUymIoAKoxzZw3QdUANcn6zTjifVERxF75OIRAb56hygc+peZvQOiC23ECds
 Cdzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2xx/6lC1d2ChRx5clv6AszAFoSxNPXI4p5EuuLTsMMGIK1hOSa3sK5uCxhBfc6OLCqB4oKCNscDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmYN6ugon2tOeaob4I8tw1dSpCrBCY+CkJzsZlKzyovkGD0IeL
 wY/kKFzX3lPPuIRGMHH7kvTOeEuIw3KKg4PZCyLhsQS/v4FETuV6khLCKtV8FNU=
X-Google-Smtp-Source: AGHT+IGM0q7njLtYkyHsjlENSHcXM/bNjMhqikyJ3G8Gq5rle1uFsdl97+lU80Xh3CPM0h4uTp3hpA==
X-Received: by 2002:a05:600c:1897:b0:42c:aeee:da86 with SMTP id
 5b1f17b1804b1-42f77d30905mr19803775e9.8.1727943279187; 
 Thu, 03 Oct 2024 01:14:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082d230dsm702027f8f.94.2024.10.03.01.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 01:14:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 03 Oct 2024 10:14:22 +0200
Subject: [PATCH 5/5] dt-bindings: display/msm: merge SM8550 DPU into SC7280
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-dt-binding-display-msm-merge-v1-5-91ab08fc76a2@linaro.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5278;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=519873eizrz1N27nvT3FmdiGwc5SoCwK9tJ1LGTJkmw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm/lJjJVqi58VnNZDpSmxF/yPjCq9ttq1x7JffO
 wwQ5dtGGliJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZv5SYwAKCRDBN2bmhouD
 176aD/4oATjZ3tdEJbCuEHszRygOjNaFfffil0utMA5XmiPMerjNs/BIIOcOH66nbj4ddfmYdUA
 0E4vrdl3vSqyfS5V9JU14ebXyzspUgYv7Oo99XyI8vOFm+uOzlYvKBBjLOiRFykamVpRrAcP/rg
 j+FitluwEgTVQOFoG0HsrDnFtqWy+WuvUeVq0MttvA+2hZUMWCKQbBMpRKUg01Pbv6TGQv3EBSu
 qQStf0fz3iuwvjCEh0FXTS65QEp0csClhCfeGXLzz1KVjvLT+6szIwzFcURy/ZOUJRlHa36MYvm
 mR0xjRSYkt/SZWLyFCKEH0No4KEZNi7Hto1t1T44/pk0xAIRRTs5kv3fRxZUXumzs88SpchJBJp
 08UVEAmS4hj2tcR2HZUlQNDFcxD3+neEoEPHs4wPqdpGq//uUtFbmRFaeMBBPrS7uKko/M6odnd
 IStITPXnIEPR3fL8rxiT2loTBwUL8eI4PiZRAVCFSGkyMI1bkHKV9xATWxeMc+ehzHqoXa2ONz9
 oizmEDr8zkm20TWXT4f5v7RU5wm5SATYTOvZUv2lILuIg/QiK1O88JCfcQDVg35HCxtGjUQjCtX
 lFbeQKiFqjWfoDDI4rNSOBB05D7+COA7Je1v0lnY332TmB3UVCEAG7exTZ1ApvZdgcOzF5JQ5MU
 G6kFNAERUhheIbw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Split of the bindings was artificial and not helping - we end up with
multiple binding files for very similar devices thus increasing the
chances of using different order of reg and clocks entries.

Unify DPU bindings of SC7280 and SM8550, because they are the same.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   2 +
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 133 ---------------------
 2 files changed, 2 insertions(+), 133 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 750230839fc9..6902795b4e2c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -8,6 +8,7 @@ title: Qualcomm Display DPU on SC7280
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
+  - Neil Armstrong <neil.armstrong@linaro.org>
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
@@ -20,6 +21,7 @@ properties:
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu
       - qcom,sm8450-dpu
+      - qcom,sm8550-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
deleted file mode 100644
index 16a541fca66f..000000000000
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
+++ /dev/null
@@ -1,133 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/qcom,sm8550-dpu.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SM8550 Display DPU
-
-maintainers:
-  - Neil Armstrong <neil.armstrong@linaro.org>
-
-$ref: /schemas/display/msm/dpu-common.yaml#
-
-properties:
-  compatible:
-    const: qcom,sm8550-dpu
-
-  reg:
-    items:
-      - description: Address offset and size for mdp register set
-      - description: Address offset and size for vbif register set
-
-  reg-names:
-    items:
-      - const: mdp
-      - const: vbif
-
-  clocks:
-    items:
-      - description: Display AHB
-      - description: Display hf axi
-      - description: Display MDSS ahb
-      - description: Display lut
-      - description: Display core
-      - description: Display vsync
-
-  clock-names:
-    items:
-      - const: bus
-      - const: nrt_bus
-      - const: iface
-      - const: lut
-      - const: core
-      - const: vsync
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - clock-names
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
-    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/power/qcom,rpmhpd.h>
-
-    display-controller@ae01000 {
-        compatible = "qcom,sm8550-dpu";
-        reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
-        reg-names = "mdp", "vbif";
-
-        clocks = <&gcc GCC_DISP_AHB_CLK>,
-                <&gcc GCC_DISP_HF_AXI_CLK>,
-                <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
-                <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        clock-names = "bus",
-                      "nrt_bus",
-                      "iface",
-                      "lut",
-                      "core",
-                      "vsync";
-
-        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        assigned-clock-rates = <19200000>;
-
-        operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd RPMHPD_MMCX>;
-
-        interrupt-parent = <&mdss>;
-        interrupts = <0>;
-
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            port@0 {
-                reg = <0>;
-                dpu_intf1_out: endpoint {
-                    remote-endpoint = <&dsi0_in>;
-                };
-            };
-
-            port@1 {
-                reg = <1>;
-                dpu_intf2_out: endpoint {
-                    remote-endpoint = <&dsi1_in>;
-                };
-            };
-        };
-
-        mdp_opp_table: opp-table {
-            compatible = "operating-points-v2";
-
-            opp-200000000 {
-                opp-hz = /bits/ 64 <200000000>;
-                required-opps = <&rpmhpd_opp_low_svs>;
-            };
-
-            opp-325000000 {
-                opp-hz = /bits/ 64 <325000000>;
-                required-opps = <&rpmhpd_opp_svs>;
-            };
-
-            opp-375000000 {
-                opp-hz = /bits/ 64 <375000000>;
-                required-opps = <&rpmhpd_opp_svs_l1>;
-            };
-
-            opp-514000000 {
-                opp-hz = /bits/ 64 <514000000>;
-                required-opps = <&rpmhpd_opp_nom>;
-            };
-        };
-    };
-...

-- 
2.43.0

