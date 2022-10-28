Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11631611D22
	for <lists+freedreno@lfdr.de>; Sat, 29 Oct 2022 00:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F3210E8EC;
	Fri, 28 Oct 2022 22:06:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FBA10E8EB
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 22:06:00 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id l9so4361222qkk.11
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 15:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oe9YWMLOYbkHnGM5Ih1wEVQ8dEjEkrZVtdAltI46+v4=;
 b=ZBRvD+MDACsUIyIxrcrpKl7fS0lCVLwbEcXBNJ54M1bmTkZ8aukcIcVjUzFcxgGQKn
 Vg0VAdVvwXsh6edKd2XanDxQor/9m7eq4UvNiSk3VbLVeDg8xX1lZuODUlVHDgk5PWpc
 evlWLZ5cyZ0sEbjG1sPlYV7smBcSW/ELW2r335IqMBAk/CqDHG5opLLsTCFuefRVtOnA
 TItz0WXLBUcevzMUF35AaKuBKJGdNkjS/SiimgKYyd718R6bCNq7P7HqcfC08mWfAhAW
 HOEurebBkUkT+RhYDvylYcw677raCx5pfiEP7Z8EwQN3mak+YW4qBaGCxKvAZXHU5di6
 2vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oe9YWMLOYbkHnGM5Ih1wEVQ8dEjEkrZVtdAltI46+v4=;
 b=Y0FMZBCUUibB2THX6eKnJ5hY6Dz6G9XJsW/q9WIS3a6uxFu53NngrqB5jaRY/4lrjk
 q+oys3KJMtl3lwmWFjO91E/DGm9+9uXfnqkHKrd62LDdgpChl0QpYrXVXaYBnwHmgKpL
 mJflAqZWf80ItkeaP2ambTC45Zxu+rcLYn6x5S9ZA9+BzVW/gDiUSUReQlGv+8y1w/qG
 0WFRAwhCiVXUYJnLIS8AvfWKu6tLItBjRlqALGeHrFdXmf1B4lUlHB63gd4LtSmm7pfj
 4zS7wsHywXB1vYiyUAin1s8Cyf9uClSyjr3n6piuvdVT/DZOlneCJbDP4p3UEl7s8u6m
 7MaA==
X-Gm-Message-State: ACrzQf1KA2PiLQTBPZgeHgMrzFAhGNakmYhypPcMDbx0MKMH2F9FsYn4
 s1YyqeeyYF92oTgh+AjPJCRHlg==
X-Google-Smtp-Source: AMsMyM4YrU1iBJT16PSlUcyx2agQqx/l8uxg+PwKzjNI22EFwmj+Nt9RZ9CXjFpopTjLH+jsaFNawA==
X-Received: by 2002:a05:620a:845:b0:6f9:df58:1ef5 with SMTP id
 u5-20020a05620a084500b006f9df581ef5mr1186792qku.238.1666994759245; 
 Fri, 28 Oct 2022 15:05:59 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a05620a258400b006bc192d277csm3830094qko.10.2022.10.28.15.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:05:57 -0700 (PDT)
Message-ID: <408b7b0c-ce30-134e-9b1f-f77c1f03f5c9@linaro.org>
Date: Fri, 28 Oct 2022 18:05:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-10-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028120812.339100-10-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable
 lt9611uxc dsi-hdmi bridge
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

On 28/10/2022 08:08, Robert Foss wrote:
> The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> 
> In order to toggle the board to enable the HDMI output,
> switch #7 & #8 on the rightmost multi-switch package have
> to be toggled to On.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 106 ++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 6e07feb4b3b2..6666b38b58f8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -20,6 +20,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi-out {

Generic node names, so hdmi-connector or just connector.

> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -29,6 +40,32 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	lt9611_1v2: lt9611-1v2 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";
> +
> +		vin-supply = <&vph_pwr>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	lt9611_3v3: lt9611-3v3 {

Ditto


> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_3V3";
> +
> +		vin-supply = <&vreg_bob>;
> +		gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>  };
>  
>  &adsp {
> @@ -220,6 +257,15 @@ &dispcc {
>  &dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
>  };
>  
>  &dsi0_phy  {
> @@ -231,6 +277,48 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&i2c15 {
> +	status = "okay";

status is the last property

> +	clock-frequency = <400000>;
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +		status = "okay";

Why status?

> +
> +		interrupts-extended = <&tlmm 50 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +

No need for blank line

> +		};
> +	};
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> @@ -248,6 +336,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_2 {
> +	status = "okay";
> +};
> +
>  &slpi {
>  	status = "okay";
>  	firmware-name = "qcom/sm8350/slpi.mbn";
> @@ -544,4 +636,18 @@ usb_hub_enabled_state: usb-hub-enabled-state {
>  		drive-strength = <2>;
>  		output-low;
>  	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio48";
> +		function = "normal";
> +
> +		output-high;
> +		input-disable;
> +	};
> +
> +	lt9611_irq_pin: lt9611-irq {

Missing suffix 'state'.

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Rebase your changes on last linux-next.

Best regards,
Krzysztof

