Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE6426F3E
	for <lists+freedreno@lfdr.de>; Fri,  8 Oct 2021 18:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2386E0EF;
	Fri,  8 Oct 2021 16:42:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051F66E0FC
 for <freedreno@lists.freedesktop.org>; Fri,  8 Oct 2021 16:42:56 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso3089189ooq.8
 for <freedreno@lists.freedesktop.org>; Fri, 08 Oct 2021 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hGP1K12EK69dgMcB4kecVV9CICgWOfW/66kRYJ6uGPI=;
 b=KF7IffvvXQW+jkKJfU3ob8BTX+iywoP07beloHVa8CobP+JDLJ/C4I59pEnp+O0oUF
 XcYRTirTIxi/kFSnw2OCov5Q4G8F9xepEtQNqty/LqGBby+q+nxfRqkTEWPy8lB2ovVr
 dAwuD4wcfrJDv80r9adg907WX9esA22KyT9nHdsb3498GpuNGjxqUsudY2cRNre75ZXt
 wawVCAhfu/twWD+z0kOx1n4kEenvdx1FTRjx2vTA3heZPankRE2ajFrSXNO0TNWFMcIH
 aovcnSMyOTDyL4DSjRPIeyH+bsx7rT7zY2HsWQCFS6g3JAD4CggEFsXFOW/93m1RwEbc
 hCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hGP1K12EK69dgMcB4kecVV9CICgWOfW/66kRYJ6uGPI=;
 b=5oe98qoIHlHzgVvhbg2ECAPt1UOhSBVNNZQCXo8y+A1xAeWhHj6waPkqQ/j4i12BHC
 wkzfPIsYkS1x4/Dp/Te+QjEXwnqv5QeYDRgD4I1rmB+BVyFY52yu9zPGrvGd75O2NQxp
 S2Uz3WrIdVCPesSZ+SZ7r5fmMS2ijo8tk2Pd+Ng02Vf7uuV6s8XpOlNqGoMlqEDVm2wp
 PqYsE1eBtFg3pTpdvOYAuYEME7lamGXkAcX8pYmkYOSd4SGLu8cSF/K7dZlD/ROECjbQ
 ydfLcgOrnXo9x7RkChlb/wzpQd6svQhCYvqywAWJE1X4vhvhvbypfxEtp7KkOdN57WL7
 UxBA==
X-Gm-Message-State: AOAM532uMpbnrA9bdja0mQNb4HV9fzqidOTgqNJ0H1dyjRsyTKLydI9V
 cpRGqoy675H3wqzUlgpqQeiAtw==
X-Google-Smtp-Source: ABdhPJwuIpGbJvtwKWWdXC1NXVzErf746PitgjMnxDkkR40INg8TdeVGOkTSrAK9LCI033+yRbA9uw==
X-Received: by 2002:a4a:49d2:: with SMTP id z201mr791650ooa.84.1633711375273; 
 Fri, 08 Oct 2021 09:42:55 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id o14sm481307oos.11.2021.10.08.09.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 09:42:54 -0700 (PDT)
Date: Fri, 8 Oct 2021 09:44:33 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: khsieh@codeaurora.org
Cc: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sankeerth Billakanti <sbillaka@codeaurora.org>
Message-ID: <YWB1cXoaGRXfGau1@ripper>
References: <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
 <YV0FlTyMEzlyNsN9@ripper>
 <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org>
 <YV3dddt/GOidTmlN@ripper>
 <9dc50145fb3e9b189fd38857b20f326a@codeaurora.org>
 <YV9TQEKPh4SXYFF/@ripper>
 <0c72f3fd8c49cdada09bb6ee366b53a6@codeaurora.org>
 <CAE-0n51bvKXmHj0X_cvR2fdk4-mh4SRsrEE33H0e1Q+p=7iPxA@mail.gmail.com>
 <ad244133bdba4570b0b45871fd136350@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad244133bdba4570b0b45871fd136350@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Shorten SETUP timeout
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 08 Oct 09:07 PDT 2021, khsieh@codeaurora.org wrote:

