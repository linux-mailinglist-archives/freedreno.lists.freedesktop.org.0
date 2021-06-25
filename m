Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639BF3B4729
	for <lists+freedreno@lfdr.de>; Fri, 25 Jun 2021 18:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028166EE0A;
	Fri, 25 Jun 2021 16:05:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398C06EE0A
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jun 2021 16:05:03 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so9764203oti.2
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jun 2021 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xd9PNnGbU+0JOU0hQhDvobfIV8H89CTisLD0oCZtB/Q=;
 b=ClbrzjpoTksrtFJM90bLEICDamVSAwKvnUIqWHFLdXIWK/KAikDxvddnvg+BPsyMGC
 JKSzu4ZgAs8Fja8rYS653qZ7XUdU0vH4s0GzISfoaxD0VYMgMbS3qgjXvz7A1tIeh7wz
 7P8zAYi1YzuWzIHyPmItNA6czsmz8ql9pwSUF9PSIogAuiRao4/0xP4D/q+/aq16aAU3
 92G13Xs+ZpLs8+NLvKPyoBBd105jl+K3QI5U2gIoSez2Bz6Ef7UAR/bGBlK4KDq5855S
 lU1UveAToK40bSlnLiIQ3cKnCBpuXGMz03zJjkRyQngDaM+RywVbWu/LuAuU+fQdL3TY
 iNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xd9PNnGbU+0JOU0hQhDvobfIV8H89CTisLD0oCZtB/Q=;
 b=soyFYU8in9EAzaI0o2Nkf8k96n0kvadDV6wojVVedmuF5Hxw9+7BkWQVC6J2NV/E8X
 NUSHoSqW4AzdtIjeud+MfjyELpnYWPcSgf8H4yi9Nw073wsSvtISe7oA9s8ShZzAL7sz
 xCzxKyZ5R1DcFg1UqiNpEgKfXtzUcWuX1jprqsigSSakCGqWiGux3fR8R9Nu/PNNA8VJ
 yTLZ8AnJSZIKgfgKv5DnMNgIiM6tSYS6hSkUFfx/r+RDLqfAX6w4Kmne1w8CaNAT9PbK
 +Cr51uJSdUafxlqxw8s221HM3/zi7emj5a3YiZzXTLp6lrExctHIv5liCC7EGKK/RELT
 POBQ==
X-Gm-Message-State: AOAM5337SS3mpnltSCz963SjdQyvzy/OGrW9AUK5MIz+2NIj1naV1Pck
 hUttbWWApa65I3z4i+9gSQUFUA==
X-Google-Smtp-Source: ABdhPJxmWQ5bf/6uYdjNUSQN553DmyHudDT79L+nx9GPVInArVpEskKs+ENqfS1mM6eR5Zl6azBIWQ==
X-Received: by 2002:a9d:5885:: with SMTP id x5mr10281258otg.299.1624637102441; 
 Fri, 25 Jun 2021 09:05:02 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s15sm1421205oih.15.2021.06.25.09.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 09:05:01 -0700 (PDT)
Date: Fri, 25 Jun 2021 11:04:59 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: khsieh@codeaurora.org
Message-ID: <YNX+qyJjagO7A9+Q@yoga>
References: <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga>
 <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
 <YL/41hWz8xB+jSeO@yoga>
 <21dc5c9fc2efdc1a0ba924354bfd9d75@codeaurora.org>
 <CAE-0n52J_mLsmXLS+skZn2u3k9dhn+GcHeXi0B2BeQyQxEUL9A@mail.gmail.com>
 <YM0THrlJlv7ADW8w@builder.lan>
 <CAE-0n53Zr-w5m-eFhLM2BVmphcYb_M4=s5je3Y7Lg6=onNo=uA@mail.gmail.com>
 <YNKiB3ZEtOQ+T/MX@yoga>
 <b157a691a1cb8f860219ca3b2c335411@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b157a691a1cb8f860219ca3b2c335411@codeaurora.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 25 Jun 10:55 CDT 2021, khsieh@codeaurora.org wrote:

