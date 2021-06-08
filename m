Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901CE3A06A7
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 00:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD096E5D3;
	Tue,  8 Jun 2021 22:15:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A09B6E5B0
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 22:15:30 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so21925745otl.3
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 15:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=1t7u9q3nwz2autO/xtf8MJUk6lpDM4DYMrf1MH8aW4Q=;
 b=nnJv9OsQARR+ciGzlrE04XLGFV0Ux9hu6Ve/m90ADK/OJWfgUtFa5VXf9rre6PLWaN
 LNJBnrT6y2ZueCu3zQ8Z3XEDG3zpgr+hsSnNo9wVaGY1PLXVOLR2eSRrW9umN/6gV4Me
 NOnl93Y3lguNQy2J2fb3oDj4vwuOs3DRJawuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=1t7u9q3nwz2autO/xtf8MJUk6lpDM4DYMrf1MH8aW4Q=;
 b=OS/LbeeAy5YPeFMAB0CtgJuLfmhzL/pi7+76P/FcZS6rU1kDvd5SWwpNbFVxz/XPGb
 04K9TicNW6D3Qfavens84UqrRmMbmq+XNtJwiwrhPjr/jLsXfZxwAJIMGopIOesCXsga
 1ROV4gHEKhVfsNeWmlE+m5NqazNBGxG/XkdSZO7cyFeezkjf8HeKZkKINKQIv9BWesV0
 x4EeMrf8ZvWsCkYSYa5du7TZnt5LEHffc9ty/Tm1jEyarv7N4p2sgXZR+hsJlJS9wIS/
 yTJ9+5Wq9zeK2tTBLbY2kK9rR/2D9srACUbem7Bs80sqABKRozzWXZWuuUvNG/6W6iV0
 I6wQ==
X-Gm-Message-State: AOAM533y1fGSNs58ZschDFZyoEVDj2UtRPqTbeo054avOs1v2a7cF6ba
 TEbj5kLKu03Ybrd45dt1+wdM59e0IceZqsSUILidPw==
X-Google-Smtp-Source: ABdhPJyhL13bl002GGKwoydit/q9hRO2Cy7ITNXY5T1OOJafiJ0zxdlM0bxacz6SkRb5QZJX9/NiCtc2lHaGS2mp8d8=
X-Received: by 2002:a05:6830:190:: with SMTP id
 q16mr7251410ota.34.1623190529833; 
 Tue, 08 Jun 2021 15:15:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jun 2021 15:15:29 -0700
MIME-Version: 1.0
In-Reply-To: <YL6sY/1E5wLzMiP/@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga> <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
 <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <YL6sY/1E5wLzMiP/@yoga>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 8 Jun 2021 15:15:29 -0700
Message-ID: <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, khsieh@codeaurora.org
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
 robdclark@gmail.com, agross@kernel.org, abhinavk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-06-07 16:31:47)
> On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:
>
> > On 2021-06-05 22:07, Bjorn Andersson wrote:
> > > On Thu 03 Jun 16:56 CDT 2021, khsieh@codeaurora.org wrote:
> > >
> > > > On 2021-06-03 09:53, Bjorn Andersson wrote:
> > > > > On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:
> > > [..]
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > [..]
> > > > > > +                             power-domains = <&rpmhpd SC7180_CX>;
> > > > >
> > > > > Just curious, but isn't the DP block in the MDSS_GDCS? Or do we need to
> > > > > mention CX here in order for the opp framework to apply required-opps
> > > > > of CX?
> > > >
> > > > yes,
> > >
> > > If you want me, or other maintainers, to spend any time reviewing or
> > > applying your patches going forward then you need to actually bother
> > > replying properly to the questions asked.
> > >
> > > Thanks,
> > > Bjorn
> >
> > Sorry about the confusion. What I meant is that even though DP controller is
> > in the MDSS_GDSC
> > power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
> > impact
> > on the CX voltage corners. Therefore, we need to mention the CX power domain
> > here. And, since
> > we can associate only one OPP table with one device, we picked the DP link
> > clock over other
> > clocks.
>
> Thank you, that's a much more useful answer.
>
> Naturally I would think it would make more sense for the PHY/PLL driver
> to ensure that CX is appropriately voted for then, but I think that
> would result in it being the clock driver performing such vote and I'm
> unsure how the opp table for that would look.
>
> @Stephen, what do you say?
>

Wouldn't the PHY be the one that sets some vote? So it wouldn't be the
clk driver, and probably not from the clk ops, but instead come from the
phy ops via phy_enable() and phy_configure().

By the way, there's nothing wrong with a clk device doing power domain
"stuff", except for that we haven't plumbed it into the clk framework
properly and I'm fairly certain our usage of runtime PM in the clk
framework today underneath the prepare_lock is getting us into trouble
or will get us there soon.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
