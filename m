Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DCAAA4C2F
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 15:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEF310E798;
	Wed, 30 Apr 2025 13:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yrE9kZMV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729AA10E79B
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:11 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-391295490c8so479438f8f.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018070; x=1746622870; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F6gCmCTf9fhJeLeRlyqxE/da/koMwMWDALPPwEDJzQU=;
 b=yrE9kZMVgghP+fEMJ29xwFX4wLupxZHWEcQ9ZgKX2PBWiXoeI9lG8YG1IFw9oJzTCY
 3WIiyI2TvmAJ8wK62da/KdomRW+DR1inApSaK1f094+tG7ft0lop0tGD9nGmaapgu0K5
 UGfo4dM2NDwrengx5/SKfD4AV8yVsNvQUGHvwUysg8CbOWfLDgI2Q1rOtHnYIf6Cu3pt
 uisu1TcwEL5RW+vLE79ysd4derMP4/vDrryvVlvxP47Tu0hcAgVJ1gsWkVj/NmKtXzE8
 xJnjpyMivIEXjlz3rPt0AaAO0Rl2kDum2R4H2L2+uqkUA+YXrNRs7dCF97o3dVLQi9KN
 7oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018070; x=1746622870;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6gCmCTf9fhJeLeRlyqxE/da/koMwMWDALPPwEDJzQU=;
 b=M8SACVbOElQMg+0Y9WLCLlB2KqPIK61Jfl95V8aww0wG1zJrIOM/QML4XtZKHU7XyO
 gPvyCLFZSsiaDqEX6eZ7YRG0eqa9/A+AnbPjMMn3ghx8jv7hlMeQmkWcMRMKIG2fBVIx
 ryDDqvu35FMVPZ4MankjEAUr25BXXW6at9MkT1UM1hfoIMdvqhry+Qyzax5SoHLI5Q1n
 LaUNunjX2U9YUgulxTerPhid49uJjNbvTfbcJGeSa4wdUmmFMLUEwvcwc0wDZUbq3bDC
 DkePUf1MfZusIymIqdMF4tzuohj3Jmj9K5/Kq0LymWT8hcS6hpdVHrKnjSV1kg5I03VK
 mWAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYbLjTevg4ymaYqBd2G/XDPuxuFze5iwEH0Y6/bpCbVMPVblGo27eEIsQbIh2HzXkp1wuL5AxOq+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4XhbjdI5UO53aHoCjZbuD1ZhtOD/xAS5dZJJvvWrqxHXp8I5Y
 bnEi06cFLiyit4B6cI41buHYeJacV2y+NS3y0OwjRPQWBzvsftsTuGnKEAv5jHE=
X-Gm-Gg: ASbGncvfvQGcUaQBK73r+rBDq9ASzsjI9wXjgEBm3r9DbsXvnOICVlSHdvsVw1ffVev
 A8na3vEkMl+HGr0JddNm0BvVdGgR6+KEN99DiFrRIgT53L0ead3xrrG9JFupE6rFeFn9t6Aj5UF
 ApgEXt79uHTQ2z9LYztLpDgkhkMcfIrkOqpTRBTYjeuWncxXIjdgulEl4GDo16S1qiilCQITQ50
 b+cyGOfTg62Sf5Ztu4svnRdDwUksLbDT9Tt/zGWMioTKJhrpgAHLb6NZ1Ec+L/InimUm9Uzq1KZ
 b/63b1DTOSFNtSVsx6nnZ0MYJxtLngrdayl0lCHqk9HAg9ljQUXImLtQY7g=
X-Google-Smtp-Source: AGHT+IEVgUlmrLBnvxqbwa/LUtoMOM3hDEY1L7MbBEMnMdxIfLiTgCeXpDac1Fk21Uc5r+CcXiaKsg==
X-Received: by 2002:a5d:64a3:0:b0:3a0:7d47:8d7e with SMTP id
 ffacd0b85a97d-3a08ff7216dmr710931f8f.8.1746018069194; 
 Wed, 30 Apr 2025 06:01:09 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:31 +0200
Subject: [PATCH v5 01/24] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-1-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h4KR3WnX0MpzZeRbCF4d1eyLafzyThDf4gmxGutr8Tw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7zKshEp4Q5qZHFef+w5ypkEzUmWV7dVpRJZ
 ewDM8XJrw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe8wAKCRDBN2bmhouD
 1z71EACbQ2OraW+4hnjm9Npk2+TB5ZWYJCsNSLyybCHA5phKCLlCGfHFgtY62sFOaFj/RU4ew5n
 xyP3rTZO73eGfUICcmPUFTtlQD9C58INJxLSrYwXXE6MXx/HCE/pkjwC5n6jO4iZrv2UshJbiK1
 i7rznCiMAUPiH35rDDhWG/PCaGfQjsGB2pkgL05axN5RUDqvs7owv9o7aJPGkm9vF2jkWu6xpCn
 //2jfRn6N3RJI8xCsH262B+7hpU1gqkTv8tvRVARpIph+fnqtRIl/UgAwJD16TfWUO/ESa97t5U
 Fq0AJChbIEtWGIv0CSheWLDVkGlGeYt/dFpBfM1Dc1YPXcPq1TiFybcCGHWsPEbnZUpCF0l2Uk5
 bmAb+vlIOlJFzQOPQbl8en+XxBz2tNIWLy07aINr0SyxGXY+9iGXj668LBCUxA6b/sa2v/F/WsT
 el9tAU+N8Kcr/lLTri1EN5A8bnvyKvW8971lbI3JxrN4pJChWeIPlgAw94VFYDmK6+qqpMe9GTv
 /sJcc35uAQDfbnJZM3t3UAxRDQGBQU8DOcwMa2pthlck9xds3XNBAPlo3ep5BciZayeoKNpQKJ4
 GoH73cOa+Md7U2TxqEls0p9VxxgUMgnGX2seqfJPcOb3ximzCf8eTr2CjgeJilIumv+WBA/phIM
 jcwslAE4AOUFjnw==
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
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
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
2.45.2

