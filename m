Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C38F9E5923
	for <lists+freedreno@lfdr.de>; Thu,  5 Dec 2024 16:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4B410EEBF;
	Thu,  5 Dec 2024 15:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qo8t2r54";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A2110EEBB
 for <freedreno@lists.freedesktop.org>; Thu,  5 Dec 2024 15:01:29 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-385eaecc213so558269f8f.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Dec 2024 07:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733410887; x=1734015687; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PE4EC9PLskFvJMahyM4wT4IIkBhlmTglPbxea814APc=;
 b=qo8t2r54xMpAr93X1Ce+UXjSq4mzr9kq9SkbKXJVLuxw60FRvC6gRYTwAaWCjYCA20
 e5hSC+i5vdgsZ2dmta0HuAU7EBRK2k2MOjRNBccifiTAlR7sVC83k4yAD5nZo3/6oA9H
 8jHL1ZtEx4s+T21KwTafKABWct1CYSUNiKEm+fQ+JybVWaHoFUUSIREI49pgYFYd2H3Q
 hiIH9CLXevghsOxA0Yk++jD9ayT6zJJRtec4gCD7ZNel21qNoXxWXV7ujEiWrvIrBITj
 i4S70LfdTibjHgi/+Ap/TFYmtvpNsGejcf1kZ0gOGBDDeYMtZujAoOd4Rqh/TGG536sX
 v6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733410887; x=1734015687;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PE4EC9PLskFvJMahyM4wT4IIkBhlmTglPbxea814APc=;
 b=QRW6hALZf4kX0xwjcOLDHeENKQ+JnadvU9YExjjr5VH6xgW6vJT9XOAe7ZOPA8zPAx
 2RV4BgdkeqzKKmfAC9zaiz3Dj1ZQ/e9CsdjXF1gdQX7S3lcmz2XqDUAHVvSUGDN8mDOA
 qCw2Qbc1A9JEhSoE4FgglC7bErAXuI5OX6iQRF0Nffln2Zu+CJZ5jRNgBfb7g++r+/57
 F9wiBY0xu+CC7biw8hqpL/CKNr2SJGiQZbIUV5aGAtwYBIg4hkHGwVpg0xBIf1s+gOVN
 eBvqm8guOxDiN5shpWQ1kvyS0/AVQgr7ftp8FiyhOOMSO8yjX9RfQEv1SCmwFQXfeneN
 sU7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs+fVFa+FCtbJtmpN3218FPvBNMoWBvfBgG+TJaahW66ZPt3YrBAfM7CAfaVbRdrFUwHogZ2lT6Lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4GqehxVnj8fUW44HvP1U1aZezhcSTT2ROsiWFINRX8q40CqP5
 1EvJL+MzSAwTr5hZsHmT7/FYJzYA36lFNPYScJzNmYEc29obxhwtNtFxMCRAZyQ=
X-Gm-Gg: ASbGncv6U3M/NryfQBUFCnl3YjMOeYF+YarU5/YNBu7mRpTOeuEZVrSBM4oQrOkpQ3U
 +uRKfOuHC47g4h18wpzuWkwOqWO6d7Y3c5tJQeswbJ/IttU3frwzGHyzYQta9WimUD2QmyHdkvI
 +JaMBstMM9HvFFuxC6NTnKkyH8agLyIKhiy71jWeAvaPBZgoWl6kUR7GoJ7riHOa06VMkKTQnQi
 OwNMIWI4yqJGQiptY4tX0ncdsmKb/gnKqGne+OejLHEnStZkJAyN058TqWme1qUscA2OCk=
X-Google-Smtp-Source: AGHT+IG1XEFDu3IE/3HqjxQTBBrt8eu9bg3PesPAyjLcHPehuhNcC0WrhOXXAhfrJuVWwx7+BGIjaQ==
X-Received: by 2002:a05:6000:188f:b0:385:e986:416f with SMTP id
 ffacd0b85a97d-3861bb5c367mr2698569f8f.10.1733410883551; 
 Thu, 05 Dec 2024 07:01:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 07:01:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Dec 2024 16:01:10 +0100
Subject: [PATCH v4 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-6-9650d15dd435@linaro.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
In-Reply-To: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RYPtTEAzI0OGTqfRzA/UycF6LcmmOXWAmTfNgMLYnHE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA5HvZp2PHgJlyryi+bTlFLh+XAS6Z7umgDCPSr
 Bhe+qHaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HAOQAKCRB33NvayMhJ0cEQD/
 wODdnXV1Ywe5zB0yYtWBWkIJkMscv50bJFauXBQDQKrsMlnPjejHnvtOexsT3FTdUsR5N8k71mCRN9
 9pvwbmwekcJEjoL0ovrpHX3rehOU6jX2g7ZhnrCD6GdBG0FwIwOclO0aqKC4d3tmYX57jjNiUsKW8T
 D4MWl64KScJDqO06jfZnRQpX0EVPONidZlTW7rHieBzdy9hmVLZ2VluH+FZ8u2kzzP7jeccdTKNjFc
 q6x7uLkv238qH4vSW5Ro4n/TJYVl4K0UOVK7TdhZhJ4HV88DKaAVpi7TSMmDjctxho03QbMFdHssnU
 6ucz3F1UBqMhBPfTTvzJli0Gbwp+RkU7pN4RBlKYDVCZs0BgBK1+ikourUJ5u4SiWxkgBYZ9VOBaqY
 d7+fRs07Zqi/EyRgDj4wIFj3h2UuUAWULqBqo1N0W5W8KO12D5tpD5Jgmi0/QevxVXxmm+5dlSu89A
 nx+o/PAXzLZb9jxI5aRMntBpSsJ17umoBlY8dtst9Z5YK+MLCL6qRRgBCfGyfHLyjt9YrrYR7JujMk
 n753RCyZ/lYtv+ubjyo0cqP84rNhuIQtOyyvIwixKTKuQuuOsKcb6BfG/8gUyS4AWaryiQzh0JSsWJ
 F/mMj5GEreNQ4LWT0+gF/xPUyuXMM7MwyP74tm07Jn9XZBDXc9QNmGWet+6w==
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

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..955f58b2cb4e4ca3fd33f1555e36a15cfc82d642 100644
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
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6671875>;
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
+					opp-peak-kBps = <6074218>;
 				};
 			};
 		};

-- 
2.34.1

