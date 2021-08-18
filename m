Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75F3F0C32
	for <lists+freedreno@lfdr.de>; Wed, 18 Aug 2021 21:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD836E934;
	Wed, 18 Aug 2021 19:57:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5726E934
 for <freedreno@lists.freedesktop.org>; Wed, 18 Aug 2021 19:57:56 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso5492954ott.13
 for <freedreno@lists.freedesktop.org>; Wed, 18 Aug 2021 12:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hMNsxaIVAKEhwUPAnI8A+Z1CyieSI/+ymj5IsPC0nx0=;
 b=BJ8XxKqZWNK+GA6AyndO/j7cjNxJpKMSCuYSPWjgJb/ckKsC2wqsaTcfweihlV2vWF
 xIWcJl8UHqrQrzoBABxdY/K72PeDLbRARVl/K7T6EH/q9oeNcAAet0rfK95TYcNtRI+e
 pF7Eborol02KyGyWnTPBNZLI+uTm7BaBQnejM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hMNsxaIVAKEhwUPAnI8A+Z1CyieSI/+ymj5IsPC0nx0=;
 b=nHBEmaBD2QDb8FBp1tqSFEa08/9bw2MCsUpN918i58gU5yHi/Jb+OIc9mIPpuLJav5
 hBspJdlbAsoSY2JamFX4qxAz9E7846opbM80TUoAyv5i7l0NBkNsUmxFLeJoEjwQ2WC9
 cCaAA7rEE+VD5SguoCl7PV2kAmiE0spepxycUcB2a+rrW+z1KLjPMGOIETO6DaINwAhU
 PNxBMquTrkeErXXri8SsYl8Daksavx6H7mBYFXyHAKrk5lEa66+U9R7avBpt8GZEQa7j
 kQaqL/4Jfyb50TaqXEZEvF7ZnuFeDDdQwiA+5DhMxCj/G+BVny80Q0oXpmA7MfqVuuea
 WimA==
X-Gm-Message-State: AOAM533Snni4fqGq+sokB9P/fsjVucJtlFjJ8fVyJ7itHE9pDO20ossu
 KNj4SJoKMcuk9wda3psc6/2z1hmr/erhIZP3i/8hWQ==
X-Google-Smtp-Source: ABdhPJzmXOb8xBARc+WzsJ0z34O3SnwrY4WwT/K/Ap9nVOEzk1VWjsLwQPpXUxpXxSI8WfoySmqZymyZv1fYbWdVLZw=
X-Received: by 2002:a05:6830:2473:: with SMTP id
 x51mr1762198otr.34.1629316675810; 
 Wed, 18 Aug 2021 12:57:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 12:57:55 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 18 Aug 2021 12:57:55 -0700
Message-ID: <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, sbillaka@codeaurora.org, abhinavk@codeaurora.org, 
 robdclark@gmail.com, bjorn.andersson@linaro.org, khsieh@codeaurora.org, 
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/4] arm64: dts: qcom: sc7280: add
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

Quoting Krishna Manikandan (2021-08-18 03:27:02)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 53a21d0..fd7ff1c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>   */
>
> +#include <dt-bindings/clock/qcom,dispcc-sc7280.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interconnect/qcom,sc7280.h>
> @@ -1424,6 +1425,90 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               mdss: mdss@ae00000 {

subsystem@ae00000

> +                       compatible = "qcom,sc7280-mdss";
> +                       reg = <0 0x0ae00000 0 0x1000>;
> +                       reg-names = "mdss";
> +
> +                       power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
> +
> +                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                               <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       clock-names = "iface", "ahb", "core";
> +
> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       assigned-clock-rates = <300000000>;
> +
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
> +                       interconnect-names = "mdp0-mem";
> +
> +                       iommus = <&apps_smmu 0x900 0x402>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       status = "disabled";
> +
> +                       mdp: mdp@ae01000 {

display-controller@ae01000

> +                               compatible = "qcom,sc7280-dpu";
> +                               reg = <0 0x0ae01000 0 0x8f030>,
> +                                       <0 0x0aeb0000 0 0x2008>;
> +                               reg-names = "mdp", "vbif";
> +
> +                               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                       <&gcc GCC_DISP_SF_AXI_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names = "bus", "nrt_bus", "iface", "lut", "core",
> +                                             "vsync";

One line per string please.

> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                               <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +                                               <&dispcc DISP_CC_MDSS_AHB_CLK>;
> +                               assigned-clock-rates = <300000000>,
> +                                                       <19200000>,
> +                                                       <19200000>;
> +                               operating-points-v2 = <&mdp_opp_table>;
> +                               power-domains = <&rpmhpd SC7280_CX>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <0>;
> +
> +                               status = "disabled";
> +
> +                               mdp_opp_table: mdp-opp-table {

mdp_opp_table: opp-table {

> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-200000000 {
> +                                               opp-hz = /bits/ 64 <200000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-300000000 {
> +                                               opp-hz = /bits/ 64 <300000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-380000000 {
> +                                               opp-hz = /bits/ 64 <380000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +
> +                                       opp-506666667 {
> +                                               opp-hz = /bits/ 64 <506666667>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
