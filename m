Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD724204D
	for <lists+freedreno@lfdr.de>; Tue, 11 Aug 2020 21:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766006E5CD;
	Tue, 11 Aug 2020 19:30:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98FA6E5CD
 for <freedreno@lists.freedesktop.org>; Tue, 11 Aug 2020 19:30:30 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id r4so19115pls.2
 for <freedreno@lists.freedesktop.org>; Tue, 11 Aug 2020 12:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+n9PUP/yu05/9MDe2VuxcN4yg1PRKAeGWVDeYP991FY=;
 b=lpt7Jm9cDHqdN9rwJn9az98LIyC8PWOAXXdc78UL2gjQNuYua8XrdpG+POwMqKX9XB
 VyYODz3OKowxSXkD5UMXyRoCr6j1yD6TQBP1AMmD2lNsNEIMj9+9D9uEG7figGQCkTI9
 4PaMD18uQVJm6IdYI6oiKA3MPtbWp8CC8dFG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+n9PUP/yu05/9MDe2VuxcN4yg1PRKAeGWVDeYP991FY=;
 b=fp7B1w19UFYeUNsj1J/IzLBlpUFPQ1q4RAkxEOPk588JZm0Qoo41n4HnmWMlrkj43m
 GkeQiSUCgsTmnxD8UECQjktXEWGgCccNQ2rdHu96LvW6i3KxWy8Wv7yPYeuzf6J9fkev
 nXHxzcmdQ6XVAOMO24fdpXXge86Zl/F7GJWwOmxpYcWMCadyGnY0nhFL/qd63PPqOofj
 uLw1MeQN7Lw0G4VGEjIW3GGfOcqVf1xDoDck3tAh+txg907YwbdqC0Amr/dZuXvZaivz
 a4HAP8HuS+5hsa1iFdmojzuN3dYSXLD5LcQXlJGBkV46mJHxnIyeWfIT9jFIaM9YBEg0
 l3/Q==
X-Gm-Message-State: AOAM532mqFAZJqCj5qJnyUjE5XZ8yjVLSGINt4/JskIaqkUsEIFR5fdv
 IdxhWlAhoqPgFZILLBB4ruQkLA==
X-Google-Smtp-Source: ABdhPJwe4qk4u80qb7K6M0UTxshn2s9EH/901eeU60PzedzdUY+tVv6ME7a5eBT8eA4fvUg13Z569w==
X-Received: by 2002:a17:902:82c1:: with SMTP id
 u1mr2289880plz.224.1597174230361; 
 Tue, 11 Aug 2020 12:30:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id y12sm16694716pgi.75.2020.08.11.12.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 12:30:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200811021553.25023-1-tanmay@codeaurora.org>
References: <20200811021553.25023-1-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 robdclark@gmail.com
Date: Tue, 11 Aug 2020 12:30:28 -0700
Message-ID: <159717422853.1360974.2200109790995932014@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v5] arm64: dts: qcom: sc7180: Add Display
 Port dt node
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org,
 Tanmay Shah <tanmay@codeaurora.org>, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-08-10 19:15:53)
> @@ -2440,6 +2447,71 @@ dsi_phy: dsi-phy@ae94400 {
>  
>                                 status = "disabled";
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000 {
> +                               status = "disabled";
> +                               compatible = "qcom,sc7180-dp";
> +
> +                               reg = <0 0x0ae90000 0 0x1400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12 IRQ_TYPE_NONE>;

Please drop the flags. It's not required per the binding. It should just
be a single number, i.e. <12>.

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
> +                               assigned-clock-parents = <&msm_dp 0>, <&msm_dp 1>;
> +
> +                               operating-points-v2 = <&dp_opp_table>;
> +                               power-domains = <&rpmhpd SC7180_CX>;

Can you send another patch to add the hpd pinctrl binding for the hpd
function? It would be useful to have that in the SoC level in case any
board wants to use the hpd pin on this SoC without having to implement
it themselves. It could be assigned here too as the pinctrl but I'm not
sure if that is correct. Probably better to just have it in the SoC file
and then let boards pick to use it.

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
> +                               dp_opp_table: dp-opp-table {

Can this be called opp-table? I don't see the need to make it more
specific given that it doesn't share the namespace at this level with
anything else that is an opp table.

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
> @@ -2449,8 +2521,8 @@ dispcc: clock-controller@af00000 {
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>                                  <&dsi_phy 0>,
>                                  <&dsi_phy 1>,
> -                                <0>,
> -                                <0>;
> +                                <&msm_dp 0>,
> +                                <&msm_dp 1>;

This bit will have to change when the DP phy is split off into the qmp
driver.

>                         clock-names = "bi_tcxo",
>                                       "gcc_disp_gpll0_clk_src",
>                                       "dsi0_phy_pll_out_byteclk",
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
