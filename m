Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D640039ABCB
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 22:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC736F4FD;
	Thu,  3 Jun 2021 20:29:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC76A6F4FD
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 20:29:16 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so7004335otk.5
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=xX3VYyjxzdpIjPz97c6PlVOdKP115o6p3Ui5EeqQcH8=;
 b=ih5nYpGzowbPdJfl92eNjSiXeyjEU8mqtDMi6euxHBeilZo65ZqleTe1Pm4RddVC4c
 B6r57+8YHVolT9AF5qMAGOdIsftI5Q9ik+rlE9alUQvw0PzTC6OwyETotdcYfF0LmBAX
 Mt53RFDUjlIO50L5YY2Ogw6GD8v/kIWSbrUGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=xX3VYyjxzdpIjPz97c6PlVOdKP115o6p3Ui5EeqQcH8=;
 b=PMn6v4lOculGY4ynWVduugsrU33vz/zyiGrrEBn2wRwXlf23mzFNs+IT71ehLjOJYl
 zYwtNxzVldT7eZ1uFaAInvoMrtOadVaEibae88oVSo1lhLHBZOBt78bYg0ELwtOb2kdH
 pSop6SXcrPo/ftcxbf8oQnsWcSNyMXZpRa8FWzCV4lmWt1B+wt6f33mMfERtWtsGgbCT
 BYPSWiw78q265v60IVvndr1PXzbVyH63UBeNXDyo4BCA1iRbHGOB9XekRis2JcszQEWN
 RVFnD6HkB1emdK1y5qj2ZRyFxcbCmyWhCNTtrWBoJenKhvbt9gobuaI4XcWEC62JQfhP
 31Mg==
X-Gm-Message-State: AOAM530TfNfM0NVL5ZWlO8SnGviJf63lGneVfdAKDWpPoIRTmpnaa4Hl
 6OCsW3SKZ86fCjeRqmqsD4XMoWszrfJ98Z6m/8xiwg==
X-Google-Smtp-Source: ABdhPJzEi43bs9A+1vKefCz1MnfpsKOuD1JXyyzfdyZKIKc9+GkL0Ty/1xFukAjWe+ur6BBOKH+NbAOBWyYfWF7fh9I=
X-Received: by 2002:a9d:18e:: with SMTP id e14mr933504ote.34.1622752156132;
 Thu, 03 Jun 2021 13:29:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Jun 2021 20:29:15 +0000
MIME-Version: 1.0
In-Reply-To: <1622738250-1469-1-git-send-email-khsieh@codeaurora.org>
References: <1622738250-1469-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 3 Jun 2021 20:29:15 +0000
Message-ID: <CAE-0n53t0fjZYTrsV3fwbPajswLXpgcm6crTAD6sYzTn7xNe8g@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-06-03 09:37:30)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293e..40367a2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
>         status = "okay";
>  };
>
> +&dp {

This is in the wrong place now. Bjorn's suggestion for mdss_dp sounds
good to me, and then putting the node in alphabetical order.

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
> index 6228ba2..05a4133 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3148,6 +3155,77 @@
>
>                                 status = "disabled";
>                         };
> +
> +                       dp: displayport-controller@ae90000 {
> +                               compatible = "qcom,sc7180-dp";
> +                               status = "disabled";
> +
> +                               reg = <0 0x0ae90000 0 0x1400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12>;
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
> +                               operating-points-v2 = <&opp_table>;
> +                               power-domains = <&rpmhpd SC7180_CX>;

I'm also curious about the power domain for DP. My guess is that both
DSI and DP nodes should be a child of mdss if they're in the display
subsystem and powered down/inaccessible when the mdss_gdsc is disabled.

> +
> +                               #sound-dai-cells = <0>;
> +
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
> +                               opp_table: dp-opp-table {

I meant

	dp_opp_table: opp-table {
		...
	};

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
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
