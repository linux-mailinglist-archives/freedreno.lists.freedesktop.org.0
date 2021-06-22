Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E333B0EA5
	for <lists+freedreno@lfdr.de>; Tue, 22 Jun 2021 22:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82EE6E1BC;
	Tue, 22 Jun 2021 20:23:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17816E1BC
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 20:23:06 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 s20-20020a4ae9940000b02902072d5df239so175663ood.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Ggw6fsmku27vHRmfMQszrNre4+RfK7j3PrPkaoOAI5s=;
 b=LJm/LbiFVvPJuS0y9W0doPgLlkncwZmOFafIU9v/PAm8m/8KHPwJT3Y5cbnkV4BXJu
 pibvHYmUPrUE/wlr8jvGDlSstXPVAb7sWUjUQ4VBX8iMDC18VCuC4nu1eYJFnvVrDNar
 z2oeL/qVTksu5CgRvcn+b9dGIc1UkJ/B/CICM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Ggw6fsmku27vHRmfMQszrNre4+RfK7j3PrPkaoOAI5s=;
 b=b+ZPOnRJou1+RiaF9lhOWZ5IA9waJul4SoB6BjAKkuNWREW5wIjP7PS3Vc4Qv6Xing
 jBYtAVjv0hcwnKxAOZyHYDf3HD60m/F10u+rhjbV4xHCjNJ2MXcgM1XQh9GYHJWgmJTp
 Qqk3bc9FTZS2pCD2u9fQzwslbYVtYJ4jjdSgOG7aIoJih6k/pH7e0u7jcUOfC1WuiOF/
 jt7doowfXYp5cpiQ/Bg2ULUk8d1NwRwXOxOvtVUyFFjrXkCPI+v7vEe4Cw2XpsZ/PWfg
 AnusSHwRx4bhlToCBpSljpN/D3jQjtOWeBZ0B0z/qDISP7a3H1rh7WuxTLKWUN48tMjT
 0jeQ==
X-Gm-Message-State: AOAM5325vvU/+8GR3Agw3CkUkJWI/5UBKrhE9KjzA52XvINZs8pUcIEC
 vKuz6I0xmj9aQ4gSvEwuaitdbl1MWTes3syfIIf6Lt9PkPw=
X-Google-Smtp-Source: ABdhPJy5r3CCQB5ei2dsC6e+iDjGtLoVXl+JauwqFRFFC7KOLNaQ916rDZGbyoUW22i3iQ7L95AFS3Jj4//ujS57zu4=
X-Received: by 2002:a4a:e2d0:: with SMTP id l16mr4771864oot.80.1624393384760; 
 Tue, 22 Jun 2021 13:23:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Jun 2021 13:23:04 -0700
MIME-Version: 1.0
In-Reply-To: <YM0THrlJlv7ADW8w@builder.lan>
References: <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
 <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga>
 <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
 <YL/41hWz8xB+jSeO@yoga> <21dc5c9fc2efdc1a0ba924354bfd9d75@codeaurora.org>
 <CAE-0n52J_mLsmXLS+skZn2u3k9dhn+GcHeXi0B2BeQyQxEUL9A@mail.gmail.com>
 <YM0THrlJlv7ADW8w@builder.lan>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 22 Jun 2021 13:23:04 -0700
Message-ID: <CAE-0n53Zr-w5m-eFhLM2BVmphcYb_M4=s5je3Y7Lg6=onNo=uA@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port
 dt node
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 khsieh@codeaurora.org, robdclark@gmail.com, agross@kernel.org,
 abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-06-18 14:41:50)
> On Fri 18 Jun 15:49 CDT 2021, Stephen Boyd wrote:
>
> > Quoting khsieh@codeaurora.org (2021-06-10 09:54:05)
> > > On 2021-06-08 16:10, Bjorn Andersson wrote:
> > > > On Tue 08 Jun 17:44 CDT 2021, Stephen Boyd wrote:
> > > >
> > > >> Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
> > > >> digital logic. Probably the PLL is the hardware that has some minimum
> > > >> CX
> > > >> requirement, and that flows down into the various display clks like
> > > >> the
> > > >> link clk that actually clock the DP controller hardware. The mdss_gdsc
> > > >> probably gates CX for the display subsystem (mdss) so if we had proper
> > > >> corner aggregation logic we could indicate that mdss_gdsc is a child
> > > >> of
> > > >> the CX domain and then make requests from the DP driver for particular
> > > >> link frequencies on the mdss_gdsc and then have that bubble up to CX
> > > >> appropriately. I don't think any of that sort of code is in place
> > > >> though, right?
> > > >
> > > > I haven't checked sc7180, but I'm guessing that it's following the
> > > > other
> > > > modern platforms, where all the MDSS related pieces (including e.g.
> > > > dispcc) lives in the MMCX domain, which is separate from CX.
> > > >
> > > > So the parent of MDSS_GDSC should be MMCX, while Kuogee's answer (and
> > > > the dp-opp-table) tells us that the PLL lives in the CX domain.
> >
> > Isn't MMCX a "child" of CX? At least my understanding is that MMCX is
> > basically a GDSC that clamps all of multimedia hardware block power
> > logic so that the leakage is minimized when multimedia isn't in use,
> > i.e. the device is suspended. In terms of bumping up the voltage we have
> > to pin that on CX though as far as I know because that's the only power
> > domain that can actually change voltage, while MMCX merely gates that
> > voltage for multimedia.
> >
>
> No, MMCX is a separate rail from CX, which powers the display blocks and
> is parent of MDSS_GDSC. But I see in rpmhpd that sc7180 is not one of
> these platforms, so I presume this means that the displayport controller
> thereby sits in MDSS_GDSC parented by CX.
>
> But in line with what you're saying, the naming of the supplies to the
> QMP indicates that the power for the PLLs is static. As such the only
> moving things would be the clock rates in the DP controller and as such
> that's what needs to scale the voltage.
>
> So if the resources we're scaling is the clocks in the DP controller
> then the gist of the patch is correct. The only details I see is that
> the DP controller actually sits in MDSS_GDSC - while it should control
> the level of its parent (CX). Not sure if we can describe that in a
> simple way.

Right. I'm not sure things could be described any better right now. If
we need to change this to be MDSS_GDSC power domain and control the
level of the parent then I suppose we'll have to make some sort of DT
change and pair that with a driver change. Maybe if that happens we can
just pick a new compatible and leave the old code in place.

Are you happy enough with this current patch?

>
>
> PS. Why does the node name of the opp-table have to be globally unique?

Presumably the opp table node name can be 'opp-table' as long as it
lives under the node that's using it. If the opp table is at / or /soc
then it will need to be unique. I'd prefer just 'opp-table' if possible.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
