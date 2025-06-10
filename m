Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D84FAD3A3F
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 16:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5A810E569;
	Tue, 10 Jun 2025 14:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SXbLXuYG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B20A10E56D
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:13 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a4e575db1aso720738f8f.2
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564372; x=1750169172; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
 b=SXbLXuYGDIBCF2/OhBvFMa7No7ssmtISUHBwGlVMDMfjpciVI0hDdelfm+oRQ1S6PL
 0B0XjAi1nE+NGz+OcXMyq9So1JhL7loVqu/9XLwE4h9pgnLZ1ZwUB5C+3NbCF916aAVX
 oSHABwjOhjOw5l0zgOT2RWOE7lL0OQRLMwcD3E/U07+kCTe9iJ3KkVsr62VFWjDsyf+f
 L38rH7GbvFiSMchLvz3apVrhQYdZeOzvBxI8CC+ZACVtqRXrerEVmhxS6TKxWEvW4T1J
 PxdpPa/u0+3+/iHsRjlOHuDZWatg0dapdzck3C0oEimKwM0bmigFoP5CN9lJXjskyaEl
 g7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564372; x=1750169172;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
 b=mmI5ZWmb+RJPjPh2R7GTZDd1I0E/ssAC0SXWumeQQVZsB33P6YyQ3Wn+p3yiIt7Xys
 7a8ylSSZM78mJlGqMKSfiowk81pLFnLTyYwTf0T5CVYpJvV5sfmC81NTGbCwpg1xzqGS
 sTwICFWCsOYjf4ZovEz+UswcItycqCISeoyvgrgrClqddMvWLfzOTqE1xhy5bUwmNhJr
 TPE8yvYnOj9eL+bh1Nb25xWOLwaTwEeKx1flY0m9BjL5N5EBICCghRV9vUmIn7iVK+rh
 tGhoSn18ZPi02TCDvkaBMk53eX00fUXb0WXAMLd2Uh/sKJg1Xl2mkWeg6juSCQy6smBL
 WJQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiYRqUdBgcUpuwo2/GOU1i8AKV6UMP5j/tACXpku9+WPdIqBc6B6uO2YgjdSzn8haiQCdMERcmPt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRk0oCog2ou+xu7f1mkaKlE68uqsuOS2QM7WCr/vrnW+cerKNr
 pT2pPc/pbKC2Fjv92Ukw7uPNawfDESKYNlRFTN1VaNoAXV+Iyz0LzefTfnBh4RkM11A=
X-Gm-Gg: ASbGncsU0Ae8UWtrwEg94O1liBS3o3e4A6z+QcG4HfH3TLRloC19MsehE9ISvtL4MQU
 A/9eXPKjV3JvJRJqulA53+0/cfqRG26s8zpi8y3salPPjBFYw73MYcM3vA/wfKf8qB3OxuYWv6o
 ycmnz60haEW5LGEgoU/U1zKQ3ozVR89TnxRKGrKgZU1b2hQplvOZZiaDf97HYAyx9xADjQxj+RW
 qmr0ZyXzCAn2JKn1eSp6xDSNw6+UvSMd40ptvE9MZc+bjDvO2FvdrEm4CD24G12zgtRPRJ46kB0
 m1XjfRv4zbSin7e71Q8RYZxKP84R9+aKEc5+Fooz4pN4Tf95sj8Mw/xBUhwLfPianTKFDwfJ5D1
 Kpw4lcA==
X-Google-Smtp-Source: AGHT+IE1BPh9K0tsvS2irh9slIs2O8I2IOLea/2GWBdBPLJ7P+lih7SyOyAlCDTffkcTPSwFJR6kEQ==
X-Received: by 2002:a05:6000:4025:b0:3a4:eed9:755b with SMTP id
 ffacd0b85a97d-3a53315704amr4816797f8f.4.1749564371436; 
 Tue, 10 Jun 2025 07:06:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:39 +0200
Subject: [PATCH v6 01/17] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-1-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDu/qPyxSZr5uQgETQ9z+HGRjh6JyUCMstBR5
 md4b/PmrcmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7vwAKCRDBN2bmhouD
 1w0PD/9GgT8PUxfu86n+kcyB03P7Gw4/ycsNaJmnr0wzsebLzXby5oB6UEvkB4/MCKHhdpfDL/a
 rCvIquz/8M7jMhEgVw2yLc0MWBwcsPSOi5z6iTGHLz43eN5J5517ETTrsG45jucq4LgZ928YkKR
 /VNFmPklDDRNd0KZhw471vuGhtJg9/O7GJunrg8CAyJ3igcEL8Xa1E8mG2y9RG2RRffqzyjgeCO
 fp8uDttlMY1wsSc5dmzQl1JyAyBKfVVkKnZOiRXyurhb7i4zK/skjmu8LxsX1nuYO81VWbU0b0l
 fA3C0eob3/kyHYnNqbhWIDjElj0TF7hCB4FR9bfD3FDCeFDCb2U4GcBGVULVfTV37uIV8kNLIhk
 5idnNT7l5NP8UICj6wMB2HSt/wrAMWjfLKYabTLOy3C0Fw6vsKzw6dBg11Qj5+ieoQfWodyUWgQ
 C6AV97Yil29ylhmXcRpw32CoSVhidWRKQ7uGB9Eg3ATYfAQq5ZXgxYqCE68NfIbeMd6rM1HK/LE
 DwUHSLE8r9CMzY/PwbNSo/AQp8gSoWo+bnDne2/YBayYMzpOTQ1t/uBMnVyY6Cy3ssEGcolks0Z
 y+tYb1Wb7L/25zKlBFGwYvb8QAP1/E3ahn3jtAl93W3Da8yDfwC7zmqAfJ+ImEz198M1TOMqs1Q
 COEegQZ5A86rK4A==
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

