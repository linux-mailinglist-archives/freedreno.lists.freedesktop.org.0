Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A163A06BE
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 00:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AA76E5D3;
	Tue,  8 Jun 2021 22:26:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD90E6E5D3
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 22:26:27 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t140so17914422oih.0
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zEVt4/c8lCCNqBGSoq0YIzdJWJUhrx9cSDWBmiuwl3Q=;
 b=NH6AZogFTIQAehx/IPJIZOXHKcbR97a4hXmH6UkB/RAObPSx36Jr3192QR5zz0LElg
 f2CIKAXSbtyBoOLzBhMxymkjtlX1xv7CdXR2AgWkLMnKsbKGOeKJqo+qy2fW7eDeSUZ+
 nLly6tGwsNWtUB8HIjIcNqDOT6mkTyoR+vQu5zqDpnKOmfrmvwovSdrK5AUE7M/UwocU
 UO5jq+xGroaF9jYF3IPq1uU8QDyxsMTJFzG9YH9TgOCpJtZdwzXpjUoZDILJr4/RQwi+
 JEo4j79a8NqXyDatfB+zWaCMe6wVX6qMzibu7XI+H7KAg/TFN8sgiKphtClFLqbgLzMi
 L2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zEVt4/c8lCCNqBGSoq0YIzdJWJUhrx9cSDWBmiuwl3Q=;
 b=Nz7N1HvVQ7FUogf14nCEFm7EnQ1EJDu9NpH0fqKVDl2xztNEyMvk2vCAz2HE7KMySc
 +PK176f6VpoHB8rv/Ab8scYbaJCxYdCoewpAAf+GcMctooxsHVlG9eiO8PmwITLM1/bG
 Js1xFw716vWObvM5yspLWK13qk3vXIbu9fOrwd26aQus1d1cq93+kI5qfb7Kiod694Pv
 1f94hMPtYr+E0YjOnHNWsVkpe4t0k2eKBXWDQd4c8Q80FvM91OYMkQvdUiDkbQvEbyIq
 ctmEWUjHuTHSzDkvBBPZ1nvon6HQ1Xo/EUsVok3oKHxm2KrB8+Tl3z1xNiIQbs40xLRH
 oQ0Q==
X-Gm-Message-State: AOAM532GceP5+ULqNl5cfeiPPnArXoJzgh/BW3InU1WDqM//6vWk/fJM
 HlA8r44ZoaKgxzD6CjBwIxqzOA==
X-Google-Smtp-Source: ABdhPJwwPivLBLTPZZXHggklQbT8BkpioImdV/IT0T25YTOA/Wz8xXB2krv/o5SVJGfYlXTG8jaLQQ==
X-Received: by 2002:a05:6808:195:: with SMTP id
 w21mr2463312oic.7.1623191186987; 
 Tue, 08 Jun 2021 15:26:26 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id f25sm1043989oto.26.2021.06.08.15.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 15:26:26 -0700 (PDT)
Date: Tue, 8 Jun 2021 17:26:23 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <YL/uj+t+BFkII1Fh@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga>
 <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
 <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <YL6sY/1E5wLzMiP/@yoga>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
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

On Tue 08 Jun 17:15 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-06-07 16:31:47)
> > On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:
> >
> > > On 2021-06-05 22:07, Bjorn Andersson wrote:
> > > > On Thu 03 Jun 16:56 CDT 2021, khsieh@codeaurora.org wrote:
> > > >
> > > > > On 2021-06-03 09:53, Bjorn Andersson wrote:
> > > > > > On Thu 03 Jun 11:09 CDT 2021, Kuogee Hsieh wrote:
> > > > [..]
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > > [..]
> > > > > > > +                             power-domains = <&rpmhpd SC7180_CX>;
> > > > > >
> > > > > > Just curious, but isn't the DP block in the MDSS_GDCS? Or do we need to
> > > > > > mention CX here in order for the opp framework to apply required-opps
> > > > > > of CX?
> > > > >
> > > > > yes,
> > > >
> > > > If you want me, or other maintainers, to spend any time reviewing or
> > > > applying your patches going forward then you need to actually bother
> > > > replying properly to the questions asked.
> > > >
> > > > Thanks,
> > > > Bjorn
> > >
> > > Sorry about the confusion. What I meant is that even though DP controller is
> > > in the MDSS_GDSC
> > > power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
> > > impact
> > > on the CX voltage corners. Therefore, we need to mention the CX power domain
> > > here. And, since
> > > we can associate only one OPP table with one device, we picked the DP link
> > > clock over other
> > > clocks.
> >
> > Thank you, that's a much more useful answer.
> >
> > Naturally I would think it would make more sense for the PHY/PLL driver
> > to ensure that CX is appropriately voted for then, but I think that
> > would result in it being the clock driver performing such vote and I'm
> > unsure how the opp table for that would look.
> >
> > @Stephen, what do you say?
> >
> 
> Wouldn't the PHY be the one that sets some vote? So it wouldn't be the
> clk driver, and probably not from the clk ops, but instead come from the
> phy ops via phy_enable() and phy_configure().
> 

If I understand the logic correctly *_configure_dp_phy() will both
configure the vco clock and "request" the clock framework to change the
rate.

So I presume what you're suggesting is that that would be the place to
cast the CX corner vote?

> By the way, there's nothing wrong with a clk device doing power domain
> "stuff", except for that we haven't plumbed it into the clk framework
> properly and I'm fairly certain our usage of runtime PM in the clk
> framework today underneath the prepare_lock is getting us into trouble
> or will get us there soon.

On the bright side, it's wonderful that we're at a point where this is
not only a theoretical problem :)

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
