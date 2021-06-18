Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC21A3AD484
	for <lists+freedreno@lfdr.de>; Fri, 18 Jun 2021 23:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315B66EAAD;
	Fri, 18 Jun 2021 21:41:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB1D6EAAD
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jun 2021 21:41:53 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id q10so12067442oij.5
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jun 2021 14:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HEAuigaKYRmeY+WM5XLEktX0+rBVmYO66uMcr8Tpv8k=;
 b=qKuYzrv6j4NzmU3yjTgh08cBfgpCmtwmdOO7VGZ7x0Wpyin21OENhZDu7wYnqoPHs0
 HSf75CkxWeZDgoBEaPxChHYUt5+6a/LZp+UQfFNLL72O/1pm3JfnKtHcimfPf1wvGFsK
 poM9I5TIeRpi+AimpmuU9P+DEjUlJCP5DvFRLmNJ3ohBlA38DBiGpq/qbXooI+RTeqE2
 QEZBQesKMQb1KSBaVQP/GcKcH5JDJNePOIK0Tjz2UnVD/BrvTieA7bjgoJJ7mSpQILtx
 pegolu/d0kmopoCrWrq8d+aWTjSm/xsplTaxmVBEc1adWHwRzLxv8kFO639cXh2f2XTX
 R9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HEAuigaKYRmeY+WM5XLEktX0+rBVmYO66uMcr8Tpv8k=;
 b=A8Np21Ju9OJEvWJZmdM8s7v0PWoZkz+twT9BY6WRsI1h9PFy+8j7JkVLQ23VmG3uAU
 OhbkwOYN12TVWbffTPzILYt3CPwVR/H/BDY9TeaO+cmjB4xzsNBf0u95dWrktUQGuBqW
 OzhXNdpIoIXSTKjzQYzhl5tBOIAsbX9muMO2rwH7mDXVDg0Wl10hcY0iH2FNIRhW+whb
 L4xzGyXHW86sewt6mhbxp7kVI4ttDJL5yRcJpGMr9B/5/Zi3Jzkm0GIEl9Ak9k9htJ+e
 JR0gzEWXPOIIm3dqd08ZDBBv3op/do4pFGvU2DI9pEBvscMLzVmz0Q93XJSSu17LWaUW
 y+FA==
X-Gm-Message-State: AOAM5316UbtD4hQBEDRiUsF7q6rtXbmSLGN0FV3b+SRSAP/33MX4WTRt
 f5EGkcHOg18c66UGQJd4ctfczQ==
X-Google-Smtp-Source: ABdhPJw+EvH62tnCFbU9WxcWHYUQU643zznk/FLKiDJaeLJ8T0g0z4cu85QEzzdO6spdx+DKHd9AHQ==
X-Received: by 2002:aca:de07:: with SMTP id v7mr15863677oig.8.1624052512628;
 Fri, 18 Jun 2021 14:41:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 94sm2251023otj.33.2021.06.18.14.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:41:51 -0700 (PDT)
Date: Fri, 18 Jun 2021 16:41:50 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <YM0THrlJlv7ADW8w@builder.lan>
References: <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <YL6sY/1E5wLzMiP/@yoga>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
 <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga>
 <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
 <YL/41hWz8xB+jSeO@yoga>
 <21dc5c9fc2efdc1a0ba924354bfd9d75@codeaurora.org>
 <CAE-0n52J_mLsmXLS+skZn2u3k9dhn+GcHeXi0B2BeQyQxEUL9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE-0n52J_mLsmXLS+skZn2u3k9dhn+GcHeXi0B2BeQyQxEUL9A@mail.gmail.com>
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

On Fri 18 Jun 15:49 CDT 2021, Stephen Boyd wrote:

> Quoting khsieh@codeaurora.org (2021-06-10 09:54:05)
> > On 2021-06-08 16:10, Bjorn Andersson wrote:
> > > On Tue 08 Jun 17:44 CDT 2021, Stephen Boyd wrote:
> > >
> > >> Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
> > >> digital logic. Probably the PLL is the hardware that has some minimum
> > >> CX
> > >> requirement, and that flows down into the various display clks like
> > >> the
> > >> link clk that actually clock the DP controller hardware. The mdss_gdsc
> > >> probably gates CX for the display subsystem (mdss) so if we had proper
> > >> corner aggregation logic we could indicate that mdss_gdsc is a child
> > >> of
> > >> the CX domain and then make requests from the DP driver for particular
> > >> link frequencies on the mdss_gdsc and then have that bubble up to CX
> > >> appropriately. I don't think any of that sort of code is in place
> > >> though, right?
> > >
> > > I haven't checked sc7180, but I'm guessing that it's following the
> > > other
> > > modern platforms, where all the MDSS related pieces (including e.g.
> > > dispcc) lives in the MMCX domain, which is separate from CX.
> > >
> > > So the parent of MDSS_GDSC should be MMCX, while Kuogee's answer (and
> > > the dp-opp-table) tells us that the PLL lives in the CX domain.
> 
> Isn't MMCX a "child" of CX? At least my understanding is that MMCX is
> basically a GDSC that clamps all of multimedia hardware block power
> logic so that the leakage is minimized when multimedia isn't in use,
> i.e. the device is suspended. In terms of bumping up the voltage we have
> to pin that on CX though as far as I know because that's the only power
> domain that can actually change voltage, while MMCX merely gates that
> voltage for multimedia.
> 

No, MMCX is a separate rail from CX, which powers the display blocks and
is parent of MDSS_GDSC. But I see in rpmhpd that sc7180 is not one of
these platforms, so I presume this means that the displayport controller
thereby sits in MDSS_GDSC parented by CX.

But in line with what you're saying, the naming of the supplies to the
QMP indicates that the power for the PLLs is static. As such the only
moving things would be the clock rates in the DP controller and as such
that's what needs to scale the voltage.

So if the resources we're scaling is the clocks in the DP controller
then the gist of the patch is correct. The only details I see is that
the DP controller actually sits in MDSS_GDSC - while it should control
the level of its parent (CX). Not sure if we can describe that in a
simple way.


PS. Why does the node name of the opp-table have to be globally unique?

Regards,
Bjorn

> > >
> > >
> > > PS. While this goes for the QMPs the DSI and eDP/DP PHYs (and PLLs)
> > > seems to live in MMCX.
> > >
> > > Regards,
> > > Bjorn
> >
> > Dp link clock rate is sourced from phy/pll (vco). However it is possible
> > that different link clock rate
> > are sourced from same vco (phy/pll) rate. Therefore I think CX rail
> > voltage level is more proper to
> > be decided base on link clock rate.
> >
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
