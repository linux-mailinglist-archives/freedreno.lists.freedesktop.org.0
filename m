Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73CA1491DF
	for <lists+freedreno@lfdr.de>; Sat, 25 Jan 2020 00:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D916E06E;
	Fri, 24 Jan 2020 23:21:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F242E6E06E
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2020 23:21:28 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id t12so2317710vso.13
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2020 15:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SRJ461+G7MgpwUQU9s+T4wtNvR/tD3NyDdbo7eqA7AI=;
 b=eZcDQrVRmmgUua8irA6uwUmZChO1NI87dboSLB2KeMzZ7JR5gsRbghI4LgN0exPQaG
 wHHGvu0c0RiHR1HnL/WKGm1NRBd7MGYwLUPDYXttvh8VvVu0+YYWqCxhGxwiU7uPt9Jy
 3VN3tqCAta+mZolHhOTXrqvhq69f6dnCWbGt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SRJ461+G7MgpwUQU9s+T4wtNvR/tD3NyDdbo7eqA7AI=;
 b=Qm+e8CSDw2MqMpexbTES2Z2rYIjxKPdYRBKOkEhMfvlv7FueQ8uM+yX+QKbDGZ28ic
 ezlr3xZzX0tAbcDBd0r9Gw4nqpHJavgrcMb3E9HpAoF+wypMQnfyPXHOuePxO+Siiicg
 1JFEAicwcup7WUqe3uGfFmOs0Vq4P3zJTvG+jP1VRmTqJbGTTRT6/rpCI6ynEMSdV5Lg
 sl93enPrjGTbmfUHMXX/8ka7y8Z/81RX2Cf7DABKCLjpkEgBH3fQEN4H1roxcarWeRxD
 KgS0j98KZUmNoOG/vwD2eT8nMqfJ0o5mX/JQ8hZiNl5y6RX2QO2eqCI6xXIRA0/kURVe
 0T3w==
X-Gm-Message-State: APjAAAWTlIsXj3l1qlx0f5wZ93U8rz7ib+HCImgvfJxg1lpUPRBCgGlC
 Gya69cuUHRc55JQSh1MGzkKuvsEejo0=
X-Google-Smtp-Source: APXvYqxuBbI93OyOq/DeIYerGQpOWx1GwOWqrr/H+OqgSRo76qPhgQjxNfao1muOkxANpLnUMAk4zg==
X-Received: by 2002:a67:e443:: with SMTP id n3mr4067702vsm.137.1579908087454; 
 Fri, 24 Jan 2020 15:21:27 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id m82sm2091227vke.30.2020.01.24.15.21.26
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 15:21:26 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id k188so2322042vsc.8
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2020 15:21:26 -0800 (PST)
X-Received: by 2002:a05:6102:2d8:: with SMTP id
 h24mr4063725vsh.169.1579908086214; 
 Fri, 24 Jan 2020 15:21:26 -0800 (PST)
MIME-Version: 1.0
References: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Jan 2020 15:21:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKVGq+x1XFvZQvBcKVPdcVxQWJJmsqpAxY3t4dorvMYg@mail.gmail.com>
Message-ID: <CAD=FV=WKVGq+x1XFvZQvBcKVPdcVxQWJJmsqpAxY3t4dorvMYg@mail.gmail.com>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [Freedreno] [v3] arm64: dts: sc7180: add display dt nodes
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 kalyan_t@codeaurora.org, "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 24, 2020 at 4:07 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Add display, DSI hardware DT nodes for sc7180.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         -Added display DT nodes for sc7180
> Changes in v2:
>         -Renamed node names
>         -Corrected code alignments
>         -Removed extra new line
>         -Added DISP AHB clock for register access
>         under display_subsystem node for global settings
> Changes in v3:
>         -Modified node names
>         -Modified hard coded values
>         -Removed mdss reg entry
>
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  58 +++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 124 ++++++++++++++++++++++++++++++++
>  2 files changed, 182 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..c77aab7 100644
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
>         };
>  };
>
> +&dsi_controller {
> +       status = "okay";
> +
> +       vdda-supply = <&vreg_l3c_1p2>;
> +
> +       panel@0 {
> +               compatible = "visionox,rm69299-1080p-display";

I don't think the bindings for this panel have landed anywhere, have
they?  Maybe keep the IDP patch separate from the main sc7180 patch so
that we can land the main sc7180 patch even if the idp patch isn't
quite ready?  ...and maybe ping whoever is supposed to add support for
this panel to tell them to get working on it.


> +               reg = <0>;
> +
> +               vdda-supply = <&vreg_l8c_1p8>;
> +               vdd3p3-supply = <&vreg_l18a_2p8>;
> +
> +               pinctrl-names = "default", "suspend";
> +               pinctrl-0 = <&disp_pins_default>;
> +               pinctrl-1 = <&disp_pins_default>;
> +
> +               reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       port@0 {
> +                               reg = <0>;
> +                               panel0_in: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@1 {
> +                       endpoint {
> +                               remote-endpoint = <&panel0_in>;
> +                               data-lanes = <0 1 2 3>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_phy {
> +       status = "okay";

The above doesn't do anything because the dsi_phy you add to
sc7180.dtsi doesn't have a
  status = "disabled";

...but probably it (and most of the other components that you're
adding) should.  The idea is that if it ever makes sense that a board
might be built with this SoC but _not_ hook up a given component that
it should start out "disabled" in the main SoC dtsi file.

> +};
> +
>  &qspi {
>         status = "okay";
>         pinctrl-names = "default";
> @@ -289,6 +334,19 @@
>
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>
> +&pm6150l_gpio {
> +       disp_pins {
> +               disp_pins_default: disp_pins_default{

As Bjorn mentioned, node name should use "-" instead of "_".  Also add
a space before your "{"


> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..3ebc45b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,130 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               mdss: display_subsystem@ae00000 {
> +                       compatible = "qcom,sc7180-mdss";
> +                       reg = <0 0x0ae00000 0 0x1000>;
> +                       reg-names = "mdss";
> +
> +                       power-domains = <&dispcc MDSS_GDSC>;

You definitely can't land your patch until the "dispcc" node is added,
but it's not.  You should be mentioning somewhere (after the cut?)
that you depend on the series to add dispcc.

...speaking of which, I just posted up a v2 of that.  See:

https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid

...speaking of which, can you please change your patch to replace the
bogus <0> in the dispcc for the DSI PHY, providing the clocks for
"dsi_phy_pll_byte" and "dsi_phy_pll_pixel"?  See
<https://crrev.com/c/2017974/3>


> +
> +                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                                <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       clock-names = "iface", "gcc_bus", "ahb", "core";
> +
> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       assigned-clock-rates = <300000000>;
> +
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       iommus = <&apps_smmu 0x800 0x2>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       mdp: display_controller@ae01000 {

Did you test this?  As far I can tell this change between v2 and v3
broke things because the node name "mdp" is magic.  In
"drivers/gpu/drm/msm/msm_drv.c" you can find the function:

static int compare_name_mdp(struct device *dev, void *data)
{
  return (strstr(dev_name(dev), "mdp") != NULL);
}

...so unless that function changes your device tree won't work.  Maybe
Bjorn can comment since I think he's the one that suggested you change
this, but IMO change it back to "mdp@ae01000" for now and then start a
separate patch series about transitioning this if people still want
it.  See <https://crrev.com/c/2020395/1>.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
