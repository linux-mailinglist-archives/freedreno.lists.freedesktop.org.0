Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F9B3C7569
	for <lists+freedreno@lfdr.de>; Tue, 13 Jul 2021 18:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF11489F24;
	Tue, 13 Jul 2021 16:58:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E692D89F24
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jul 2021 16:58:30 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 b14-20020a056830310eb02904c7e78705f4so460601ots.13
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jul 2021 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6SEHtexM30zQ1pNlegjyNVvT5I02vNfZvNmYrTBM0+0=;
 b=ZQ+ry+Bx8r9GFRJnBTRGJ89JZCMdTEXJ7q5yArO2dp23xWpZw4BvXP1uG4PK+Uq/ie
 t4UPLQr8vSBiOZFs0RUvpyf6uMGF3ZQntmNGZDOdBBUow/VsywUeAw3wdXzYzCrq/+h2
 QA7P5Sr7mYfyRDcB20gerZcLdLFsNws/E1mDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6SEHtexM30zQ1pNlegjyNVvT5I02vNfZvNmYrTBM0+0=;
 b=n3Z0WcfII5DSqhdczrChf3a1jASYnB7WapLQK7tjcP5wHDfM3btBemNEBTv5C1SFU9
 qiPRWY3r02OTxu7yEpsrK97E6QbCWFi831IRGprRlDinadQD2JsaH03YQOU/URjC+z22
 ZIAOfJYCiF7AOQVFDBMEb7HPhQ5gQOH19Q4THBT39Z0UvpWdA+CFiTrSriYVxtKrK0zA
 Bar377DN3NTeBW3yESi3zoBtMBWywGeYpRXbWOUjTZJEU1buXLrZwMZjBdhKsacTiFjB
 YiItRpalBa9cv3iyCQQ3ofcDv0M4Vz8fP5ZDQ+Enz2HOmm/MeclLEVDvraO4DrVJE5XB
 FgKA==
X-Gm-Message-State: AOAM531aklYDK7JgxNsdeAkGtNzEnaeZX0AvyH6tzGo5zCMeGbpq3FJ1
 zyehJwVRtZpkRrT7kyliDYrDT9r5k7e3g/U1tB7ZJw==
X-Google-Smtp-Source: ABdhPJwfBxb7hGnmJjrluM8xypb4cOTE7kDdsy2G6JzETLnn61eE66M9+B1vlIXxd1/coMtHeMn4CAh93opbQGLOymI=
X-Received: by 2002:a05:6830:2366:: with SMTP id
 r6mr4310903oth.188.1626195510078; 
 Tue, 13 Jul 2021 09:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-15-daniel.vetter@ffwll.ch>
 <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
In-Reply-To: <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 18:58:19 +0200
Message-ID: <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v4 14/18] drm/msm: Don't break exclusive
 fence ordering
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > There's only one exclusive slot, and we must not break the ordering.
> >
> > Adding a new exclusive fence drops all previous fences from the
> > dma_resv. To avoid violating the signalling order we err on the side of
> > over-synchronizing by waiting for the existing fences, even if
> > userspace asked us to ignore them.
> >
> > A better fix would be to us a dma_fence_chain or _array like e.g.
> > amdgpu now uses, but
> > - msm has a synchronous dma_fence_wait for anything from another
> >   context, so doesn't seem to care much,
> > - and it probably makes sense to lift this into dma-resv.c code as a
> >   proper concept, so that drivers don't have to hack up their own
> >   solution each on their own.
> >
> > v2: Improve commit message per Lucas' suggestion.
> >
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index b71da71a3dd8..edd0051d849f 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> >                                 return ret;
> >                 }
> >
> > -               if (no_implicit)
> > +               /* exclusive fences must be ordered */
> > +               if (no_implicit && !write)
> >                         continue;
>
> In practice, modern userspace (the kind that is more likely to set the
> no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
> every bo, to shave some cpu overhead so I suppose this would not
> really hurt anything
>
> Do you know if this is covered in any piglit/etc test?

You need some command submission, plus buffer sharing with vgem
setting it's own exclusive fences, plus checking with dma_buf poll()
whether it signals all in the right order. That's pretty low-level, so
maybe something in igt, but I haven't typed that. Maybe I need to do
that for i915 at least.
-Daniel

> BR,
> -R
>
> >
> >                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > --
> > 2.32.0
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