> On 2021-10-07 15:34, Stephen Boyd wrote:
> > Quoting khsieh@codeaurora.org (2021-10-07 13:28:12)
> > > On 2021-10-07 13:06, Bjorn Andersson wrote:
> > > > On Thu 07 Oct 12:51 PDT 2021, khsieh@codeaurora.org wrote:
> > > >
> > > >> On 2021-10-06 10:31, Bjorn Andersson wrote:
> > > >> > On Wed 06 Oct 08:37 PDT 2021, khsieh@codeaurora.org wrote:
> > > >> >
> > > >> > > On 2021-10-05 19:10, Bjorn Andersson wrote:
> > > >> > > > On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:
> > > >> > > >
> > > >> > > > > On 2021-10-05 15:36, Stephen Boyd wrote:
> > > >> > > > > > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> > > >> > > > > > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> > > >> > > > > > >
> > > >> > > > > > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > >> > > > > > > > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > >> > > > > > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > >> > > > > > > > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > >> > > > > > > > > eDP this reduction improves the user experience dramatically - i.e.
> > > >> > > > > > > > > removes 9.9s of bland screen time at boot.
> > > >> > > > > > > > >
> > > >> > > > > > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > >> > > > > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > >> > > > > > > > > ---
> > > >> > > > > > > >
> > > >> > > > > > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > > >> > > > > > > > re-read the code a couple times to understand that it's waiting 100ms
> > > >> > > > > > > > times the 'delay' number. Whaaaaat?
> > > >> > > > > > > >
> > > >> > > > > > >
> > > >> > > > > > > I assume you're happy with the current 10s delay on the current
> > > >> > > > > > > devices, so I don't think we should push for this to be backported.
> > > >> > > > > > > I have no need for it to be backported on my side at least.
> > > >> > > > > > >
> > > >> > > > > >
> > > >> > > > > > Sure. Fixes tag != backported to stable trees but it is close.
> > > >> > > > > >
> > > >> > > > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > >> > > > > > >
> > > >> > > > >   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
> > > >> > > > >
> > > >> > > > > This patch will prevent usb3 from working due to dp driver
> > > >> > > > > initialize phy
> > > >> > > > > earlier than usb3 which cause timeout error at power up usb3 phy
> > > >> > > > > when both
> > > >> > > > > edp and dp are enabled.
> > > >> > > >
> > > >> > > > Can you please help me understand what you mean here, I use this on my
> > > >> > > > sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
> > > >> > > > work? Or am I just lucky in some race condition?
> > > >> > > >
> > > >> > > > Thanks,
> > > >> > > > Bjorn
> > > >> > > >
> > > >> > > The problem is seen at sc7280.
> > > >> > > Apple dongle have both  hdmi and usb port.
> > > >> > > plug Apple dongle into type-c, then plug DP into apple's hdmi port
> > > >> > > and usb
> > > >> > > mouse into apple's usb port.
> > > >> > > If edp enabled at this time, then usb mouse will not work due to
> > > >> > > timeout at
> > > >> > > phy power up.
> > > >> > >
> > > >> >
> > > >> > Okay, so you're saying that if the DP driver invokes phy_power_on()
> > > >> > before the USB driver does, USB initialization fails (or at least USB
> > > >> > doesn't work)?
> > > >>
> > > >> if dp driver call qcom_qmp_phy_init() before usb3 call
> > > >> qcom_qmp_phy_init(),
> > > >> usb3 driver will timeout at readl_poll_timeout(status, val, (val &
> > > >> mask) ==
> > > >> ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().
> > > >
> > > > Thanks, I will try to reproduce this on my side. So the 10 seconds here
> > > > is strictly to give good enough time for the dwc3 driver to probe...
> > > >
> > > > Any idea why you're saying that this is specific to sc7280, what
> > > > changed
> > > > from sc7180?
> > > 
> > > I did not have sc7180 with edp before so that i am not sure it will
> > > happen on sc7180 or not.
> > > The usb3 does not work when both edp and dp enabled I just seen at
> > > sc7280.
> > > Current at sc7280 EC is not boot up correctly when system power up.
> > > I have to manual reboot EC from linux kernel shell before DP/usb3 can
> > > work.
> > > I am not sure this contribute to this problem or not.
> > > 
> > 
> > Can you make the usb driver into a module and only load that module
> > later in boot after the DP driver calls qcom_qmp_phy_init()? That would
> > be an easy way to move usb probe after DP probe and expose this problem.
> 
> we need usb calls qcom_qmp_phy_init() before dp.

Why?
