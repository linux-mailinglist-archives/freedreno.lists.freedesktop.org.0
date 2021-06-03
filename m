Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E339A64B
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 18:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9281E6E85E;
	Thu,  3 Jun 2021 16:53:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DE36E85E
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 16:53:23 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v22so6951090oic.2
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iBYxhbY2j6ySAuGmihYVsYnbIsjaqUjkE1YWENFEGdI=;
 b=szaOaLRXYKAt968AT7xKKmjTg8k/1a7nMo4m2LlLG61kXhN8/uB+6BEwnmH/7Rm3Oi
 3PGKICoeFamExccTohZRBhj0F07Md4Ey/bzMLyOpWA6RTaeUvGjCsYBwoB8gdwkpJ8ge
 Q1odEP4/LrfmFkDOV1AD991vCez2qofOHMBOcK1aiBnLuahgoq9M/nkWb6VHmzacnCPv
 6NYgpyIWT8BcIkUu8S9l2QcruCnaUyVZJN6QnjIN4NhhyPWR5NAct5md2wpJl1KqT8wF
 C1xAPWbx3vYzjJPfhM/fE1e33PeWHzFBNKwQE0iR7+5SzJKye7SbJdxG2jzc1QpR1t+1
 2MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iBYxhbY2j6ySAuGmihYVsYnbIsjaqUjkE1YWENFEGdI=;
 b=ci11y2hmFj35+q8vnSoyqvAmTNUlCQV1PhmHtDVTgYMWWNX6wi+oxrMKz0o1jSj9pt
 M52cHut9qfCY0PNDcCYawow75SQ8LVcxlDXUhXZLk4b1SdR0VoPIIfogbHg1OXGCVI7g
 nBCw5f1kQoTvsixkZVLfCS+jcy38wZnbjktjnghR5glnBisNIB7uINyn+iHXuSD5wBUW
 pskhjS4Bqew5DnN6RBALBn2eyHjBH7UG2olyUI2SaXMy7lIjbwD4JQ3yhm3FHGr33SKK
 tTVAbwFrYuG9CiydFvKhYzx4KpYhlaW//dmBEODG6DAnPJj6XvRMAva7NotypKQXe5ot
 xiQg==
X-Gm-Message-State: AOAM530+mu5/49+vNGcVfkyDruzPYHJV1m5SK0xTOM3vsAuCT4/F/03Z
 hsF0SKH01a5F3p2pmJaJU8W5Kg==
X-Google-Smtp-Source: ABdhPJzj648Va4opuaa+MJGmQyF9iwtfKcrlzj48E5tYlGvBaBb6SqyGj+OYun1sa/hrf4gT2z6I7A==
X-Received: by 2002:aca:5b04:: with SMTP id p4mr7898391oib.28.1622739202413;
 Thu, 03 Jun 2021 09:53:22 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l28sm326090otd.66.2021.06.03.09.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:53:22 -0700 (PDT)
Date: Thu, 3 Jun 2021 11:53:19 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>
Message-ID: <YLkI/6ItCz+SbbuJ@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port
 dt node
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

On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:

> Add DP device node on sc7180.
> 
> Changes in v2:
> -- replace msm_dp with dp
> -- replace dp_opp_table with opp_table
> 

I'm sorry for those suggestions, I don't like either one of them.

And for everything but changes to the DRM code the changelog goes below
the --- line, so it's not part of the git history.

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

Is it a limitation of the EC in Trogdor that you can only do 2 lanes?

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

If you label this "mdss_dp", then it will naturally group with other
mdss properties in trogdor.dtsi (which should be sorted alphabetically).

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

Just curious, but isn't the DP block in the MDSS_GDCS? Or do we need to
mention CX here in order for the opp framework to apply required-opps
of CX?

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

The one and only "opp_table" of the sc7180 :)
Maybe name it dp_opp_table instead?

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
