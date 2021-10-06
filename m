Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D015424434
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 19:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA456EDDD;
	Wed,  6 Oct 2021 17:29:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2286EDDE
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 17:29:53 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so4012891otb.10
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sriAlmS/O1ECrsUc2OnPgpiaqh82uZoYCygtIK25Qms=;
 b=U5/BlyXEMbL16pTIuvauG2ZaIDGc6fUX3EV72SGDx4T74Tpwj7UsA4oMhgwrGuZ0rW
 fcA3XyEz97l1ejfg/T3jSNAKYJfOn3lgIulJaltlOzES327tc9JDntqc1WoDwL3IQY+I
 ZX1T766ELr1cACdNGgEYpKpbd4Pd2IiW5/0EdQea1shQixU0ojEhOwdPfmKvKPa1Wm42
 llCsdKQGeEgbfvYOVDfukom68SPhSvDcSK3fFkcrVK4pywZp8HYdJ6x7hp4mpZORmK+y
 iCrBFqSBLAhcSpdFT2gVkB1duSzYAnhDyvHMt7Bb5Cf8jI+opOh59nm4Zr8BHDD6Hd56
 tclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sriAlmS/O1ECrsUc2OnPgpiaqh82uZoYCygtIK25Qms=;
 b=hzZkwAvgSAnQjY41ZGVFAFVavJ2qLcgHVvjUpvtdhvI8/9zG/Z+7DoVOzNIphhyQXK
 NTxeDTUsBgqXhGqkuWADhApPZNpbHAjJjseSK/ZGWFz5nLQVO1DQ9tgqMPH9IYPGpY2Y
 prTZpocfWd8G5xdlFg5At0Pry0dqimhITzh6H330cxlhFfd6hMJQ001M0R5ycQXGPemV
 7npdF65RzQ70eZA5UGBlfMBHsm0dKuUxF0RukcbCPQeoPHCzJXO0I+o5bD8dvc72JCCT
 Y7jKr+e3MaWf0P/EDpllszCBRNsoqslsIG/fwZRuK1Th1Z3WFzXli4ubWUAQTJF/Levt
 R0Uw==
X-Gm-Message-State: AOAM531cxbUuecPys8RB6e6igkmBwAYcRhjpZN7PP8H+qZETIZNcjMWu
 EzR4YaAYIavtQ+bLA1QfjfjZ6g==
X-Google-Smtp-Source: ABdhPJyS/b8mbpHQI/Rhb/Fwvm6HfYEn/3btWLeRutifqSrkBNiIKsEaa4tSBor2yY437OBnLj1jhg==
X-Received: by 2002:a9d:1716:: with SMTP id i22mr20008206ota.20.1633541392652; 
 Wed, 06 Oct 2021 10:29:52 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id z24sm4027968oic.26.2021.10.06.10.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:29:52 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:31:33 -0700
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
Message-ID: <YV3dddt/GOidTmlN@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
 <YV0FlTyMEzlyNsN9@ripper>
 <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org>
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

On Wed 06 Oct 08:37 PDT 2021, khsieh@codeaurora.org wrote:

> On 2021-10-05 19:10, Bjorn Andersson wrote:
> > On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:
> > 
> > > On 2021-10-05 15:36, Stephen Boyd wrote:
> > > > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> > > > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> > > > >
> > > > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > > > > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > > > > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > > > > > eDP this reduction improves the user experience dramatically - i.e.
> > > > > > > removes 9.9s of bland screen time at boot.
> > > > > > >
> > > > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > > > ---
> > > > > >
> > > > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > > > > > re-read the code a couple times to understand that it's waiting 100ms
> > > > > > times the 'delay' number. Whaaaaat?
> > > > > >
> > > > >
> > > > > I assume you're happy with the current 10s delay on the current
> > > > > devices, so I don't think we should push for this to be backported.
> > > > > I have no need for it to be backported on my side at least.
> > > > >
> > > >
> > > > Sure. Fixes tag != backported to stable trees but it is close.
> > > >
> > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > >
> > >   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
> > > 
> > > This patch will prevent usb3 from working due to dp driver
> > > initialize phy
> > > earlier than usb3 which cause timeout error at power up usb3 phy
> > > when both
> > > edp and dp are enabled.
> > 
> > Can you please help me understand what you mean here, I use this on my
> > sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
> > work? Or am I just lucky in some race condition?
> > 
> > Thanks,
> > Bjorn
> > 
> The problem is seen at sc7280.
> Apple dongle have both  hdmi and usb port.
> plug Apple dongle into type-c, then plug DP into apple's hdmi port and usb
> mouse into apple's usb port.
> If edp enabled at this time, then usb mouse will not work due to timeout at
> phy power up.
> 

Okay, so you're saying that if the DP driver invokes phy_power_on()
before the USB driver does, USB initialization fails (or at least USB
doesn't work)?

Sounds like something we need to work out in the QMP phy driver. Do you
have any more details about what's going wrong.


Also, I've seen various references to said "Apple dongle", do you have a
link to the exact one you're testing with so I can pick one up for
testing purposes as well?

Regards,
Bjorn

> > > I had prepared a patch (drm/msm/dp: do not initialize combo phy
> > > until plugin
> > > interrupt) to fix this problem.
> > > Unfortunately, my patch is depend on Bjorn's patch (PATCH v3 3/5]
> > > drm/msm/dp: Support up to 3 DP controllers).
> > > I will submit my patch for review once Bjorn's patches merged in.
> > > Therefore I would think this patch should go after both Bjorn's
> > > patches and
> > > my patch.
> > > 
> > > 
> > > 
