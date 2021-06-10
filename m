Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC453A3172
	for <lists+freedreno@lfdr.de>; Thu, 10 Jun 2021 18:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808BD6E3D0;
	Thu, 10 Jun 2021 16:54:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE14B6E3D0
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jun 2021 16:54:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623344051; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zFFkMEwlO26ouYUqgGKuegHfhdCq+VEk7tkGM2HN59s=;
 b=jDJ2N1jw81eBIDroEEIXbDdbVEEYG4lbHv1EM2WbG5xBkemCR7xdyBlOV9sVRrW5XNzZqwmx
 L7S9zC60hLbevCeB/Pksx/qCfCGT6A/CNSdDM/0R6Nc3syb3FKn1fVh2I35dWN9DeIU6u3mm
 00s4/PU9dUwigr5jViHa0HR1XjY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60c243b0e27c0cc77fb97eed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Jun 2021 16:54:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8EB7C433F1; Thu, 10 Jun 2021 16:54:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F429C4338A;
 Thu, 10 Jun 2021 16:54:05 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 10 Jun 2021 09:54:05 -0700
From: khsieh@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <YL/41hWz8xB+jSeO@yoga>
References: <YLkI/6ItCz+SbbuJ@yoga>
 <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
 <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org> <YL6sY/1E5wLzMiP/@yoga>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
 <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga>
 <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
 <YL/41hWz8xB+jSeO@yoga>
Message-ID: <21dc5c9fc2efdc1a0ba924354bfd9d75@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
 vkoul@kernel.org, robh+dt@kernel.org, Stephen Boyd <swboyd@chromium.org>,
 robdclark@gmail.com, agross@kernel.org, abhinavk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-06-08 16:10, Bjorn Andersson wrote:
> On Tue 08 Jun 17:44 CDT 2021, Stephen Boyd wrote:
> 
>> Quoting Bjorn Andersson (2021-06-08 15:34:01)
>> > On Tue 08 Jun 17:29 CDT 2021, Stephen Boyd wrote:
>> >
>> > > Quoting Bjorn Andersson (2021-06-08 15:26:23)
>> > > > On Tue 08 Jun 17:15 CDT 2021, Stephen Boyd wrote:
>> > > >
>> > > > > Quoting Bjorn Andersson (2021-06-07 16:31:47)
>> > > > > > On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:
>> > > > > >
>> > > > > > > Sorry about the confusion. What I meant is that even though DP controller is
>> > > > > > > in the MDSS_GDSC
>> > > > > > > power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
>> > > > > > > impact
>> > > > > > > on the CX voltage corners. Therefore, we need to mention the CX power domain
>> > > > > > > here. And, since
>> > > > > > > we can associate only one OPP table with one device, we picked the DP link
>> > > > > > > clock over other
>> > > > > > > clocks.
>> > > > > >
>> > > > > > Thank you, that's a much more useful answer.
>> > > > > >
>> > > > > > Naturally I would think it would make more sense for the PHY/PLL driver
>> > > > > > to ensure that CX is appropriately voted for then, but I think that
>> > > > > > would result in it being the clock driver performing such vote and I'm
>> > > > > > unsure how the opp table for that would look.
>> > > > > >
>> > > > > > @Stephen, what do you say?
>> > > > > >
>> > > > >
>> > > > > Wouldn't the PHY be the one that sets some vote? So it wouldn't be the
>> > > > > clk driver, and probably not from the clk ops, but instead come from the
>> > > > > phy ops via phy_enable() and phy_configure().
>> > > > >
>> > > >
>> > > > If I understand the logic correctly *_configure_dp_phy() will both
>> > > > configure the vco clock and "request" the clock framework to change the
>> > > > rate.
>> > > >
>> > > > So I presume what you're suggesting is that that would be the place to
>> > > > cast the CX corner vote?
>> > >
>> > > Yes that would be a place to make the CX vote. The problem is then I
>> > > don't know where to drop the vote. Is that when the phy is disabled?
>> >
>> > We do pass qcom_qmp_phy_power_off() and power down the DP part as DP
>> > output is being disabled. So that sounds like a reasonable place to drop
>> > the vote for the lowest performance state.
>> >
>> 
>> So then will the corner vote be in place when the PHY isn't actually
>> powered up? That will be bad for power. The phy configure code will 
>> need
>> to know if the phy is enabled and then only put in the vote when the 
>> phy
>> is enabled, otherwise wait for enable to make the corner vote.
>> 
> 
> If we vote for a corner based on the link rate in *_configure_dp_phy()
> and put the vote for lowest corner we'd get the corner part sorted out
> afaict.
> 
> We'd still have to make sure that the PHY doesn't hang on to the cx 
> vote
> beyond that though - and implicitly in the non-DP cases...
> 
>> Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
>> digital logic. Probably the PLL is the hardware that has some minimum 
>> CX
>> requirement, and that flows down into the various display clks like 
>> the
>> link clk that actually clock the DP controller hardware. The mdss_gdsc
>> probably gates CX for the display subsystem (mdss) so if we had proper
>> corner aggregation logic we could indicate that mdss_gdsc is a child 
>> of
>> the CX domain and then make requests from the DP driver for particular
>> link frequencies on the mdss_gdsc and then have that bubble up to CX
>> appropriately. I don't think any of that sort of code is in place
>> though, right?
> 
> I haven't checked sc7180, but I'm guessing that it's following the 
> other
> modern platforms, where all the MDSS related pieces (including e.g.
> dispcc) lives in the MMCX domain, which is separate from CX.
> 
> So the parent of MDSS_GDSC should be MMCX, while Kuogee's answer (and
> the dp-opp-table) tells us that the PLL lives in the CX domain.
> 
> 
> PS. While this goes for the QMPs the DSI and eDP/DP PHYs (and PLLs)
> seems to live in MMCX.
> 
> Regards,
> Bjorn

Dp link clock rate is sourced from phy/pll (vco). However it is possible 
that different link clock rate
are sourced from same vco (phy/pll) rate. Therefore I think CX rail 
voltage level is more proper to
be decided base on link clock rate.

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
