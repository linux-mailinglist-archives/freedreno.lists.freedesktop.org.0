Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7F6389FA
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C29910E754;
	Fri, 25 Nov 2022 12:36:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECC910E0FC
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n7so6546656wrr.13
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Pnrz7CxvZ7ybVJUgqP8hjKP0Ck4G3JBOu5Z9AIGH0A=;
 b=dHM95RVf8Kp4A/apgk/MWwQp6R+YbnOnEAmCvABDPmlzxiqk8/9n7uXYDq+Ar8Ycr9
 w6/F4Bt9OVmLhNBAxc3x1y5VUH5l7gAWYT9gv7RTnXYOrfdVhBkShekyZ0r+lGtFPeqw
 DZoXjj9jR42aSsjs/SO6pOGsihrJ4yjYUHKRWsKmu/fU18bdBPKURrF6eG3BbPFV6k9P
 kg0BJYNe/HK8MJQfx/ArzthPELMAtfwpgilBN0emrXP3TWeiC85RGtp4l7w7tnsGQJvf
 NijQ9yVYAfwlgT8Zm9343zHeBtyQCsmglYBvB41Z+FmJXrbw7Jz56YFvTUkIbvay/D7u
 xCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Pnrz7CxvZ7ybVJUgqP8hjKP0Ck4G3JBOu5Z9AIGH0A=;
 b=f3GqyB41B4K3S6upR7uVFdTvxEGeF0sC/FJDnpsywDssJj4Rv4K2iGOSO3Bx2XzOjs
 2lNXB2eJTlaRTt3S0ZgnUB9tgwrtsxQfqmbiMhdZxMXNiJIMCadIWn6pJzYJEHiQf86N
 4FBLdVgfxABDQk488QwuOlXV4oApuP8CEd+g4bMOsBsr4dC7WcqwPQ0yHX3tE3n4ZYjr
 ScqNSy3D/t1NQYnqO6Hn9opsppIF5jFhc4j8G7z6EXogZpZXNVL+EILJvKxf1/cwoS0Z
 LyZqa4WlQrNc+A1uhPlSjQMM7TOqTFnAmUxUwMcY+ZC/A/uYfFoveMipi+12dEzQtm3C
 OCnA==
X-Gm-Message-State: ANoB5pmE61mpdaHTZ0GKTte8efvzcRfZ3yfDRC/Dl1IEiGdgNvIkG/f6
 jDKHqwp8UjmFH7C+rkT/ZjNKJg==
X-Google-Smtp-Source: AA0mqf5jEIWQ0kAcydCway3qTPrOv5zzpx1ZK6MFfNmBVZGYF1WZRXqwktgAeq76VoRbVnIoDiUDiQ==
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id
 c12-20020adffb4c000000b002365270735emr12330288wrs.659.1669379806496; 
 Fri, 25 Nov 2022 04:36:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:24 +0000
Message-Id: <20221125123638.823261-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 04/18] dt-bindings: msm: dsi-controller-main:
 Add compatible strings for every current SoC
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Currently we do not differentiate between the various users of the
qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
compatible string but, the hardware does have some significant differences
in the number of clocks.

To facilitate documenting the clocks add the following compatible strings

- qcom,apq8064-dsi-ctrl
- qcom,msm8916-dsi-ctrl
- qcom,msm8974-dsi-ctrl
- qcom,msm8996-dsi-ctrl
- qcom,sc7180-dsi-ctrl
- qcom,sc7280-dsi-ctrl
- qcom,sdm630-dsi-ctrl
- qcom,sdm660-dsi-ctrl
- qcom,sdm845-dsi-ctrl
- qcom,sm8250-dsi-ctrl

Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 67d08dc338925..0cd2079137b02 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,9 +14,20 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,mdss-dsi-ctrl
-      - qcom,qcm2290-dsi-ctrl
+    items:
+      - enum:
+          - qcom,apq8064-dsi-ctrl
+          - qcom,msm8916-dsi-ctrl
+          - qcom,msm8974-dsi-ctrl
+          - qcom,msm8996-dsi-ctrl
+          - qcom,qcm2290-dsi-ctrl
+          - qcom,sc7180-dsi-ctrl
+          - qcom,sc7280-dsi-ctrl
+          - qcom,sdm630-dsi-ctrl
+          - qcom,sdm660-dsi-ctrl
+          - qcom,sdm845-dsi-ctrl
+          - qcom,sm8250-dsi-ctrl
+      - const: qcom,mdss-dsi-ctrl
 
   reg:
     maxItems: 1
@@ -146,7 +157,7 @@ examples:
      #include <dt-bindings/power/qcom-rpmpd.h>
 
      dsi@ae94000 {
-           compatible = "qcom,mdss-dsi-ctrl";
+           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
            reg = <0x0ae94000 0x400>;
            reg-names = "dsi_ctrl";
 
-- 
2.38.1

