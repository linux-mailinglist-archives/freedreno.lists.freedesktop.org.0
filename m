Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9F68BADC
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 12:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD9910E375;
	Mon,  6 Feb 2023 11:01:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2408F10E37A
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 11:01:10 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id l14so1292522eds.4
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 03:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KwRz4A4hQ/J9QIusp/1jXDk64bWoea7Fqenc5+pmfnE=;
 b=y6vB86/boAJml+m73otGVLoTarM87Pjnj7JSie5PXhii0ogznyY1LDXBtM3uBkReEz
 lLio7FhDIT90pPPo5XrypDG64iZB6oJlPO56tiQUF07UuZu4VR7goz+k8EG0dC8PLT6H
 cPK4YTPzN+sL0gI6joEc3TvrRevOmGiL2m9RT/R97S7y25ZsEUlmlwFYU8l4+FOdd3z2
 3zTfKPsAx/J/V5Ko8ixDEmQcskkn1uIZ1v1QtjkwiyUEwccg66yZxGr1b5L1Z2MYBq/n
 +PevY1avmoEneGws9pGyTPkGIt7sGd8mfXWwDHLJ0FyisGzXCQ+YajK1Dm5MYTz8vZTM
 R4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KwRz4A4hQ/J9QIusp/1jXDk64bWoea7Fqenc5+pmfnE=;
 b=ZqU6V7gKfnBhJJJd+hx8OnKU4iedvgDIRgEfp1un781/r7Q0WJ84EM1gFmHo/nKLWl
 TZINDGTKxsXdcB7OHpUAmrdXRHCp2xMyGI9RuMZ7SetrVtgjB6C4JZjSAvMROkP/Ff94
 1si6+UMX90dcRV2Pv67feVRjpGuu6IHiPIhTW5oBUbVTBXfoqPSCXAmanIh5y6hhYKTD
 bM6G8aOjU3EI9ZkS7iBhv/ob994wErsAFm5SgLZnYJw7R3q1Sbj07JPr5AJoYu2jdaRS
 J1Ilk0TJq+i3gCiTSfYDBJE9Fug8xVY5OLkoEl3c9yhSfSk7v3nXb/MpBzl2u8SpH8vb
 AWbA==
X-Gm-Message-State: AO0yUKV9S+uOrp2FcFuLnAxtJJL3Cqlk9VSpfXqlXO9rrh8qa7UY+Etu
 WiBzmskIh1do2MCDN/LYpSDHug==
X-Google-Smtp-Source: AK7set/fY/ZlQZwJV7YWSAn/cECe7mID+2YbEp9fJdmXkb+zQZoxhhIklg46bHsUIgkCchCuox9cow==
X-Received: by 2002:a05:6402:1c07:b0:499:70a8:f915 with SMTP id
 ck7-20020a0564021c0700b0049970a8f915mr17576170edb.21.1675681268625; 
 Mon, 06 Feb 2023 03:01:08 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a50d54f000000b004aac3fd90fbsm222495edj.17.2023.02.06.03.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:01:08 -0800 (PST)
Message-ID: <376236b5-9a5d-1c0b-65e4-346cc79e9de6@linaro.org>
Date: Mon, 6 Feb 2023 12:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-5-f1345872ed19@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v1-5-f1345872ed19@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 5/5] arm64: dst: qcom: sm8450: add dp
 controller
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



On 6.02.2023 11:17, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts |  4 +-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 82 +++++++++++++++++++++++++++++++--
>  2 files changed, 82 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 5bdc2c1159ae..1b4ef79f74b3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -480,7 +480,9 @@ &mdss_dsi0_phy {
>  	status = "okay";
>  };
>  
> -&mdss_mdp {
> +&mdss_dp0 {
> +	data-lanes = <0 1 2 3>;
> +
>  	status = "okay";
>  };
This belongs in a separate patch.

>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 757b7c56d5f5..8d83545d5e4a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2745,13 +2745,20 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						dpu_intf1_out: endpoint {
> -							remote-endpoint = <&mdss_dsi0_in>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
>  						};
>  					};
>  
>  					port@1 {
>  						reg = <1>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
>  						dpu_intf2_out: endpoint {
>  							remote-endpoint = <&mdss_dsi1_in>;
>  						};
> @@ -2789,6 +2796,75 @@ opp-500000000 {
>  				};
>  			};
>  
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sm8350-dp";
> +				reg = <0 0xae90000 0 0x0fc>,
Trim the leading zeroes from the size part, please.

> +				      <0 0xae90200 0 0x0c0>,
> +				      <0 0xae90400 0 0x770>,
> +				      <0 0xae91000 0 0x098>;
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface", "core_aux",
> +					      "ctrl_link",
> +			                      "ctrl_link_iface", "stream_pixel";
Make this a vertical list, please.

Konrad
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_1_qmpphy 1>,
> +							 <&usb_1_qmpphy 2>;
> +
> +				phys = <&usb_1_qmpphy 1>;
> +			        phy-names = "dp";
> +
> +			        #sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SM8450_MMCX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
>  			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
> @@ -2966,8 +3042,8 @@ dispcc: clock-controller@af00000 {
>  				 <&mdss_dsi0_phy 1>,
>  				 <&mdss_dsi1_phy 0>,
>  				 <&mdss_dsi1_phy 1>,
> -				 <&usb_1_qmpphy 0>,
>  				 <&usb_1_qmpphy 1>,
> +				 <&usb_1_qmpphy 2>,
>  				 <0>, /* dp1 */
>  				 <0>,
>  				 <0>, /* dp2 */
> 
