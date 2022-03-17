Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811374DD020
	for <lists+freedreno@lfdr.de>; Thu, 17 Mar 2022 22:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F8610E7F1;
	Thu, 17 Mar 2022 21:23:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207BB10E7EF
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 21:23:19 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso8030287ooe.6
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=OSDPwmZWTp87KAIy56WntFqaaFxosNFz2qqqMdiQW6w=;
 b=PJSF+SEnFIXKdHu3Posg9gntmUOehMEVLlRwTbnF1+4F7G+er1T969Y9ngviAXdzSN
 WMR2zF5dWsm+M1j1KuCH6P5qEmzm7jrw7rSRKE9YLViPhsImpNxr5Qr6j9QcfSHAzYoK
 ViP0HOoRbn6P9jB+5NFGJm65SroZFBoGUteSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=OSDPwmZWTp87KAIy56WntFqaaFxosNFz2qqqMdiQW6w=;
 b=WHDcPDzuplwwodLIbjiqEFUKElqB3ryN2KIxKqTxFr24rsAFUv7I/2LhfjA7ajTFel
 6JUWQ3EwaT531I8n0HI6VW04HZhTYJRRNVQOGnXS9Qja7f9TZuT9Px/BneAOihGlWSiW
 SOjX/w2zt1fXzsU4nhiMt0CDyYH91N97p5eMft8RG/Lqzhn04H8CMn+NyZuKUGuL78ii
 0YhxjAFkMh5lyOFW0UdWGeRNog2vgdeWDhb3/GbA2uKIp83EjZljFApFWQiv0Ds+yLPZ
 v2WeM8S5v95gQI10fhdjSoNQ7jfDGQ7nLDUxX/A2mjqQ9xAJ78rlbfcVY+DfBFwy2kkm
 UqsA==
X-Gm-Message-State: AOAM532Fo4jNhOV+3Zmqevvd6JQgozO91g9b1wNx2DGHeCdgqE9zi29x
 ZQ38zRTgJS5bKFtU7ZcVDwaSEtpNSwVFJnK9jNN2RQ==
X-Google-Smtp-Source: ABdhPJw06bFhb833+vINYAHpOMiySRBg+3pJhhdSUg3v/t91YQ4C0lwpA5ljXOcGX9capHP3ozNx73UBjrV0d5X78P0=
X-Received: by 2002:a05:6870:c0cb:b0:da:2bcc:aa09 with SMTP id
 e11-20020a056870c0cb00b000da2bccaa09mr2695488oad.63.1647552198396; Thu, 17
 Mar 2022 14:23:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:23:17 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:23:17 -0400
Message-ID: <CAE-0n52Uzo47N5QzoKOwny3XTrArA4nM-KPqAVxAPewSAyNOWw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add
 support for eDP panel on CRD
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, quic_khsieh@quicinc.com, robdclark@gmail.com,
 agross@kernel.org, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, thierry.reding@gmail.com, krzk+dt@kernel.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-03-16 10:35:47)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index e2efbdd..2df654e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -7,6 +7,7 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include "sc7280-idp.dtsi"
>  #include "sc7280-idp-ec-h1.dtsi"
>
> @@ -21,6 +22,27 @@
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
> +
> +       edp_3v3_regulator: edp-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "edp_3v3_regulator";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_panel_power>;
> +       };
> +
> +       vreg_edp_bp: vreg-edp-bp-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vreg_edp_bp";
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
>  };
>
>  &apps_rsc {
> @@ -76,6 +98,58 @@ ap_ts_pen_1v8: &i2c13 {
>         };
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_dp {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&dp_hot_plug_det>;
> +       data-lanes = <0 1>;
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l1b_0p8>;
> +};
> +
> +&mdss_edp {
> +       status = "okay";
> +
> +       data-lanes = <0 1 2 3>;

Is this property necessary? It looks like the default.

> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +
> +       aux-bus {

Can this move to sc7280.dtsi and get a phandle?

> +               edp_panel: edp-panel {

I'd prefer

	edp_panel: panel {

because there's only one panel node at this level.

> +                       compatible = "edp-panel";
> +
> +                       power-supply = <&edp_3v3_regulator>;

This is board specific, but I thought it was on the qcard so we should
move this to sc7280-qcard.dtsi?

> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               port@0 {
> +                                       reg = <0>;
> +                                       edp_panel_in: endpoint {

This can be shortened to

			port {
				edp_panel_in: endpoint {

according to panel-edp.yaml

> +                                               remote-endpoint = <&mdss_edp_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss_edp_out {
> +       remote-endpoint = <&edp_panel_in>;
> +};
> +
> +&mdss_edp_phy {
> +       status = "okay";
> +};
> +
> +&mdss_mdp {
> +       status = "okay";
> +};
> +
>  &nvme_3v3_regulator {
>         gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>  };
> @@ -84,7 +158,26 @@ ap_ts_pen_1v8: &i2c13 {
>         pins = "gpio51";
>  };
>
> +&pm8350c_gpios {
> +       edp_bl_power: edp-bl-power {

Is this used in a later patch?

> +               pins = "gpio7";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +       };
> +
> +       edp_bl_pwm: edp-bl-pwm {

Is this used in a later patch? Can it be moved to the patch that uses
it?

> +               pins = "gpio8";
> +               function = "func1";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +       };
> +};
> +
>  &tlmm {
> +       edp_panel_power: edp-panel-power {
> +               pins = "gpio80";
> +               function = "gpio";

function of gpio is unnecessary. Where is the bias and drive-strength
settings?

> +       };
> +
>         tp_int_odl: tp-int-odl {
>                 pins = "gpio7";
>                 function = "gpio";
> --
> 2.7.4
>
