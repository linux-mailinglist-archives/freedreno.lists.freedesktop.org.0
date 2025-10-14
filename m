Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19509BD9624
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 14:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A2E10E5F2;
	Tue, 14 Oct 2025 12:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hbZlR/OJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471D110E5F3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 12:39:51 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso46100705e9.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 05:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760445590; x=1761050390; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Jr7LNKVjdtViBKNRpmGFnlxclR+yg4rYU2bymPMGPFM=;
 b=hbZlR/OJuqtKg4Jec8O1Vb6o25rHq91FO7iljFxgiMzU+nLC4nWz35z/GcsCWolo7f
 foQVNmkCd+BLfBouPZB+1v8sv93JLiro6E+XX3EY1zU8bwJs66naZGxpnjeIchf4CmGa
 evoE1OwgCyWsN1oupmPlyrBoh7x7i0RoZK/WGo4L2k/hRL/iYfeTxL+7/X7ya68OsntR
 8jUfCuVc/K92OAoVgrC3ynB+klSgc1czK2MJpScnUo5HoGzEBNvtzFxzptoeB79poLWf
 KDMkmzoMhpePIwHxVA+LfLFlH9o4dHAmChhOhTUbXGipzx5hiQ5FCCzw/53cRIi/6JPd
 B3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445590; x=1761050390;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jr7LNKVjdtViBKNRpmGFnlxclR+yg4rYU2bymPMGPFM=;
 b=WxlCUIta7WW0YH3vRS46sAEKfmc0UlbfeuY06dTdGSIidLi+UM2P3HqlqP3lxFBeV3
 dSy4iA7LZlJYxnFrEe+SxRxsB82lQTllJEbaIXFLIaU1YS2o5098M/nKu+XsTp2lxF3z
 DfQLrgP1VLbbK9CaKE3uHSjWaZqB7VMjrpwo1bYwYmLeSPWzf4hhA/vjqstdR0Pb014k
 1VyhH2Mc3zXqdsBLVPA/W8oHG0TfXtNhlN88UzOn/9D6vhEmF0xPk3/nZ2w3908QEO1M
 dz3Epr/8JciKsbP14ssMqL3S+4Cx4So8IVrYLaF+dcp5ig61XCiHKaIpAOxcSHzODZiU
 0Ddw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUS2Qr5udHk4zVNdRsTNBRuGVPe1Hq7Li6tKWyWOHCEzbrxcIp4SI+VsoLGd+5wyAttFYoYe6wBd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV/e+rYXh46IaHNEn+/xgBMb2OJOgZMD9U6B4xvkajlIgR9Gwo
 4nzXFBsaPfSXYNA0FggUpbiDU2imBS26QlVyDSZ2MvGwUbQbD7I/J7pk7KaYjBmBydI=
X-Gm-Gg: ASbGnctxVRIvaV+50RhMskZrWStOO90pG9UExpA9tEKyLjdR6wxH4DJXwvvZ5RMu5JD
 DFKK7nMXJmm+rQ7A4vFvvsIIjyt3nfOrI9ZQpbF54WVaM5C0d2zdWlhTvKjtamaCehfcm3IsGvE
 o0TUF1sPk57RUDtZF6Y49sHcfoqTheDXEnMnIUT/NcVcu5hRFpUDb7jIW4A90EzC+BcBotbDyti
 zPTKHHWiTzhYiVm3+QTTmITdHAuQJbjGc4CngUlfP1hF++sqkAjPzQAjkC2UUXkj230JvEwCk73
 +aRJn6xclLMqS6keEdvbLSWp7W21NaGIL6cMJVJdIASRuR1tgkKZT9sf/CHK4893ubed8CvJU8Z
 vYNIxYekDrwuz/wxEv46NCln7vRqoEE57ZrbEdcLueOg=
X-Google-Smtp-Source: AGHT+IHAXgms3trWgiDz3u55yLhtlw8BrtHFyAYkIq3bD8Vv0swwJtxLa54vKVKdMEk/wnjboazR0A==
X-Received: by 2002:a05:600c:529a:b0:46e:37a3:3ec1 with SMTP id
 5b1f17b1804b1-46fa9af1797mr169031645e9.24.1760445589676; 
 Tue, 14 Oct 2025 05:39:49 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:39:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:27 +0300
Subject: [PATCH v2 2/7] dt-bindings: display: msm: Document the Glymur
 Display Processing Unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-2-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Kp1VLU4+XFZTkZgR+tSxksnxkxtMD6rynYbzEXze+LI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kR7zNKJOIizYJYTJbed1F26+5ZN3nJ4Je/hH
 Ps12u9TJkCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EewAKCRAbX0TJAJUV
 VhOPD/4mZHHz07jsa0zUshCH99Xrwc63SDUROmR8zffg5Wx2BeQwNJQjXZ59ZokT33sQYBsW3eG
 jHhBaHhD54ZQ7hO2wc1x5AeeMeD2Rdnr8tx42UvPNvTDX4a1TrMs/sNgEmCU/rO3QWONz29A9r9
 Uf7x2QJMXMvjm8bYx26tcYl6Dq/eCgVBy4T2jmvFdB/dqXzE8EV1bHEStTOya7FBEaj8JdqpImL
 3XkYN2FZcRwRh/w5PIy7wWyNS7yaMCTUezh1BMfDhS/F+kVuNvYY1ne8kfWnWrFWl4CcfVZFEy+
 BMbNKHwJ0ogGaBLwQYkEYkbiUZBB0q1CSmQ5k9IOFTes9MP5ufN9261LWTh/EKeG97Og72+k4w9
 9XZTqun4G1auZA8Ji2LHdT5myLBSdDtkqK09j1MUdlHzg91aIlnREuhga2LsXNKoELaYC7rkoOV
 elQAHm7H9EU6F5vogscetdkcfJ7lEu4sjzNWc1XZhR5yf50VSvrMZVnl9aoZKBqHhEc87Z3R4Ru
 BaF4nGknqkDaTYNXu5SimEWFag3fdtaQGNkNpjC0d9LKu3NeRf9FwzzMqSmf8hahWBc965HHdK8
 fM6ULYEEFI6M6sm2Orh/2m971QNF35kEFfuKzB+QmALQu8O+fBOAGc6G4w3tFuI/9FQ6Za7do8O
 +SkapL0bx7k3maw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add DPU for Qualcomm Glymur SoC which has very few changes compared
to SM8750, just enough to make them incompatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..feb1b8030ae0e381118a9482252a915199e19383 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,glymur-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu

-- 
2.48.1

