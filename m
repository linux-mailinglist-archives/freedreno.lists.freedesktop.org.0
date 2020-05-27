Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C241E50FB
	for <lists+freedreno@lfdr.de>; Thu, 28 May 2020 00:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559086E3D2;
	Wed, 27 May 2020 22:11:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19284897F3
 for <freedreno@lists.freedesktop.org>; Wed, 27 May 2020 22:11:15 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id h74so4858667vka.7
 for <freedreno@lists.freedesktop.org>; Wed, 27 May 2020 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ib++0cCLLitVx1shV2jGQa+ni4nOQcBF64cPLDTrgCc=;
 b=NcXYcKIVwG0ueKs966DI5d737p2jqNpsHmdvqJgR5Ck2iSd69RDowe2cbDvVSielEW
 4f4lDTsaueLXnEUlskfiQPVLfIGMNLtm+QHarALLKVNc2VVcQWaft+Ihz6qri+7/WBZj
 pqaDs2RMNbRSOwWWEDWMuRuS01IjqvQlxSczM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ib++0cCLLitVx1shV2jGQa+ni4nOQcBF64cPLDTrgCc=;
 b=QsDRWb0LFr7gPSk1Jd6iK+NKpE19WLuksOBxCd3/IfxobbmJnrx3mOyeRcOdCMtRF1
 zyx47fvCRZiWnhSnbWeGMb/K8jPGEI6dz6WZFfaEts50qWEykZnar0IlOm+0F5YV5MQR
 ZprmPtJfYQLMGzM8DiTsjjNYiTgTxwzTAAZ6tPF/KtJkomZDfri7QNJdkvvsIMUcVElc
 5D3U4DCc74kxRwCm6A2gsB9dBRnw4CoZlylJWrZn0Zjd+rnIg8TvgLWS680LQxk3rBq8
 kcDzlCgUdsa8MTDOQ4wASnhkRhP8k8O4nn9KYAFwqwraUv9q8ZClF3g5CBxI+cNnQAUK
 TN1A==
X-Gm-Message-State: AOAM532o48/tFO7mpJas35QOc2K6xYTY8njCYB7SeK4nzRckaG1MBhjF
 bRUyJbb5nU1U5coJNH24mO1uuXOHoaE=
X-Google-Smtp-Source: ABdhPJweXhNgCjP/VpiEa7/xLqFJ8rRaLNsXTWMh4BQdC9AqPp8Ab7SRSKEzC/4b9fAemyGqYzyqsQ==
X-Received: by 2002:a1f:4a83:: with SMTP id x125mr150337vka.44.1590617473726; 
 Wed, 27 May 2020 15:11:13 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id j65sm392581vkc.22.2020.05.27.15.11.12
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 15:11:13 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id l15so14678816vsr.3
 for <freedreno@lists.freedesktop.org>; Wed, 27 May 2020 15:11:12 -0700 (PDT)
X-Received: by 2002:a67:e884:: with SMTP id x4mr6706217vsn.106.1590617472047; 
 Wed, 27 May 2020 15:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
 <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
 <CAD=FV=VVi6oUDx_2Yf543ZphS1oQJiQU8St0XNUHs7HyPkoTeg@mail.gmail.com>
