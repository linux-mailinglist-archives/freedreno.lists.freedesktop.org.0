Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96C14C146
	for <lists+freedreno@lfdr.de>; Tue, 28 Jan 2020 20:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B2B6F3C6;
	Tue, 28 Jan 2020 19:53:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AA16F3C6
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2020 19:53:25 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x185so7207454pfc.5
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jan 2020 11:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fd0Bf5ciOLDTzu4NvqY5lz18CA8ytAWcDkClCt4wOyA=;
 b=VzBbyfrXVyTu7+qADXfLaD3EjrI4fRju5zzq6rggViLj1t/lQA5k01gHSHLjHTTFQD
 1W4boLRmulXdcHOS3sn7t2I4ZwVPsNWq2uq9VvKzMNc/jboiF6Mml59qVjX5mB5mZQaL
 ZOuCxQKhPWuI9boE0o/Y/80zNA7ioPQIGtPa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fd0Bf5ciOLDTzu4NvqY5lz18CA8ytAWcDkClCt4wOyA=;
 b=W7g78i/W3kGEtpeZwbbBe93vOvpgJQ8Zz2dfHy3fZV1iJTz11DlCyXh6zerkXBZ4JH
 ZNYXkNQy4u+Mlv0V6NeJXhM4Kq+cNPWTJksC7x0uGeiJg6IKhjp3OqPYxJeXjsu/PvhB
 AltRMhrGDxMxtF37eKMBaBOe2FPQXK9ktIThlOue5e+9HfyPWBTkowmKMRfCprpS/aIe
 GDGZA41C/xwTx707CCSuEQvZ210K8sBGhRnKw/hlafReRabYPbjPlkYeBdUms86cN5qj
 s7iIZe6W4Hf3q8VZcxSkXuLZHqZOi1apQiJtxRE2pibC3vLQmnUHiiGqqAA2uKUwSMih
 gmLg==
X-Gm-Message-State: APjAAAW+vmps377hdQ6gFIVet/OTHlXvcIuJ91WqOHfsGUK564jHIH8/
 /Fl/qouLo24MwtDmoRo7pYB8WA==
X-Google-Smtp-Source: APXvYqxnNBwdER95BEHw3GteU6AfO0/0iBE9siRHXhDTs3M6ALIsjR66bbcQH9s8Amw+OkFTtECJBw==
X-Received: by 2002:a65:484d:: with SMTP id i13mr27036413pgs.32.1580241205473; 
 Tue, 28 Jan 2020 11:53:25 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id w3sm20442356pgj.48.2020.01.28.11.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 11:53:24 -0800 (PST)
Date: Tue, 28 Jan 2020 11:53:23 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Message-ID: <20200128195323.GC46072@google.com>
References: <1580218617-30293-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580218617-30293-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [v1] arm64: dts: sc7180: add dsi controller and phy
 entries for idp dts
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 28, 2020 at 07:06:57PM +0530, Harigovindan P wrote:
> Adding dsi controller and phy entries for idp dt.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 56 +++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..9f42367 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -7,6 +7,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7180.dtsi"
>  #include "pm6150.dtsi"
> @@ -232,6 +233,50 @@
>  	};
>  };
>  
> +&dsi_controller {
> +	status = "okay";
> +
> +	vdda-supply = <&vreg_l3c_1p2>;
> +
> +	panel@0 {
> +		compatible = "visionox,rm69299-1080p-display";

This depends on the series "Add support for rm69299 Visionox panel
driver and add devicetree bindings for visionox panel"
(https://patchwork.kernel.org/cover/11320773/) which hasn't landed
IIUC. This should be mentioned after '---'.

> +		reg = <0>;
> +
> +		vdda-supply = <&vreg_l8c_1p8>;
> +		vdd3p3-supply = <&vreg_l18a_2p8>;
> +
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&disp_pins_default>;
> +		pinctrl-1 = <&disp_pins_default>;

Is there a point for listing a suspend configuration if it is the same
as the default?

> +		reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +				panel0_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;

The 'dsi0_out' node is added by 'arm64: dts: sc7180: add display dt nodes'
(https://patchwork.kernel.org/patch/11354253/), which has not landed. So
either you should list it as dependency below the commit message, or
(probably better) send the two patches in the same series.

> +				};
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&panel0_in>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_phy {

Also this node does not exist yet, it also depends on the patch mentioned
above.

> +	status = "okay";
> +};
> +
>  &qspi {
>  	status = "okay";
>  	pinctrl-names = "default";
> @@ -289,6 +334,17 @@
>  
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
> +&pm6150l_gpio {
> +	disp_pins_default: disp-pins-default{

nit: missing blank before curly brace

If there is no suspend configuration you can get rid of the 'default'
suffix.

Since this is only a single pin I would suggest to use a name that
describes the function of the pin or the name used in the schematic
instead of 'disp-pins'.

Thanks

Matthias
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
