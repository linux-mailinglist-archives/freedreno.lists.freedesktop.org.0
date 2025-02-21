Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD28A3F828
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 16:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF87910EA8B;
	Fri, 21 Feb 2025 15:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rix8RGQr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650FF10EA8A
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 15:13:20 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-abb7d5a6577so26684466b.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 07:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740150799; x=1740755599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kffi9mM57RBxjp4z5FLBrRuQy7GA5fKXeHplvEZGGf4=;
 b=rix8RGQrGDtkyjesyvBhwZpHaR55mwciXJZaeiAdn991fd6Ir5aPqHIv329qfjyqGj
 DjWQZqMezLiWUZe/7M3ya1I4aff6mB9Qi4b7t+S1ulQlyAOpKsL7LyIH+GrTvYLNCmSH
 cOwjuIaCP7aYTioTEiUX2HgzZmjp4JCVPMWHpUCD2xNKSqKryBriJJdH11HP3wNxCaV5
 YkAtpIk6mG8CabQq6XkLmGkil9Mt6XAoxwU78020B75nomV8Km3/fUpQnKqRZTVdJLJy
 An7HTe0BiUG7DLkyTf6OTLyaPVqjwTJvsgNtDo+32OxRLPoNs1TCzSImvK3rcIXRPqA+
 +V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740150799; x=1740755599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kffi9mM57RBxjp4z5FLBrRuQy7GA5fKXeHplvEZGGf4=;
 b=OjAhtcWYX92Nj04o+WML0r6mk6S3CEb3EWW1imDd2FHhiyvifB0zPSgYStZ5EEtp0y
 7zu8vsWs6JbnkH5O3Q7VpuYKsBt+T6sOFMTCH6Yc1JNFVLWDbvBu1AN2CnmOdA5YDmZJ
 b4z4InEnepMl4wx+XYm2tbJDv6/tKbj3bwtevdisnlWAYJKUXo+6qmGzz6iZLfNIFqeC
 A5+M5scjz/YCSP6y8usVDY3xaJDEqbkqQb4FHns87F7cAjU76tdjaGuw5knslIpGS+GR
 WVQ6zlrlKOAEEwrxEpeKXT1TcMhJtjYipYek26eBTIlhxjPSviv35KkMBlQx5DvEUQug
 gdeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqo8ugSRJWnMyStLppnkEbbImWwX33DJ6tPSVrX9m8UaxGKjDWVp+MvdoPn/xM/u8764Ci1aIh7ac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRPmmGco9m8DS33dW+t0sMC0bHBz6K0djKWkcie/T9oFmfn8OO
 GFFO8VDn5V3Uks4RD98OC7eGNRU5gTd+5l5dudeYYf9AhGnPBZ6mKmepymcfj/0=
X-Gm-Gg: ASbGncuY8e2PY2GGOb7a3pbTyadE3kckFX1w/U/UGpFmwy/ign01PpmFmbJrf1a8B1R
 0dlJmYVkkiivn3cGtgT/IrPXJGlCug4v7sO35PkqFPy3xSyGLYWbr3eDgH2AxvMXiSoBAjJm8GQ
 NKRn1d8mtYUYBPUrdeX4/T1ryCxML4nbVDnluA/7Nz2dFZx5s49lWgKXR19oaNTbWOKBTVEXMjy
 yNwZpe5BEAR/9TDT3DIlnje0lVePwJ90DDQswa94j4a7Y6b5PjaJlJz9LfEBkgxFY8n1aeZK4zs
 WzFsdWUTcwaRsPWNTRTy/ncpDc7vsn6Fqf+ga7EnOEppM6m0gIEEQzTOpo+Ro30DWgFRK16cCG4
 =
X-Google-Smtp-Source: AGHT+IE2efORy+XnFq6iGRbNUJ79O3DLiV+WA47UQiAkKow39HzZeGH66x8Isz/Apww6BksdMEVRpw==
X-Received: by 2002:a17:907:a089:b0:aa6:9574:1728 with SMTP id
 a640c23a62f3a-abc09a0bf96mr141099466b.6.1740150798792; 
 Fri, 21 Feb 2025 07:13:18 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8ab30726sm1110640166b.153.2025.02.21.07.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:13:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: display/msm: qcom,
 sa8775p-mdss: Add missing eDP phy
Date: Fri, 21 Feb 2025 16:13:11 +0100
Message-ID: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
missing device node in the binding and extend example to silence
dtbs_check warnings like:

  sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix reg size (address/size cells =1) in the example (Rob)
---
 .../display/msm/qcom,sa8775p-mdss.yaml        | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index a90a8b3f1a9e..5fac3e266703 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -52,6 +52,13 @@ patternProperties:
         items:
           - const: qcom,sa8775p-dp
 
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sa8775p-edp-phy
+
 required:
   - compatible
 
@@ -61,6 +68,7 @@ examples:
   - |
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
     #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
     #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
@@ -158,6 +166,26 @@ examples:
             };
         };
 
+        mdss0_dp0_phy: phy@aec2a00 {
+            compatible = "qcom,sa8775p-edp-phy";
+
+            reg = <0x0aec2a00 0x200>,
+                  <0x0aec2200 0xd0>,
+                  <0x0aec2600 0xd0>,
+                  <0x0aec2000 0x1c8>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+            clock-names = "aux",
+                          "cfg_ahb";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            vdda-phy-supply = <&vreg_l1c>;
+            vdda-pll-supply = <&vreg_l4a>;
+        };
+
         displayport-controller@af54000 {
             compatible = "qcom,sa8775p-dp";
 
@@ -186,9 +214,9 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                               <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
+            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
 
-            phys = <&mdss0_edp_phy>;
+            phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
 
             operating-points-v2 = <&dp_opp_table>;
-- 
2.43.0

