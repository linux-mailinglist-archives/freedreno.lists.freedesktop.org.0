Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800284235B7
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 04:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACA26ECB3;
	Wed,  6 Oct 2021 02:08:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BBD6ECB8
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 02:08:49 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id y201so1932846oie.3
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 19:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lYqbd1yY6Vt/MStunvcBDmbeftnynuSmElbE65yJeuI=;
 b=GC6d96YWZxDnlnByKPE8fzKDBgpe+/UipmMF6p4IzkEANqw1A+OhrXdDLSPEZdgDy4
 am8AsWG52xoFc6BD1SSQypkjO8/pMZdsimyMa0CTKwTOCVB+58kihH0X4CilBV7FzGrF
 WX+AM7FGM1t8QjqF2kVBwQD9XAkawVs5tMe1myGfh2X0jlwxR1lHFmp9rcMmyVJus8aw
 UeUQPVSmfb/2fCUwCtXoCf9AWZy/mAxrPsHgnJXkKS4gxCFRGBQ470PbFnKB6H9COVJd
 wbYZ9vaA9bqwPHC45Dj+ztPNh5EvwRv0UkZjFKEBmxNs6zXDyVgpTk2NuMug5pg2dXW6
 SpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lYqbd1yY6Vt/MStunvcBDmbeftnynuSmElbE65yJeuI=;
 b=dvgDHZ6Z1U4LAQx+0hwgkuWZKf0IB3SVV3eiMKMqJCMe2FzppjlKfgr7VjX6cb1BkQ
 xFfRhxPjae5NLfXiUaQLYXEaX3s/CuDpZI98bDxaKd3gLYqQ9C/EGXrMTSLTZSc/Ugvj
 KB86y8OW3lj0xuBIfj0j1l70RF2obzOnTU68saZZymGt7XMnCaMGVSuI7kalAsyY/r99
 iWg74t/NEYCnmRz1IZ2d22RsXTgtY9f0624t1iVtnXussmj4rbO6vbKRuTHgh3FGh4mi
 dQ3cFJgYL21HUz2iVFGrXxA2ql7hhPKE/5XkUGJ+51uRFW+b+9JsDO4t180p7wVH8aZ0
 bSRQ==
X-Gm-Message-State: AOAM531CuOa/p2e0eyxzMRDkf1z0O7cQEge+KsCjCWkV2rV0VcN7DkAM
 mfLGOUZnUOBy6hlG+klVulSzRa/+85/7kA==
X-Google-Smtp-Source: ABdhPJwOAzvNXUWrQOMZZ6Pn52U6g6WPpbGpk9AzF5O1hc8wZyZsEDHPz1VOQo1RF640zOdBhAsitA==
X-Received: by 2002:a05:6808:a99:: with SMTP id
 q25mr5117219oij.162.1633486128519; 
 Tue, 05 Oct 2021 19:08:48 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id l23sm3535076otk.21.2021.10.05.19.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 19:08:48 -0700 (PDT)
Date: Tue, 5 Oct 2021 19:10:29 -0700
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
Message-ID: <YV0FlTyMEzlyNsN9@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
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

On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:

> On 2021-10-05 15:36, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> > > 
> > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > > > eDP this reduction improves the user experience dramatically - i.e.
> > > > > removes 9.9s of bland screen time at boot.
> > > > >
> > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > ---
> > > >
> > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > > > re-read the code a couple times to understand that it's waiting 100ms
> > > > times the 'delay' number. Whaaaaat?
> > > >
> > > 
> > > I assume you're happy with the current 10s delay on the current
> > > devices, so I don't think we should push for this to be backported.
> > > I have no need for it to be backported on my side at least.
> > > 
> > 
> > Sure. Fixes tag != backported to stable trees but it is close.
> > 
> > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > 
>   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
> 
> This patch will prevent usb3 from working due to dp driver initialize phy
> earlier than usb3 which cause timeout error at power up usb3 phy when both
> edp and dp are enabled.

Can you please help me understand what you mean here, I use this on my
sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
work? Or am I just lucky in some race condition?

Thanks,
Bjorn

> I had prepared a patch (drm/msm/dp: do not initialize combo phy until plugin
> interrupt) to fix this problem.
> Unfortunately, my patch is depend on Bjorn's patch (PATCH v3 3/5]
> drm/msm/dp: Support up to 3 DP controllers).
> I will submit my patch for review once Bjorn's patches merged in.
> Therefore I would think this patch should go after both Bjorn's patches and
> my patch.
> 
> 
> 
