Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5B8FB459
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 15:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE20210E496;
	Tue,  4 Jun 2024 13:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="t/NLTLw0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DD210E495
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 13:50:55 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42108856c33so32901655e9.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717509054; x=1718113854;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=96Dvl82Hjo8efzNzsjm1jSvKrMhIPC8VaRY2If0PCPw=;
 b=t/NLTLw0WRe+jZf+WGPadsQZSGbVRAR4xGquniTthyLM9HcNIoip/poiwh68S0vuuf
 WVdWpaCgz94J238Cquf+kA8c542CueqYaVEMNWWtRKZPK+CcXpByyzzO7qeLcUBKjmzq
 r0u0tO9bRqidKE1pBlRy+vEenGo4VswW0Y45z4m7E2rzL6Em/XXjvOTLbCaJQc9NnvlA
 IIOHU60NbfoC9pIDYUtYNbGWKVTTyd9r/4/7mpMMmb4WnWcKEbyQyCyLq+Hhr3vme0S3
 QVQnwxLkOYRgvE/ZxT+ygUvWjAysFCfXJZ0ijd0WvgT4sIKIc41k6vmWXKjNt5fTPqBn
 senA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717509054; x=1718113854;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=96Dvl82Hjo8efzNzsjm1jSvKrMhIPC8VaRY2If0PCPw=;
 b=BFdTpC+clDTZzaQogjsOfOMYzdhsOsjcFW7HthJbPYc7Jxt+/79hOYfygHtuWzw1ss
 MX807dInYiigUVzZiG68vS/cGLVlVXbg03fY70Fdmpito78aXgx1t9qGA8QdFXAYdkZu
 F5qBNoCvSstmy3vA3i7xrptq9z9yZ2xdCQnAStU7vi0k7EyzjVlP9t01Ru4+b8wQu84n
 HeDM7ECJvjHg6/JoYj7XmoieNZry8yUaHg+wKm9gSeFGufvWJuW7vqGGEEJI5DjH/lYh
 fWAoD2ca1a62fQYwxKKC7/s81QQVHFZGTxZpkaKJfxhDvgB50d18cUXOlu1Xtqd2UsEK
 hliw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpN9trOqrcpI2anvkikM2CI1NiNymgjdooY87Q7nXcTz5MWW6YaiuxdWOQWBgqxMPY/9uDmgG3HDRkyeBCp0FcY3/Y58SrkZoTyRpnyI92
X-Gm-Message-State: AOJu0YygOWsz5B3VUh37OXXTPItuf61sVQ/t2OtUnEb3Ql2Acs9AZmq4
 FLtGzLIYnrpwgS4KloZZmjV9DcAp61RHl6mJGaWPNcBepoF2+aFEdcXctUo8yO8=
X-Google-Smtp-Source: AGHT+IHiQS1qEab8CDh9QhUYvRIc9qMluklpij7Hsvm1tty61lkjVQR1crQTp7gzhBw6FTV42IpGwA==
X-Received: by 2002:a05:600c:5487:b0:421:556f:5fb8 with SMTP id
 5b1f17b1804b1-421556f6215mr2242405e9.0.1717509053947; 
 Tue, 04 Jun 2024 06:50:53 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42133227f8asm139569755e9.19.2024.06.04.06.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 06:50:53 -0700 (PDT)
Message-ID: <648b2798-9302-4c6e-9ef2-e4318066d28f@freebox.fr>
Date: Tue, 4 Jun 2024 15:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Language: en-US
In-Reply-To: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

From: Arnaud Vrac <avrac@freebox.fr>

Port device nodes from vendor code.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 100 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index ba5e873f0f35f..f65a76da61ea8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2785,7 +2785,7 @@ mmcc: clock-controller@c8c0000 {
 				 <&mdss_dsi0_phy 0>,
 				 <&mdss_dsi1_phy 1>,
 				 <&mdss_dsi1_phy 0>,
-				 <0>,
+				 <&hdmi_phy 0>,
 				 <0>,
 				 <0>,
 				 <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
@@ -2890,6 +2890,14 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf3_out: endpoint {
+							remote-endpoint = <&hdmi_in>;
+						};
+					};
 				};
 			};
 
@@ -3045,6 +3053,96 @@ mdss_dsi1_phy: phy@c996400 {
 
 				status = "disabled";
 			};
+
+			hdmi: hdmi-tx@c9a0000 {
+				compatible = "qcom,hdmi-tx-8998";
+				reg =	<0x0c9a0000 0x50c>,
+					<0x00780000 0x6220>,
+					<0x0c9e0000 0x2c>;
+				reg-names = "core_physical",
+					    "qfprom_physical",
+					    "hdcp_physical";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <8>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MNOC_AHB_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MISC_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_CLK>,
+					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
+					 <&mmcc MDSS_EXTPCLK_CLK>;
+				clock-names =
+					"mdp_core",
+					"mnoc",
+					"iface",
+					"bus",
+					"iface_mmss",
+					"core",
+					"alt_iface",
+					"extp";
+
+				phys = <&hdmi_phy>;
+				#sound-dai-cells = <1>;
+
+				pinctrl-names = "default", "sleep";
+				pinctrl-0 = <&hdmi_hpd_default
+					     &hdmi_ddc_default
+					     &hdmi_cec_default>;
+				pinctrl-1 = <&hdmi_hpd_sleep
+					     &hdmi_ddc_default
+					     &hdmi_cec_default>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_in: endpoint {
+							remote-endpoint = <&dpu_intf3_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						hdmi_out: endpoint {
+						};
+					};
+				};
+			};
+
+			hdmi_phy: hdmi-phy@c9a0600 {
+				compatible = "qcom,hdmi-phy-8998";
+				reg = <0x0c9a0600 0x18b>,
+				      <0x0c9a0a00 0x38>,
+				      <0x0c9a0c00 0x38>,
+				      <0x0c9a0e00 0x38>,
+				      <0x0c9a1000 0x38>,
+				      <0x0c9a1200 0x0e8>;
+				reg-names = "hdmi_pll",
+					    "hdmi_tx_l0",
+					    "hdmi_tx_l1",
+					    "hdmi_tx_l2",
+					    "hdmi_tx_l3",
+					    "hdmi_phy";
+
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref",
+					      "xo";
+
+				status = "disabled";
+			};
 		};
 
 		venus: video-codec@cc00000 {
-- 
2.34.1

