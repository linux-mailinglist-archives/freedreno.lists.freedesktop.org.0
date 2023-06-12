Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D783672C9F9
	for <lists+freedreno@lfdr.de>; Mon, 12 Jun 2023 17:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F6E10E2AA;
	Mon, 12 Jun 2023 15:26:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CD810E2A8
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 15:26:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f7f4819256so33691915e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686583606; x=1689175606;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sY1We4qYQqoWhZd32M3qvVq9EFogwk8bUgcdgefUaYg=;
 b=xO46XRE7BYWe/EfbY6wcZkB3U6p5d9X5EXp8ragS1lhxK31LazDv4hU7bN3OnM+gFn
 Ihj44nO5+jKvRMVj0G8FZ9bCyRF+cBPJTxrdyEX3445Zli5/KL3R54UENUdfaBf/4VeA
 s0RPu1pgFJPBfLyuzCw+qrteBY5vFYayWHO27JI1MSf5AlinnSLSZDR+bNojzGbUBWnK
 /m0SB7DtJT87BzH66k/6k4ztVu5BG2lyxqXrsk+UHNSZo/a3au/4dsgm7kt+RXd6rtLN
 Y9oyCa8jtV4PgdUydVejLFaohtkAVTGPJLPHJiIRtaeWu9/TJRBM8I0LfFABkX3t1iIT
 bKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686583606; x=1689175606;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sY1We4qYQqoWhZd32M3qvVq9EFogwk8bUgcdgefUaYg=;
 b=CI6LiUZoRKp297aw08CMlFqXDL6EZ8u9NZPGb9WGqyqBhMGO8DNEZa59yLw7/S0KLu
 lpNY9gA914p6etRBMI016cnhlbWjtfieVbV4gLnldLQ5qseKKD1ZP5v/4UbGsrYWF8zm
 2JQ2Z5LTtvwy7tFYadzpNGkl+BI1IaABj9h/aiXDv0AcR6qqi46SQLzJFELdPjiLjS7A
 /pMUfJeXt3jT+3cEybMC0Y1p3/5x6rq4FW9K8G+mAPh5BBE7JCUXdgj/BIC/6KlfRwge
 C3feqgaS3nLKqzNNvmjd3RURc3KHVO+ftuGcnDWYigdIb1uxlhfWV/YWFjIYD9trRDVs
 yZCQ==
X-Gm-Message-State: AC+VfDybfn7kL65KwXzZ+OawDN1ZVAKq0Qivf2R0z58LqhwgVncysi5W
 96mH8CYAgzfXS6hZ913e9Z0vmA==
X-Google-Smtp-Source: ACHHUZ7AJhHIT4+23AOmIOGAsw8aBe3JSM0uaMJrpR8I2kybMX2jiPfxkkdFOb/2r09ShEbanL5qQw==
X-Received: by 2002:a05:600c:21c7:b0:3f7:3651:450c with SMTP id
 x7-20020a05600c21c700b003f73651450cmr7038638wmj.6.1686583606485; 
 Mon, 12 Jun 2023 08:26:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c28d100b003f080b2f9f4sm11816344wmd.27.2023.06.12.08.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 08:26:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 17:26:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-sm8550-upstream-dp-v3-1-5f9ffdcb8369@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BYB/JqR4EQKAABvrcd/B6Yg5ojwBRjwkuwpOgjg+m3k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhzky3j48nlFxUR7q6e6n0RBmK0/W8bxM8NQjBPYi
 39tFOpyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIc5MgAKCRB33NvayMhJ0XzAD/
 4sjfXJNHCbiYBzhHPy6V44IogIGoSDHmunvFjTq1Mrtywm7O7efqplzmRUBtlkJm8gKm1FUuUq39gS
 6RLZZ5vDBUNLIHfkR8nQCu2bu7Lt22wPoN3IULvNQbQeTQA9HqN5HSKnaCQNpCDyKKjDgESvCiYon6
 3GrPUi3OFXEtohqhBVI51eY6o1OUaoDV0LxCzYy74jtK7sLjE67xmo8Gvuue9+QOQNXbCFZDtjTEGh
 Xn3XvDs5iL6LKZGWpR7AYlpQfYo/nD1NqcQ8Qx3K6Vc5bvQ637CxWwpr4Eo5X4Y5N0vXe58Uw4kJQA
 ClVvH0082aR88pQEq00D8EKEhyQxtx1ZRccVzW6T229rfPq3U5Wty8UbJx4sTGAg5kbx1KpkrjfYk/
 c9O5g07je1tuXf2nZdXK+NOSKaVv3yQLRX0RPxpucsZ3rg4jHhuAmQHYwsxMc5PMgKgtnM4i3sl3FV
 sM41PRi0VXpcG/Xv0Lew+aK+jWDNp/UuzKtCdULYNM/DoYx9iAhtmqLN2VBqMR3LPQXf6TFYydFdTs
 7y2ibe3FUayjQQCEGmOcgqpsrbXIWjXtoXLqJlBlUiF6JPbf89CJeNJ9llzHfwperMqULMhBbbz1e4
 eWLkqZpOAi2ZNnVK35+1cAKitdLi1fiZ/SY5LJx8dD4er65Qbrnh3tXgF9LA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH v3 1/2] arm64: dts: qcom: sm8550: fix low_svs
 RPMhPD labels
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

"low" was written "lov", fix this.

Fixes: 99d33ee61cb0 ("arm64: dts: qcom: sm8550: Add missing RPMhPD OPP levels")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 75cd374943eb..972df1ef86ee 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3649,15 +3649,15 @@ rpmhpd_opp_min_svs: opp-48 {
 						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 					};
 
-					rpmhpd_opp_lov_svs_d2: opp-52 {
+					rpmhpd_opp_low_svs_d2: opp-52 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
 					};
 
-					rpmhpd_opp_lov_svs_d1: opp-56 {
+					rpmhpd_opp_low_svs_d1: opp-56 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
 					};
 
-					rpmhpd_opp_lov_svs_d0: opp-60 {
+					rpmhpd_opp_low_svs_d0: opp-60 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
 					};
 

-- 
2.34.1

