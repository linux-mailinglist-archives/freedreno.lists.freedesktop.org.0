Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D49F4E58
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 15:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C9810E9BA;
	Tue, 17 Dec 2024 14:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nJHmIABA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DED10E9BA
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 14:51:30 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43618283dedso52842965e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734447089; x=1735051889; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OJE6jWewYLR4+WwL69RNcPxwF9+nvRISCL65MftveMw=;
 b=nJHmIABA40++YR/IO/2e+hT24CcqGdgjFloWrLZI5htDphADXGt4p5BAVgUlvGHf7o
 6BiPkyqulrOhNXsfRKGvhOLTTMEZL8KS+t0jZJoaX5fU2WxqEIpz1GMYRJgG46ScNkVZ
 DjgP/GbeG/IkR9Y5go7c4AUiXM4Kx7YZt+n/Jiu2wolEnE92O5qMa9lkqofIzSERg2xd
 yQ/TfnxiU5JITOtBxICrGGf9MyS/oh4qK7vuMkZbhjRTCkuR4MOJs7SU2d7p1J3hs5hR
 M57qfMTnAs+EJontRNpaxN58cnAdpepkBvq0ta6y+pwK3zXa4/FKqdu+huSx3wX8B3Yl
 AOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734447089; x=1735051889;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJE6jWewYLR4+WwL69RNcPxwF9+nvRISCL65MftveMw=;
 b=lSGeB64n+zSzfE6h7UD5N/By8u15EnJmn0we7UX5xT2WAQyIV16EnrMbKFnmHOFDz6
 WWEp7pmqEAG/h9eYwfxnfl9+Mo041vd8B4pQWoH0TfAf63Wu7e7MYk0Q6RSF/1LRKIic
 9y3/THy6ZplfncqjDf9Rx7rmfactoI+1vp7JgNTH6U983/1RrenExWKFEX/xWrwQyz19
 g9Rnb4SLRJCLm+wZlPJkGaqXhLWJr2InJ6xhP1Fw3yaj0foaQXlS9xodjpWHXrNgNJ1X
 dZ7tFugyx8nfoyzStI0iUI/Cz01RYPkoaFdzoHV3UzwH8ZspeES7DksPr6mCWenIo5wH
 74uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMy4eRLJMEMRhBoBqESRdkd3zhwCyvx1xe+LRSE0/NBhPrKZwLi3nSzSXb6aOeDEABDlj+uG/Sw28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGRRyrIHJzq5iYfwhl2dXLPiuXnwxyKk5utrTiFxa+8XUSihmG
 h76xCmclD8LSJ2D8EdO4y/QZrdmFGcktnS9TnvBJtmtqxu7MSCz3Nzioz8FXh1w=
X-Gm-Gg: ASbGncvW3VaD3V4VygQ5OQ4n7gqm2ohDPLTvWGXFn6kvx4K0oMtl5mT66NtSYXyamIP
 NH4djbMlPV283l6/+0w02GnW23LDYwgry7B6VJPoMc3xak7gLnXOxxk9lKtM/GFbwkB+A71kmSO
 HgcpKFkHmFlei/S8WKcIbPBTvzrD7IoSg2u1QoEdLnmQjvO8+nmdcQNt7w8DFzJmfJvh2iNmlhg
 tVDCCbKq0wUstVOD5nu5en6K9AvgtZe8IqnY4QD5n0cno2NqlLxVXvf9y/S8PYUnt38NS7/WQsd
 Nw==
X-Google-Smtp-Source: AGHT+IFUHbbW3BkUovJZZOWhbSfd7ks4S0Ah5TbZBB34UYpxXhgyo5k1ucB7eyhgyysOJiFAhcz6IQ==
X-Received: by 2002:a05:600c:a011:b0:434:f819:251a with SMTP id
 5b1f17b1804b1-4362aa3a029mr169784665e9.9.1734447088961; 
 Tue, 17 Dec 2024 06:51:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 06:51:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Dec 2024 15:51:19 +0100
Subject: [PATCH v6 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-6-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/odnHxZWWHGZfFp55MjWvpXpUwEvrIEZN9FPq1
 IpBDrIqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP6AAKCRB33NvayMhJ0QfID/
 9uMLHn4VVbaJkMk1lETarrEfDU2ckUcBSIrrTfcMAWM4YcnY2BoD6AimxgH7fHmfXp2ahVg3FYkkth
 Gdhsu5+hWloM0tY1K1mgKDPXrkW6X4lri+6nMoKV8/i0/5HbXBp1NaQXX0w4CB9XhIZrQIFGm30u7q
 PosUrvdbxK3vq630WCHhcBmRSBwLomeR0bi2Q0WVa+t4W0pMG7BVrGj0RfbPj0fX29vWNW7j7LgNCX
 15HobnWm7M7GzSjTBJjX7cMR/txtcUrlGz1dOvAgFWDundZgEIwOwfdcnqNISi72DzTrC5lt9UODiO
 1cZt1Bqvl2IFrExK/RGF1tokvIvKomqPFOCSQr6/Fo4BkdboeaPos0hGDoaNoCyZZv3JJsPwOCM6Ji
 UblKj3kilaprVUOQqhvTTwhZhNPNXTgq4bvoPgVTJiPoPX8pNOcMgiOET1JEKGZBVb/Rl3sGK0uSBm
 ZCg5Opcndo7gBGIBNM9wZkqvLBzgCW8rz81oypXZxmS7dr5UIpmYuVrav2Mk8RT2lm+VsHjsQ4eETo
 jKbteo0PmfHfpwr/8sMSDnMbbGSVDYiT1b7dnL1mxFwvBqpKF1NXvrCSFLm4DI/mMEqNZTqpn67z0r
 HWxyHdHVD/2vDP9vmdAnMaEWiWQnKkZvUo1XPkBEfx5GdOsL2MP1aJpHE5qA==
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

