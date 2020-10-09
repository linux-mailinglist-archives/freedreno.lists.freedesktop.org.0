Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5772F288F41
	for <lists+freedreno@lfdr.de>; Fri,  9 Oct 2020 18:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E426ED58;
	Fri,  9 Oct 2020 16:57:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2646ED58
 for <freedreno@lists.freedesktop.org>; Fri,  9 Oct 2020 16:57:07 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y1so1204677plp.6
 for <freedreno@lists.freedesktop.org>; Fri, 09 Oct 2020 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f0yCCPBqY4qUb9wGcJ1HYTDZ/2njY0BqjbSXTuo3NEs=;
 b=c+JTbiYOfr6d/Q9KtvL8QV3qo4AeNQnrPFkw1q1W3KPrMzuYn513Pr6f37djB/0GBO
 XTzecWXNTPSHigt5LUZ/XMoUMlSUGAFMXq8jzHiX3xUxzMMXq7FsOcXxwRF2biuOO8cE
 pI9lSDSidVfR392HG5GEskfqr6JyHruMz2yX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f0yCCPBqY4qUb9wGcJ1HYTDZ/2njY0BqjbSXTuo3NEs=;
 b=Ssa6fn8NZZjt1pgmbBo0iQ3rgMwJMG8DYxDX1PXSO8OoWB5hA3IzUtZog4SI66q/Tt
 WTLSyE6TrMrfNOp4utS4ze4ci0Yd2cudYpKo/cmFH44NW/49Wa0D6K/+l6P5uuf3Ln4H
 bytc40BXEf8xbF9K2SXZfrot/va6tMfIhLcXOoOIgVpXTxy9P3guFavj+nhAQr58GZAo
 z4rayODjSF63FcvxNuUAEExTrP/Ma5MrMLA4skmtzUt7Mk20L8Wt5FZZ8mwWojmLsnYp
 y4jgqjJeUMAsNo51ZRnNkdRTpJQg6z+zENgCvsWqpUmj5RkL6b3Su1k1BW+3YBfw+zrX
 BTug==
X-Gm-Message-State: AOAM530us5431x7n8zaXiVjjHRKAB/b4x7HtfdSCa/fONZY6CIzyIbun
 tMYtPoQ44HSA1S5YhMB9JZJSqw==
X-Google-Smtp-Source: ABdhPJzZt2IYb63TKHYDfYcwjS4BY/Gbv5TlJ4agbMRc6lmmwNUyboVRsfpjnVMoUuc9Ytn2lmUfww==
X-Received: by 2002:a17:902:7fcd:b029:d3:f037:d9dc with SMTP id
 t13-20020a1709027fcdb02900d3f037d9dcmr12644867plb.79.1602262627441; 
 Fri, 09 Oct 2020 09:57:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id 8sm11516688pfj.44.2020.10.09.09.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 09:57:06 -0700 (PDT)
Date: Fri, 9 Oct 2020 09:57:05 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20201009165705.GA1292413@google.com>
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
 <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
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
 Akhil P Oommen <akhilpo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 08:05:10AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >
> > Add cooling-cells property and the cooling maps for the gpu tzones
> > to support GPU cooling.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 29 ++++++++++++++++++++++-------
> >  1 file changed, 22 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index d46b383..40d6a28 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -2,7 +2,7 @@
> >  /*
> >   * SC7180 SoC device tree source
> >   *
> > - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
> >   */
> >
> >  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> > @@ -1885,6 +1885,7 @@
> >                         iommus = <&adreno_smmu 0>;
> >                         operating-points-v2 = <&gpu_opp_table>;
> >                         qcom,gmu = <&gmu>;
> > +                       #cooling-cells = <2>;
> 
> Presumably we should add this to the devicetree bindings, too?
> 
> 
> >                         interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
> >                         interconnect-names = "gfx-mem";
> > @@ -3825,16 +3826,16 @@
> >                 };
> >
> >                 gpuss0-thermal {
> > -                       polling-delay-passive = <0>;
> > +                       polling-delay-passive = <100>;
> 
> Why did you make this change?  I'm pretty sure that we _don't_ want
> this since we're using interrupts for the thermal sensor.  See commit
> 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
> Thermal-zones node").

I was going to ask the same, this shouldn't be needed.

> >                         polling-delay = <0>;
> >
> >                         thermal-sensors = <&tsens0 13>;
> >
> >                         trips {
> >                                 gpuss0_alert0: trip-point0 {
> > -                                       temperature = <90000>;
> > +                                       temperature = <95000>;
> >                                         hysteresis = <2000>;
> > -                                       type = "hot";
> > +                                       type = "passive";
> 
> Matthias probably knows better, but I wonder if we should be making
> two passive trip levels like we do with CPU.  IIRC this is important
> if someone wants to be able to use this with IPA.

Yes, please introduce a second trip point and make both of them
'passive'.

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
