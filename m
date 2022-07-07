Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF856AD83
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4684A11B5FA;
	Thu,  7 Jul 2022 21:32:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4952D11AFC1
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t24so33339613lfr.4
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bai7uA9Zgr1Dxz6AfyxoBBI60z5ndVSBWprohGAiax4=;
 b=qEEHXBHCgDuyEBTWfYy2HkBs5w4OvbEUbUNseSTVjgEZx+VeadXa9ccQqCkUP5WuQN
 vpn8YrRRCsnN/3nY/PloQQTMl1e7EpdqeybEIXhliof9CXdUuhPFt4IUghqQ5+xur/s6
 Tze1TgJwR5Ffx4ipVMFuyDue/h38WE5kW6HCtNu6FAQ0MdQZqpkEcogHyrDJM2lpuLfB
 4Z/t5jEiC/r+FgknJzN0CYmj25oDUfEPjnL8+2tSlCrSkYhJFPbmW4fjBWLpm5IPQyrK
 GGTaAh3scH07p4/eQXuOZq5lB9DrsLMtabWKjciA46Spa+DwfoWe2G2qcRYsnhxaZBHf
 Tyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bai7uA9Zgr1Dxz6AfyxoBBI60z5ndVSBWprohGAiax4=;
 b=2g8QCqa/JKJrSbXZZbZMRXiDDvV3DbXKVqDGhK0gFs6Qs2J1ilK0pTuXELzZyztcRZ
 sPlkdS9jy52gdhOWPFNWa0USGfU6nVwI6a+VQg1oAZo5qMesI+8wOXa6B/aIDfB0AJuP
 MuTW2KrcofD0lD8ikysEudlveDvbql5vRxNnXxSqt4UvxBbkm0JBs1EtfI9bYNFr+Uax
 P9/VSMpd/eI1RxzLqAglvw+r0D8CstHEzdiyy18a5nNTxhFk6da//ko/id9gRqqvWHwh
 Qn9tN896pvD1dBMIsYBmEnb9wIImj9nVVaErNLzuAp3EmheWiVc0YXoRtWrhoA2maZt4
 dZmQ==
X-Gm-Message-State: AJIora9+jJSPcFLcovCbBxpaw96hSheYqF4AKFcz9rN93zAaV75UbDVT
 YSU99kPEC2ZFb+dLuPVz5tPJjg==
X-Google-Smtp-Source: AGRyM1s0dJc5gcVjYEXPgUWqRTH19P4dhK1AZJwU2duhUmKpruScIAJJg7eI5CiOAKTtl2Cr0u2CCA==
X-Received: by 2002:a05:6512:234e:b0:487:8835:e92a with SMTP id
 p14-20020a056512234e00b004878835e92amr162026lfu.190.1657229528577; 
 Thu, 07 Jul 2022 14:32:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  8 Jul 2022 00:31:58 +0300
Message-Id: <20220707213204.2605816-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/9] dt-bindings: msm/dp: mark vdda supplies as
 deprecated
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
functions from eDP/DP controller") removed support for VDDA supplies
from the DP controller driver. These supplies are now handled by the eDP
or QMP PHYs. Mark these properties as deprecated and drop them from the
example.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index dde82d5f6610..75344694466f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -79,8 +79,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
-  vdda-0p9-supply: true
-  vdda-1p2-supply: true
+  vdda-0p9-supply:
+    deprecated: true
+  vdda-1p2-supply:
+    deprecated: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -143,9 +145,6 @@ examples:
 
         power-domains = <&rpmhpd SC7180_CX>;
 
-        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
-        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
-
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.35.1

