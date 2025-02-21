Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A06A3F861
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 16:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF2710EA92;
	Fri, 21 Feb 2025 15:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F7yzBgbz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ACC10EA9D
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:01 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-abb76cc6108so29999966b.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151500; x=1740756300; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rC+p/AJsENqyF24I0F1pgnfGa5IztyP3HTXK8BcRgR0=;
 b=F7yzBgbzEwcph/Qsb0nasqRfRgWg6PZcQ1OLgYRkTR/TIsCAoPxBketj7nJfRMid97
 GW0/UPz8CdKPDocoUs+jl52/uzzKkBCWhDbgxOcs/7g78WVYZZXh9ROgyvym2H/2SR4a
 53/AzW1MKbrbLQrBRK9jzImrT9vGyEn6qpRRaZP86hQaZvSV6Mq12D00xqwDWWM0nZZS
 soSzqkm10uNsAUcz7YmH4RSDYkucPIznMjO9IRZDeHleBmh7Ej1uQcjJYwnebADYK+vQ
 T+4a0rKDRt9nxggYX248236wSTIA3+KdVQHudCHILBQmlramKq0sQOtMtRGWP4sGfHpH
 M8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151500; x=1740756300;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rC+p/AJsENqyF24I0F1pgnfGa5IztyP3HTXK8BcRgR0=;
 b=d6z/CPXCz75VrlclTLCEpcxqlyQ6jxbrfnp2fOniBhGFhMO+htsUN1dIncuB3JXCUG
 SLT0Zukidlo69eZgbWhrSKOpeRntkEv5sEDIvXLoQ7UbluwosFjOP995U/cJyw7ZzGxj
 aA4AsSlonpqOmjE1YCT32CSgon2XFwcvIzfhjCHTlHPpjS2BoXirp9L5JJvbU1FAnTil
 jbuOCey+De+A4kuM0L1XD7RpdOKFLnFCJc4WBb2dqhKxzcPTh7bNQn9S4JYAIjO9inSV
 BulaQxrkOsOmLOa7c+MQ0f/zHxQU+hlOGR+X2uJfRjrO6mRFrptJR9poMSmM44bL/SxN
 11vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc5n9PUB68xZlAXBRjJSt7YeXgtnB3e7h/RqMUshTbGntlNkqmiv0FngtRxa+ksVSJZVbRhp8c02Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsnIAn/vbrcYiA+gb+KlVQhYM77d9lUn/NFJzyx/QWHlpeyfKK
 i8stVgQklXX2JjvlEoNhWUp7HLYFxBzIWseXMPutzSjbuq0MaD9OeS9O4luTR/4=
X-Gm-Gg: ASbGnctT7e7DV6aZaas1wWIk3FxjN7R3dZqL5RVbHPXrMEBMdF+p8GLyxlglIavD3b9
 kUaTUSYWhUDMakuIS6SBakXM2Zh4Mew0zaWLJlTPCVwVYEPgUNXBewbtc452eGEVn//bo3yQJiD
 lnmN7HRQ96sem3FIEkHlM0n70NF+sECfGDMC01QB1qR0O6ORctVtV7xIc1yq26+wxbDho4kKJfu
 q5Mqkr6nyvVJKzdOtWHlnOum+CP5bkhvv1WOkSq9/cPIPBxJfvULAdjU4iZ3uQmOZnXcjjRhBO8
 NRYyqkojrqb8OQ37GTgmIMYkBVzAZtG15dTEfJkb1tdC02Zb51B5E3/1Ugy0iyPn+U/Al3oq/jV
 +
X-Google-Smtp-Source: AGHT+IGUaZJLMfhhvZ6mrcB3zhy337JFIkyRqJ9Bx5R78WejuUWui56ud8b82suf0d+ViP7DXXMidQ==
X-Received: by 2002:a17:907:2d22:b0:ab3:8bcc:3d97 with SMTP id
 a640c23a62f3a-abc09a46c73mr147175566b.5.1740151500410; 
 Fri, 21 Feb 2025 07:25:00 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:24:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:15 +0100
Subject: [PATCH v3 05/21] dt-bindings: display/msm: dp-controller: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-5-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9B2Xq7lYY3q6Y8LyOgUlIBLiX0qqdACiJxxNpgXSDG4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqwYmhjNiJz64m3Odm70ow8pEs9DwcSnwYWo
 JzWPq3daK+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iasAAKCRDBN2bmhouD
 107JD/0cDnFr4AxqzNmIIFy59u6RC8j9KAubzvu979pw6xQXoaAnXSToTCm/VZ0zgpRsKmVhUK5
 U8RDOJB/OmjKsL+TB/JFnE9n5qEVJkyrXdtIyIqb72sisTuAIH9KWIfZH7L9eGO5tb7R1ZeZ6aC
 yABdqEWnFASosGW07EiRLchCNtBxYBuG2xzOwnWjT0kTE/o65oR1xI99JvWnUNbsSwzHdbhRdqO
 /gnlkLYxV8/DtgrWiTUUU/AOh2wASm36b1UxnD0jyfPsgi/DJ7dLRW5VwIuawTtpF1lwWiDHwV7
 pNqlHN+z10FQcM9+3JYvtLo1BObW7LCoOxLT5DcULqY5g++QR83Ge+vvRUG5yMlOtTmc9f7/I2d
 JyP+8S0mkVsMJI6f4benMJTa/VcZ6UQ2tD9ZasTGoRmzIN3PrZVqlsecR6i+28sk00Z2l0BfJ5y
 zm5DwXaVG/AJ7kZ8CwVH5QxDIMGClQBp2WGnLJLfAJh3zMwkqOVB7gY6YJRJKf19wIkOkgP7PEj
 DIGT9L9iLkN7z4pj+sVHJus/LV9oOyz5vkpNPaQqaOvyPqws9r9si75nGzW0+a1m80PfrDnPwry
 K+I/C64RDpWjqObRBg/p4SoKg7JAmR3e+Kz7pDKinJvlrbSC6nXOF7ZLZgJkzpXHsYhrzbXT9aa
 h5dhsXxkxEiRthw==
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

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant - both are of version
v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
MST for DPTX0 and 2x MST for DPTX1.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Extend commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -37,6 +37,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.43.0

