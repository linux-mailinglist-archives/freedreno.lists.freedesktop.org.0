Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AC71FFF94
	for <lists+freedreno@lfdr.de>; Fri, 19 Jun 2020 03:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF266EBF9;
	Fri, 19 Jun 2020 01:12:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7AA6EBFE
 for <freedreno@lists.freedesktop.org>; Fri, 19 Jun 2020 01:12:50 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h10so3742910pgq.10
 for <freedreno@lists.freedesktop.org>; Thu, 18 Jun 2020 18:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=C2dez5Y5nxFP07QRNZ0OnRkJ8X7zqlBAGXKDCAlVfhY=;
 b=oLZbVHf8BIG6+THknBsryI8MvBmceKvdaIGFcE3E8GegV/CVRGi6iE+Kwgyq9mrL17
 XRSoTGChHFP9fypFoBBia72WZxyDSkB0DKPHBdJZDUNsFAhLAEFRLc/D+ClLJBVEUj5u
 8TfIW2yPdC0tRHqgM6ZlMpL1HE2kF0GK5OWBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=C2dez5Y5nxFP07QRNZ0OnRkJ8X7zqlBAGXKDCAlVfhY=;
 b=hIlT/gC7irxasPajqbHBII+kEpGQxUhMqiRmITfgGiBAa6ymBwmxFiwDOcNJ4//IRu
 3y8mQtY18H14SZuNwu4ru/5MEBNR4nXZ3TEBinUGdkA+0bYP8YL7Pf6JbnJobhSn9URQ
 ebKjDrajkbShSz2TJ1bN63S6Q7MOWl0jqM5W8YTPGQ8L/O60Z4PL0t8RdnJq6IQF8cpT
 aEOlmA7WVHnKUAowTOkkL66OKn+UHPBT182RCmuLLQlyp8DMe2FE936Hkiovg6WtwjTl
 58AjvTB0RkMHNIpGC8pB7yiuuXvQYSw9btyS+cW5pfZZlRnKoPZG/VgOn+JjVVWHiKq9
 MYJQ==
X-Gm-Message-State: AOAM532II8iTp81FBPpPYhSMzzVY5CdMmjgi+qFg5GxThjIw6lpHEvd7
 dkjI6vLr/xR40jInrCHHb76dvw==
X-Google-Smtp-Source: ABdhPJzpkIA9xRXSKhL1HR6SniZnYA3qMlfoJJoj709qP03uEsU3yPapKSC/mT40nipGsCn4VwPPgg==
X-Received: by 2002:a65:614b:: with SMTP id o11mr995414pgv.443.1592529169747; 
 Thu, 18 Jun 2020 18:12:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id n1sm3622207pjn.24.2020.06.18.18.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 18:12:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200618232113.22687-1-tanmay@codeaurora.org>
References: <20200618232113.22687-1-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, agross@kernel.org
Date: Thu, 18 Jun 2020 18:12:47 -0700
Message-ID: <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7180: Add Display
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
Cc: devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-arm-msm@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-06-18 16:21:13)
> Enable DP driver for sc7180.

Add DP device node on sc7180? This isn't a driver.

> 
> This change depends-on following series:
> https://patchwork.freedesktop.org/series/78583/
> and https://patchwork.freedesktop.org/patch/351990/
> 
> Changes in v2:
> 
> - Add assigned-clocks and assigned-clock-parents
> - Remove cell-index and pixel_rcg
> - Change compatible to qcom,sc7180-dp
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 916401f7e87c..26fe623e3b0f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2216,10 +2216,19 @@ ports {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
>  
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint =
> +                                                                <&dsi0_in>;
> +                                               };
> +                                       };
> +
>                                         port@0 {
>                                                 reg = <0>;
> -                                               dpu_intf1_out: endpoint {
> -                                                       remote-endpoint = <&dsi0_in>;
> +                                               dpu_intf0_out: endpoint {
> +                                                       remote-endpoint =
> +                                                                <&dp_in>;
>                                                 };
>                                         };
>                                 };

I thought this wasn't supposed to change? At least according to the
binding it shouldn't be needed.

> @@ -2293,6 +2302,46 @@ dsi_phy: dsi-phy@ae94400 {
>                         };
>                 };
>  
> +               msm_dp: displayport-controller@ae90000{
> +                       status = "ok";

Please use status = "disabled";

> +                       compatible = "qcom,sc7180-dp";
> +
> +                       reg = <0 0xae90000 0 0x1400>;
> +                       reg-names = "dp_controller";
> +
> +                       interrupt-parent = <&mdss>;

Any reason why this isn't under the mdss node like the other display
device nodes?

> +                       interrupts = <12 0>;
> +
> +                       clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                       clock-names = "core_aux", "ctrl_link",
> +                                     "ctrl_link_iface", "stream_pixel";
> +                       #clock-cells = <1>;
> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +                       assigned-clock-parents = <&msm_dp 1>;
> +
> +                       data-lanes = <0 1>;

This can and should be left to the board files. At the SoC level my
understanding is that there are four lanes possible, so no need to
artificially limit it here.

> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               port@0 {
> +                                       reg = <0>;
> +                                       dp_in: endpoint {
> +                                               remote-endpoint =
> +                                                        <&dpu_intf0_out>;

I'd prefer these were on one line, regardless of the 80 character line
limit/suggestion.

> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       dp_out: endpoint { };
> +                               };
> +                       };
> +               };
> +
>                 dispcc: clock-controller@af00000 {
>                         compatible = "qcom,sc7180-dispcc";
>                         reg = <0 0x0af00000 0 0x200000>;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
