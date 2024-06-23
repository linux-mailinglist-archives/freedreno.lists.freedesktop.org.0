Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C5913DE3
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 22:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E429910E21F;
	Sun, 23 Jun 2024 20:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oPePIVRd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E1610E184
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 20:03:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4217a96de38so26924935e9.1
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719173008; x=1719777808; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8xw3d8h1KtA4Bw9HNT33Bp9fAotcAbqf6CP/+FNxfG4=;
 b=oPePIVRdZWcJHwHFB/ghudt4H2yi5+Z+4fVZvHQJGb/rC450lddlDndn79//N7oxaM
 T4RUKNuDBtuLMje9xKJByARPxTT5MW4Lw3LUPQzQq2rxVVnYS00RU+QY0IU2/1MAFFa+
 Yg6QBhDAR2M4KCcSsheOjViY16JujQwEqmuqeo2SKDiOzQ3wkcv3AJg41D2IjJvZxWP9
 Cqp5/X2SELW1D3rgLVKUFv2raIPg7FdHnzn7Wll5EhByvukQIGaMR6wKCe66VWzJ4HrJ
 9tcn5ndHRNqMnZWrbdEabbsFYyrVdMwzthCzPcybJH+pdcTzGdAafwxif+eOtF3QZgAK
 brjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719173008; x=1719777808;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xw3d8h1KtA4Bw9HNT33Bp9fAotcAbqf6CP/+FNxfG4=;
 b=S+Ba+tZBqMAy/0/jirZLSSi29caKPrqlT1KhIqv+sbR/5rszXUDHxBMuBQVIBe44YA
 V8pwosVoyz30Uqlus28aGbPpL5yUH4i2kj9CYhgMfdpwWhZnTADe0Sxd4jFqrMCucP2Y
 xSikuO46xrKs9sVuAdodYjl8BnSOuH4tzyivf6RFg0kedOgOKfVRfByY9P1IPcuixizp
 fL1vg2/bHPhs6jI6cAFFfERf4ccnb29LWTEgLo6KbWMFLXs0VvQYpXBwNhrJ+XVQyOzf
 idFt9dXWBu8egCgO6o1Ch2L+TIOHMElo7i6yWCno6TX/+VbcM+3yo9hy4Wacew+kMQrU
 iyxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxf7beGq2Y4+26XGhUVbGZ3UFpng5K2skq1WECTUPO4va5gvMDgB7wWcndVoKaPEA+3vkCjB7W1haJaKIuD7hIEsmUPPHp4shYTz0ZjHlq
X-Gm-Message-State: AOJu0YynuquMlSdXaCB8ioUusc7eTB8S4Gw33dRbcuCdr4g+8wkX+Z1d
 PKl3fQ7VID+HahTXcrYLB+d0JCO7QpbAD/41C3on8yR+c1aI1O3aQH1Eb3KXMtU=
X-Google-Smtp-Source: AGHT+IHe+47qKRRfSwrj79ONMz16tzlLcTL5okV4sa+DoIkXOUUXKXA75900ckiItgh0XPvu+g9aIQ==
X-Received: by 2002:a05:600c:1c02:b0:424:8e37:f4bd with SMTP id
 5b1f17b1804b1-4248e37f5fcmr13985735e9.7.1719173007957; 
 Sun, 23 Jun 2024 13:03:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:03:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 23 Jun 2024 22:03:01 +0200
Subject: [PATCH v2 2/4] dt-bindings: display/msm/gpu: define reg-names in
 top-level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-2-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JAgl9N70T7nBjWq6sfG0RrGjlyZ1vYMXOKdaL4AiRxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+HKVRaplObRNxhgegl2aew/fV0tzsAie8BX
 7Qgmsz2c86JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/hwAKCRDBN2bmhouD
 15M9D/4rFV3sFT+G51uJJNM74lvKwiFFLUuu6qyMY6Pn6XV51y5H7sSrgp7UqVzWmTsNEy4TAVL
 zh0cQUl1FTpnBwyCrkailFQMuMU3sbpUjECCFUkAjkOHkQ221wRccVFQCofbbAQfLVb3ipDhqWG
 hDa5+cSZa13fakg9gOFD0Iy7UknBSpncDRpPiO0yNXW1ocHU1EjYr2+Da9V4LPIWOKwxTLpE/Pf
 RGFIEuHmCpMRtyFDAjC6mwSZo3g0iAuhYe2SbyhjrvK506zVZ8NLGN0y57ErKA78BzlIlBcWTgx
 F8tOb8VEv1VQRIaqlqVt4oZ1U++Xm/TlHX1ILDk3fJGsTID/Sgj7+ozSHiRH5MHjY4G+0Wk78sC
 YYfmdY7UoJuYbFCLb02FuyWfm3TcKu1QbqPd/fYQlA+eT8Pd5w87htvIVjavUJ6SmiHqU5JFjO9
 DdUSQupa1kWFnF3meplTgyCuBRyNX3kApnP1qSF+vwYiXINHCHftcG+WKq5Tq8pROFKxKdeEO+V
 q2FbmpsWNs9twhn3OArE2Xa6U8MyZMRGqWYxmZMakqY96Zgcl9rLxjbrmyHsEaTNy4RmOyBkjH8
 PmNVAidrjBDFEk2KnxpsWplocLPx+s48I7HHtCV7VC/Mlqe9yio5hUZv6Q5SQB5/3+d117brxE3
 Oqjr5j50S6Obb6g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

All devices should (and actually do) have same order of entries, if
possible.  That's the case for reg/reg-names, so define the reg-names in
top-level to enforce that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 253e68d92779..baea1946c65d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -46,7 +46,10 @@ properties:
 
   reg-names:
     minItems: 1
-    maxItems: 3
+    items:
+      - const: kgsl_3d0_reg_memory
+      - const: cx_mem
+      - const: cx_dbgc
 
   interrupts:
     maxItems: 1

-- 
2.43.0

