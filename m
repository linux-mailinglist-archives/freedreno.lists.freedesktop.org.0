Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239671F21E3
	for <lists+freedreno@lfdr.de>; Tue,  9 Jun 2020 00:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3A589F82;
	Mon,  8 Jun 2020 22:37:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9876589F82
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jun 2020 22:37:01 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id t25so16900886oij.7
 for <freedreno@lists.freedesktop.org>; Mon, 08 Jun 2020 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K2/QowlQF5mc64F4D/RIrE7YecSYcNfpv5/vBazsU68=;
 b=YoLH9s/K/Q9F2icLGQ4XsZ8yu34FpvCJWwojbzdGbDurrkiHcXCFSCy3FoJkWSiy3v
 ttxN1tKlG+tKqtaDuusQXGxcoYxAqVReyLgBQl1PcyR1ZwZp0pBpPOPsPo71/MhepPX1
 TAlNJPez35trLSgzDHzZEhmRB9+n4fqnr8UMqQoTNeTg6jg6EdOASp/qq4C7sepzG9Cd
 dZJWCGvrEIyu5+XKoLiiqXIf6j+5wBS8cSdu1lwUmBNGajuww2Lml136v36elMFLLBlr
 Ka/gIOFoy6ErsrRJZh6TEMEyVDIeFEF0Mg+ikohuWdsdh0ciUnmL46WhAoOe+rkmwelJ
 +EiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2/QowlQF5mc64F4D/RIrE7YecSYcNfpv5/vBazsU68=;
 b=IlYDlO18+5enkB1F8jR++LJpsh2ObfojUmsIaCDRI3LJNNe6/hcm4fm3vYogUFj9O0
 7NYkQYRPWa/SNnKNinIbMdRZ2ABOAkOIgdSU74suC/mgrUhBUoFgYAPrLpqX4pupEnu/
 xgPJw4EkVXpvD7hWaZyLr/byVzsDb+Tsysj+JuwiDq9bLjk9uSIDCbgw97EdIIm7WB6u
 wrKAUKSZZLWnU0XfAMbrfH8llUtZMNp+3RpqCinUb/Fw3GUZgkoFQ5tzm4t5AshCLaaD
 wLIGCbgNNWLwwvtDDzU0liS2Wr3UT0kT+Gygtdv7yg7AIfMn9Y+QQX/+JUwPYOdhSJli
 eB7g==
X-Gm-Message-State: AOAM530SGJb2MaSfxYzZCr5xKrWgzy+nP+xqcq99j6fCXWG6BFYxandt
 BqSTH4r4hWnLXV8Y3xvY/mRD3zO2817I2Es6I/mqNg==
X-Google-Smtp-Source: ABdhPJxIVKuOn/EYkNbXNpa9saF5jSFauCOTybMaENNZXSr0SEt5psJ1bIFC5jcp72iD0nqj2OOCaxBHUwukVfcj1E4=
X-Received: by 2002:aca:2108:: with SMTP id 8mr1330741oiz.10.1591655819262;
 Mon, 08 Jun 2020 15:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
 <CALAqxLViRrga-XW2o1J1JutFdS1d-qmmgOrEP2beNygw3A7H4A@mail.gmail.com>
In-Reply-To: <CALAqxLViRrga-XW2o1J1JutFdS1d-qmmgOrEP2beNygw3A7H4A@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 8 Jun 2020 15:36:47 -0700
Message-ID: <CALAqxLWbhioSH4pFyM348VrGWxRXHQV1s9bdz6HArYguLtAFcw@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: add support for color
 processing blocks in dpu driver
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
Cc: Amit Pundir <amit.pundir@linaro.org>, mkrishn@codeaurora.org,
 travitej@codeaurora.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Rob Clark <robdclark@gmail.com>, hoegsberg@chromium.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jun 8, 2020 at 3:25 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Mar 25, 2020 at 1:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > This change adds support to configure dspp blocks in
> > the dpu driver.
> >
> > Macro description of the changes coming in this patch.
> > 1) Add dspp definitions in the hw catalog.
> > 2) Add capability to reserve dspp blocks in the display data path.
> > 3) Attach the reserved block to the encoder.
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Hey all,
>   With this patch now merged upstream, I'm seeing a regression on
> db845c that I bisected down to it.
>
> When I boot up I see:
> [   40.976737] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> error]failed to get dspp on lm 0
> [   40.985600] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> error]failed to get dspp on lm 0
> [   40.994587] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> error]failed to get dspp on lm 0
> [   41.003492] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> error]failed to get dspp on lm 0
> [   41.012283] [drm:_dpu_rm_make_reservation] [dpu error]unable to
> find appropriate mixers
> [   41.020369] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
> resources: -119
>
> Over and over, and the display doesn't start up.
>
> I suspect we're supposed to catch the following check before the failure:
>
> +       if (!reqs->topology.num_dspp)
> +               return true;
>
> I suspect the issue is in dpu_encoder_get_topology() we don't fully
> initialize the topology structure on the stack before returning it.
>
> Does that sound plausible or is there likely some other cause?

This guess is wrong. The topology.num_dspp is 2, but lm_cfg->dspp is
coming back as zero.

I'll continue digging to see if I can understand better whats going wrong.

thanks
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