> On 2021-06-22 19:52, Bjorn Andersson wrote:
> > On Tue 22 Jun 15:23 CDT 2021, Stephen Boyd wrote:
> > 
> > > Quoting Bjorn Andersson (2021-06-18 14:41:50)
> > > > On Fri 18 Jun 15:49 CDT 2021, Stephen Boyd wrote:
> > > >
> > > > > Quoting khsieh@codeaurora.org (2021-06-10 09:54:05)
> > > > > > On 2021-06-08 16:10, Bjorn Andersson wrote:
> > > > > > > On Tue 08 Jun 17:44 CDT 2021, Stephen Boyd wrote:
> > > > > > >
> > > > > > >> Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
> > > > > > >> digital logic. Probably the PLL is the hardware that has some minimum
> > > > > > >> CX
> > > > > > >> requirement, and that flows down into the various display clks like
> > > > > > >> the
> > > > > > >> link clk that actually clock the DP controller hardware. The mdss_gdsc
> > > > > > >> probably gates CX for the display subsystem (mdss) so if we had proper
> > > > > > >> corner aggregation logic we could indicate that mdss_gdsc is a child
> > > > > > >> of
> > > > > > >> the CX domain and then make requests from the DP driver for particular
> > > > > > >> link frequencies on the mdss_gdsc and then have that bubble up to CX
> > > > > > >> appropriately. I don't think any of that sort of code is in place
> > > > > > >> though, right?
> > > > > > >
> > > > > > > I haven't checked sc7180, but I'm guessing that it's following the
> > > > > > > other
> > > > > > > modern platforms, where all the MDSS related pieces (including e.g.
> > > > > > > dispcc) lives in the MMCX domain, which is separate from CX.
> > > > > > >
> > > > > > > So the parent of MDSS_GDSC should be MMCX, while Kuogee's answer (and
> > > > > > > the dp-opp-table) tells us that the PLL lives in the CX domain.
> > > > >
> > > > > Isn't MMCX a "child" of CX? At least my understanding is that MMCX is
> > > > > basically a GDSC that clamps all of multimedia hardware block power
> > > > > logic so that the leakage is minimized when multimedia isn't in use,
> > > > > i.e. the device is suspended. In terms of bumping up the voltage we have
> > > > > to pin that on CX though as far as I know because that's the only power
> > > > > domain that can actually change voltage, while MMCX merely gates that
> > > > > voltage for multimedia.
> > > > >
> > > >
> > > > No, MMCX is a separate rail from CX, which powers the display blocks and
> > > > is parent of MDSS_GDSC. But I see in rpmhpd that sc7180 is not one of
> > > > these platforms, so I presume this means that the displayport controller
> > > > thereby sits in MDSS_GDSC parented by CX.
> > > >
> > > > But in line with what you're saying, the naming of the supplies to the
> > > > QMP indicates that the power for the PLLs is static. As such the only
> > > > moving things would be the clock rates in the DP controller and as such
> > > > that's what needs to scale the voltage.
> > > >
> > > > So if the resources we're scaling is the clocks in the DP controller
> > > > then the gist of the patch is correct. The only details I see is that
> > > > the DP controller actually sits in MDSS_GDSC - while it should control
> > > > the level of its parent (CX). Not sure if we can describe that in a
> > > > simple way.
> > > 
> > > Right. I'm not sure things could be described any better right now. If
> > > we need to change this to be MDSS_GDSC power domain and control the
> > > level of the parent then I suppose we'll have to make some sort of DT
> > > change and pair that with a driver change. Maybe if that happens we
> > > can
> > > just pick a new compatible and leave the old code in place.
> > > 
> > 
> > I would prefer that we stay away from making up a new compatible for
> > that, but let's see when we get there.
> > 
> > > Are you happy enough with this current patch?
> > > 
> > 
> > Yes, I think this looks good.
> > 
> > > >
> > > >
> > > > PS. Why does the node name of the opp-table have to be globally unique?
> > > 
> > > Presumably the opp table node name can be 'opp-table' as long as it
> > > lives under the node that's using it. If the opp table is at / or /soc
> > > then it will need to be unique. I'd prefer just 'opp-table' if
> > > possible.
> > 
> > I asked the same question (if it has to be globally unique) in the patch
> > adding sdhci nodes for sc7280 and I didn't get a sufficient answer...
> > 
> > So now I do want to know why "opp-table" wouldn't be sufficient name for
> > these device-internal nodes.
> > 
> my opinion is dp_opp_table is more consistency with mdp and dsi.
> Either one is fine. Please let me know asap.

I presume you mean dp-opp-table, and you're right, that is perfectly in
line with gpu-opp-table, mdp-opp-table and dsi-opp-table. But there's
also a few examples showing me that there's no need for it to be
globally unique.

So "dp_opp_table: opp-table" is the form I want and we should fix all
those other cases.

I'll update your patch as I apply it, no need to respin it for that.

Thanks,
Bjorn

> > Regards,
> > Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
