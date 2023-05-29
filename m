Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1833371491B
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 14:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B710E283;
	Mon, 29 May 2023 12:10:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF5C10E283
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 12:10:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f3a611b3ddso5438589e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 05:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685362215; x=1687954215;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l69CNvwsvVxOdGGpTP24kCQnLR92Q+STYaVRxceSaVE=;
 b=YbyxlReB4gUoqN2+Uux/itPBp3PjRZlrffduJWaRXZxM9KKG30DePhV0sz6Mjv/ib6
 ybVp6lyLlt1ETOMC3+gZ4+1unKtQ0vkATYVPWriHtOaQ3AZUdVdPnlPVbCAuuD/oeemB
 i4CE4aHYXZRpCEtKYJMg/y+7ZYrqwHPoK5YByqF3dtti8DS5PdDfVOkzPGM+0SCgk3UY
 FP11aj+eC7T0d1DqCc1yuJHvlRNIuAm0CU/FZ6SQ6HwRPyjmcrGsSSWURPa6XU+ibxUE
 2O8pDijXUBCexo4C0Odpsb87iscgLW7ggGcFHbGF9JpuSJ9veh9yFcORMIaTV4cyjPkE
 VBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685362215; x=1687954215;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l69CNvwsvVxOdGGpTP24kCQnLR92Q+STYaVRxceSaVE=;
 b=E+2HGX5FFRv5xDCfctvsq7qG3C+UfmOdkddoWNOK2744sTzYMMfnnPTuukCgWmNK/8
 Qyyi+wWu4Vi65UqEs5cN6DMjh48+yAwV8bN7u8ASlj82BC5ShBjv9QSRULoyKEVBmc7G
 8av0GocLyfoChc3lIIKleWw3aATva9GaQ9A5FxX65Jco3mnQAHxUqe9pZz4nlqAxARSP
 9cf1ABTphC70bDJ6BbUwS2E4j73Zz/+OJQDtseNmcPJ+gpyT3X1Xm/7E2OYGN7kT4wTO
 aqdG1A5SENsTO7NxQMsBck4V64PFYU4+JZXXooehXq/70aNlRFAxZE1Sd5u7pzOP5lIY
 RqdA==
X-Gm-Message-State: AC+VfDx5vBLh0pcfi2OKXgPqkrH6xHiAZL4IPIt3BsOr2d8exoXfcWOa
 h3ZT7Yq1FINmwQ0Mm5s323HnlvQYRX+D1skX3Sg=
X-Google-Smtp-Source: ACHHUZ4SLO0EXLJHmvPcuzw7Gf9skUZZu5F7ieOm7t2Pa05aSNTcrQE7t9swQbgYoE0bglE3+lgHSw==
X-Received: by 2002:ac2:5581:0:b0:4e8:487a:7c2e with SMTP id
 v1-20020ac25581000000b004e8487a7c2emr2935379lfg.14.1685362215610; 
 Mon, 29 May 2023 05:10:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 e18-20020ac25472000000b004f4589808cfsm1963021lfn.300.2023.05.29.05.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 05:10:15 -0700 (PDT)
Message-ID: <6c79b99e-cc69-8cd9-c990-5c0373e1f09c@linaro.org>
Date: Mon, 29 May 2023 14:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-7-679f335d3d5b@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v1-7-679f335d3d5b@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 7/7] ARM: dts: qcom: msm8226: Add mdss nodes
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 29.05.2023 11:44, Luca Weiss wrote:
> Add the nodes that describe the mdss so that display can work on
> MSM8226.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 118 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index 42acb9ddb8cc..182d6405032f 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -636,6 +636,124 @@ smd-edge {
>  				label = "lpass";
>  			};
>  		};
> +
> +		mdss: display-subsystem@fd900000 {
> +			compatible = "qcom,mdss";
> +			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
> +			reg-names = "mdss_phys", "vbif_phys";
> +
> +			power-domains = <&mmcc MDSS_GDSC>;
> +
> +			clocks = <&mmcc MDSS_AHB_CLK>,
> +				 <&mmcc MDSS_AXI_CLK>,
> +				 <&mmcc MDSS_VSYNC_CLK>;
> +			clock-names = "iface", "bus", "vsync";
One per line, please

> +
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
We're not using the irq cell, is that necessary/should that be 0?

> +
> +			status = "disabled";
status should go last

> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			mdp: display-controller@fd900000 {
> +				compatible = "qcom,msm8226-mdp5", "qcom,mdp5";
> +				reg = <0xfd900100 0x22000>;
> +				reg-names = "mdp_phys";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_VSYNC_CLK>;
> +				clock-names = "iface", "bus", "core", "vsync";
One per line, please

> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
Would port { work here? I remember one mdss component's bindings
didn't allow it but don't recall which one

> +
> +					port@0 {
> +						reg = <0>;
> +						mdp5_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@fd922800 {
> +				compatible = "qcom,msm8226-dsi-ctrl",
> +					     "qcom,mdss-dsi-ctrl";
> +				reg = <0xfd922800 0x1f8>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi_phy0 0>, <&dsi_phy0 1>;
One per line, please

> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MDSS_BYTE0_CLK>,
> +					 <&mmcc MDSS_PCLK0_CLK>,
> +					 <&mmcc MDSS_ESC0_CLK>,
> +					 <&mmcc MMSS_MISC_AHB_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core",
> +					      "core_mmss";
> +
> +				phys = <&dsi_phy0>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&mdp5_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi_phy0: phy@fd922a00 {
> +				compatible = "qcom,dsi-phy-28nm-8226";
> +				reg = <0xfd922a00 0xd4>,
> +				      <0xfd922b00 0x280>,
> +				      <0xfd922d80 0x30>;
> +				reg-names = "dsi_pll",
> +					    "dsi_phy",
> +					    "dsi_phy_regulator";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
One per line, please

Konrad
> +				clock-names = "iface", "ref";
> +			};
> +		};
>  	};
>  
>  	timer {
> 