In-Reply-To: <CAD=FV=VVi6oUDx_2Yf543ZphS1oQJiQU8St0XNUHs7HyPkoTeg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 May 2020 15:11:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XphGpmBwZdL0jZ5HEFdxY3L7nH+s9_A0Kjamtg7j3R9w@mail.gmail.com>
Message-ID: <CAD=FV=XphGpmBwZdL0jZ5HEFdxY3L7nH+s9_A0Kjamtg7j3R9w@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <seanpaul@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org, travitej@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, May 15, 2020 at 9:37 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, May 15, 2020 at 5:06 AM <kalyan_t@codeaurora.org> wrote:
> >
> > On 2020-05-14 21:47, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org>
> > > wrote:
> > >>
> > >> "The PM core always increments the runtime usage counter
> > >> before calling the ->suspend() callback and decrements it
> > >> after calling the ->resume() callback"
> > >>
> > >> DPU and DSI are managed as runtime devices. When
> > >> suspend is triggered, PM core adds a refcount on all the
> > >> devices and calls device suspend, since usage count is
> > >> already incremented, runtime suspend was not getting called
> > >> and it kept the clocks on which resulted in target not
> > >> entering into XO shutdown.
> > >>
> > >> Add changes to force suspend on runtime devices during pm sleep.
> > >>
> > >> Changes in v1:
> > >>  - Remove unnecessary checks in the function
> > >>     _dpu_kms_disable_dpu (Rob Clark).
> > >>
> > >> Changes in v2:
> > >>  - Avoid using suspend_late to reset the usagecount
> > >>    as suspend_late might not be called during suspend
> > >>    call failures (Doug).
> > >>
> > >> Changes in v3:
> > >>  - Use force suspend instead of managing device usage_count
> > >>    via runtime put and get API's to trigger callbacks (Doug).
> > >>
> > >> Changes in v4:
> > >>  - Check the return values of pm_runtime_force_suspend and
> > >>    pm_runtime_force_resume API's and pass appropriately (Doug).
> > >>
> > >> Changes in v5:
> > >
> > > Can you please put the version number properly in your subject?  It's
> > > really hard to tell one version of your patch from another.
> > >
> > >
> > >>  - With v4 patch, test cycle has uncovered issues in device resume.
> > >>
> > >>    On bubs: cmd tx failures were seen as SW is sending panel off
> > >>    commands when the dsi resources are turned off.
> > >>
> > >>    Upon suspend, DRM driver will issue a NULL composition to the
> > >>    dpu, followed by turning off all the HW blocks.
> > >>
> > >>    v5 changes will serialize the NULL commit and resource unwinding
> > >>    by handling them under PM prepare and PM complete phases there by
> > >>    ensuring that clks are on when panel off commands are being
> > >>    processed.
> > >
> > > I'm still most definitely not an expert in how all the DRM pieces all
> > > hook up together, but the solution you have in this patch seems wrong
> > > to me.  As far as I can tell the "prepare" state isn't supposed to be
> > > actually doing the suspend work and here that's exactly what you're
> > > doing.  I think you should find a different solution to ensure
> > > ordering is correct.
> > >
> > > -Doug
> > >
> >
> > Hi,
>
> Quite honestly I'm probably not the right person to be reviewing this
> code.  I mostly just noticed one of your early patches and it looked
> strange to me.  Hopefully someone with actual experience in how all
> the DRM components work together can actually review and see if this
> makes sense.  Maybe Sean would know better?
>
> That being said, let me at least look at what you're saying...
>
>
> > Prepare and Complete are callbacks defined as part of Sleep and Resume
> > sequence
> >
> > Entering PM SUSPEND the phases are : prepare --> suspend -->
> > suspend_late --> suspend_noirq.
> > While leaving PM SUSPEND the phases are: resume_noirq --> resume_early
> > --> resume --> complete.
>
> Sure, it's part of the sequence.  It's also documented in pm.h as:
>
>  * The principal role of this callback is to prevent new children of
>  * the device from being registered after it has returned (the driver's
>  * subsystem and generally the rest of the kernel is supposed to prevent
>  * new calls to the probe method from being made too once @prepare() has
>  * succeeded).
>
> It does not feel like that matches your usage of this call.
>
>
> > The reason to push drm suspend handling to PM prepare phase is that
> > parent here will trigger a modeset to turn off the timing and
> > subsequently the panel.
> > the child devices should not turn of their clocks before parent unwinds
> > the composition. Hence they are serialized as per the sequence mentioned
> > above.
>
> So the general model in Linux is that children suspend before their
> parents, right?  So you're saying that, in this case, the parent needs
> to act on the child before the child suspends.  Is that correct?
>
> Rather than hijacking the prepare/complete, I'd be at least slightly
> inclined to move the other driver to turn off its clocks in
> suspend_late and to turn them back on in resume_early?  That seems to
> be what was done in "analogix_dp-rockchip.c" to solve a similar
> problem.
>
>
> > A similar approach is taken by other driver that use drm framework. In
> > this driver, the device registers for prepare and complete callbacks to
> > handle drm_suspend and drm_resume.
> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/exynos/exynos_drm_drv.c#L163
>
> OK, if there is another driver in DRM then I guess I won't object too
> strongly.  Note that when searching for other drivers I noticed this
> bit in todo.rst:
>
> * Most drivers (except i915 and nouveau) that use
> * drm_atomic_helper_suspend/resume() can probably be converted to use
> * drm_mode_config_helper_suspend/resume(). Also there's still open-coded version
> * of the atomic suspend/resume code in older atomic modeset drivers.
>
> Does anything get fixed if you do that?  It seems like it'd cleanup
> your code a bit so maybe worth doing anyway...
>
> ---
>
> I guess the last question I'd want resolved is why you have this asymmetry:
>
> SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, msm_pm_resume)
>
> Why couldn't you use pm_runtime_force_resume()?

I'm curious if you had answers to any of the questions I posed in my review.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
