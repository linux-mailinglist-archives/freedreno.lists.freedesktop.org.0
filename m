Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851FD29F404
	for <lists+freedreno@lfdr.de>; Thu, 29 Oct 2020 19:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D80D6E5BD;
	Thu, 29 Oct 2020 18:23:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CBD6E8B7
 for <freedreno@lists.freedesktop.org>; Thu, 29 Oct 2020 18:23:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p22so732183wmg.3
 for <freedreno@lists.freedesktop.org>; Thu, 29 Oct 2020 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WptYepIxvUtBGbdfe98byMus1rF84W8IHfRhIetB8kE=;
 b=RQBKJR+7mIXmVt2BzbUwRmfEBlPWlq+vo62QPLGc5veKhuZtO2NmyOyX6KqEa1cc/V
 Pz9XOpHJ6eo/sdS5lsc4BUAU+00BrTZ5SZd1Y9nLLzCOZ4x68BFzBDGCOdzdT1K9ldrC
 yGPHEjqMynYomFJgV0EfMfpmEf+0TFA+yueS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WptYepIxvUtBGbdfe98byMus1rF84W8IHfRhIetB8kE=;
 b=takPxghyR4lMqPZQPJqxJcDeufhF4+9hvsEHGx9lrZBrtN6zPJjEsiyHWDQs2UOzSR
 9eLt6+734NihKUNX6R/yybCKW9+I+3dAKIWvCkpeoxkPYKMPFyBGJDQYH/ykOpqTzWSN
 SUfs6+c1MCeH9J0FRnzj3r0G/H93cVx9Ko9HL0nbO2ScskTZMRDKi8/Q3f1EDJj4KwgY
 pPzZvE8Fq5cAYu8zAr1qFh4CRFrE8tyJ0e90MFL0pRqms1a3OYIT8URrAMu+dxRIiCOR
 7jdGpHjcac3or2Z14hXSQaieBQOAs8LfVY1nVTX1AoOiM4x7x7wge6CqQrdiR5oPQNGB
 mxIQ==
X-Gm-Message-State: AOAM531yJPF/ZBqiaXbfmCYP/JobmmNFA4OvOSo/9vTD7G07WQMgU8Mq
 ArtWVaWxGfcF5D/V23HTKYMYtg==
X-Google-Smtp-Source: ABdhPJyp95YENdHwZ66lxLNl0XS2/n4giFjn2XgtRCJ954OsgnABOBSWtRN3hojBXjSHm5FxATl9fQ==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr170768wmc.4.1603995779199;
 Thu, 29 Oct 2020 11:22:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o184sm1025591wmo.37.2020.10.29.11.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 11:22:58 -0700 (PDT)
Date: Thu, 29 Oct 2020 19:22:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201029182256.GD401619@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Sean Paul <sean@poorly.run>
References: <20201023165136.561680-1-robdclark@gmail.com>
 <20201023165136.561680-24-robdclark@gmail.com>
 <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
 <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
 <20201026093405.GG401619@phenom.ffwll.local>
 <CAKMK7uHK27hMu+zSR0O35gR-Nq-JDXpXWBFXPBcXUhOi_3AKnw@mail.gmail.com>
 <CAF6AEGsSY2WtQ33mSZFmju7bSkjP3Zsi2vBnGDy35+YFCWu7qw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsSY2WtQ33mSZFmju7bSkjP3Zsi2vBnGDy35+YFCWu7qw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 09:59:09AM -0700, Rob Clark wrote:
> On Thu, Oct 29, 2020 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Oct 26, 2020 at 10:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Oct 23, 2020 at 08:49:14PM -0700, Rob Clark wrote:
> > > > On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > >
> > > > > On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > If there is only a single ring (no-preemption), everything is FIFO order
> > > > > > and there is no need to implicit-sync.
> > > > > >
> > > > > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > > > > is undefined when fences are not used to synchronize buffer usage across
> > > > > > contexts (which is the only case where multiple different priority rings
> > > > > > could come into play).
> > > > >
> > > > > Really, doesn't this break cross-device implicit sync? Okay, you may
> > > > > not have many peripherals that rely on implicit sync on devices where
> > > > > Adreno is usually found, but it seems rather heavy-handed.
> > > > >
> > > > > Wouldn't it be better to only ignore fences from your own ring context
> > > > > in the implicit sync, like we do in the common DRM scheduler
> > > > > (drm_sched_dependency_optimized)?
> > > >
> > > > we already do this.. as was discussed on an earlier iteration of this patchset
> > > >
> > > > But I'm not aware of any other non-gpu related implicit sync use-case
> > > > (even on imx devices where display is decoupled from gpu).. I'll
> > > > revert the patch if someone comes up with one, but otherwise lets let
> > > > the implicit sync baggage die
> > >
> > > The thing is, dma_resv won't die, even if implicit sync is dead. We're
> > > using internally for activity tracking and memory management. If you don't
> > > set these, then we can't share generic code with msm, and I think everyone
> > > inventing their own memory management is a bit a mistake.
> > >
> > > Now you only kill the implicit write sync stuff here, but I'm not sure
> > > that's worth much since you still install all the read fences for
> > > consistency. And if userspace doesn't want to be synced, they can set the
> > > flag and do this on their own: I think you should be able to achieve
> > > exactly the same thing in mesa.
> > >
> > > Aside: If you're worried about overhead, you can do O(1) submit if you
> > > manage your ppgtt like amdgpu does.
> >
> > So just remember a use-case which is maybe a bit yucky, but it is
> > actually possible to implement race-free. If you have implicit sync.
> >
> > There's screen-capture tool in mplayer and obs which capture your
> > compositor by running getfb2 in a loop. It works, and after some
> > initial screaming I realized it does actually work race-free. If you
> > have implicit sync.
> >
> > I really don't think you can sunset this, as much as you want to. And
> > sunsetting it inconsistently is probably the worst.
> 
> For the case where you only have a single ring, as long as it is
> importing the fb in to egl to read it (which it would need to do to
> get a linear view), this would still all work

Hm right we still have the implicit sync of the ringbuffer. At least until
you add a submit scheduler to msm ...

> (but I may drop this patch because it is just a micro-optimization and
> seems to cause more confusion)

Yeah I'd say without numbers to justify it it feels a bit on thin ice :-)
-Daniel

> 
> BR,
> -R
> 
> 
> > -Daniel
> >
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > >
> > > >
> > > > >
> > > > > Regards,
> > > > > Lucas
> > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > index d04c349d8112..b6babc7f9bb8 100644
> > > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > > > > >  {
> > > > > >       int i, ret = 0;
> > > > > >
> > > > > > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > > >                               return ret;
> > > > > >               }
> > > > > >
> > > > > > -             if (no_implicit)
> > > > > > +             if (!implicit_sync)
> > > > > >                       continue;
> > > > > >
> > > > > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > > > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > > > >       if (ret)
> > > > > >               goto out;
> > > > > >
> > > > > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > > > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > > >       if (ret)
> > > > > >               goto out;
> > > > > >
> > > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
