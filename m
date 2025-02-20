Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778A6A3D7FF
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 12:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5392B10E940;
	Thu, 20 Feb 2025 11:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f66OCZ76";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFC410E94E
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 11:15:13 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so9118521fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 03:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050111; x=1740654911; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9X5DqzSWRf6FCwakTqnI1Z6ip+HiUbF/QIcptAcLPLE=;
 b=f66OCZ7625BYtXJaIHbCtHrnDbF5CYlLwrmXM+rI/pfV+A3CpEMazDHZu7ZaRHnzcP
 JqbBO0/gmAV2y9NbztL3e5mhXODxASDCeyEBzWIA0xWjWqOKfKVqjqJg3PHO/uTBcI0W
 d1Xfs2vyiFQaaSZcnK8VbDaZLSaEiaURUWgECGwDjkVOdBpD+fK2nCaaKno8Q6ATRfuD
 M9hOYWx+OF3CpSxRkrF57f+qmOGUixsBJAN68+dsqiPjTxFVckFlwiy0KHcrih9sgmdd
 q1oRtbFLaxu5mltY8m6rg5RCTp+7E/9lYdGimRySw3LrvcZV3xP//Hr24EPibGWzKOjc
 VAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050111; x=1740654911;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9X5DqzSWRf6FCwakTqnI1Z6ip+HiUbF/QIcptAcLPLE=;
 b=WEDLdP5FpLHzDTnglW80dBS3c+ZQqn2Td1RESfNTT7WuS59yHIvDc3L9bWBaV2hLZ6
 +Zz1XShC+4Yi4ayWKI9a8TnOEBDSqNzyP0JfeiOURzN34AC4+57mun+qg1oRYZDIgclK
 N/OE3Xg6ha7ODKy/hUsBYW+kvrIa8J6R66uJ5gxs5vKHU4dtLvT8T5TGOJIfTkHXgFwP
 O3kp/aFGo7G3fgX9d/E/kzr97zI28e58AVvw5edRSX04V0wlsclDfUQwAKm7QBgYrPpK
 3rDxq8xP3/mSDkBws546+3JDWdh6Bd8EOEga7HlJHc+r5j+3Ai0FNInFg8uudAC6E6Wn
 3A9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp8oPYJ5we3RnFlMPBMsEF+tHF5DZW1FaBigJPx36izxXsiWCZbSgX28rh5yG4MZt4J/BaIlZcSYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTn0wOAwB1TXiaehkk8CwKpfqducnOKLwqh33PUEYUXv5akSrq
 g9wo0SOL23CVQhSwvJ403wc6XEDFPENIgo9XDqZ4aR0bTCt6wBJLx7ToC8K4gmE=
X-Gm-Gg: ASbGncurjKqwmDFFmRZ/3jL/5msIQyZ5Dpm1RmNkmQXlI7ZroktLIRy/QUDQDl3+EWR
 pFuBcQRjnUV77ZeLTUAX/UJMQHT7YDO9QhzQ9R6xMcOStLsUp43i5pG9xe3YMe31dfctDxaFabu
 j/jhgn55WYqKrqBcHtHJo1QV98osnWCAqGdjRx4hNcOqs0SdCddNiSapq8biO7tGsLzumjof0nv
 FPkpBqlILjVmnQlwk9QOqCP0dtThuEGdKBNJ1wq692jpOCvQOTj5OVqujeDHTih+iVcMcuzWLtt
 RYXm+RDmdh4cY+q4oIo33Yk=
X-Google-Smtp-Source: AGHT+IEBrH7t5T3Pj2WB/YKjyu6Tt9mfV/BJf6mygTdxQLlHJOo6nI55pj3svLEpB1+vdLAfNkGcnQ==
X-Received: by 2002:a05:6512:68c:b0:543:e406:6363 with SMTP id
 2adb3069b0e04-5462eedb651mr3405483e87.3.1740050111516; 
 Thu, 20 Feb 2025 03:15:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:15:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:49 +0200
Subject: [PATCH v2 7/7] arm: dts: qcom: apq8064: link LVDS clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-7-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=d0CtcQf8Wv3lL9BY8WXV1YwbKLOoSAl/tzsPQ0leEnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6sydCzdr3lq263K0JOQk4Qc0tnyxdU2wME+
 N15Skc4LBWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOrAAKCRCLPIo+Aiko
 1a22B/4pss99hBOLDX1XScPaKx+olriF4M0K8pHizkh00Z3WXSnIrKWJXBFmoeXMv3qVLJGrM0t
 XYV/MGe18IURcZhSkygCpi9HvJpgzK1QVEW74QVH9x9GSMrWQba0SLDX1XLzOdGYooiBB5mUI8E
 EuXd973XQNSA8aWj4ilqqFrzPvd+O7wYJPNC8s8WnG7Zt3Gz8FuIW5NzveuDEk4+d2delGqk9PY
 Nuxg8zf+Nxh9tMnz6to4uG9vp3dw8eB62vBCBvfcsgEzqok9at27cUaEEKlbBieluMZ6W4HKacr
 IO+VeB/mBl7Pa5mhesh4KgO9VbWqQ5+a9Jc65SqVnFSdjklR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Link LVDS clocks to the from MDP4 to the MMCC and back from the MMCC
to the MDP4 display controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..b884900716464b6291869ff50825762a55099982 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -737,7 +737,8 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <&dsi1_phy 1>,
 				 <&dsi1_phy 0>,
-				 <&hdmi_phy>;
+				 <&hdmi_phy>,
+				 <&mdp>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
@@ -745,7 +746,8 @@ mmcc: clock-controller@4000000 {
 				      "dsi1pllbyte",
 				      "dsi2pll",
 				      "dsi2pllbyte",
-				      "hdmipll";
+				      "hdmipll",
+				      "lvdspll";
 		};
 
 		l2cc: clock-controller@2011000 {
@@ -1404,13 +1406,19 @@ mdp: display-controller@5100000 {
 				 <&mmcc MDP_AXI_CLK>,
 				 <&mmcc MDP_LUT_CLK>,
 				 <&mmcc HDMI_TV_CLK>,
-				 <&mmcc MDP_TV_CLK>;
+				 <&mmcc MDP_TV_CLK>,
+				 <&mmcc LVDS_CLK>,
+				 <&rpmcc RPM_PXO_CLK>;
 			clock-names = "core_clk",
 				      "iface_clk",
 				      "bus_clk",
 				      "lut_clk",
 				      "hdmi_clk",
-				      "tv_clk";
+				      "tv_clk",
+				      "lcdc_clk",
+				      "pxo";
+
+			#clock-cells = <0>;
 
 			iommus = <&mdp_port0 0
 				  &mdp_port0 2

-- 
2.39.5

