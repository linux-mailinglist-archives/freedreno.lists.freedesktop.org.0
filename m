Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F0EA3D7F1
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 12:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821DD10E940;
	Thu, 20 Feb 2025 11:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fl5YpyWM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B0810E940
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 11:14:59 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-545fed4642aso898224e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 03:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050097; x=1740654897; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kmi5qZiZT2PWJkmQW4SIR2YbWKNMaLc2hi9Q1PeeMGU=;
 b=fl5YpyWM+7e/CVzqpTiBLfSmVSRTeQIHU4d+stqkO7jpG+lXG4keMNjn1Mq329mY3Y
 dMnfJR2KqRbJfQaKJWZVvIY3BYEx+4xUvwEf5hblcp/MLiSfRhSsYo+9vVvhtQTsryZ8
 E+4bGA3ka0kKTFsuO3TW0Qh6ABEGMlUD5+GlFKt6UL7XlMsGZRMHOO3wZS33+OoScIP1
 D5U3I+21mwIy3AfZZKdzAwe7qE49hedPA8S0h3Xgn2AbsUFbhCxFR5heM9/ACK8w1hMR
 fstQuRCz0OvgKUUb48tdIZCASVAxOqqiqpMKMvdv909zu0K511gex8D0+EC1mFsfPX3V
 DE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050097; x=1740654897;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kmi5qZiZT2PWJkmQW4SIR2YbWKNMaLc2hi9Q1PeeMGU=;
 b=uuwqrcgYR1fQ5Ur2Twe12VvqSxX5EqOJxIVK7fYTXDWu79npbT6H8BceXSdI+AW6ul
 CQLkq4u++EvcyxtmA0xM57MheX9h865WTk7xhzIOHw8tgbvyo07mqhmKNEj3C/pCSCaf
 qGQRZIib3NDIknF3clXYxwUxT8H+plVf6iQAs5mWIG6V9Gc+MK8CipnumzgjpEGLhffG
 r0U6DBakC9VJ0JFCl5DvqAR0kuRyPBy+7ioGCmdwEO0G3tz0zTfD7X2CD8eyqKoh+1No
 yxiV7Rh6qMBAr8IZHQiFl2DXFmpq3dk7et+C/E47KRIbCQKhwPprrmnXVqF+z3fD0n3K
 OJXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa3ylOck3h8UyDMH/RGHrmbdvP6P71Qu1ISNxsp3TXL32w4IaJa/VR8Iwk+tGTJLBqffdMVeXNMBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlmlmlYjIrmHqIf9adhFNrSB4dtStVRB3L+g7urUs4EYaiwGGj
 kCc4PCyV75PnorgkKelLTuURWSjoo1IrhKR5sRK7W3iRTWjIs8gz3ZATRusRESs=
X-Gm-Gg: ASbGncusxY9rtOh+4Rg9ymNHBMZb4QWVH+5mOPH9pj9KzkeXL1RQLnGOix5HaaYUsgv
 PyJMlyYPN7fqUkrOm9yyg1Gtq+1zEyV3rT8AQKs7gDLzp/7fu/ERM3qqUmtZnRvIXsFJCbQzY21
 F0sTHNwAx6HOk6vRMn6rQF2hAgW/8ttKUgtdRl1PqFBmXBbtqzmxurC4wGf7cJLx2nMzuHc+8Nt
 XT5fLKzKgQEQVZncy8b9oaZJq7U/iZtfbeEwMXLAM/e754eXYrYENXA/2F5sIUn/Gn5qGLJiuwD
 uEBC0cnZywDB1pOsTEXDgBQ=
X-Google-Smtp-Source: AGHT+IEcT8WbQ5vEweEAYBbOtxpJnbkkjGYmd95cHUJt/YZkrsXFT+WC5s2N5eKXQwAqzYTMpYUmmA==
X-Received: by 2002:a05:6512:3a8f:b0:545:cc2:acd7 with SMTP id
 2adb3069b0e04-54724a7b458mr785756e87.27.1740050097280; 
 Thu, 20 Feb 2025 03:14:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:14:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:43 +0200
Subject: [PATCH v2 1/7] dt-bindings: display: msm: mdp4: add LCDC clock and
 PLL source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-1-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h5+bG7QnOGzKdNB1OGuaSSBt1fw1j+BI9wMBVkvkoFE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rLFo5o/3jAn6PLBBB8PgMmUUthGTk+MMz3
 InhVdiOND2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1T+3B/wIyihaqmkz1M8Ue/9XefuiaGR4R8gc3Nvfhww3ydt5DSX5EZw5UVzMInfEP1xG4CPoA4u
 hKzVa8HwQouiKCKBbdX5vF79BlHcquloeI5Y8JH6w8VLkE0JCiCm1swqbq2Ak52Hi8zWgVMaZ0N
 /4iptmF7mzSgUYBc/4uQVWvhGzUVB/MxxldvDVJF/ETZHcAK21P7ej6V9VbrZG2QLDAaP94Gz2t
 2WGe08QpbdMkw1qz+JWHeigDBpghXOuipKUNxeWdHH3v2spRexhSKjgHaMVb9113vqi9ss/DvkT
 EZgReHrtG6NJUbt410Dl9MpFn/PHtEem1Eo7Use0eqzsNWEF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Add the LCDC / LVDS clock input and the XO used to drive internal LVDS
PLL to MDP4 controller bindings. The controller also provides LVDS PHY
PLL, so add optional #clock-cells to the device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdp4.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
index 35204a2875795e2c1f7582c8fab227f8a9107ed9..03ee09faa335f332259b64a42eefa3ec199b8e03 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
@@ -18,9 +18,10 @@ properties:
 
   clocks:
     minItems: 6
-    maxItems: 6
+    maxItems: 8
 
   clock-names:
+    minItems: 6
     items:
       - const: core_clk
       - const: iface_clk
@@ -28,6 +29,12 @@ properties:
       - const: lut_clk
       - const: hdmi_clk
       - const: tv_clk
+      - const: lcdc_clk
+      - const: pxo
+        description: XO used to drive the internal LVDS PLL
+
+  '#clock-cells':
+    const: 0
 
   reg:
     maxItems: 1

-- 
2.39.5

