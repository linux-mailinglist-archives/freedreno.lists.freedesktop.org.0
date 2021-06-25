Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46D3B473F
	for <lists+freedreno@lfdr.de>; Fri, 25 Jun 2021 18:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C825F6EE10;
	Fri, 25 Jun 2021 16:13:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83D46EE10
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jun 2021 16:13:48 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 d21-20020a9d72d50000b02904604cda7e66so8008791otk.7
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jun 2021 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MWWpxotgdBre27isI3DwZKQ334uPd/zecV0Lcyc3n7Q=;
 b=N7zn6P76h5T81mOnWCupIHAcZvozSOjxZGTu/yWBXAFYQ7KtjfLycqT4XiBEFUrId1
 xuFky7NkApH6BPvpnPP0zRNbC/4HgA3jtVvNGI+RUnb24WxoZeD9R+pzeMjUpHHNOo64
 tHsRlMmWYgu6iwZ5Y1+vzK6RUg+S1UytBwSb/jEKBmT4hkrEWavEbxCZoV8vrmNjpV+R
 WjDZQspCHpjwecQvvyvEw3rK09fdE1nXSzAmX3hc1Mn/MId88dV7sZ6g6dO+M1Eg6b/+
 aznWTPJMenw99Iu2z8iwu/CLCOCmax7ptRtYD5oxbeGmSDu4wg2B69pO0hmJ5I5xAQrT
 VxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MWWpxotgdBre27isI3DwZKQ334uPd/zecV0Lcyc3n7Q=;
 b=eKi5FcxGvOwJJjJhKYLjR/epk+WSbay4uRqwPZm8X+fDjEZ0ybJ1F1KelOxxm2aEG3
 EYcEeM8MlimD111Z1tBQgBXx96isCLRnby2GT5niKvNx9u9Utwj70PhCQfHc5S4QSG5k
 PiCTGVfD4hl8eTDC0TpQEfq48WylDclqt+RySAZ+NeiwVXj347cyykPrZh8RROrL8LZr
 Vch1b8hdOgWZ19jLY65FW3AujeKJkxBcZ2W7WmJzrXSIwQIlJSPfRwR6waDsDR5qHuAL
 R1+L2V1dZ8C0NaJwmgJMyGZzk/lTJh9jNd4kLACTUGZDD4NtdMNZBpCyaxLpCFeVJXuL
 X/Sg==
X-Gm-Message-State: AOAM533fvdvRiFYb8N40F5oyIgxHt8o83AgZWZa2J7BddMN4n9r5lZmJ
 kFxpmgHhzksaiolyax5mzddNlA==
X-Google-Smtp-Source: ABdhPJxTOT8pJDLAz3xdWNJ/+53maozvDLTDh1AQoHyWbRZamb70O7ND1oumpz1JDJMQrWT5GODECg==
X-Received: by 2002:a05:6830:1309:: with SMTP id
 p9mr10338163otq.209.1624637628209; 
 Fri, 25 Jun 2021 09:13:48 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id q9sm1509884ots.1.2021.06.25.09.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 09:13:47 -0700 (PDT)
Date: Fri, 25 Jun 2021 11:13:45 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>
Message-ID: <YNYAuaBrGgdtToph@builder.lan>
References: <1622758940-13485-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622758940-13485-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v4] arm64: dts: qcom: sc7180: Add
 DisplayPort node
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 03 Jun 17:22 CDT 2021, Kuogee Hsieh wrote:

> Add DP device node on sc7180.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> Changes in v2:
> -- replace msm_dp with dp
> -- replace dp_opp_table with opp_table
> 
> Changes in v3:
> -- correct text of commit title
> 
> Changes in v4:
> -- replace dp with mdss_dp
> -- replace opp_table with dp_opp_table
> 
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 78 ++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293e..051fb40 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
>  	status = "okay";
>  };
>  
> +&mdss_dp {
> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&dp_hot_plug_det>;
> +        data-lanes = <0 1>;
> +        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
> +        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
> +};
> +
>  &pm6150_adc {
>  	charger-thermistor@4f {
>  		reg = <ADC5_AMUX_THM3_100K_PU>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6228ba2..c779ad3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3032,6 +3032,13 @@
>  							remote-endpoint = <&dsi0_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&dp_in>;
> +						};
> +					};
>  				};
>  
>  				mdp_opp_table: mdp-opp-table {
> @@ -3148,6 +3155,77 @@
>  
>  				status = "disabled";
>  			};
> +
> +			mdss_dp: displayport-controller@ae90000 {
> +				compatible = "qcom,sc7180-dp";
> +				status = "disabled";
> +
> +				reg = <0 0x0ae90000 0 0x1400>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +				clock-names = "core_iface", "core_aux", "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +				#clock-cells = <1>;
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> +				phys = <&dp_phy>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						dp_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dp_out: endpoint { };
> +					};
> +				};
> +
> +				dp_opp_table: dp-opp-table {

I forgot that our discussion about the node name here was on the
previous revision, _this_ is the patch I will drop the "dp-" from and
apply.

And as I've looked at this quite a bit now:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for following up on the other feedback!

Regards,
Bjorn

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
> +
>  		};
>  
>  		dispcc: clock-controller@af00000 {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
