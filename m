Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB729F0E7
	for <lists+freedreno@lfdr.de>; Thu, 29 Oct 2020 17:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E376E8D8;
	Thu, 29 Oct 2020 16:14:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A106E8CD
 for <freedreno@lists.freedesktop.org>; Thu, 29 Oct 2020 16:14:40 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id j21so2772874ota.13
 for <freedreno@lists.freedesktop.org>; Thu, 29 Oct 2020 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i6etDFeKtUj+RtB8Hig0oByEs1X05vnGUjehBWAxKJ0=;
 b=JM8mmzrw2EIMWTSgXhoxYpNCZD/kbBIkLatmDmz6EvmNi2aHE4F5HWIEBMT2e9rVtj
 vee/pN885rxskj/y1aYzLuGj96hMCkTeA2H/K/mcI8cd1j3f4cM0kyZJoUbF43HcTN45
 RnviYKwKrR5iq9ojbuj7d/uUu290M4d1GlwPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i6etDFeKtUj+RtB8Hig0oByEs1X05vnGUjehBWAxKJ0=;
 b=OiSJsS76Hmm6Q6u2O5m0enXIccPWFBKSWUQd6oQhLmN7G7AVe1QqTMjUr6r8vQo7MS
 l0vtXDXf0qaFAWU/kI5QqegPQJAqnWS8p6ENW2NZqPCOtF2jRsD1Kw38CLThkx8vBqCO
 o3IPc5wNuTyYakvTRfDPm9Q3FdbTLqfNWwR/T4+k+LmWBZsNo+gVck1i67GLe/8eJ8zp
 gTzAKyxsKmK4ENHgIbLCWTNeHQokc1qTfN2Nrpu9Rk6KD/aL4yxHolv9Qx30SeI7pPP9
 fqQaGVywYfnT48Kf+HYvBrrOXzzvMLMvng0oBizC9lDU5nP6MnGSqnl7fiizwmyRBbvj
 ie6A==
X-Gm-Message-State: AOAM530S4CzPLwudn/dDOWhjXP7y0eVfZSvmEzRJc0kFYGZ3WaYXvo75
 8sIhI3zrg1HecM2ElNTzXghwks3sEFQ/+0PJoZu56Q==
X-Google-Smtp-Source: ABdhPJzPHzC8UIBm63CxXaV40WY8W+RrSlKqzKbRX+dYTIIbYWElVjSUdt4KiCZJrMjvPqNqDV5P/bOU4CfJH1rKOi0=
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr3667472otr.303.1603988079536; 
 Thu, 29 Oct 2020 09:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201023165136.561680-1-robdclark@gmail.com>
 <20201023165136.561680-24-robdclark@gmail.com>
 <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
 <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
 <20201026093405.GG401619@phenom.ffwll.local>
In-Reply-To: <20201026093405.GG401619@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Oct 2020 17:14:28 +0100
Message-ID: <CAKMK7uHK27hMu+zSR0O35gR-Nq-JDXpXWBFXPBcXUhOi_3AKnw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v4 23/23] drm/msm: Don't implicit-sync if
 only a single ring
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 10:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Oct 23, 2020 at 08:49:14PM -0700, Rob Clark wrote:
> > On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > >
> > > On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > If there is only a single ring (no-preemption), everything is FIFO order
> > > > and there is no need to implicit-sync.
> > > >
> > > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > > is undefined when fences are not used to synchronize buffer usage across
> > > > contexts (which is the only case where multiple different priority rings
> > > > could come into play).
> > >
> > > Really, doesn't this break cross-device implicit sync? Okay, you may
> > > not have many peripherals that rely on implicit sync on devices where
> > > Adreno is usually found, but it seems rather heavy-handed.
> > >
> > > Wouldn't it be better to only ignore fences from your own ring context
> > > in the implicit sync, like we do in the common DRM scheduler
> > > (drm_sched_dependency_optimized)?
> >
> > we already do this.. as was discussed on an earlier iteration of this patchset
> >
> > But I'm not aware of any other non-gpu related implicit sync use-case
> > (even on imx devices where display is decoupled from gpu).. I'll
> > revert the patch if someone comes up with one, but otherwise lets let
> > the implicit sync baggage die
>
> The thing is, dma_resv won't die, even if implicit sync is dead. We're
> using internally for activity tracking and memory management. If you don't
> set these, then we can't share generic code with msm, and I think everyone
> inventing their own memory management is a bit a mistake.
>
> Now you only kill the implicit write sync stuff here, but I'm not sure
> that's worth much since you still install all the read fences for
> consistency. And if userspace doesn't want to be synced, they can set the
> flag and do this on their own: I think you should be able to achieve
> exactly the same thing in mesa.
>
> Aside: If you're worried about overhead, you can do O(1) submit if you
> manage your ppgtt like amdgpu does.

So just remember a use-case which is maybe a bit yucky, but it is
actually possible to implement race-free. If you have implicit sync.

There's screen-capture tool in mplayer and obs which capture your
compositor by running getfb2 in a loop. It works, and after some
initial screaming I realized it does actually work race-free. If you
have implicit sync.

I really don't think you can sunset this, as much as you want to. And
sunsetting it inconsistently is probably the worst.
-Daniel

> -Daniel
>
> >
> > BR,
> > -R
> >
> >
> >
> > >
> > > Regards,
> > > Lucas
> > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index d04c349d8112..b6babc7f9bb8 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > > >       return ret;
> > > >  }
> > > >
> > > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > > >  {
> > > >       int i, ret = 0;
> > > >
> > > > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > >                               return ret;
> > > >               }
> > > >
> > > > -             if (no_implicit)
> > > > +             if (!implicit_sync)
> > > >                       continue;
> > > >
> > > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >       if (ret)
> > > >               goto out;
> > > >
> > > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > >       if (ret)
> > > >               goto out;
> > > >
> > >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
