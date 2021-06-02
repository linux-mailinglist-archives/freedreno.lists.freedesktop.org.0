Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB330399586
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 23:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F616E550;
	Wed,  2 Jun 2021 21:42:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA866E550
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 21:42:44 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so3844253otl.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Y9EqrbVUvdRXQm6S1vGkiBBzxsokfCTZDqeffR9IjWU=;
 b=ez7XacjFJ5Tf16GMFkB8cnre+KJX4IIZyOcbMP9amxCwW7BGHdS4CdFpKfrV98HluV
 rHRRqztGo1W5XeJovPvLEtHU3txxZNGswW5UianDRAciHrtQUt8wUv8oe3OSJB7UiKkR
 1Q0WlyFL8DK0KXG3J4EP5irTdjSolimxwcbAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Y9EqrbVUvdRXQm6S1vGkiBBzxsokfCTZDqeffR9IjWU=;
 b=ESL1C3nXLz2gdGCr8nDhpxPX8KycsZaRsHsA/v2J/1NaJn6T9K+CzaIGW91c9EiNu+
 Wt/nv3PjMBDBJ1coH/2ysc68v+Yf3CFKOCj6k/BcAhrmYcN/bCo7DEhnt+Vev1TxVSnq
 btRt1AP7m1BR0pP6YbSNPKoUXWblHSybw2iJkv/++qAJayq47P+Yc/oFYKo4PCE0GYq5
 P+OWoFPkW/obXcNi7+OE3KqbYYB2iD0ZNYuiCfzIZO/C+yqxNG2CHYI3VAcjcdKSLMTg
 C3nNV+QsYq2NEuqaILv2MR2ueV2jbw8rqJdODNqlt+bhcAovRtSOmHXSLtxDu8fgCIrz
 VGYg==
X-Gm-Message-State: AOAM5338048R2YLcragv8SmwYR/7LEWLtooQBB+CJS7XFHvaNpnwjbYL
 tzNAGeN5d2VaP4yRTWu7bYCLSmS2bzyad99TGhgAyQ==
X-Google-Smtp-Source: ABdhPJwcQMiZ5bocnmxz6pkL58nlbAYlzkz5dN6hF3rzJ7ZRu+8AJhKGsZHlUBM5T4MznnMb51qeRSjoiSeN4OdKAbk=
X-Received: by 2002:a05:6830:3154:: with SMTP id
 c20mr28424918ots.233.1622670164299; 
 Wed, 02 Jun 2021 14:42:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 14:42:43 -0700
MIME-Version: 1.0
In-Reply-To: <1622668118-2237-1-git-send-email-khsieh@codeaurora.org>
References: <1622668118-2237-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 2 Jun 2021 14:42:43 -0700
Message-ID: <CAE-0n52_GFYdvuugm0xZ4EsXTVe9V+-8N=RxWNuV=YJkjWAzQg@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Subject: Re: [Freedreno] [PATCH] arm64/dts/qcom/sc7180: Add Display Port dt
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
Cc: linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Subject should be

	"arm64: dts: qcom: sc7180: Add DisplayPort node"

Quoting Kuogee Hsieh (2021-06-02 14:08:38)
> Add DP device node on sc7180.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 77 ++++++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293e..53ef3961 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
>         status = "okay";
>  };
>
> +&msm_dp {

Maybe the lable should just be 'dp' as msm_ prefix is redundant.

> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&dp_hot_plug_det>;
> +        data-lanes = <0 1>;
> +        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
> +        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
> +};
> +
>  &pm6150_adc {
>         charger-thermistor@4f {
>                 reg = <ADC5_AMUX_THM3_100K_PU>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6228ba2..2e45098 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3148,6 +3155,76 @@
>
>                                 status = "disabled";
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000 {
> +                               status = "disabled";

Can this come after compatible?

> +                               compatible = "qcom,sc7180-dp";
> +
> +                               reg = <0 0x0ae90000 0 0x1400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12 IRQ_TYPE_NONE>;

Should be

	interrupts = <12>;

> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                               clock-names = "core_iface", "core_aux", "ctrl_link",
> +                                             "ctrl_link_iface", "stream_pixel";
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

Move this next to phy? Or at least a newline here to split from ports.

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

Maybe node name should be opp-table?

				dp_opp_table: opp-table {

				};

> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-160000000 {
> +                                               opp-hz = /bits/ 64 <160000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
