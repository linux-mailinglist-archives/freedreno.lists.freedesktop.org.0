Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26798436ACB
	for <lists+freedreno@lfdr.de>; Thu, 21 Oct 2021 20:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285676ECE3;
	Thu, 21 Oct 2021 18:44:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6575C6ECE3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Oct 2021 18:44:47 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y26so2228258lfa.11
 for <freedreno@lists.freedesktop.org>; Thu, 21 Oct 2021 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pHhVhqquKAAu0r/TEo1pX9uwYVJYpZ/W1KvkF4P7FI4=;
 b=VjMGVxMVOpWL6wq1JlI0ny5rn2/k7ayNDN+LmlDqsGGvt1nPfeXXXei9kbVY8pWggA
 LEvnaRvdwolaVvJJNQgQAoMZ29GSC5Q084F7uRSv//T5pzeTPKQTkye6raJYb7B+5BGn
 9uwur3K2Jk84xzuvzLEfGn7i58Psa+FvJIIQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pHhVhqquKAAu0r/TEo1pX9uwYVJYpZ/W1KvkF4P7FI4=;
 b=Qu3y8yZhDLrvfz3QSRM3hKU7Bh7C9GECcIpxhtA6S9fCqssFPP6v4Z32/9PF+/jCb0
 74H/9i3szk0EiNOqwKQLs7q+VGoeaCmxIciFMTrEoNJdIZZ3zvszm9onHBsL6BlpuSnc
 +pAEYXNBN6b5NRD8jr7c+sDi3qmGxlMgmrmHjujWnUWBo9kXeS7O7aYg0AQZxhNblG+s
 b6Loav+ZHZIWgIcYaL+8NpY3vgmeoJ3Om1GOhGLeni9JryP0gGZMv46rsd/2RA9Nwvs7
 7e0YwyNOsuY5t/0m38JkyPIFhboM2fPAgeNLfVSOfjCG8h+fDAfpVFMs44R03xkOPek3
 KKgA==
X-Gm-Message-State: AOAM531mZwJEUAgB+PuqymBTGUpzSIBrzhIpNWp7n8trQXpegMqbUEQW
 5gbVHjY5d5NInoubhwCxvQaGIIR2PWe40poa4aeMRA==
X-Google-Smtp-Source: ABdhPJy4eaetcGrXWg6kvpqouhiMbpbnWM+kCpqU9amIsEV9R86CYSl3AeDT7uzbbe5EmkZ/5AhH0lkpV1KslXDxoXA=
X-Received: by 2002:ac2:5c12:: with SMTP id r18mr6904239lfp.251.1634841885620; 
 Thu, 21 Oct 2021 11:44:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:44:45 -0700
MIME-Version: 1.0
In-Reply-To: <1634738333-3916-4-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
 <1634738333-3916-4-git-send-email-quic_mkrishn@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 21 Oct 2021 11:44:45 -0700
Message-ID: <CAE-0n53NtSwin8RavHqF44d2adv9-_HMwDC+RzyzgQq8Z4t_yA@mail.gmail.com>
To: Krishna Manikandan <quic_mkrishn@quicinc.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, kalyan_t@codeaurora.org, 
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com, 
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/4] arm64: dts: qcom: sc7280: add edp
 display dt nodes
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

Quoting Krishna Manikandan (2021-10-20 06:58:53)
> From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
> Add edp controller and phy DT nodes for sc7280.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>

Some comments below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


> Changes in v2:
>     - Move regulator definitions to board file (Matthias Kaehlcke)
>     - Move the gpio definitions to board file (Matthias Kaehlcke)
>     - Move the pinconf to board file (Matthias Kaehlcke)
>     - Move status property (Stephen Boyd)
>     - Drop flags from interrupts (Stephen Boyd)
>     - Add clock names one per line for readability (Stephen Boyd)
>     - Rename edp-opp-table (Stephen Boyd)
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 106 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index dd35882..4450277 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2575,7 +2575,7 @@
>                         reg = <0 0xaf00000 0 0x20000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> -                                <0>, <0>, <0>, <0>, <0>, <0>;
> +                                <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;

I can already tell this is going to be a merge mess! Can this also be
one cell per line?

>                         clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
>                                       "dsi0_phy_pll_out_byteclk",
>                                       "dsi0_phy_pll_out_dsiclk",
> @@ -2777,6 +2784,103 @@
>
>                                 status = "disabled";
>                         };
> +
> +                       msm_edp: edp@aea0000 {
> +                               compatible = "qcom,sc7280-edp";
> +
> +                               reg = <0 0xaea0000 0 0x200>,
> +                                     <0 0xaea0200 0 0x200>,
> +                                     <0 0xaea0400 0 0xc00>,
> +                                     <0 0xaea1000 0 0x400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <14>;
> +
> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                        <&gcc GCC_EDP_CLKREF_EN>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
> +                               clock-names = "core_xo",
> +                                             "core_ref",
> +                                             "core_iface",
> +                                             "core_aux",
> +                                             "ctrl_link",
> +                                             "ctrl_link_iface",
> +                                             "stream_pixel";
> +                               #clock-cells = <1>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
> +
> +                               phys = <&edp_phy>;
> +                               phy-names = "dp";
> +
> +                               operating-points-v2 = <&edp_opp_table>;
> +                               power-domains = <&rpmhpd SC7280_CX>;
> +
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               edp_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf5_out>;
> +                                               };
> +                                       };
> +                               };
> +
> +                               edp_opp_table: opp-table {
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
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +
> +                                       opp-810000000 {
> +                                               opp-hz = /bits/ 64 <810000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
> +
> +                       edp_phy: phy@aec2000 {

unit address needs to match first reg property. This should be

			edp_phy: phy@aec2a00

> +                               compatible = "qcom,sc7280-edp-phy";
> +
> +                               reg = <0 0xaec2a00 0 0x19c>,
> +                                     <0 0xaec2200 0 0xa0>,
> +                                     <0 0xaec2600 0 0xa0>,
> +                                     <0 0xaec2000 0 0x1c0>;
> +
> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                        <&gcc GCC_EDP_CLKREF_EN>;
> +                               clock-names = "aux",
> +                                             "cfg_ahb";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
>                 };
>
>                 pdc: interrupt-controller@b220000 {
> @@ -3932,6 +4036,7 @@
>                                                          <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>                                 };
>                         };
> +

Drop this?
