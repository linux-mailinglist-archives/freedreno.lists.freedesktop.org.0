Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF5F39A668
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 18:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693376F4CC;
	Thu,  3 Jun 2021 16:56:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26A26F4CC
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 16:56:01 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id a21so6955676oiw.3
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mX0haAANX9Ohl4Z8WOCYfoEFijudUEJiwohJAuQC02c=;
 b=E7gdFcfwwZk7HmQ39zxmvX/yTsBZjXSyT/Yh6ZyK3X2oG5Bw6amUuTiTPrsOwy6kgZ
 B5tW/iWZvcNhruetACGyvRTD0P7EP+pM/4pEhrwTbkdVEFcqoWmBI+nbTzfUzXvm6tId
 QCDfi7lTrixquP/z55TlYmB+GxG6PB4DmyPJXVEj2dL/4K5XDCEJ90HQlxDV6xa6KT0z
 W7fkr1RnCW+Hato7dLIZsIGe+vP8u/lM+JRDb5Aw60xNBjoZBWxCV7M+pRVKfwnEeepl
 kR64NgQ50fSStAbaU0ooPvLmuPoP/QqnSNkkytaSiZmHWGEp1AhH4RmRQGYwlw/dMtxk
 MdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mX0haAANX9Ohl4Z8WOCYfoEFijudUEJiwohJAuQC02c=;
 b=f555SMINlbG67BniQ3YhdPPPvLcC5S6OZBzbIkT/sRSxgr6APxZnU5norokl3tc34d
 Z8ASDN7B3kabIBw0nyLaElWMwBcV52rY1vpxsN7EkItEfJIdXJaQdzOWH2f5djF07AYr
 vH+wbIJEgytD7pat/kxpFf8aR1Mf5M9lOu/dkdmXs1bobWPHHlx0Qn9bFKWAeCP5IBEd
 J2iBlx37TsqPxvdIpycS+bK7PC0Lmz2xnqo23GFfA/sQ26oVFGixmDCW2met1KgYgEU6
 Jtoh+5o5GFUzFbgMcyqH5+WeRQu20Yac8Q8aYRQSeerkGT8xIRU4hN0lPXk3CkGN48xJ
 h7Mw==
X-Gm-Message-State: AOAM5312cLPxVGtC0duc1KiciebMu0Y6XTSoJ+QQAttjMzwYVqwc8HWw
 eK9stXPl0sR2OeMOUnbqzUgrEQ==
X-Google-Smtp-Source: ABdhPJyH8XlibAf+nkUPd+aUoPXdrt4Uu4nVZEpvj3KHhEHg0ADoVLdvXpEkcF8+yqTYU3JWMkFp1Q==
X-Received: by 2002:aca:be8a:: with SMTP id o132mr7819096oif.3.1622739361220; 
 Thu, 03 Jun 2021 09:56:01 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z25sm818070oic.30.2021.06.03.09.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:56:00 -0700 (PDT)
Date: Thu, 3 Jun 2021 11:55:58 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>
Message-ID: <YLkJnmYujyPu1Zzu@yoga>
References: <1622738250-1469-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622738250-1469-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v3] arm64: dts: qcom: sc7180: Add
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

On Thu 03 Jun 11:37 CDT 2021, Kuogee Hsieh wrote:

> Add DP device node on sc7180.
> 
> Changes in v2:
> -- replace msm_dp with dp
> -- replace dp_opp_table with opp_table
> 
> Changes in v3:
> -- correct text of commit title

In addition to the feedback I gave on v2, please also remove one of the
two spaces between "DisplayPort" and "node" in $subject.

Thanks,
Bjorn

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 78 ++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293e..40367a2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
>  	status = "okay";
>  };
>  
> +&dp {
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
> index 6228ba2..05a4133 100644
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
> +			dp: displayport-controller@ae90000 {
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
> +				operating-points-v2 = <&opp_table>;
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
> +				opp_table: dp-opp-table {
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
