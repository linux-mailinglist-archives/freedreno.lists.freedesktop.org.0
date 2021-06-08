Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FDB3A06C4
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 00:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3396E5D3;
	Tue,  8 Jun 2021 22:29:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1B06E5D3
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 22:29:28 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id c13so17612981oib.13
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 15:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=22Ssm6bBidoI2OKdGgKr4Z380nMp59e0xlDapEUt3rU=;
 b=WPz6kqlJJfs8tIkZz7PYSNVeHx0zT+YXabel5UgJo2BNRuHZjWdtewaiBIcyWuOWr8
 Wqj51S0ykw9kcRp8mwWWuO3vqvOBm1PbNfgQdBEEeEBZs0RyBwGeWOV86TR9Tv8ckkH2
 CKs7FUDayZghlqqy/rxwQh+r/GAEDkjkAWRIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=22Ssm6bBidoI2OKdGgKr4Z380nMp59e0xlDapEUt3rU=;
 b=DF0h5P7GLIBU/GLDCtmFzwbigbBSdko+/C/iC6+jJ/AcqEHqrxvxAKp2gHwzM88qDZ
 gHm/jjvm9xK+AEM9fb+uAufTkLioWpxLBzHv4/p84J41578cgWPKethk1chjYXokERp5
 GXTHrK2aKTJVSYrUifdg6DlNtHjzv4duiszJfXoQyxG+PTF7NQV6T1PmR4xN7pMuYsZU
 5RqgBuIXa8WKHVeK6i2N/ocNCK1rsmEgKSGznnvDCL+3uiOMAPtzjRmn33sZIRtlv+JN
 UW7luCqsFDQmrMKNSBk9m9brZyyuePnZ2lbf/UiEtm4krawfabn/vjqlfzmfPlSzJy8t
 YCSw==
X-Gm-Message-State: AOAM5300R+NVE/vcv5kM87lIfr3boy7BcfPBgKj2+EWWpFvLL8RSic+n
 2dR+HgXDVVILnUXr7pSJQcJ/x83mNIh9GoBs2slt03z8Rwc=
X-Google-Smtp-Source: ABdhPJzPevJ+f/UberY67NRwcENdBNcopJshXKUMZZDlcap5kw7JKZSRUy35YlubQZREJJ1G5PAO5O8h0e2PmmIh9jQ=
X-Received: by 2002:a54:4501:: with SMTP id l1mr4450778oil.19.1623191367772;
 Tue, 08 Jun 2021 15:29:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jun 2021 15:29:27 -0700
MIME-Version: 1.0
In-Reply-To: <YL/uj+t+BFkII1Fh@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga> <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
 <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <YL6sY/1E5wLzMiP/@yoga>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 8 Jun 2021 15:29:27 -0700
Message-ID: <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
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

Quoting Bjorn Andersson (2021-06-08 15:26:23)
> On Tue 08 Jun 17:15 CDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-06-07 16:31:47)
> > > On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:
> > >
> > > > Sorry about the confusion. What I meant is that even though DP controller is
> > > > in the MDSS_GDSC
> > > > power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
> > > > impact
> > > > on the CX voltage corners. Therefore, we need to mention the CX power domain
> > > > here. And, since
> > > > we can associate only one OPP table with one device, we picked the DP link
> > > > clock over other
> > > > clocks.
> > >
> > > Thank you, that's a much more useful answer.
> > >
> > > Naturally I would think it would make more sense for the PHY/PLL driver
> > > to ensure that CX is appropriately voted for then, but I think that
> > > would result in it being the clock driver performing such vote and I'm
> > > unsure how the opp table for that would look.
> > >
> > > @Stephen, what do you say?
> > >
> >
> > Wouldn't the PHY be the one that sets some vote? So it wouldn't be the
> > clk driver, and probably not from the clk ops, but instead come from the
> > phy ops via phy_enable() and phy_configure().
> >
>
> If I understand the logic correctly *_configure_dp_phy() will both
> configure the vco clock and "request" the clock framework to change the
> rate.
>
> So I presume what you're suggesting is that that would be the place to
> cast the CX corner vote?

Yes that would be a place to make the CX vote. The problem is then I
don't know where to drop the vote. Is that when the phy is disabled?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
