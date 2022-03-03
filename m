Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F2E4CCA4B
	for <lists+freedreno@lfdr.de>; Fri,  4 Mar 2022 00:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEB510E203;
	Thu,  3 Mar 2022 23:51:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A772410E203
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 23:51:02 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id g24so5269877qkl.3
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 15:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEUDph6pdILfOjFK/V90NsjsmH/ILVmOF+Vdrb+tua8=;
 b=DFpGnpSMnFmOUvMJOYbl261thgAry2SYgtDsyMBZuLiJDYxlUr+vXHe5DRn1OOPG55
 lbAU5uyEJ6BCRngz3QV/NzOlgo9IdG/lUiQi7nmDxqL9XgwJIVmhdSPBnyODd43C5Hq8
 ztcOXHnG5slmbzAFJ9tFDftjvWJnxU4V/Tvk9whBObB1E75KVBul2XY8XdWshFO4Lp7j
 yDZub7Qd094o4eV03t3BQzIwoffa9QfyD1XaIeHpqqnEeqcp15O3d+fZlyCrSYlD8iI5
 l/lRSc3ayN3yttX+4Ndi7Aw6gvAahTmo0Jbul3oLc+yzqhYgXJWoyjtrumJMmlOeVkhY
 LkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEUDph6pdILfOjFK/V90NsjsmH/ILVmOF+Vdrb+tua8=;
 b=qkbAVRGQ8CI34FWhZgaA8aoYoXdrzNHo3hZrDTWd3aaFjS7yrusEROR4faExGt64mr
 s6DcGQdlrwf/PfFgFgBgenLFWMdUwi5toTao7ht4x3MnjXVyeCGa3SvtIdEHoPT9B4qr
 O+SZ6zmxcItLVOeBKGEh0e/hJkAMq1IAJt358Dy+WxnvpIAcwZ53p3qbslyU/exdCNob
 D1iTk2ndMpyFIeeDBFuBYg5T39Tp7a5BNu9FR12iQRC5R1iXQjr9zfRNmSNCCDrM4nVf
 dBCeQVy518QtXr8sjFDlfVRpvvwl5DgSwtqg7J3Jt9shVJYvS6cvFMLJJ146ZpnjmI1Z
 pmew==
X-Gm-Message-State: AOAM533/+w3FLCgWy4BidRVUyUZYAP3c2Mm+4z0+odtXTcS+Xeg6SHXi
 6xIbWbxjHW4YPaKLRZe+tArE3tTlL3h1hFYLu42s8g==
X-Google-Smtp-Source: ABdhPJxO/chGuWgVCSeW611qh1w44gEqrV7Xsc4Oh8x15acfkpz3bzzXTGhRfR1YREAZMdmJovlbjCD2iHuTu/of2xE=
X-Received: by 2002:a05:620a:1392:b0:60d:d76a:5073 with SMTP id
 k18-20020a05620a139200b0060dd76a5073mr1036802qki.59.1646351461812; Thu, 03
 Mar 2022 15:51:01 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 02:50:50 +0300
Message-ID: <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove
 assigned-clock-rate property for mdp clk
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robdclark@gmail.com,
 swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")

Please remove the Fixes tags from all commits. Otherwise the patches
might be picked up into earlier kernels, which do not have a patch
adding a vote on the MDP clock.

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index fdaf303..2105eb7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3164,9 +3164,6 @@
>                                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
>                         clock-names = "iface", "bus", "nrt_bus", "core";
>
> -                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -                       assigned-clock-rates = <460000000>;
> -
>                         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>                         interrupt-controller;
>                         #interrupt-cells = <1>;
> @@ -3191,10 +3188,8 @@
>                                          <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>                                 clock-names = "iface", "bus", "core", "vsync";
>
> -                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                               assigned-clock-rates = <460000000>,
> -                                                      <19200000>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <19200000>;
>
>                                 operating-points-v2 = <&mdp_opp_table>;
>                                 power-domains = <&rpmhpd SM8250_MMCX>;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
