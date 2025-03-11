Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604C3A5CE7A
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 20:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385A810E672;
	Tue, 11 Mar 2025 19:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AziB3rCx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B0110E66F
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:28 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43ce4e47a85so4141385e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719747; x=1742324547; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FX08Ji8HI3+KbtFLo37LoGENRgVWTP1rrMFXfNP52RU=;
 b=AziB3rCxj8FoK1GioYIV+E5Tkrl86OuKa5WMo6cSv3+/7In9CKdD983Nb0veyJtDO8
 iaUK81UXmkYYBCYkXz4ckWf8M88fXYPGxRgjWoLH6qs80Q1DuiZktfl/pSAAyS5H5Izv
 JjGn7QNZ92ZHKI77TyeQjOMCNe66Dtsxo2KIhuOJ91PE7E+7DXjTwVui7sou/C5W9EfM
 /bHfdvtPxKurJLcWG5OdVBR5Ayv1olpFZsOrijqt2U/qml+ilz26bOws4xJ+oll/RhJ2
 4CWPWCrgewWHW+A16jrp9FlTBYMWWZlH5NTg/dHUCy7wTJK8P6Mfu9LnirI4cke9+/2S
 vO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719747; x=1742324547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FX08Ji8HI3+KbtFLo37LoGENRgVWTP1rrMFXfNP52RU=;
 b=jScVP5LzqeABdvZwcgGy7lTueeKK/WsSOfj6CF/6QF/gMktIGp27U1uQbY06D7u8WY
 bJPGG+HpIPf6AXqIKbXnFvOZeCjpX/ROeP0vosm2I14k9lOuS2O2LSYkwcVYj6dqKR1R
 8+cbnfYLCTFmAt+h0FQrLEvOysLpuoHQs/J3L0sfEZ1wNC1RQfpzPabTyAZsTg9MMWvK
 8mq1kN7PAbQ4oGf+K8n7o/U+Yqx8L2b/bcsS1G5yCizwFlrqj03PmLn+YnHFXwPu6yhK
 5faIUI3dMqOnhp3lOVaOVV8Y1mQpzGy5d0cNAU8rwBOHrdItwxvj9cOen4oWVeRY8Gfo
 MYnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb5UnLXGpvE8Oz4QCR51sTNv2vU5Mm11o2h5zr9+h1Y4qfu4AehcSQvYiJISrWj9F7AjmSB7TbccE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjtu66m4IozMR5rdaK5ZoZ/2IHF55yxmkaG0Qfy4cRU00zpiPO
 9S28g3ErQBNwSdZy9PQh75bxs0TSlYcGiI8unX2fMUk7//WTJhIDgT6LuUA3Kfo=
X-Gm-Gg: ASbGnctMbQEwIbyignrHya+wtvmq0rt5EroJzPLdBuVC1N3CNg99ILB/Yh8Aj7WpJ9H
 Sqnok0jN/qYLYBsKTWO8MCSI6yDktTT2NFjxtwGznQzKL6FiAm0xxamzPlZPLzcpk7xvTps3aZR
 aauHVw3zLDlkEuVBNShhjocQv2aAxzu2gpiyUxNhnH0HvZt2YZBwYxVJMraRh6Uo/AiC8ZZ06r4
 ncJdj1WJXwpe62mwdIW2Wg+wnk7gp6J34JxGDWZvn9J227IGzkChea+Xk1fvLwayvnvdF3JcKCU
 zIo/yedDrEH9ethiOynMMMydoKA8nnVAUVY+cP48B6uxd8BF5GrNG0JuChE=
X-Google-Smtp-Source: AGHT+IE2n0MfJYoUab/sCdFT6aJjrI3Uvq0aDb8rnqdRJQHOYDQUaJhfbkTymsdz/VIXrXgdwkFI5A==
X-Received: by 2002:a05:600c:1992:b0:439:9b3f:2dd9 with SMTP id
 5b1f17b1804b1-43d01c305cfmr25909345e9.7.1741719746990; 
 Tue, 11 Mar 2025 12:02:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:54 +0100
Subject: [PATCH v4 04/19] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-4-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vM/Rhh3m/LDu1luem1JmpPvieCwNMZVHKpBxAm5wGsQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IiocmK7G66FTqUKGat1Pcxqrslw0gSJB99AE
 o+CCOeaee+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqAAKCRDBN2bmhouD
 12fHD/4rXszGtQ6+BkcqOFgb6A3GryEXr2IaxtUfqKrWkKyjYlq6wvQ9318mCdgZrm/DHBVqdsv
 G4JWx+ued+V+4MctrGrkeeITliPnnPVgI4BkWhbQa6gRo5dFGsVVbKZwcltpk7gwrB58tm/JYzx
 L+ED/1OP+uGKSfM+rJfQgnnppTAn7JBefwB9maqx0dyXfT0eW0AIhEVZ0omaz+/fVZFKGaM8Ylw
 JXK6UPuVxjF8LVr2wxXYt4efqgWX2vvhllxTuq6xZZdTtYjDPUVQDHYWoxkv1raZyDuBstdG30k
 oJelobea91F8Vo6W2q+PvKNCXz1msLvAMT8nkfPXxUEtORLp+2Mc+dZm1HB0K85ZDrH6pcJydLs
 99GEHJBeOOACp0gJU1GUfobaMGDmEpSMdGZMhsaH/njw11yvmOgh6rT451cXUhm3+MomAwV7FBw
 8anWN/cwJB3/XDiohxwhhtC6JsK+ep7FuwAT4XRx6uFBTvtiKvZglVEvhu5lKIXZuK/k674D62e
 kwxHPFO51rJrApDv3bh2nT8GUwYnFcyrT9nsMi0svF0N6ufaEvducVNJIk03srOfdmeSoAKtiYQ
 FhbFbElPjWiu+9yp59id6Zxx9lbs6tAkto7btoGFtAzKPiHqgbRd7zeI3+vkadvc+rhln9vBFnj
 NUBdxpqFxUTm+iw==
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

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.43.0

