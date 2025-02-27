Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEF1A47266
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 03:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AD110E0B0;
	Thu, 27 Feb 2025 02:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AvaqfsNa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7860B10E066
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:18 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30a303a656aso5140251fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623117; x=1741227917; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q5U2PqqsAittXp536ew/SvCsut9jyzjmr2ENiR9whTM=;
 b=AvaqfsNaf6gopj5zPycm6J15DPm4gefpkUBiulyBEymtYI08IYTWndWy7ZEm5u2DTT
 ij35dJexbuEbbYgareyDL1gWYOgoUVCSJ/pApGV0NEsVGEKYEHheJM4+cY1oNqx80ZEn
 kEGksWWjQ1/ISFpyD1/24YRm4fIcV+yYspwdBmNiierybul6Ya/SWXsjoWCScWJYeGsc
 KyVo+mFMW0PcFre+8nNXSe5HakAjjlPyfeQOd2hqnk+qF1ssTLeNE6Ka8RSCMbMcw4vB
 7dEpmAQt06bA2hfhNrtQXaDRi0wzfexJ4Ptnz7hhMN7VHugEa2n9DhDx92rG/kdNZC6K
 6COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623117; x=1741227917;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5U2PqqsAittXp536ew/SvCsut9jyzjmr2ENiR9whTM=;
 b=HGSVpkpczuaJSXP6uIg8r57GYS6FwdUfN1W5a33x3y2XGvnCuL+omeeITqyd3yciQX
 LvCaDcHuq1CR4b3SnFX1/7+FflsoQby1bnefYRFKEe4zEE/luqabI0BNDH2v7Y5nxTik
 j2iMmO0P/Ssxru8WA6vCXGcDug2925yTS9bmbk0lCkjAU6bU7NodT1yVTts2IFw53erz
 6muGclC7IDFOzzWrYJCGwhF7a2CscORNRw1MO1OV6ormFITsAcnTlQKUgBtyTnAplZtW
 PbCfOsLRqE/61AQilrImzg+dkY0HUXy9zSGsr446X2LcE+Bolonum+hRLPeEroWcXM9z
 q1BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4kXi8E4abKfQJLPxNW8X5mMwa/yaEZUem92Tx7M7Xnk2qTTAPrUky7VChfXP2tPsUjvt9+hiXDVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeBwZL2N+VbnNj6enIF8QEBAPO9ru3/ApluhNYBOl6RsAKjmUL
 ObY9yVmFSU3na/09a6W3sPCjYYFEi0SaH2tQdzB+lXIlQ93SXwzdErZkXZ8BJLY=
X-Gm-Gg: ASbGncuauOCR1mM1vZQjn9KfgARFEDOJwjRyD6eAKJCNupBIH7a7zR01EXwbL1qRbHf
 NQ+anAorNctfcGdE0EKgp/mPEos0pYxWcl87HOSzLn071tmr5k7TWkbWGGw7gAsih0WgwE/T9Yj
 sXIW06dkAw+rS4SYjbdryvWGVMCqwb7U0NIavd5GV1klKOBddM/oosG1qM9zY1mcq4OlmhUVNgG
 Doyn0QtdI0E76NIi+Mx0+2CrCcUdYDM4cGeFxDe+uwTImgr0WQMLXlT7J5+zYO6GC4Bhk1pDYJx
 C/7DvKrfQOxvgHT+8k4CsOQKqrT/MIG16g==
X-Google-Smtp-Source: AGHT+IGGp9KrMaDyRbIC/wTKqo5mY4JxnEPl4O+DeJ+ybSnTzA3m+DKpiJplqcNL8wwlCZUgExesLg==
X-Received: by 2002:a05:6512:2347:b0:545:27f0:7b6f with SMTP id
 2adb3069b0e04-5483912fc82mr11153371e87.11.1740623116670; 
 Wed, 26 Feb 2025 18:25:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:09 +0200
Subject: [PATCH v3 1/7] dt-bindings: display: msm: mdp4: add LCDC clock and
 PLL source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-1-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nAUeCQaacPy4eDcat81zyQ4FPPYgERyNRUqIhBqqdZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80G1AVXjPfLNQ8ur8MgA/B8hG0n9UdJwoFEA
 3JcymoX9+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1UNWCAChp9UJAPMKWIwQHWroB0P5YvcwUfqq3siqgw9PBarSlLO0xCgLeBDo/2zRn2E+OHq7oxB
 EmRoXMsWHJwSDbHd8/uyWb66SkpVKZH+xtYPJyBTBj7it/qpWjOMK7EZM75sHAWwwTnGgaimA+a
 /cW/3uQeNEnukCV2+c6OzEV5W5tkVLvoMuvzzMcoraJPl4sTKCU5++fBGoSYx5ZgR+Wih7rOQ/C
 l8v7QSCRHn0omGtFc4ZyVSG/jdTn1bcAFVzUXf954MGo5XJwxeRwGPM4dTCFt4kD3iBzdMoSO1f
 Z+5iseXm/gQaIZ2W5cMZcQ5bKfMJYmBK4k8CM0b554psYjFr
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

