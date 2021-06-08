Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 540DE3A043A
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 21:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA96EC2F;
	Tue,  8 Jun 2021 19:55:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9F96E7E6
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 19:55:34 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id f70so6254277qke.13
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zFpLFKwnnwm0v+NfjRrYrippm6tYEqwT/Uhc6jwTJ8w=;
 b=b0oPOrNo+272HFqMy8yfisgYJbkEi9xugRr+3TQwP35XzlQTKJPjFtV/nXZ9Dc9k45
 I00qaWcsJkvoAJjbFkUdCKVQIrtxCjt4gxFoCGs8ZLlYojDW3pFiqko1/gwW2Cxql1XZ
 pijnlAtH+m0eF1zZzOxTKmM1lJQcl9onaNuiOuIz/2LdI09pcxIwkVQes9Y51XxgeoKT
 nQZqxpJBAh9rFUBn2q6mV07oqQ4NRNZ8y5cxlEo412V6n+HIxvNNDiQNuARju6qAYth4
 96cjvgZyrsxvAyLeLBh4SnlW22dmLSfSX4vjBYmRZFb+s6mzLTorovZvFuI8k2Mh9Thg
 MbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zFpLFKwnnwm0v+NfjRrYrippm6tYEqwT/Uhc6jwTJ8w=;
 b=EF1PHysFIXT+UWNLJUmn/DNWwd4DoDlD7fdXDJKiP77jb5A5bsSFc+zQYpol0xrXIZ
 PfvSaLj8uBz7N6ZQ6PCKr+KEKG+BFwHnYDw/EwirUr0g7x4GOjhZfUBoK4HdCyQHqzJ/
 mCnjSSDq0ykJbHpnKQohWd7YhIIS9tauH7k9uhGkkjeJjKgwD8irNjhTN7VroFVa09tT
 DWk40aMEtfn5BCdqGqp+j+D7QA+xHWJrFkrA241NGvjsFritsx/9g9htt7+Bkt5DJyay
 qY7jAgr4NKay85qvmQ//go5mOxjfhZrJP7zdV9zMrMZo847mjNHvl89xMIgFFTHhH9Dg
 CVlg==
X-Gm-Message-State: AOAM5317l0k5FDTjdFbnjJCh39127bcIeUdMMhFmTCXho2efbwszSxu1
 iNtytdrG0Ym8tlYrD6hduDT7lTRpBeT5mAXziodyWA==
X-Google-Smtp-Source: ABdhPJzYaRdFTlAOd4uLx+ty4mPjYDj5n0p9y4JDG0llRCv/4CexdXu+QJN2N5fMSfqvkuPcfAeTBA==
X-Received: by 2002:a05:620a:1675:: with SMTP id
 d21mr22993674qko.390.1623182133954; 
 Tue, 08 Jun 2021 12:55:33 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id l141sm643687qke.48.2021.06.08.12.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 12:55:33 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue,  8 Jun 2021 15:53:27 -0400
Message-Id: <20210608195342.18269-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608195342.18269-1-jonathan@marek.ca>
References: <20210608195342.18269-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 1/3] dt-bindings: msm: dsi: add missing 7nm
 bindings
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These got lost when going from .txt to .yaml bindings, add them back.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
new file mode 100644
index 000000000000..bf16b1c65e10
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI 7nm PHY
+
+maintainers:
+  - Jonathan Marek <jonathan@marek.ca>
+
+allOf:
+  - $ref: dsi-phy-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-7nm
+      - const: qcom,dsi-phy-7nm-8150
+
+  reg:
+    items:
+      - description: dsi phy register set
+      - description: dsi phy lane register set
+      - description: dsi pll register set
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  vdds-supply:
+    description: |
+      Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vdds-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     dsi-phy@ae94400 {
+         compatible = "qcom,dsi-phy-7nm";
+         reg = <0x0ae94400 0x200>,
+               <0x0ae94600 0x280>,
+               <0x0ae94900 0x260>;;
+         reg-names = "dsi_phy",
+                     "dsi_phy_lane",
+                     "dsi_pll";
+
+         #clock-cells = <1>;
+         #phy-cells = <0>;
+
+         vdds-supply = <&vreg_l5a_0p88>;
+         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&rpmhcc RPMH_CXO_CLK>;
+         clock-names = "iface", "ref";
+     };
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
