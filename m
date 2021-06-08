Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD453A0743
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 00:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FBD6E5D3;
	Tue,  8 Jun 2021 22:44:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8C36E5D3
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 22:44:19 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id u11so23219681oiv.1
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 15:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=vK1DB3ja5xfgrUtd+VQum3f44icaE1l0DPwqifdZgI0=;
 b=F/QEOIuItw8Ek1r/l6/FFbACr7K6wavqhwXAUcXNdVn22Y1+Tgm6fEm84iVWBNotzE
 V/xFczwrPLmiEK7FWdt2SjDmaa/YL7vtczm2P533PDvmeaxzOcK2iVLnA1dK/NuJEHQ0
 xej7tv+0w93r+c/FZC3cqox7OLdefAM2CE/Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=vK1DB3ja5xfgrUtd+VQum3f44icaE1l0DPwqifdZgI0=;
 b=cUSL7Cd45wJg72bZvLttB45qWjipJ8yfNk0B7ccs8JqfBIQfAXQGlpEzLxhpY6bTgM
 ZfeWK8qwtt6B+ldK2dnGyvKOtxkjJsKlKa/0e73KG83EBpNbuXCr60rcDB7frmpkIwl5
 dkvzTLKrmGJHgyc+WNAT10iVAq9HY1bq3A2wiAdzPnSaURbw5FLSaK2pV4M6oGxMSZCz
 89t0ZY1Qk2gi6loLVYK4ELpXtZ4AtY0uSHLM4QsEp6fszLGEIpGh8536eqiDCcgJeeNX
 x5/e+PPoAqAhwSSCtRYsBWujvbwCMQ6QthNpAn5ynRnhycuWHL/5kIijl/VzEGpIadSb
 /0ew==
X-Gm-Message-State: AOAM5337BxTIvqMNJ8rdyRQtjdpjEoakl36ju3zOOBH2Herx1otCmlKJ
 5bM+ni6hq61UVNUzNSYRsC+9x5ZdXvSkQuoWITNd4A==
X-Google-Smtp-Source: ABdhPJzXO4M75BrnIbzQxlkzWZ5A3G/HUmijr4z0C9M2sd3N9NMuUcemw/YoTKbEJqQWCTf2IdeJnKgRiAszb3FoiBQ=
X-Received: by 2002:a05:6808:144e:: with SMTP id
 x14mr4591500oiv.166.1623192259105; 
 Tue, 08 Jun 2021 15:44:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jun 2021 15:44:18 -0700
MIME-Version: 1.0
In-Reply-To: <YL/wWdRs6e/eECiC@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga> <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
 <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <YL6sY/1E5wLzMiP/@yoga>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
 <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 8 Jun 2021 15:44:18 -0700
Message-ID: <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
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

Quoting Bjorn Andersson (2021-06-08 15:34:01)
> On Tue 08 Jun 17:29 CDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-06-08 15:26:23)
> > > On Tue 08 Jun 17:15 CDT 2021, Stephen Boyd wrote:
> > >
> > > > Quoting Bjorn Andersson (2021-06-07 16:31:47)
> > > > > On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:
> > > > >
> > > > > > Sorry about the confusion. What I meant is that even though DP controller is
> > > > > > in the MDSS_GDSC
> > > > > > power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
> > > > > > impact
> > > > > > on the CX voltage corners. Therefore, we need to mention the CX power domain
> > > > > > here. And, since
> > > > > > we can associate only one OPP table with one device, we picked the DP link
> > > > > > clock over other
> > > > > > clocks.
> > > > >
> > > > > Thank you, that's a much more useful answer.
> > > > >
> > > > > Naturally I would think it would make more sense for the PHY/PLL driver
> > > > > to ensure that CX is appropriately voted for then, but I think that
> > > > > would result in it being the clock driver performing such vote and I'm
> > > > > unsure how the opp table for that would look.
> > > > >
> > > > > @Stephen, what do you say?
> > > > >
> > > >
> > > > Wouldn't the PHY be the one that sets some vote? So it wouldn't be the
> > > > clk driver, and probably not from the clk ops, but instead come from the
> > > > phy ops via phy_enable() and phy_configure().
> > > >
> > >
> > > If I understand the logic correctly *_configure_dp_phy() will both
> > > configure the vco clock and "request" the clock framework to change the
> > > rate.
> > >
> > > So I presume what you're suggesting is that that would be the place to
> > > cast the CX corner vote?
> >
> > Yes that would be a place to make the CX vote. The problem is then I
> > don't know where to drop the vote. Is that when the phy is disabled?
>
> We do pass qcom_qmp_phy_power_off() and power down the DP part as DP
> output is being disabled. So that sounds like a reasonable place to drop
> the vote for the lowest performance state.
>

So then will the corner vote be in place when the PHY isn't actually
powered up? That will be bad for power. The phy configure code will need
to know if the phy is enabled and then only put in the vote when the phy
is enabled, otherwise wait for enable to make the corner vote.

Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
digital logic. Probably the PLL is the hardware that has some minimum CX
requirement, and that flows down into the various display clks like the
link clk that actually clock the DP controller hardware. The mdss_gdsc
probably gates CX for the display subsystem (mdss) so if we had proper
corner aggregation logic we could indicate that mdss_gdsc is a child of
the CX domain and then make requests from the DP driver for particular
link frequencies on the mdss_gdsc and then have that bubble up to CX
appropriately. I don't think any of that sort of code is in place
though, right?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
