Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C45288C28
	for <lists+freedreno@lfdr.de>; Fri,  9 Oct 2020 17:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38316ED0E;
	Fri,  9 Oct 2020 15:05:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288706ED0E
 for <freedreno@lists.freedesktop.org>; Fri,  9 Oct 2020 15:05:24 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id c1so3158151uap.3
 for <freedreno@lists.freedesktop.org>; Fri, 09 Oct 2020 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M5jmyRhySind9c0afwtQ0KGtByGsUKvjJEoZbk8E1rg=;
 b=Joaf6MfmCGF25mUhtUk8dw/KXhE9rOyy9cTfuhkZlrJrF5/AOOW+PGSTxiaz7deqDa
 J7icjzTVlWIo0zqGLDB6KJhXPIsrcv6jdY7k1u/VGev5bdPaZJN//YsjneEDCJWWCTCY
 KCh7oNHZcnOKkCwkzJEVqtmjUFyaavX+BdV8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M5jmyRhySind9c0afwtQ0KGtByGsUKvjJEoZbk8E1rg=;
 b=hFQsBFcJgrWCynvQdK4iNPjHi1EXhie2m2KCxV8sotEiuVoW3iolK6F1sOSHtYBfUl
 sCrAfxXXBRUH1vfOi8+H4nSsq3Gvzz66fM3G6RcmdEqqqJ27MY7USzaVPdxRHWxIzp7P
 hJMJKhW70ZyyXWzwoBf76/wlv6x36bWQJMffUxTRCG4XA+kH3LYqUHAozMl/cn7KtI1G
 FZP4Gdfs0E0lrwd0mv5fqrHO//GsbjnSO0Ebx2URKHDwfr7SvrqokEVwIMsMd0UYQz6E
 4CF6xKbWZHfYia4vTkA7dUv4PnzhWea4jrHcfpBVZRbUhYLWr+DJD5n/VVILrFon/ut8
 lXuA==
X-Gm-Message-State: AOAM530Pxayo8/5C25tJ156T3E17s3X/KrmdrH0zS+MBEE5zXHrCj7PP
 +pSqi1aM0vfqUi0CKKVY4r7/wQS/TB/SKw==
X-Google-Smtp-Source: ABdhPJy7+zB0Y1VgjRCmUp9GPei38+letg4bgbrlIteUq5SYyjyA6hasNHHJVJ1h9Ixg+/UB6lSKww==
X-Received: by 2002:ab0:627:: with SMTP id f36mr7755041uaf.76.1602255922676;
 Fri, 09 Oct 2020 08:05:22 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id 31sm1313546uac.10.2020.10.09.08.05.21
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 08:05:22 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id r24so5127872vsp.8
 for <freedreno@lists.freedesktop.org>; Fri, 09 Oct 2020 08:05:21 -0700 (PDT)
X-Received: by 2002:a67:bc0d:: with SMTP id t13mr8045062vsn.4.1602255921448;
 Fri, 09 Oct 2020 08:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Oct 2020 08:05:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
Message-ID: <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 1/2] arm64: dts: qcom: sc7180: Add gpu
 cooling support
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
Cc: Rob Herring <robh@kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Add cooling-cells property and the cooling maps for the gpu tzones
> to support GPU cooling.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..40d6a28 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * SC7180 SoC device tree source
>   *
> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
>   */
>
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> @@ -1885,6 +1885,7 @@
>                         iommus = <&adreno_smmu 0>;
>                         operating-points-v2 = <&gpu_opp_table>;
>                         qcom,gmu = <&gmu>;
> +                       #cooling-cells = <2>;

Presumably we should add this to the devicetree bindings, too?


>                         interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>                         interconnect-names = "gfx-mem";
> @@ -3825,16 +3826,16 @@
>                 };
>
>                 gpuss0-thermal {
> -                       polling-delay-passive = <0>;
> +                       polling-delay-passive = <100>;

Why did you make this change?  I'm pretty sure that we _don't_ want
this since we're using interrupts for the thermal sensor.  See commit
22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
Thermal-zones node").


>                         polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 13>;
>
>                         trips {
>                                 gpuss0_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <95000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "passive";

Matthias probably knows better, but I wonder if we should be making
two passive trip levels like we do with CPU.  IIRC this is important
if someone wants to be able to use this with IPA.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
