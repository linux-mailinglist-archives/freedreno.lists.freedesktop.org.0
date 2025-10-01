Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D9CBB513D
	for <lists+freedreno@lfdr.de>; Thu, 02 Oct 2025 22:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4608510E84C;
	Thu,  2 Oct 2025 20:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B4zeAH+q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7773A10E1A3
 for <freedreno@lists.freedesktop.org>; Wed,  1 Oct 2025 14:01:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so69761975e9.0
 for <freedreno@lists.freedesktop.org>; Wed, 01 Oct 2025 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759327265; x=1759932065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fsszsfqn6nKhuQ5ZGb0FQ/doPY/Ih/TU5I38riDkDPQ=;
 b=B4zeAH+qa7zIkcBRUgaVL3ARqf8/n0vyZWrwSZR5VjEQLbhl6Cakd/gSo3m9EXRFm8
 or0sF5kP96wdJwuxugmD8/V+WWYjG/HZvI0pZ5q/pcDj0YWEk5aJtdB7Qkmv3qaQzz21
 rcvrN5aMQrPuuGkmv0os/MkfAYCcF/MbW+vZv/4TqYnXQEzHC43H2n+5DcHVByC3bIYS
 zqbUH3JEGnArtsqWn+XNK+cDpblUZiQvHoYYPvJXC+qVF9SZccNxvbp2a3W97pFo53Bl
 xVOyZ+mTpHzTWIuQ1ev4OCNZlAj/m9JY9I+fiXsSHY425bKJwWSJb55G5wlCpQF3wg/r
 GYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759327265; x=1759932065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fsszsfqn6nKhuQ5ZGb0FQ/doPY/Ih/TU5I38riDkDPQ=;
 b=Lp7Ei6vsVZFo0xXMYdDJHkQLDyqgtHEallg06IInu7OhuVhV6QNrWP1u5xh2GjUm6y
 li+l/s9L47nNXzF5FO9qzt/YYoCTVNOeiZJsxw3ShxVeT3F5TaUmvqqMhx3weoCSqM+S
 mhMth1Scyc/UD8XySWZoMRBHRxdx4pvZaxY8V+T9csy4dV26g9NB7S3mCd7mTEPjosJM
 tLd2miLvjwl2R/unllw0yVasQxQq6ClIfkAqUARhy0uUK/8MwxUnZOGt/MQLuhMCGpsf
 6/kaxvzwm13P0Dq3cr6kQyT04fFIgD77FTVMKlz7yRCZPJD3QwGRa/UB5TtIvXtGgoNR
 P0Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU19FDDGbsl+3ddBrBiDwx7NQyzFLZ1L3m/v0Ps9RpI4PYaCiU3CZMXxR1G8Ama/QfJnfp99x3TaMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/uQokVVmu8a7ezY4Z1AfDkq565KI4VyAb4GUPsSFIQcIziQ1c
 UnlhmFUljuDwbZ9x2wB6EvpdqCaBfflicmM6DPqFwqM4QfLP8+Yizyyi
X-Gm-Gg: ASbGncslqJYa4tMPzMbL/m8bG9f8ZKKebkYFXmW2qhYH7QVemMTsc3czimyj3RSSEv+
 8oh/p+qePHn83PAns25qhQXFoNLcTazAJKRh2qYNy8XIna5uAW3upNCClZgITA50y1YdHPfDnS7
 Zm5ZOj7tWfKjrns+G2zBIqmiQkoXXnAEMC7NJRpNQCa2ljrXpdDyCnt6gV+OMciK6+GCYSEm6F7
 KQ+1rw1i0tY++J2tSELrYaTul9u50phR/9fM9aWD5nbSl29dGmtWP0NENjGxideJ62pbiOeQMp3
 gW/rMvB65U6u/ifociuHIr5fHFJNEx28yHViIH1AwRcf6UJcrpWXTjZwF0PAd7ZGjI8T8FQEJyB
 Q5yoIf29h0K9NqzZGGBJsIA11g1X0iVHYTx9J9elJ0axziexOVVwN6FuLUBvaeiabd5Nov96eEL
 EzmoAcnTD5tHLvyGC35mWXepqiyafa5RGKpy+UC611z95DEbJxFQspQg==
X-Google-Smtp-Source: AGHT+IGfdA3CFMOqzDfdHGv3iprZDyUerHzmhklMNsvWYGm9CmujeeYnsM2kSToIaaRJkR9fFhfaSg==
X-Received: by 2002:a05:6000:18a7:b0:3ee:154e:4f9 with SMTP id
 ffacd0b85a97d-425577f31e3mr2814568f8f.20.1759327264519; 
 Wed, 01 Oct 2025 07:01:04 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk
 (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 07:01:04 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] dt-bindings: display: panel: Add Novatek NT36532
Date: Wed,  1 Oct 2025 21:59:12 +0800
Message-ID: <20251001135914.13754-2-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001135914.13754-1-caojunjie650@gmail.com>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 20:04:12 +0000
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

NT36532 is a driver IC used to drive MIPI-DSI panels. It is found
in OnePlus Pad 2 tablets with CSOT panels.

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 .../display/panel/novatek,nt36532.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
new file mode 100644
index 000000000000..ca4b16459a72
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36532.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36532 based DSI display Panels
+
+maintainers:
+  - Junjie Cao <caojunjie650@gmail.com>
+
+description: |
+  The NT36532 IC from Novatek is a Driver IC used to drive MIPI-DSI panels.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - csot,ppc100hb1-1
+      - const: novatek,nt36532
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA
+
+  vddio-supply:
+    description: regulator that supplies the I/O voltage
+
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - reset-gpios
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "csot,ppc100hb1-1", "novatek,nt36532";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&vreg_l12b_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.48.1

