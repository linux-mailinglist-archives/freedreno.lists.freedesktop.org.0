Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC4561EF8
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 17:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D1010F5DE;
	Thu, 30 Jun 2022 15:17:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1393011A2A4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:57 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so1534485wmb.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkO7+eWy2ajU0U0Nw4Lp72hNN32+JTLNsyjuRV2jhBU=;
 b=sK0CAukDTWACoQtJfMyFzJ3PG/JOH8MqpXMYQA/NMqS86Ozt6beCfW1ean69vMDTvY
 QrbAxJeq1oyQxXSwPABP7oL8PC9MeyrLHeCjkwWSjpgy6KdjVMxdAtaqsxsCSN4Uu+hT
 Ss/3czz6km3T2Erk4XxuX7WajyqSDY8FAFaPRAde5utsskpye+gmtb/5g3K+satVmjER
 HubKyT5l6SomqJmaet0ez70gvmJuoW3hJyVaRRsrulfPVR0OIW9NXsquZ6nklkF52eFT
 9IHDVJRfKySd+w+nW+YxBAXl8imBpVgyCB83i9jn4fM18rmXJjgN4bfraI5J2b48UJ3Q
 gaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkO7+eWy2ajU0U0Nw4Lp72hNN32+JTLNsyjuRV2jhBU=;
 b=Wtv9g0nROfAmIKzEhe7bkNnBguGygLQ3IozCNiBqg8RKxXe8WL025+tsPSdyjudHYp
 0DTaVMz6H9E4opy2S6ovCnbEyBEj8oXCJV2du1MDWSEv9eZHTbqvkPUUd+HL4uLlUvF5
 cgGjTp7B1tTIKv43wpdjB6ASbe7KvaUo88nsQcB3FiosJIHnAFxXzCIg9A2EVHePGen2
 PTfe0S+Yquzjo/DV1c2oLDCtDur282eio/RjLScz4E14Z1ODJXXqjp8luUdmHvU/PNMd
 HtA6KXJ5BuR+OvNc5uCITrPOg4AuvxrMeyXvN30z/zuioIRdy1qdS/gvLBsSLw301/cv
 BjTQ==
X-Gm-Message-State: AJIora9QzOibPKmKMHpYLQgGRrMjy7lbR9IzXrFrS1ekuTIeV/z/Rqd3
 mEIgiifwwS3Pat/1AYj7j2SZ9g==
X-Google-Smtp-Source: AGRyM1uGKVKbziLy2t2BlcrLr0mk26fcsPQY7sqpIVNX4XJVkw9hpX1thprzgTd3GKF6NI4k0lSu+w==
X-Received: by 2002:a1c:7c16:0:b0:3a0:4c5f:ce13 with SMTP id
 x22-20020a1c7c16000000b003a04c5fce13mr9624027wmc.73.1656590935626; 
 Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 30 Jun 2022 13:08:44 +0100
Message-Id: <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Jun 2022 15:17:39 +0000
Subject: [Freedreno] [PATCH 6/7] dt-bindings: msm: dsi: Add missing clocks
 to 28nm DSI PHY YAML
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add in missing clock and clock-names declarations to the 28nm DSI PHY.
When converting from .txt to .yaml we missed these.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-phy-28nm.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe22..9ecd513d93661 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -19,6 +19,21 @@ properties:
       - qcom,dsi-phy-28nm-lp
       - qcom,dsi-phy-28nm-8960
 
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iface
+        description: AHB clock
+      - const: iface_clk
+        description: AHB clock
+      - const: ref
+        description: Block reference clock
+    minItems: 1
+    maxItems: 2
+
   reg:
     items:
       - description: dsi pll register set
@@ -36,6 +51,8 @@ properties:
 
 required:
   - compatible
+  - clocks
+  - clock-names
   - reg
   - reg-names
   - vddio-supply
-- 
2.36.1

