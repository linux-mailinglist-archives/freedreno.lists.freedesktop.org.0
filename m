Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54EB9D2D33
	for <lists+freedreno@lfdr.de>; Tue, 19 Nov 2024 18:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F004C10E6A9;
	Tue, 19 Nov 2024 17:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tu9o7Var";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2335B10E6A4
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 17:56:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso30816615e9.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 09:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039017; x=1732643817; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9QLp1s6RunFlEIPDGsvb0lHzi+DB0IAKSMWyP0xL4Qc=;
 b=Tu9o7Var83nwEXQXzvzHdMAXnPi6Ec8Hm8gLsdqs6PneAvKWH7yJ07O+4WIXRKpVZn
 47Rnu38+mz7qikSsMtUjw2gwP82Pozl5aho0+6AOt7w+imk3oEZJnrR1psOHcgOg0tQ8
 1Ai3wicZ7Av31MNgxJmIdTPZFX/TpUtveedh5wwUDKa38ltzzVsiA9e6VuBT/XPxBhFZ
 jINgr9utuJQ4P+5ji0zv6KIq8jUAiaVNxAjeBcycQpJviM0wBxfwpTX8sIEklnx7GGtk
 EhfUucGtY6dnliH6NxqlqV5Nwk92exjwUgOS0oq5Amq+MIvJc6F7vsXM+ld3FlWkn9g2
 IHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039017; x=1732643817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QLp1s6RunFlEIPDGsvb0lHzi+DB0IAKSMWyP0xL4Qc=;
 b=mdfBCnxABC4+MVB6zsuaEtC6ZCY9Jnx7Mkr20Q8HEWB3CMqiLRX123e5c8k+D0pJ/F
 SdYbkVYcsBd4mSjOVVN8H1sWxILUuYFF8QkNsx0QY9bIuoWJ8NbGNm/qDNyAED/d2D12
 qbo94wr8MjOyfSckLlv/RXK5vfaBYpUY1BOhi9gQU1SZalfe5DFR9iOw4n6ylhSJsqCv
 f6/XR3+s2QdUEzdshPzqZf/j69Uis5edoC1z+gdS8g0NCxg8fsPdKfrKg+3LaCXosyp4
 mD2Hdf9/zxkUUAdhwgX7yGan0KZfHiuKyNi5OlJO4j3YvDBfHmTFnMyEZzwJf6xlwix3
 MqOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbZTMhWHmZy2aSOP7DN16dHHxq98OWg+B2Uoo8i4Sw7t2Knfi0/vaZuQiMSbgj0Fvo+ZHtcrd3+5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCr1hLpnHIxY+8+2VhsZeBLDpKHFR2CxC88Me795s2rVLBBMly
 1U6R6cR6jp1RB2kxITg3x1VRJIEQNqB7cmXiT4bGpOeHNuOkljOWtSlO7C1OrDI=
X-Google-Smtp-Source: AGHT+IGVsBGgDLeziU/OzjRWtYuWJehF5iLVaaBSNw6aG2zEDYNlB3n01ca6GHiJX62rmk6DiM4//g==
X-Received: by 2002:a05:600c:4f06:b0:431:5533:8f0b with SMTP id
 5b1f17b1804b1-432df78e7demr126208745e9.32.1732039017561; 
 Tue, 19 Nov 2024 09:56:57 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:45 +0100
Subject: [PATCH v2 10/11] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-10-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xTy0814t50k26n3IdWEnCW6RpXe9FNt3pkGR9JMo8Wo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFbd07WfUX+D3DO8S9DCJmtm3fmLCUXBbP0PPX5
 yQHxYC6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRWwAKCRB33NvayMhJ0dxhD/
 0eLXNGnWTLn0HhT5yDPUlg/ODVerSk5fLn5D0uGYbMNd6xHehmhMi7HzPEVFIlHAqzm0mbVZ8aXz3U
 xV7/qI2EAkv70rCMw9s269YKLo4UBvAc5DL0pflSy+gJaMeEPH3pCpCoRzVahSWTnYnfKEbUDTLaHV
 sO13U/ZkaHm4B3RCHbdglvwFS9kRz5Snqw/kXBzvsFTWhJfO25VsGiGE3iiWOtN3t8mKq19B59WCK1
 aMzFlsensMqpdXOMPihgc3TkDXleatgpi6n+p/shVsUeyrxLvLp0LSxI0fiUCB3k/JDK/MiR4nKNeJ
 9d9YgeuCEaPajGFk/H1MsfJ8HjjxPQhfLzrNcd51u+dJxlOOSqLXdWAfNDJFvqJWLd28yUSBeclw3j
 iGerbFp9eGbfn2PNDJgA73NmDT/e81goHVXesCs00ET40y5TPrcvq+PN1hZ6H4gYId4QVmNioMIu7Q
 cvFagAEBfgItx/18KTFIxatu6J8x/f4ZSetvCgU3e3tUgrHi5m2Av4bMoZkjn7pVnlycEXq2+bAbVy
 L8Pc8dHEGHh0+EZPumH9bYKCUiv85Odas2Mg7k0HrYcSRGIULlh7XMhc7j8Bi+o+KQLwc35xsj2+Pn
 eKCapM6aujBfwjSimn9B4NP0SvuYrtbyAe+AjnBKhhEEu3q6wf0JpwBD0LWA==
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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f8711e01934e47331b99e3bb73682..808dce3a624197d38222f53fffa280e63088c1c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2113,6 +2113,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2126,41 +2129,49 @@ gpu_opp_table: opp-table {
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

