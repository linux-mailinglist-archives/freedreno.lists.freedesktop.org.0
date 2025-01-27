Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6DA1D676
	for <lists+freedreno@lfdr.de>; Mon, 27 Jan 2025 14:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0A310E23F;
	Mon, 27 Jan 2025 13:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TV7rmXZ7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F10910E3B0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jan 2025 13:21:10 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-436284cdbe0so7026715e9.3
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jan 2025 05:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737984069; x=1738588869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+klEMk0HAOeZBAXubltjLaVWMvzRQNoO88wNMjjAFMg=;
 b=TV7rmXZ7m7dE0Bq+y7MI3kH794/DZ4fgvEweWAjXWW9FpjX0YNiVBusbJPZyhfQ6hy
 7sA6WvJWg74V/29lzRoHBkGxAqceUW9zloWbH9nyiAnTzjaTQith4CtiBU84Mq8TWMWh
 NBgDIslPLxpSYIoltn7nADIUkKO8FlFIORMuUwyyK1kr6JStk9P9GW3ncUNmgYBpT3eO
 qyfq8nknl4/YaifyprgWMjouxY6B39rvgxAZeCqik64mBJrx7CcTwQmg9FbCwLCC3qxe
 LCQTRpaSKvzi2OoKUOSutHvp6wVXoIB2hXiHS1ryRYEzD4zFBNNBgI8rnA1ghuGJU8S4
 NVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737984069; x=1738588869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+klEMk0HAOeZBAXubltjLaVWMvzRQNoO88wNMjjAFMg=;
 b=CcNIf0nunsL23wD3fs1Ixv5kQCs3sxzv1q7cpByra1vunGQhzPd8h3djZbfcbTPZmp
 MQyF/DlTpJx3qGG6M5INwgkdmX9aSdH+Bq0rpPjFbwL+Rhzq4GeG0GsQ6t2nIdA0CcoV
 vvYSR5DNMR6ejQe+HSSgd/fbQ14FKZ7SSyAM7OR5w8eAmjtBo64M6zCecLMUqdmk1rsf
 xSIe+uSbQeT+krIACCXo4lh17E58xxyRHnfAWWJG6fEVGs30enuF22/IAhmO26OomwpB
 PUBhIKgcMBYDAO04dBFW4mm6JUePzujU7bQOhQGtmzUIrqhywhw1JjzNRLgu8kg/HOTL
 cNoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiVt8Y0VzSDSd/kGLQdBcOqaHFr0fHV6brjmwJGlJnvJSYhJ0eWewqRVuU5Z6TMJiRVGvCMEyU9zk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIiVWrciFaWjz4hJgzwkuqeb4MiP2txVYOeNEDHI55VEROKSHx
 JrNBiwtRDuQ1zCSZbcfKSLcnBJkaN+c7Bb5tzCfcUiEh7W5BjeWy+eqCEYrDOrM=
X-Gm-Gg: ASbGncvkQ9GnfcrCuXj66B5KIjvYXGLbDqwUr/5TWs9YjpKcRDZlRqhIdHq+LChGLKz
 pc41o0UjdbJHSgzBW9LCrccZSdowW8vlYf6saYSqQ3swiMwTlwD6WWNwJLoWeQFu3BNhhZxiGeQ
 poU+AfZ3vPwS12sdocRkRwODffG53fD43H3Xem6l1lvPntS6esX9JIQqxYrB9de3Nsm5LN2QvY3
 NGiOWbegGGKj71Ynj6iG77KPTDBWUE5Cg6IWiYP9Fy186td3MNGz6tSP/wWUG3qLBMFzAX1Hhkg
 1WWq0IFzgBVlOwogAg==
X-Google-Smtp-Source: AGHT+IHXp0TkSnUcKeJc7jgumcRa74yvba9PnZUCBYFw4tCqyzZOJvhurHlS0rdMsNnSl5Phd/c0+g==
X-Received: by 2002:a05:600c:1c0a:b0:42c:bfd6:9d2f with SMTP id
 5b1f17b1804b1-438913bde78mr147472595e9.1.1737984068879; 
 Mon, 27 Jan 2025 05:21:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9977sm132386105e9.25.2025.01.27.05.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:21:08 -0800 (PST)
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
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed
 clock IDs
Date: Mon, 27 Jan 2025 14:21:04 +0100
Message-ID: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
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

DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
two clocks.  The respective clock ID is used by drivers and DTS, so it
should be documented as explicit ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch for Display tree, although with Ack from clock.
---
 .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
 MAINTAINERS                                              | 1 +
 include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
 3 files changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
index 6b57ce41c95f..d0ce85a08b6d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
@@ -15,6 +15,8 @@ description:
 properties:
   "#clock-cells":
     const: 1
+    description:
+      See include/dt-bindings/clock/qcom,dsi-phy-28nm.h for clock IDs.
 
   "#phy-cells":
     const: 0
diff --git a/MAINTAINERS b/MAINTAINERS
index eb75c95f6c45..30103e3918ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7398,6 +7398,7 @@ T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/
 F:	drivers/gpu/drm/ci/xfails/msm*
 F:	drivers/gpu/drm/msm/
+F:	include/dt-bindings/clock/qcom,dsi-phy-28nm.h
 F:	include/uapi/drm/msm_drm.h
 
 DRM DRIVER FOR NOVATEK NT35510 PANELS
diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
new file mode 100644
index 000000000000..ab94d58377a1
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
+#define _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
+
+#define DSI_BYTE_PLL_CLK		0
+#define DSI_PIXEL_PLL_CLK		1
+
+#endif
-- 
2.43.0

