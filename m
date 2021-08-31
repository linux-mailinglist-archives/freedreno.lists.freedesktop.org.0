Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD93FC038
	for <lists+freedreno@lfdr.de>; Tue, 31 Aug 2021 02:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D354389DDD;
	Tue, 31 Aug 2021 00:58:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344D689DDD
 for <freedreno@lists.freedesktop.org>; Tue, 31 Aug 2021 00:58:02 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 6so22320684oiy.8
 for <freedreno@lists.freedesktop.org>; Mon, 30 Aug 2021 17:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XYpN3SAtfvTTijjUpUhGm+neUMN/BjViflHhfgj+W+M=;
 b=L1SCg7SonFYijTI7AWQxcDtkQmPNoWFDMG13dWrcS1VQ/1iHc3PEAkb9tExC8YJbKy
 4snvL1BY+USFvZP7f0P7Cbu7NDyBed617lUjXt+lDKKURJmqQLdG/wG2Htcv5cj64mb9
 rxH50EQScj5U8ghqPdl/ltVmwxEsXiwPQ7JtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XYpN3SAtfvTTijjUpUhGm+neUMN/BjViflHhfgj+W+M=;
 b=j/8qnom179lHzHLfMby9LObtvvHwXwJsF4RCHPrCzoU5FqdsWkK/ox+PQedNyAo+Jd
 FNtjj/lytShMDoRFN3fhT8RBeunDnaSPwsx3CkD8Xy0Dlz9Yerxt7aRBaGU64zFTcoMe
 P6mTQWk+PUNjBOc/1cKLp+E76ZGaJrIK9a6xiW8DZ5h2JfQXJrykpvJ2XngTmVh99jJN
 t5nwvut0VhkiKnvnlir0Tyma9Qh1xJyx4Hu38I57Ubt1GEseRJgRg2gWxGPszlBSHYnJ
 h0C/IYNN2uC4/UjGVB+wONXCEc7vUBPRPg05Gij/OHBM+RZq5QQBuDpKbC9e+uibp5J5
 4FgA==
X-Gm-Message-State: AOAM5303KiDMgmKNUb7JLps5BsZtykYVl6gSFwyknWawpip8PpMJTiHK
 oJaZy6TGOv/fyow5CS75L8GBY/x6JLiNPwCF/1NjGA==
X-Google-Smtp-Source: ABdhPJyAt70CIHuM1fAQgI+/NvPTolzh5c0egjVTluneOAw3mU57bB65j1CAQcMKkEBiPn0xE3peYDhwnb/M7j3U7Sk=
X-Received: by 2002:aca:2310:: with SMTP id e16mr1421394oie.64.1630371481520; 
 Mon, 30 Aug 2021 17:58:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Aug 2021 17:58:01 -0700
MIME-Version: 1.0
In-Reply-To: <1630339489-23172-1-git-send-email-khsieh@codeaurora.org>
References: <1630339489-23172-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 30 Aug 2021 17:58:00 -0700
Message-ID: <CAE-0n52OjXovJJ2HNFPgyGn6vS84wgrEv4C66-tb176nUbdwSg@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, mkrishn@codeaurora.org, 
 kalyan_t@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7280: Add Display
 Port node
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

Quoting Kuogee Hsieh (2021-08-30 09:04:49)
> Changes in v2:
> -- break this patch into 3 patches

Are there two more somewhere?

>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 88 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c29226b..f224029 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3202,6 +3202,13 @@
>                                                         remote-endpoint = <&edp_in>;
>                                                 };
>                                         };
> +
> +                                       port@2 {
> +                                                reg = <2>;
> +                                                dpu_intf0_out: endpoint {
> +                                                        remote-endpoint = <&dp_in>;
> +                                                };
> +                                        };
>                                 };
>
>                                 mdp_opp_table: mdp-opp-table {
> @@ -3389,6 +3396,78 @@
>                                         };
>                                 };
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000 {
> +                               status = "disabled";
> +                               compatible = "qcom,sc7180-dp", "qcom,sc7280-dp";

It should be most specific to least specific from left to right. I'd
rather see "qcom,sc7180-dp" dropped entirely as it will become important
to know that sc7280 has eDP and DP whereas sc7180 only has DP. We should
key that knowledge off the compatible string, so having sc7180-dp here
makes that harder, not easier.

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
> +                               clock-names =   "core_iface",
> +                                               "core_aux",
