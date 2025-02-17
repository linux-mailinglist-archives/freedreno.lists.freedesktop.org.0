Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B226A3899A
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 17:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCC210E549;
	Mon, 17 Feb 2025 16:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TzWTFiK/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9844810E547
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:54 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-abad214f9c9so53953666b.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810513; x=1740415313; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HAwXSbZcFpOuQBHVRwbOUqZidyc0Shw8eVGCnAwERkg=;
 b=TzWTFiK/rqJ/fOoO+PI/hrKWxwtN0m0t7f/1zxBdvM1QQ1L9xs0oC53Kk1aqhwrKq6
 lo1tDDembV1y+mJYbqNh7vtGCu0KgsH6pYI6XOvhdN2JJpx5JsTkfR6PtG0WyCG6A83F
 4xDI8DJBJNL0alXppbD5WpZUPTV2QBAcTrSQOhqSP98Hlmzv+nJVkwOFxLypxccOqHB5
 HnCBApdGtBkLE0uYwBtv488+8E0UtjvtcnuG7HoWS36HF1gZ97sRY2mXLj/ManuYm3zf
 937KDjRGUa3Rpt4l1V2jwxXrqEBvSw4JbXXANdJY4W47/ynBsClXf/swA7wJG5gnPw/O
 t8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810513; x=1740415313;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HAwXSbZcFpOuQBHVRwbOUqZidyc0Shw8eVGCnAwERkg=;
 b=LlkvQ5bvQzPWUMjLLlCydW+6/jkm+WWjuI/gIIc0H0mZT+PGPd5f1czYtdDVFfRUQW
 GKB9Nh/i70ufCJdBaDorX2XTzslCdKpoSR/bUf5p0ocyVjOT2tGteDNEIJmNZMBISKk9
 jkG8Wy5pDp7Aq/N5M+Dq+xJRb354Yz6n/ch4PYzUYfr2i9siZlqozG916dOrs89V/rzJ
 gV5VPjIlFZxkq4OXyvRNFHu/NyJ0YX2MZktInnVbWrq+souI1xSn7uWyzG6n1TaEGVLl
 fa0+UTcQ5Lgs0Fd0ONGR+UFHygE7Wmw306BvbEGyenSL1uOXG05N6wXEPv1yK5MhTI1e
 1h7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXVXITDa3ZMYPYNpEd6TGFb3Ke0wFRzlGsDie567r2cnaVbNyIViJd7mZiVr7HLRnBALrVhHghNqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytzuxgXBufOkvpemv6DXWRMS8QECx+HqEEY2OmT9jsi7ncbIew
 W78GIwi0eCNGX7p1ifbj2Qfq1VHMHQq6Je25WmhqlQVLiFyfVJn37hdY+fNYfzw=
X-Gm-Gg: ASbGncv0zK3idm/SWId/A/zrhSOjnybHOTLRMLnJqAeKaNpUyQJOX1Y+K2LSCXh/ahI
 jPmTRfJH6xyPGgxh87uy9KC0UDhtqrPx9w5HEB+zFZPY5Pbihi4QPSB7FkCXBF/0pLgL75RfGBp
 kQQdFMBF9f/lndQPghP17ax+s5EmoanAQjIcGxrkbzdezGgI8vpjJZcLQLhpkzXrFAoAX11I3B8
 1jPiWSDXzP/f3BReYue+xvruurLx2fQRPD2tAvfQpo0OK1DIUz95wErXSqh/xw41hFf5Q8No832
 nX993yG8JIOhfWrNGZMBpJ8y2DbeIK4=
X-Google-Smtp-Source: AGHT+IHwt9rKtdqVpWvlWMU9opivZ7B6UiCBuR01NuzfOowAfznEVo3RY7QMrNt1GQOd6t23b+mNaA==
X-Received: by 2002:a17:907:c1f:b0:ab6:db64:b040 with SMTP id
 a640c23a62f3a-abb70dad1e7mr357653066b.12.1739810513000; 
 Mon, 17 Feb 2025 08:41:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:26 +0100
Subject: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
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
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=K/LvPsSs8jLRaKqgMy3wwlLWJHnMlL7FxoRoOu4sBqA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a78Jl/FGD655nQ2ck6lMnvuiIvLFc2KWABe
 cxYdI+PBHCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmuwAKCRDBN2bmhouD
 19SAD/47HAphtGjTesMY+DDBLPGVDxs9LvcNhaL12xOwXoKX9nzrjNxyunuPfjSnCSMX6P+7WvR
 WOE0v45WZ/wAuJSaUZmryLvApkkf1UCY9+KEXnglMErTefMJW5nA1ZANRAQ7oVJuZe08MJq6UZ2
 6FcW/BuA7wkxKcZ4+jf4/z2GJgBl2B8zrWxAA7vW4AAoF/nwM8f2g3+3cFiEzCEyiCOKFUl+51S
 1/NYFYzfTa8qebl4rQr/QBmTPe+8qoP6eFrwusxrsXJezjXMpAG0kB8Wto/YxxtWfLAEgWE8H7U
 v6FG6CT8MTIMY9YAML0nRz4pcGnsfq2Mjv8zN+LurTsu4WVrr9Y50URiIvm9ufKAe0OQIHBrRmt
 fSt/MfvWHwBdOv8ivzJBjOQZKcVTXFRg1t4Z2ovrdDxNL6yvFzcSMvHKHOYOImeo4JKRRWHX2xS
 lcNVc0pJsEGBPFz1eeYZPiMXBklL2KZGlRXHTKQU3qqOMDdogSf2k37eOf3Qi3zGEUF27X3o80W
 1n9sHksn6pT9ZLoemO+9GDmyV+3j+eKrZRX28sta+LIFpua0998IQwIQ7F1KRFTcwtJYfm9GuGm
 TMXIcJ2EKF7scPlkiwVXAYTHa6K2Tg9KRqnxHO1m5Y9LrSctkxV/vuc7R1+zQuk+0BB6JwUMgxV
 iWuep+VjxioDxXw==
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
fully compatible with earlier SM8650 variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

