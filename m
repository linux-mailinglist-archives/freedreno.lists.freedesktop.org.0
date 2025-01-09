Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43546A076A2
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 14:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7EA10EDC1;
	Thu,  9 Jan 2025 13:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="voxUVeZS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDCB10EDBD
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 13:09:51 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-385dc85496dso37922f8f.3
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 05:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428130; x=1737032930; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4C8lFM4usc2WCSKaYFakQWoC1zk+7BImjfAxgt/bKlA=;
 b=voxUVeZSN3IyhK8bYJhbE+uFWeN8Hq3zTn9XlDFjXd41GCfbhu55dhToss+X9pTdOC
 KcD1A5JNyfJwfnblN+wx9Z2bx9VOrgNUAf9bM6Xj/A/eTiwETIgoq2zlHszw0ZMLGu7t
 buN/ChbpaYuPxCsUutQFd78dzz4zXSsXC3Xd4snR63A+IKtra/cLJM5MLBU74rdNRMDT
 vfbzTsx/QoL5ypuHFaON6Rj09/6OJ1aJmouezuklZjU15cGYVwffB5eeJUG56QV5TfQi
 min2neTQbmTIt7T8dRbveti7S5XdI7uJY08K4Li4Op+8zT3tnuPBBunJB6oKmiv6Py8C
 DHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428130; x=1737032930;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4C8lFM4usc2WCSKaYFakQWoC1zk+7BImjfAxgt/bKlA=;
 b=A9rj67OkCOvQF3PVPUYWaRWLV5RWeZrcVKeh9kaVcxWzTrjIIhi+hIoWxfREWo94ij
 LOiOWl/7nJmk8IShmk4No9MLg1VyOVZ3igTb3DusC6xpLqz/8NqbcEALdJfwm/8iFd3M
 iKAFGKUk0R6zLUFH4aRLSNE4f+9aPqCUeJzOxk0GkKT4bZwJtBntrrENpWdyVRrWE8OR
 yZ32BZXtjaOIM66Jc32nHlvVqvVQSxKZ7OuVdb5i+/vow0SJgO+/UsCOuLrwUtvpQQdg
 l1/3+aeek6Z2fTlQ4U3E+wIlEbtKrlRNeZOdMg/w44WIs540jJNXRUxeKxxy0YIhKIbR
 jF8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAjIOQcu7mgoYodYDtztmA3pDJgAO44NRkYtWP2mW0O4mEeFOfsv3hls9+qViIB9sat0VpX3fRf7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAEZJfWaxvXIbA/5WU42s8b7Hy51q5LvNn2Fvm5phWQUXccW73
 jV9FaJyexzHUZWw8PsDzOAkA1lF8WDfCpYcdzRM4/ksrrriQutdB8NrOzlKFnb21rNst+JPUj+n
 p
X-Gm-Gg: ASbGncsucT96LJeHV7YEmS2XYTonI4+eqluFkTcj8D/b02GBWfyOc+vSH8qWoYjxmRx
 YlIfYhg9H9CiC95QxxxJWogxHzt/86ZyRHcIGeuU1R5kcnjUh76ZBIxTVXbDbo2caKmM/q5DvoO
 hcDz/JNtUJDj94v+n13L4fYUHhT8jsq1R8K67C2h0L4t/gBqUexA3cb5OgmqOlE3j5BVTAcSMbd
 v1BsisxIk6F7eMej3hwcs6hUV9unLxe055VVDvH88ajrGwcQnomSlo5HbgLGsFO4yqPzPC6
X-Google-Smtp-Source: AGHT+IEUQcwvPKcbMIyP5ZKenACaYFV8nmJntcoucqUL76PjNvM3RVPBbc04BbNpWGPXqI3Qhp3mCg==
X-Received: by 2002:a05:6000:1ac5:b0:385:f3d8:66b9 with SMTP id
 ffacd0b85a97d-38a873122f8mr1918123f8f.11.1736428130154; 
 Thu, 09 Jan 2025 05:08:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:30 +0100
Subject: [PATCH RFC 03/11] dt-bindings: display/msm: dsi-phy-7nm: Add
 SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-3-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=e0kdcE7yovOEd8OkvRzLucewo18gCGxr8FZ8czNmUJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pSigc0AOsfkJ1vj+FW+h4c8exWR+2AjLU03
 XWEbwBbG9CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUgAKCRDBN2bmhouD
 18w/D/9j523hP6tsD4X4WpxZoWwq7ujCH3x9l7dPbgGmHHl+HyR+0usvRdMuj7f/q3ivtb1FC6N
 6tN9mdgETOhx7VB97ygMjvjJ1QFxhK4nmjOEmoe/Krsy3Zs5HOeWscofNGoTD5Zpi8zhR1t735y
 d/RLYaGNjybkPSXgeb1rgK2kygDY9TwMX/Ar3qJXk10HzJ27jmpc075iyX0kVywNbBX1hwivVc7
 Q2NvlUl+/Ph603mtdOK+CT6V3sgWaJbqAiUe/cO4UvM4kbvG9fTAt6XAKAVbGSL95yTMpIY5/H0
 eilgDltfq1/4fi8V/l1IfDz5LLZPyFXBJ45v/yu1xlViobbDzth8+kFSmBE6CIq8UNw714il5WJ
 L2hgMqP2+/YrXKvkQt/KjC3tqr7OtM7k+aDChiBqvk8Aa74O9rFRtkIYzmb1PXgLcn/Sn3x5pyW
 t3O7e45CyXFRNshgaqgq4tgOtQyDS1DV9am9enzibdw1GGc1rYWS4UvNaQWDL6rfyJdtIYIXXDr
 QKRcKklKuL2q+rrOZCG7UUYzqoY/0NoJ03aoJrmx00bbrLXtzMlqv+sHJWtKY/9ULc9UsHqSSDm
 ExSklXiwEDeHUUhVU+TvAw3M1wktdjJ36KSvMu2TdwaJybCjTRWMsx1Sz6d3P9oQzyrCFsqOSqA
 gLs4C6IxVhpCPyQ==
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

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 7e764eac3ef31829e745673ea91d4135921d61e5..e356a65a97e901104a29ffe8e5ac04dbaaad6bd3 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.43.0

