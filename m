Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D386A07FA
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 13:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C249310E2F0;
	Thu, 23 Feb 2023 12:06:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F0610E1F9
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:49 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id z42so2882925ljq.13
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7GfFVek+ElBU/x4Gj7bclUI24uP1/zbAkUCH7g+3I3E=;
 b=SFzlXW25c2p4gmoVDowFXTsP5M8MKa9SLmR9b6XVCY+h18lAKnP8yoYhiEZ0+jdxXo
 RO+5/lzqt4SUkwxXvwRV3Yx4FoS48uKXXeqKv4cuVg5pO91p8hHIN+jLA9wlnWMHsgXC
 R/Gm0Ev8ftdKzILltKVZlw3gvE4RTsmDwRlhvwSzjRUXj/Ydih6ZG4fQpToXwpnSwnd6
 k9nxQHFzkYI6FcohI0E5yzAXuKWRK2KerIvUDB3jW44Rtm87LO4hNhSLmxl/m7wLsxa+
 lmpjA2lfRabtij/IW2dEzn0J9K2WsQSvlXsCNAhSiW83Wn3o8xK8aM6NDu9ajLNZWgVP
 kwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GfFVek+ElBU/x4Gj7bclUI24uP1/zbAkUCH7g+3I3E=;
 b=hqX/+aJy8/3RuJwi7lzviQ7bsM+8/6hvlq8Mw0EVxMiHq96grV9SlamUinkxDX5py1
 UJA2rOhvr9GeKaMkhgKTccuBhSzfYGusS3fdgsHW+7OsiQo5P7eTyGU+6NalZy1fdwV1
 EuJjmsh3Sje5TJ0q581gsDeg8+Y58CACOe38Hw+mb8YF5SIqskGwFT8M8Racm3I3tBmS
 m9HbPxbqbnFI60xgZ5JaUfzEsLNBXTuZ4BD68JjMRZvVEv8IOsD1Q+hh3aX8Hh58HUSK
 2tga3Ff0LoIqn9nhaaQRnpyLxNqE86/v+9Mcsjwlv3lD5vFpHgw9AZQdjA6Q0yxk+knZ
 k/9A==
X-Gm-Message-State: AO0yUKWGywkMlu8CjHrhX4PPn5XTwmUb5SehVxhmdPgGtUlrF+Th9kkS
 C3TRusTWwTdVKzOMmHN69EtUFQ==
X-Google-Smtp-Source: AK7set/R8hp0OHle8W9yidCEv0lkrsZraNX5wicXprVVmMdsiLMN7wglCaVXpAb3H22Bb1WLOAP1KA==
X-Received: by 2002:a2e:a408:0:b0:293:4e57:2bd4 with SMTP id
 p8-20020a2ea408000000b002934e572bd4mr4273974ljn.8.1677154007553; 
 Thu, 23 Feb 2023 04:06:47 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:47 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-2-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=2667;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jy8JJ/4jpW1OOt7PFexguPcdOFWIzV/3CRPopFhMDDQ=;
 b=dRvrwjzYmrX1k0lskf2jeL30yaDbqDq+7qdA9yECMw94dbVSOYzqxXXt3wtV3xaxyycXAe7tcqkV
 pt9s2rj4A+e0HjnTBfiV51jBmIDjMDD6C9/u0io1VJ3L6Qlr3dC1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 02/15] dt-bindings: display/msm/gmu: Add GMU
 wrapper
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

GMU wrapper is essentially a register space within the GPU, which
Linux sees as a dumbed-down regular GMU: there's no clocks,
interrupts, multiple regs, iommus and OPP. Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 49 ++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab14e81cb050..021373e686e1 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -19,16 +19,18 @@ description: |
 
 properties:
   compatible:
-    items:
-      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
-      - const: qcom,adreno-gmu
+    oneOf:
+      - items:
+          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
+          - const: qcom,adreno-gmu
+      - const: qcom,adreno-gmu-wrapper
 
   reg:
-    minItems: 3
+    minItems: 1
     maxItems: 4
 
   reg-names:
-    minItems: 3
+    minItems: 1
     maxItems: 4
 
   clocks:
@@ -44,7 +46,6 @@ properties:
       - description: GMU HFI interrupt
       - description: GMU interrupt
 
-
   interrupt-names:
     items:
       - const: hfi
@@ -72,14 +73,8 @@ required:
   - compatible
   - reg
   - reg-names
-  - clocks
-  - clock-names
-  - interrupts
-  - interrupt-names
   - power-domains
   - power-domain-names
-  - iommus
-  - operating-points-v2
 
 additionalProperties: false
 
@@ -216,6 +211,27 @@ allOf:
             - const: cxo
             - const: axi
             - const: memnoc
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-wrapper
+    then:
+      properties:
+        reg:
+          items:
+            - description: GMU wrapper register space
+        reg-names:
+          items:
+            - const: gmu
+    else:
+      required:
+        - clocks
+        - clock-names
+        - interrupts
+        - interrupt-names
+        - iommus
+        - operating-points-v2
 
 examples:
   - |
@@ -249,3 +265,12 @@ examples:
         iommus = <&adreno_smmu 5>;
         operating-points-v2 = <&gmu_opp_table>;
     };
+
+    gmu_wrapper: gmu@596a000 {
+        compatible = "qcom,adreno-gmu-wrapper";
+        reg = <0x0596a000 0x30000>;
+        reg-names = "gmu";
+        power-domains = <&gpucc GPU_CX_GDSC>,
+                        <&gpucc GPU_GX_GDSC>;
+        power-domain-names = "cx", "gx";
+    };

-- 
2.39.2

