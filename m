Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65263F7B4A
	for <lists+freedreno@lfdr.de>; Wed, 25 Aug 2021 19:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A6D89956;
	Wed, 25 Aug 2021 17:13:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271F589956
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 17:13:28 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso40922462ota.8
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 10:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UCTcnsSbnb2BZPV5ZPemMMiSns8GwhF8Z8WDFU9MAlI=;
 b=Ibh57Mm8xpQqtAjHZeGcPf8lxPMd2widHCoILjnCYnTqer/uKN4ADjUsOUz/d8yeOn
 JSABs5wZGdIApigvNsHdWChYLvkAAtKABlqdFHzntcL38IXkoEf5VBY9P0iet573RMyT
 0mRFTWy4GCeiC1ANUzQ3PzLdIqEpqXZRaGZlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UCTcnsSbnb2BZPV5ZPemMMiSns8GwhF8Z8WDFU9MAlI=;
 b=gTfSga0xdXf6R9mT9Ug1fsqWCF2ElTsz3jXkA4FLVgWkktJ3fF8/M+CCc997paW8lY
 MOTe+/lHlX05WoDg6Y9YeHPOqx4e+H3Wd/HsK49KVML/WlFAB92i3oiBUSM1gfZSBRff
 UhXUFk2Tf/oYWVSWPyhMXJPdraHaCC4fAa2Op33PJFWXYjusORsW+o8coP52ISmeWtBB
 AnXKApa5h7a4glxTS57DWeiUnc4v2Ya35ur3IidrZ5Lipi4curQOEVBereu2Nm+ZQvx/
 7JEgwrHR0YlNj+Ys6j1t0gTLhEbxt3cqP4cMnbydlmu/9CZ8A32RKD2Bu0omRTPeJ/56
 +8kw==
X-Gm-Message-State: AOAM5324+AdmlcS+B6Utxg7qc9Jex5zmHq/iGkEG79tFwRMyS5zvP391
 HUTTD8F6KONu2yUyos4kpCyfjriHr54Uo1+N8sr97Q==
X-Google-Smtp-Source: ABdhPJzUAvvASSSNhBU6e1q+DsAdjQ//tA+JJPp3BoOFd00NZu2mdaPhv4bOdOq7WiLeweSJGe5V1lDrezdQ5NtyZMU=
X-Received: by 2002:a05:6830:2473:: with SMTP id
 x51mr31010415otr.34.1629911607276; 
 Wed, 25 Aug 2021 10:13:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Aug 2021 17:13:26 +0000
MIME-Version: 1.0
In-Reply-To: <1629847226-10112-1-git-send-email-khsieh@codeaurora.org>
References: <1629847226-10112-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 25 Aug 2021 17:13:26 +0000
Message-ID: <CAE-0n50Yp00hzAhSET8txib3BhTzz2ptOaLhERoF-ggUGU6ChQ@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, mkrishn@codeaurora.org, 
 kalyan_t@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sc7280: Add Display Port
 node
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

Quoting Kuogee Hsieh (2021-08-24 16:20:26)
> Add display port supported node for sc7280. Also correct dp-phy node
> tx/rx/pcs/tx2/rx2 base reg address to fix aux channel read/write
> failure issue.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  9 +++

Please split the idp diff from the sc7280.dts diff so that there are two
patches instead of one. It helps with ignoring the idp diff.

>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 98 +++++++++++++++++++++++++++++---
>  2 files changed, 100 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> index b1cf70e..4aea369 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> @@ -202,3 +202,12 @@ ap_h1_spi: &spi14 {};
>                 backlight = <&backlight>;
>         };
>  };
> +
> +&msm_dp {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&dp_hot_plug_det>;
> +       data-lanes = <0 1>;
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l1b_0p8>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c29226b..a350d84 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2918,15 +2918,11 @@
>                         dp_phy: dp-phy@88ea200 {
>                                 reg = <0 0x088ea200 0 0x200>,
>                                       <0 0x088ea400 0 0x200>,
> -                                     <0 0x088eac00 0 0x400>,
> +                                     <0 0x088eaa00 0 0x200>,
>                                       <0 0x088ea600 0 0x200>,
> -                                     <0 0x088ea800 0 0x200>,
> -                                     <0 0x088eaa00 0 0x100>;
> +                                     <0 0x088ea800 0 0x200>;

So this was wrong? Best to split that out into another patch with the
appropriate Fixes tag.

>                                 #phy-cells = <0>;
>                                 #clock-cells = <1>;
> -                               clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -                               clock-names = "pipe0";
> -                               clock-output-names = "usb3_phy_pipe_clk_src";

And then mention this part in the commit text of the fixing patch.

>                         };
>                 };
>
> @@ -3389,6 +3392,74 @@
>                                         };
>                                 };
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000 {
> +                               status = "disabled";
> +                               compatible = "qcom,sc7180-dp";

Can we add qcom,sc7280-dp as well? Just in case anything is wrong with
sc7280 specifically.

> +
> +                               reg = <0 0x0ae90000 0 0x1400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12 IRQ_TYPE_NONE>;

Drop IRQ_TYPE_NONE per the binding it is one cell, not two.

> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                               clock-names = "core_iface", "core_aux", "ctrl_link",
> +                                             "ctrl_link_iface", "stream_pixel";

Can we get clock-names on one line matching the clocks property please?
That makes it easier to match it up between the two properties.

> +                               #clock-cells = <1>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> +                               phys = <&dp_phy>;
> +                               phy-names = "dp";
> +
> +                               operating-points-v2 = <&dp_opp_table>;
> +                               power-domains = <&rpmhpd SC7180_CX>;
> +
> +                               #sound-dai-cells = <0>;

Nitpick: Newline here.

> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dp_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf0_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dp_out: endpoint { };
> +                                       };
> +                               };
> +
> +                               dp_opp_table: dp-opp-table {

dp_opp_table: opp-table {

> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-160000000 {
> +                                               opp-hz = /bits/ 64 <160000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-270000000 {
> +                                               opp-hz = /bits/ 64 <270000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-540000000 {
> +                                               opp-hz = /bits/ 64 <540000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +
> +                                       opp-810000000 {
> +                                               opp-hz = /bits/ 64 <810000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 dispcc: clock-controller@af00000 {
> @@ -3398,7 +3469,8 @@
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>                                  <&dsi_phy 0>,
>                                  <&dsi_phy 1>,
> -                                <0>, <0>,
> +                                <&dp_phy 0>,
> +                                <&dp_phy 1>,
>                                  <&msm_edp 0>,
>                                  <&msm_edp 1>;
>                         clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
> @@ -3525,6 +3597,18 @@
>                                  };
>                          };
>
> +                       dp_hot_plug_det: dp-hot-plug-det {
> +                                pinmux {
> +                                        pins = "gpio47";
> +                                        function = "dp_hot";
> +                                };
> +
> +                               pinconf {
> +                                       pins = "gpio47";
> +                                       bias-disable;
> +                               };

Combine these two nodes (pinmux and pinconf) into one please.

                         dp_hot_plug_det: dp-hot-plug-det {
                                  pins = "gpio47";
                                  function = "dp_hot";
                                  bias-disable;
			 };

> +                        };
> +
>                         qspi_clk: qspi-clk {
>                                 pins = "gpio14";
>                                 function = "qspi_clk";
