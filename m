Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8EA3B470E
	for <lists+freedreno@lfdr.de>; Fri, 25 Jun 2021 17:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A73B6EE08;
	Fri, 25 Jun 2021 15:55:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2D6EE08
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jun 2021 15:55:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624636543; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=k+52SBszcH483ZRUtcU+yiloL+pyVt9AUiozgNhX+3M=;
 b=M2Bs7jZ79JYBlnDYQCkUPkr3m+8wScMGMbzCeIHiq6uVU0s4UJV0wN/Zud375dbkiMUr5BTy
 p3FBydhB9lR12UWncQAs9/UxVXdpibL/ayFThV4+P3Wd9MYd1Sxs9QZHA745PB2P+/hUYoNn
 poQ+T3ORbPtgkWYXQVeYY2ocqOw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60d5fc7e2a2a9a9761156c9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 15:55:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 56B68C4338A; Fri, 25 Jun 2021 15:55:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2765CC433F1;
 Fri, 25 Jun 2021 15:55:41 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 25 Jun 2021 08:55:41 -0700
From: khsieh@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <YNKiB3ZEtOQ+T/MX@yoga>
References: <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
 <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga>
 <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
 <YL/41hWz8xB+jSeO@yoga> <21dc5c9fc2efdc1a0ba924354bfd9d75@codeaurora.org>
 <CAE-0n52J_mLsmXLS+skZn2u3k9dhn+GcHeXi0B2BeQyQxEUL9A@mail.gmail.com>
 <YM0THrlJlv7ADW8w@builder.lan>
 <CAE-0n53Zr-w5m-eFhLM2BVmphcYb_M4=s5je3Y7Lg6=onNo=uA@mail.gmail.com>
 <YNKiB3ZEtOQ+T/MX@yoga>
Message-ID: <b157a691a1cb8f860219ca3b2c335411@codeaurora.org>
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

On 2021-06-22 19:52, Bjorn Andersson wrote:
> On Tue 22 Jun 15:23 CDT 2021, Stephen Boyd wrote:
> 
>> Quoting Bjorn Andersson (2021-06-18 14:41:50)
>> > On Fri 18 Jun 15:49 CDT 2021, Stephen Boyd wrote:
>> >
>> > > Quoting khsieh@codeaurora.org (2021-06-10 09:54:05)
>> > > > On 2021-06-08 16:10, Bjorn Andersson wrote:
>> > > > > On Tue 08 Jun 17:44 CDT 2021, Stephen Boyd wrote:
>> > > > >
>> > > > >> Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
>> > > > >> digital logic. Probably the PLL is the hardware that has some minimum
>> > > > >> CX
>> > > > >> requirement, and that flows down into the various display clks like
>> > > > >> the
>> > > > >> link clk that actually clock the DP controller hardware. The mdss_gdsc
>> > > > >> probably gates CX for the display subsystem (mdss) so if we had proper
>> > > > >> corner aggregation logic we could indicate that mdss_gdsc is a child
>> > > > >> of
>> > > > >> the CX domain and then make requests from the DP driver for particular
>> > > > >> link frequencies on the mdss_gdsc and then have that bubble up to CX
>> > > > >> appropriately. I don't think any of that sort of code is in place
>> > > > >> though, right?
>> > > > >
>> > > > > I haven't checked sc7180, but I'm guessing that it's following the
>> > > > > other
>> > > > > modern platforms, where all the MDSS related pieces (including e.g.
>> > > > > dispcc) lives in the MMCX domain, which is separate from CX.
>> > > > >
>> > > > > So the parent of MDSS_GDSC should be MMCX, while Kuogee's answer (and
>> > > > > the dp-opp-table) tells us that the PLL lives in the CX domain.
>> > >
>> > > Isn't MMCX a "child" of CX? At least my understanding is that MMCX is
>> > > basically a GDSC that clamps all of multimedia hardware block power
>> > > logic so that the leakage is minimized when multimedia isn't in use,
>> > > i.e. the device is suspended. In terms of bumping up the voltage we have
>> > > to pin that on CX though as far as I know because that's the only power
>> > > domain that can actually change voltage, while MMCX merely gates that
>> > > voltage for multimedia.
>> > >
>> >
>> > No, MMCX is a separate rail from CX, which powers the display blocks and
>> > is parent of MDSS_GDSC. But I see in rpmhpd that sc7180 is not one of
>> > these platforms, so I presume this means that the displayport controller
>> > thereby sits in MDSS_GDSC parented by CX.
>> >
>> > But in line with what you're saying, the naming of the supplies to the
>> > QMP indicates that the power for the PLLs is static. As such the only
>> > moving things would be the clock rates in the DP controller and as such
>> > that's what needs to scale the voltage.
>> >
>> > So if the resources we're scaling is the clocks in the DP controller
>> > then the gist of the patch is correct. The only details I see is that
>> > the DP controller actually sits in MDSS_GDSC - while it should control
>> > the level of its parent (CX). Not sure if we can describe that in a
>> > simple way.
>> 
>> Right. I'm not sure things could be described any better right now. If
>> we need to change this to be MDSS_GDSC power domain and control the
>> level of the parent then I suppose we'll have to make some sort of DT
>> change and pair that with a driver change. Maybe if that happens we 
>> can
>> just pick a new compatible and leave the old code in place.
>> 
> 
> I would prefer that we stay away from making up a new compatible for
> that, but let's see when we get there.
> 
>> Are you happy enough with this current patch?
>> 
> 
> Yes, I think this looks good.
> 
>> >
>> >
>> > PS. Why does the node name of the opp-table have to be globally unique?
>> 
>> Presumably the opp table node name can be 'opp-table' as long as it
>> lives under the node that's using it. If the opp table is at / or /soc
>> then it will need to be unique. I'd prefer just 'opp-table' if 
>> possible.
> 
> I asked the same question (if it has to be globally unique) in the 
> patch
> adding sdhci nodes for sc7280 and I didn't get a sufficient answer...
> 
> So now I do want to know why "opp-table" wouldn't be sufficient name 
> for
> these device-internal nodes.
> 
my opinion is dp_opp_table is more consistency with mdp and dsi.
Either one is fine. Please let me know asap.
> Regards,
> Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
