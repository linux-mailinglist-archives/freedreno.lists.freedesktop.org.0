Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818AA3A06EC
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 00:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338D16E5D3;
	Tue,  8 Jun 2021 22:34:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0A36E5D3
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 22:34:04 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id s23so757220oiw.9
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 15:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Z2cNfvcQAcy2ANvLLjZJjzEI5gApw88qpo9VFjprV7o=;
 b=hjV9Lzd8YhaXBZN4GSOiJj40wzj9SDuNYxR2HaFBNfEVbp/fQ5cK4tOioLD1X2OUX2
 uYtdPK9q3irwTJJqg/aeChzTLLyMK6ustvInbvS23aX7mlpNB1Ye5eyVlTPZoa8fYIPE
 yaBQB3exJuY5ybsKj4A4UqrXO/+mqlt8hQpr+2krKZgAQDOUIEOPoyeF9AH9hOyKfdjx
 ARRBaoXTJv6GvOyeSJSr3gOmCOpO99VTk0MlRCnc4e/w/Kqg0lDhu5r5PfOV00cK7yWF
 fculQdbq+XRPqnlZXSxCd6Qh9BlnoR4Cu+81sCuK7eoPiA7g8RAHZsTibg2Wi6ibvWX0
 hM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z2cNfvcQAcy2ANvLLjZJjzEI5gApw88qpo9VFjprV7o=;
 b=IZ3Fy/QiOWWkRTE4YYaGX4eh0w7F9kLfG1v+YL2sEkEss1EWkj5mWwrsOpt3lUT35L
 S7mWjnEFbFRVQ9lP0qzFssXbnZ+XGP2oCNQBqd/ioOWMD6QN2KuaI5x/xTy6DhYv2UOf
 xwRksCQsYBSuC4BQifnHxC4UP0lzAScudeyNqcwBBuTFLQAEUsAa9uAAh/tDJ6O/Tcxu
 uPZ7EP0ND90WL3PSTAdzoJCrIRHIBhUdt4Q6hFdkoBp1qcMBsidwsoIuZbSKX1HZgdB6
 qcvFJkbRMC4bAxuKgSUN+g6x08zk9DbOE+lhnVSWRH1djpd81LGBvnXzad6ewjJriXWM
 noyA==
X-Gm-Message-State: AOAM533tiXXFVv0oXXgWRM9oTA0UPQKb9EzoFUwpSJC4LhiJv/IEk/7w
 S21O2SJ8GFYViPMstlKS8Cs0+w==
X-Google-Smtp-Source: ABdhPJydZSsBQopKHSARPdjPdI/RjKhExqcUJ297JFnLmqUOpbX/lAhjikw1P3if/3WtaIWisSJNKQ==
X-Received: by 2002:aca:1b0f:: with SMTP id b15mr4150593oib.178.1623191643760; 
 Tue, 08 Jun 2021 15:34:03 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id e19sm315895oiw.24.2021.06.08.15.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 15:34:03 -0700 (PDT)
Date: Tue, 8 Jun 2021 17:34:01 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <YL/wWdRs6e/eECiC@yoga>
References: <1622736555-15775-1-git-send-email-khsieh@codeaurora.org>
 <YLkI/6ItCz+SbbuJ@yoga>
 <ac326ec8689c0babb08b2311e19d52cc@codeaurora.org>
 <YLxX/YtegtbLmkri@builder.lan>
 <ef1879fa7ecfefaf0c70c7a4782240a9@codeaurora.org>
 <YL6sY/1E5wLzMiP/@yoga>
 <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
 <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
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

On Tue 08 Jun 17:29 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-06-08 15:26:23)
> > On Tue 08 Jun 17:15 CDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Bjorn Andersson (2021-06-07 16:31:47)
> > > > On Mon 07 Jun 12:48 CDT 2021, khsieh@codeaurora.org wrote:
> > > >
> > > > > Sorry about the confusion. What I meant is that even though DP controller is
> > > > > in the MDSS_GDSC
> > > > > power domain, DP PHY/PLL sources out of CX. The DP link clocks have a direct
> > > > > impact
> > > > > on the CX voltage corners. Therefore, we need to mention the CX power domain
> > > > > here. And, since
> > > > > we can associate only one OPP table with one device, we picked the DP link
> > > > > clock over other
> > > > > clocks.
> > > >
> > > > Thank you, that's a much more useful answer.
> > > >
> > > > Naturally I would think it would make more sense for the PHY/PLL driver
> > > > to ensure that CX is appropriately voted for then, but I think that
> > > > would result in it being the clock driver performing such vote and I'm
> > > > unsure how the opp table for that would look.
> > > >
> > > > @Stephen, what do you say?
> > > >
> > >
> > > Wouldn't the PHY be the one that sets some vote? So it wouldn't be the
> > > clk driver, and probably not from the clk ops, but instead come from the
> > > phy ops via phy_enable() and phy_configure().
> > >
> >
> > If I understand the logic correctly *_configure_dp_phy() will both
> > configure the vco clock and "request" the clock framework to change the
> > rate.
> >
> > So I presume what you're suggesting is that that would be the place to
> > cast the CX corner vote?
> 
> Yes that would be a place to make the CX vote. The problem is then I
> don't know where to drop the vote. Is that when the phy is disabled?

We do pass qcom_qmp_phy_power_off() and power down the DP part as DP
output is being disabled. So that sounds like a reasonable place to drop
the vote for the lowest performance state.

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
