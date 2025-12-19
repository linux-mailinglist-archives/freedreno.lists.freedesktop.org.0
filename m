Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893E8CD0ED8
	for <lists+freedreno@lfdr.de>; Fri, 19 Dec 2025 17:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518A010F04B;
	Fri, 19 Dec 2025 16:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="VtGWlgCS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D8810F042
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 16:41:25 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64b8b5410a1so1587828a12.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 08:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1766162484; x=1766767284; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e2Cw2KB1P5Y6mcnQJX0NULNND1p0iocVjya6HA4fgP4=;
 b=VtGWlgCSZW86mrsFJUt6/tZ0UEx0sgvTvM6+sgr9JVn1VcMX4t07UnC0n2jyyCNrTH
 n4e3Lhe99DGOWc9gAIzgS5THdkINW6G1CctesSxl7VtdcdbkwyL0uU7KV6aOaVlXj+/m
 z9+chkyp5LOjPAoQhof/dPuj9VYoDac13QXObA/MNr49+dMX4m0rfpYlH2PAaRPauggU
 cecUkwG2sSVbT70uUy/ktSRlWaosGmsrjeKQd46pWo8dlmXucux5s13vsqGp6qKj8UGR
 a+GjW1Q5+H7OedXe/jqjKkWOqubhdDE5n4uN90hlzOuCBqzwVtFUpfTCzpRJYhHzv86Z
 QyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766162484; x=1766767284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=e2Cw2KB1P5Y6mcnQJX0NULNND1p0iocVjya6HA4fgP4=;
 b=ix0iAruaQfBCSE7E1281ORm5Ib23ZBPF5mDfHZGjeMy5CUaZ99S4SjvxcNlW4fv2Kt
 6rUxqEntyaoMGbIRx8AJoca+0gywaVWUiELQvc2lKwh7J9UhffwVm0VJt9lt1T1pw/cE
 OMcXZKjtoVAQWdoBO/LSf8Pm4xkjKvLzIHHx0B0+g5Wq0rbe6vRf/AgwWuSbOyFcU2JD
 qY0oldSo5shv1Frs+gCUnk9BVrIHle2Ac1ChzVMFAG5uRtrEbeNZpmSyDmJVp1UJqI14
 wUu1CEAQwbEdhwbeLS+golNHZSKhUCbUVN29LRkgSd3BnAX+KUquCZ7Fz/3jvWcI3Sb4
 GrBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7BGG4u2u3TMLEk/Pszx2kp3rPvtHj1ntTkwo83vH3HHFa+FMdykNbLSK94Z0usYyeYVIx8s5TycY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcMq7VRgyv9xFfNtTvA5xnmtGgC32f4nE6lZLgtl0FHba08fN2
 hcT0wKLLoSjlCMpuUneO/smFHZy8BLofPYk80DN8Zb0woFNsdNKfRS57djGc2T2vzCg=
X-Gm-Gg: AY/fxX5WHleBFZcI4Th5ke9M7oVSTBPHEv/s0WKuWUAhnDS4KyL+u0hVRXvygXZB+D/
 crpjQUJCeiSDvihO1Je4AfZxiGn0XlSSM14rx1l2eD3fx71LM5d09tb550yVGCkfmiI7TUP6ybR
 KZQ9deX9CHeMIzaiaHztdscvXxsWGAotQ4+voZn7rlrU2q8K0VIA5yYdkwGOMBmU94QRAsUgkoM
 G3QoPjJTXWablgPrHZVZeIdMtDoIUCN8DpHydLnThXXntkTkRkeeUk02HRBcloFQGfhN61ioKd1
 lViwFIzgOoqqBzkmY0hsk/E7ARqcCAYHuay8/ZFldDnzLntTDu0gouSJq01U6/xOKeG5QTtX2Rr
 B3+WgPbWJV/bdn5QefhAXsw6yV7BorzuEmd4817u1yU53XX9Y1AROIHpjKRHc6Vh1YiWByIQVnm
 DQcTuE4s8z1udTt/A27jMGWE2h3vR64QB7sXV0f6c5kqR+RhqNy249yDb4EBNesB5PT2564BYrK
 X1vxT2M1xpkB6dhg/dskOx9ifWwIpLOTnk=
X-Google-Smtp-Source: AGHT+IHcMyLakLOiabV0zgp9j2BbCuOpJ/ILNqwAtFawoKOVX3o7aGBaAA9adOk/BitF1e97wb/uow==
X-Received: by 2002:a17:907:6d23:b0:b7d:266a:7728 with SMTP id
 a640c23a62f3a-b80371f8f50mr342762466b.44.1766162483979; 
 Fri, 19 Dec 2025 08:41:23 -0800 (PST)
Received: from [192.168.178.182]
 (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b89:c600:71a4:84f:6409:1447])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 08:41:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:12 +0100
Subject: [PATCH RFC 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-6-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=2578;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LbaF66ke8LZxZbzBSqWF+LbtIQHMEYFknVPL8JPpg/I=;
 b=Rv0hSkSQEMyym7EIZ+cVRBj/6SP1f7dhM4pzbEWfaCF2YNFHzOP6VQw+YLffiycuav+hx1xjB
 GC1ASefj0LAB0zCj980vbPgQ3vI8SRE/lnefKNNv4uybbds++qyTiBv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 71 ++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 92b40ab56c26..8cddab412581 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -612,11 +612,6 @@ eeprom@51 {
 	};
 };
 
-&dispcc {
-	/* Disable for now so simple-framebuffer continues working */
-	status = "disabled";
-};
-
 &gcc {
 	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
 			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
@@ -725,6 +720,51 @@ &ipa {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,bj631jhm-t71-d900";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vddio-supply = <&vreg_l9b>;
+		dvdd-supply = <&vreg_oled_dvdd_1p2>;
+		// avdd-supply = <&pmiv0104_oledb> (VREG_OLEDB): 5V-8V
+		// elvss-supply = <&pmiv0104_elvss> (VREG_ELVSS): -8V-0V
+		// elvdd-supply = <&pmiv0104_elvdd> (VREG_ELVDD - OLEDB): 0-8V
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -883,6 +923,20 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	ts_active: ts-irq-active-state {
 		pins = "gpio19";
 		function = "gpio";
@@ -910,6 +964,13 @@ pm8008_int_default: pm8008-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio129";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart5 {

-- 
2.52.0

