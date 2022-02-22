Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3004C0408
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 22:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9C410E658;
	Tue, 22 Feb 2022 21:46:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05410E4CC
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 21:46:11 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id l25so10462629oic.13
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HXh2wWf1n/8+fbu1pdrOCmZrGQ3694naXlsmKt36QH8=;
 b=e90OgSdnQ+hZe3EuGBtW9CUZvz3eGZp0qAl+wQ36AonE5961IiWhfYKsy4ayPmicsx
 n6vcJsAhznvfY3vFDjrJPwcRxCadYdUouYMLulUkfJeacEdart9rkno1+gWMG4Yygx9g
 0vixKsaHQDAgmZYEEYa0Zo1g1MeojVaikUxvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HXh2wWf1n/8+fbu1pdrOCmZrGQ3694naXlsmKt36QH8=;
 b=nV1Yr3IjakPeagwUY+pyFScRUdwhu0RvSmPv/O6Oyl1dAehffc0Le0ZOAvDM2lafLb
 0/QLlGINCyyfZUzgyc/vdAfoU+GxWHVejqYqIffvP0qgdG0+mG2xzQG24O2nEAM56AKu
 8/naR3r9W+70JnatczAWpx4x4sUjJRo14Lw0WrRl4MFlxUq2M9dYFhM9HRJhoE6MgT8k
 h78m9LAHyphH6V3cpu5GwVYhP4e/LOgHo7L2nV8moMKpTjxO8kKVpk0shhO39Dk2TLQm
 aHC0FmWlgih3FtEn8OnxgLPaf4A91qM+sQxFd8uludgSgpzKDvUSCNOH6VC0vsVdJJba
 W2mA==
X-Gm-Message-State: AOAM5323Jn1UJrhxAl9sVa6oueHHLLE6v3nWJxVYbU6qFDZxIdTEX+6w
 i03tTsN4KfYCOeWKEZemaA6kByxNm6OAlwOQPD4E6g==
X-Google-Smtp-Source: ABdhPJzm+C5bYVv9anAXu3Z61wQBhQXH7Va4U0f+EoX/aM7qXc1WBaENweddodTaULni5p6NQAa4tqIsS91bDqikSg8=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr3061739oig.40.1645566371038; Tue, 22
 Feb 2022 13:46:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Feb 2022 21:46:10 +0000
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WvstZkDJcHJPAT0aez3X=uSKzDX0paQRHYD4DEktkMEQ@mail.gmail.com>
References: <1645449126-17718-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n507XcYRz4=Uw-K37kPsLRqi_gN2L9y1wcu_X-UJP+6ySg@mail.gmail.com>
 <CAD=FV=WvstZkDJcHJPAT0aez3X=uSKzDX0paQRHYD4DEktkMEQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Feb 2022 21:46:10 +0000
Message-ID: <CAE-0n51V+bfDUb_heV_DVkS+KOzDcjYzxpU=E8cCGFESrUwpeg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v1] arm64/dts/qcom/sc7280: update mdp clk to max
 supported value to support higher refresh rates
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2022-02-22 13:25:05)
> Hi,
>
> On Tue, Feb 22, 2022 at 12:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Vinod Polimera (2022-02-21 05:12:06)
> > > Panels with higher refresh rate will need mdp clk above 300Mhz.
> > > Select max frequency for mdp clock during bootup, dpu driver will
> > > scale down the clock as per usecase when first update from the framework is received.
> > >
> > > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> >
> > Please add a Fixes tag.
> >
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index baf1653..7af96fc 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > @@ -2895,7 +2895,7 @@
> > >                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > >                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> > >                                                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
> > > -                               assigned-clock-rates = <300000000>,
> > > +                               assigned-clock-rates = <506666667>,
> >
> > Why not simply remove the clock assignment and set the rate based on the
> > OPP when the driver probes?
>
> I was curious so I dug. It turns out that it _is_ using the OPP. It's
> just that the kernel driver currently assumes that the initial rate is
> the max rate. :-P You can actually see in msm_dss_parse_clock() that
> it walks through each of its clocks at boot and records the boot rate
> and stashes it as the "max_rate". That's not a scheme I've seen done
> commonly, so if nothing else it deserves a comment in the commit
> message.

That sounds like a scheme to detect the max frequency of the clk before
an OPP table is written. It would be better to convert that code to use
OPP tables if available and then drop this assigned clock property from
the DT (in both places).

>
> One other note is that I think there are _two_ places in the dtsi that
> are setting this same clock rate, right? The parent node `mdss`, which
> you're not touching, and the child `mdss_mdp`, which you are touching.
> Seems like you should just do it in one place. If it needs to be done
> by the parent then the child could just assume that the clock has
> already been set by the parent.
>

I see that it's this way on sc7180 too, which is sad but it seems nobody
noticed.
