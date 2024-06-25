Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48066917035
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 20:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7838610E71F;
	Tue, 25 Jun 2024 18:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t02Mhqo9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278F210E71D
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 18:28:26 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec10324791so71811281fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 11:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340104; x=1719944904; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OZxsbIBefCYoeKy9Cb25bQD5JKjjQqCGKHe9J4bV87I=;
 b=t02Mhqo9CIa1GArLNlfHypmVxpSVsyqQWc6geWHeA35464cbgFOPoQ3XA00xUNg8AR
 +2LHnJh7ysDPrla97e0o6+GSecnnregEFDdWX3a1r4VzXfJD2dfVKAFjBriQcRvjxTzQ
 lDbjKnD5qs27CzV/dIAfOuht5/KTIFbSKrtc/xBfJZEnZQ01/ZBA5qsiPal4jANe7Qgr
 +WhB03WpF6pm2FhbQE/RTDoICAiulO1+kplQp/nW2d9ZdSdVZnfQujgrteHTdMo8UJmM
 g6YCcv/+Q43vJeuaor8yirPqN4aBqhgfQ9kFHXna6w5Sgimq5TI5tx5xpzCqDAtGYREo
 ErNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340104; x=1719944904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZxsbIBefCYoeKy9Cb25bQD5JKjjQqCGKHe9J4bV87I=;
 b=lTpSPfLG2eA+xZgZZCw3DVQM5bLNlSKt9Fw1aj1vGS8dK5kSdVdSLKtb4jcKkM94hS
 eQuiOtM/AEz/9pUEDZb+/z1LLdhgN7ynFsc2oTAl6QJedP4FLwNgpqF9wuKGqGs3rbHF
 HRetieThAz68yoHSzjA6QtRcfQpoKd7dcCIiKZRqym6w4W6G9xjRpHdluAc1CBVJ6mQL
 o7w3kZuIDkHNIf8eR5HYoadzB8vh4LqLNS+SmPOGFkZoMXeatoLw6B+/xCnZ+NkeQtge
 KbNKxYHwrr59uAeoeSowYm9cuQgeX4MZhtujfRzykPyMEY70qcn54dMLE1JtGT+HwS+B
 cFzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoRgomvyqGuAMilotta5T+qgwfbSTq2Rc10MVeEGdNDoBgLAUe0vtgImiCz6k8bviifaRSQaeufl1M+Tuf/2V7k29WGGaToLqrhlo29FKl
X-Gm-Message-State: AOJu0YyY5zH9jo7girXnyGb0JZ1RX8vHfiydWHi32Og22KbQ1Gwtn01O
 60fGTB3/j1C+rj76JnJn9lEIUDycCWSqNhd04FzyzMk1fTjLW4JjJduo/zTf6Mg=
X-Google-Smtp-Source: AGHT+IERTLnLNNHy3T1W68s0MqqOr6aCsT3CWd3e/h0KiEMukzd8w8NKEEGKBwI+4WE9ry1o8Lt2xg==
X-Received: by 2002:a2e:730b:0:b0:2ec:95:d6fe with SMTP id
 38308e7fff4ca-2ec5b28ae9cmr48217441fa.24.1719340103431; 
 Tue, 25 Jun 2024 11:28:23 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042fd72sm6323136a12.48.2024.06.25.11.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:28:23 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 25 Jun 2024 20:28:10 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm8550: Wire up GPU speed bin &
 more OPPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-topic-smem_speedbin-v4-5-f6f8493ab814@linaro.org>
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
In-Reply-To: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719340091; l=2474;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Il2UvibnuII6pAMEt7ZcsOO48MoDeeFboVabC36fJtY=;
 b=BlXBbM1o+PokhijSw+a2fl1gngXBbq3ayq9OQmI+TCgtGvPpsbaOQBkdjIvAjvDF7aXjlDpJH
 esr8rfv+fDKDgRA+7vpMkcyhgkuyqJI/f62VXU0kMJnbmcR074FZ4FI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Add the speedbin masks to ensure only the desired OPPs are available on
chips of a given bin.

Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 4c9820adcf52..c1e3cec1540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2119,48 +2119,67 @@ zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
-			/* Speedbin needs more work on A740+, keep only lower freqs */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
+				opp-719000000 {
+					opp-hz = /bits/ 64 <719000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-supported-hw = <0x1>;
+				};
+
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-124800000 {
+					opp-hz = /bits/ 64 <124800000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
 				};
 			};
 		};

-- 
2.45.2

