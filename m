Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E997ADEF70
	for <lists+freedreno@lfdr.de>; Wed, 18 Jun 2025 16:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E966D10E872;
	Wed, 18 Jun 2025 14:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RJbQ97de";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858C10E88B
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 14:33:18 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ade33027cbbso100806266b.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750257196; x=1750861996; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
 b=RJbQ97dehiSS+1uTDAwzI3sBh6N+PpAPW0WhkKU/VuAnA+2nSvEqt2IRsnkg/QDSxG
 iw8yUo9RVOntqFxbgn6WCL3j8vCMpITFZbDwwQ6Mit2Sp2PXwEkoMP4mUGttA01goHSc
 LAg4DumNZ25KchMgp++QKLiD9RrqIQaoIy8jxdR9d6endEvY1XbGmdH/QOwdcPDr7hbt
 ahMdFoLbx8dSXMRo19UdLclgBFxiRTzyMZRyveDw0sqCT0TWElhZtqpQC93iRdu1CSiN
 e4ZT9TpZ7UOtpsvO76lg5mWTkM10uQlyjgmHE2FxdEbgex9YI18hzMMUH9nIlx/Ob4tD
 ioOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750257196; x=1750861996;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
 b=aMhpmxzBcaR1baHEuIvMC4XNqPbV5O9t1ilxYiint5zhy/iFPGWA/AZ70VNyDP/+mX
 L0lb5WiEoJixuQnrc49EbvAOeNhZA+2oowDzuui//cVLb86n4pTidhg9zcVg+0gyEQGy
 2bkga3x7Wj9VFqouQjyKaA2WYKx2MJc0pC1shr81o3lsCmASFLsjZ6mWidNDxf24u2zu
 OgteNRReJZKfddw56DBDBV7FlZSZ2QSBYMCSOC3hMVtv4cJIxXiDjQpdSXHgqV2G9nlS
 oItrh7tFqZxqIeuxfN5dIZxkSA3juN7xoz6DxQkD3WlOhDxtylIiBoFDWHda3DnKe6Dh
 nBNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoIBwKORMbXOCrm+CdkGK1HChvZbGnGG20h9nNjH0xvkDP/ff0A8vPWGoDk2HekbKeKSQrUJoGBTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7KVCG16SHGIDCJmReDh+Gftjbp0KjLDux9ShH+ua+vX1eOXlb
 q7QvTUJImNKl2UjqCMQVv6jyfG6r/GozCEU5QKQW8HJqm608ryoxJpZ9QF9FdRUDERM=
X-Gm-Gg: ASbGnctlSDooOXhRT/tfCu05sqFlcoY4o7cayBqYCRZiDCPLQlmVg53lrFNdSucmyyN
 XpS1drewO6Qg7r+EtD05C3S93HKBiEgk0XNh4hM+4Nz3NIaC73t7q8lOLK/OR02QwkjseyzCvJn
 bCdVDnw7pLxTTANoLEjhqr69Hf9AHtTcTKLI0mOEHUBKKMNNdgsbOvXq97wvq1JW+4ilr1k9BRF
 5Op7kt/LdkjMZsTYXLa4F0XjvXKOIPXNHeZGDAZjPH7zc9okrmw4vuTg0JFkztc7PwNbatDeQId
 G9SYWREAEtZK1NLy/h/ywizek4D27eNUxPBlKMipvkwLJlhiP9kwmbEpTzf0UB00ZbObpjbkhbd
 0H8SGg4U=
X-Google-Smtp-Source: AGHT+IHXnKRDR3Ql5qmBBMwJv0NM899ZSndO0MgBPTy1nfGVrxEeMqChlf9unxqDA9c2qxWrRaa+yw==
X-Received: by 2002:a17:907:86ab:b0:ade:9b52:4d84 with SMTP id
 a640c23a62f3a-adfad5230b8mr605074766b.15.1750257196488; 
 Wed, 18 Jun 2025 07:33:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:33:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:30 +0200
Subject: [PATCH v7 01/13] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-1-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6p3gmVNgeWpM5P5NgnZSHUvO6bicpNKcBnOP1+C75sg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4a7XDxGu9sj2aHu21RSAfhGgELU/Bw0aAYI
 wskTgq5XP2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOGgAKCRDBN2bmhouD
 19AgEACYoVeVBbfztNRqMn55p6VM0unzlIT/zvVGJPIR60HXWSs8IAfhOiu1ULWx3FCuSzyN5s3
 r7BHv1Qa1j5NYR2ckxCaTDjrNMtXMgJpihVNV+3y5kpgS9yMh6JOcxDqPKW0mTTUq6TVcH2u0Ad
 FcjOY46mcxEJeFs/U47eBlLhmniBp4/xUmCTmyFXbCkblkcLrbft8bmU6igMAwAuEtw37bdUIXk
 AzMq3+g9IHbEG4GTSyGvXMltaLTVp7A1jBHGmBBCte3cHlYwaML4H4B5LQz11y/U5AKMbAzd9zz
 4ZP6u5/qTCXt6V8oi8XKE78bpLwBexSdP3igQKKqXYt90rNOTHBUiMMqrdwbwK1yAE3KbN0Uj8y
 mdje9ZrKQsEzF2uVWDUL7FJr2C8B7aMSZSPEbHuWs0rc43xl5FSURBDr/i4ilKhbgHiaQDDyMJh
 g4wqepd/deZRbWir8IWaFaAa6lYN9wX+hF5KO9GMu+h2txpBKn3WCajyOntr/8Wys/AQXePcZTs
 q3SFC7JNPnJHFCOpboTihoiAx+5uPT7qEf9ghpZo7UJ9Byl89c8AOAH0ibzdaOza6QwbgQQ14s+
 DpYSk/mNy7t5Nzzvm7H/wh0OUw/WBFzvpKNTDJnFpxU9KH9hXreA8sPn+PxRqNoLjiJTYOphUUe
 31VaPalhhNu7/kg==
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 3c75ff42999a59183d5c6f9ad164023d6361ac07..1ca820a500b725233e161f53cbbbd59406326876 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.45.2

