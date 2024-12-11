Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89C9EC743
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 09:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F2D10EABC;
	Wed, 11 Dec 2024 08:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zoXn7ihi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4360B10EABD
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:08 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so42467765e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905807; x=1734510607; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OJE6jWewYLR4+WwL69RNcPxwF9+nvRISCL65MftveMw=;
 b=zoXn7ihiEu/O33bE+NGinDZJsdVPiEcCSWSdxX1Vhb8dIxHKCirECafSkJtxvUZOiL
 i2sTnwJ+1Yx6xvYh1WBpX4hzURoZYVM7EbypWq4szAkknSYEoJKuCWqwSqv1G57cyN5q
 20ywkIY0ipouSj44pRJpyO4zES5SyfAS/b1O2eBpesI7/nXZ5TlQvQi9NtxhOcG+0gUk
 oYUJc8CSMuwhD5cuxBySGXXZegfJNhrVDIetpFaPz0pHz0VrVGnvIFjJmTSgQMkh9876
 cc7vhVNtLNf36KAMJpkg85xscJnixRS7aQYZVsvRe/cOBPKts/m1oMs7+XTjJeNiUA/s
 oOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905807; x=1734510607;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJE6jWewYLR4+WwL69RNcPxwF9+nvRISCL65MftveMw=;
 b=BsMhf49mPW5fmfVezR8CTE+iV8RoX2xxIo3/DhXIbnTeIpVkcSqgZ8+OW+WlijK8Pl
 C0qfmO7GVKN8t1qjZ3ii+gMMLt9ns8skG0UaiDiDeBJrR0PUHchcduCdMRNAeJ9qxHz7
 pSbEFxD5lTmHBJNK5kr52G+VY4akltvop0MT4YYzB2mejyuGoEmpc6/v4ufEwx3Fwvo+
 S4WbMG3foKnShdc0IwPqYaFQAH3l9m8LodR+iHqYDfepkLQ39upC2Di6jeMy7rSc1pQI
 yeiwH4JzTRwQ57+qmOzmnwEgq6N0zHAP/mG1IvaJIcvlrteg7k+YUi7TEo4e7Qe6M5IC
 DGVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZOuBwyY7RA/Sy1s2vHXQw5sCnL7q15ijfq1eDSsAAeWX+kkG7d/dG8HPRh/ckCPM6Oku63X3MmxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykck2LegvBvNP3gAihLHkbhrNs7zlQUYY4vOJeEZUHKMOXBJnv
 UtyUUid1Ub8AFxcEPmFueTPa8GCb7OcLGxeOGhUexH+7acdGZCSLSwaG8BdtcdU=
X-Gm-Gg: ASbGncuLXYjKeR0sbbJ67iV1VNNNvc/v2Eh/h82cZqz90sr6Xct1rIQrSL1FpgWEvVw
 iKt/VUuRPBSNrEbRRN5ZE8KuRRnRWeK46M9124Vo7tDsTzMNjChv5+LUw+RDQXZTKFjjeSUk03o
 Irgfqdhnw1/cNXr+lMqm665Ag/PRcxVzrPRc1VOfG9xQn6dA9v2jLyHwGtGbb5e9PnMYUkHL034
 Nab6/8naj66OIlWXJMhDLcH4yAYiHC4xv6hSbcRl27iqyN9Cve8bZ2lgD20nGxF81J/BfAstfk=
X-Google-Smtp-Source: AGHT+IEUW0/j6mo/cphlP6h+I+zkwofgriHLT9wdAyPVKtEJ1u7lzyZIITwTPRB+Ctkzy3cAPNR3Dw==
X-Received: by 2002:a05:600c:1907:b0:434:ffd7:6fca with SMTP id
 5b1f17b1804b1-4361c34469amr13541845e9.2.1733905806625; 
 Wed, 11 Dec 2024 00:30:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:30:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:56 +0100
Subject: [PATCH v5 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-6-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2617;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TRwNAhGHhGveZJg6Jt3v1KhBQ4NlTPzWkB4It076Q5s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2FA2VPuTGXFnwJEd+MglovyCJPCjTRgawXwdkJ
 c9Lin2+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNhQAKCRB33NvayMhJ0VIKD/
 0enVnSmdAg9FuxyRRV2ix6HrTWcoGkQNwZVZT1c540JRfipkIEbGsWfGAnBVoUl3tSAkV73jOULxZ+
 hdKixrVaHfXVgOW6eAbsO4vW/ebwzI7Ss/ay7OWpxcXEBd+ZwP42sg/QRVpWsWL08e45AJaY0QD6Tm
 GCBUZ2bZyD01G4EbRlIutPvr4gW0uvJPS6jCTi2h8DATZ0y5+t5KkGp27NR1+WjcZptAQi7speJq6y
 PgVREfhvLHtw3rqE1HHPLf5/hVRZs6Yx3B4e7xnfvy1Yrlxdm3vbkdGazngKSjT+MsU0zJx95EfrrT
 6i7WhiMdynEbxPsPWMXmNnNkyzr5AqMaOH5FrNlsdOQnvxau/+X4hUHBvmTdLw24MGMGeNrm4NnJII
 /oBwgI/95t+oSfiSEj1V00jVnZlYeFHgV5T3+ahFWTHdcN7NJZv2PYrJDjn+NEeGhJMEVyg8s6fdAw
 GO9v40k3Ywgb0NM+x9CjiSz/HUIlinU0bGZqC2cb2DUzLuEyWllQKqMI9Ur+J+JQ7tjQcHRF8n7mBY
 J07are5KHIeFi1wsg275CMIBiyZFvJeuRTU5LLnLDv868G5PiFXfsTUHyGdZrIqPj9/rEkppyDpwRe
 MSnwjKhCsboqd1tJ1dHG0y9RnG3f9kr7X+whjnrDI6FZVRgLhsbaijQvWO8Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Each GPU OPP requires a specific peak DDR bandwidth, let's add
those to each OPP and also the related interconnect path.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..dedd4a2a58f2c89b6e1b12d955da9ef8734604c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -2114,6 +2115,10 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2127,41 +2132,49 @@ gpu_opp_table: opp-table {
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <10687500>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
 				};
 			};
 		};

-- 
2.34.1

