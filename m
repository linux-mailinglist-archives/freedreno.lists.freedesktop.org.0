Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 886CD3C75E0
	for <lists+freedreno@lfdr.de>; Tue, 13 Jul 2021 19:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356126E107;
	Tue, 13 Jul 2021 17:45:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141626E106
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jul 2021 17:45:48 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id h9so29551073oih.4
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jul 2021 10:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmtzcyst+8OgXBI41dqYr4OHovq38Lmve+NnPNNWFaA=;
 b=E9kH+I9A0KksyrSJYGuPUtireKMQ1h2VVRvbVTFj8eIP6xeFILzX1kJzRhrGWs6vO2
 0GxXLljCV1mje7M4duMNSElcxU8qhCQCWnKE3E3TutR8TWp1lLyaL6PvyZo22zMJ0oku
 7HEYM2UyRDUBzKlVlqAyP7or8ocosvwOWsNAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmtzcyst+8OgXBI41dqYr4OHovq38Lmve+NnPNNWFaA=;
 b=k1dNOxmCOVN5rh7TZr87HKt91Vktsdi9O8+rfCtL/qbOyNjPCxjbumltsd/nAi3MWP
 rZpMsKm6mdRi3APYYIGXFTdVCYk6/DAa8P3g08R4THOR4f4o+WIWWR4Zfxss0ZzYvIDh
 sySuVsepq4Q2+511F5fZ3/bQDvbR+HZTjgZ5IXIWOutQaWU5WLUCAdh/LiSJBE5dSNl8
 h5AjvYE5k6dJkbqbKqXRdjEWl1pP6jM7yFI9RYsNRdpyHLjormOjNXDMoBpMn2BPmBxE
 QjTP0NF30tonHl1Ekw6xLUPNvNKC0OuIRNEaaEbeAgsTG8L9sjAYgmrxY1VBWXLlrSDf
 oBEA==
X-Gm-Message-State: AOAM533fP94clmz8dCo0XsOC6C3xTVcf3KiNXPIg2wLhAjREzAvf8Fp+
 DB/vn1lHiH/6wK76CP0+sgR9IXzP+H/17THXjCYUgg==
X-Google-Smtp-Source: ABdhPJxzpjd8fmeN5xsqQQ8/UWTplGKa3o1OKFivFnAQ9i+M2VhbfW3DpqnVr7dh4haRV9U3tHRv1DXHvWi5XsqX2z4=
X-Received: by 2002:aca:3085:: with SMTP id w127mr398974oiw.101.1626198347467; 
 Tue, 13 Jul 2021 10:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-15-daniel.vetter@ffwll.ch>
 <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
 <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com>
 <CAF6AEGvsQnULTKwqWu+ToX0cVt12hs4SZrZ2Ai216m=8MBaqTQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvsQnULTKwqWu+ToX0cVt12hs4SZrZ2Ai216m=8MBaqTQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 19:45:36 +0200
Message-ID: <CAKMK7uF8wZuJVON0-06xDGtuSof2m6Y-cj7qkdUSTYd1PrVt9A@mail.gmail.com>
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

On Tue, Jul 13, 2021 at 7:42 PM Rob Clark <robdclark@gmail.com> wrote:
> On Tue, Jul 13, 2021 at 9:58 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Tue, Jul 13, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > There's only one exclusive slot, and we must not break the ordering.
> > > >
> > > > Adding a new exclusive fence drops all previous fences from the
> > > > dma_resv. To avoid violating the signalling order we err on the side of
> > > > over-synchronizing by waiting for the existing fences, even if
> > > > userspace asked us to ignore them.
> > > >
> > > > A better fix would be to us a dma_fence_chain or _array like e.g.
> > > > amdgpu now uses, but
> > > > - msm has a synchronous dma_fence_wait for anything from another
> > > >   context, so doesn't seem to care much,
> > > > - and it probably makes sense to lift this into dma-resv.c code as a
> > > >   proper concept, so that drivers don't have to hack up their own
> > > >   solution each on their own.
> > > >
> > > > v2: Improve commit message per Lucas' suggestion.
> > > >
> > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > Cc: Sean Paul <sean@poorly.run>
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: freedreno@lists.freedesktop.org
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index b71da71a3dd8..edd0051d849f 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > >                                 return ret;
> > > >                 }
> > > >
> > > > -               if (no_implicit)
> > > > +               /* exclusive fences must be ordered */
> > > > +               if (no_implicit && !write)
> > > >                         continue;
> > >
> > > In practice, modern userspace (the kind that is more likely to set the
> > > no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
> > > every bo, to shave some cpu overhead so I suppose this would not
> > > really hurt anything
> > >
> > > Do you know if this is covered in any piglit/etc test?
> >
> > You need some command submission, plus buffer sharing with vgem
> > setting it's own exclusive fences, plus checking with dma_buf poll()
> > whether it signals all in the right order. That's pretty low-level, so
> > maybe something in igt, but I haven't typed that. Maybe I need to do
> > that for i915 at least.
>
> ok, you lost me at vgem ;-)
>
> (the vgem vs cache situation on arm is kinda hopeless)

Oh that explains a few things ... I just found out why vgem is failing
for wc buffers on x86 (on some of our less-coherent igpu at least),
and wondered how the heck this works on arm. Sounds like it just
doesn't :-/

On the testcase: You'd never actually check buffer contents, only
fences, so the test would still work.
-Daniel
>
> BR,
> -R
>
> > -Daniel
> >
> > > BR,
> > > -R
> > >
> > > >
> > > >                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > --
> > > > 2.32.0
> > > >
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
