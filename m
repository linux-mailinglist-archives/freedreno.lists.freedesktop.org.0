Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D98D283E1B
	for <lists+freedreno@lfdr.de>; Mon,  5 Oct 2020 20:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D082E89CC4;
	Mon,  5 Oct 2020 18:19:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776A889C1A
 for <freedreno@lists.freedesktop.org>; Mon,  5 Oct 2020 18:19:04 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m11so3940797otk.13
 for <freedreno@lists.freedesktop.org>; Mon, 05 Oct 2020 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=In0H1HeRaahBqHRJG3WYCn/jPrfcT39VxygZWdrKz0U=;
 b=G9VnZHdzNM4pErmtEpJ1P06DEL/kfTfrDzrcMiS0K+PneP38wM4nkksUdHu+NCcAnW
 PVRbECL0+y0gPnfU9bYGb1SRyEpPt5657CnVeVTSzpK2xDkX7uaij8f6nYicopqm7U4/
 ZJe/HUFY5gn3zR59Rrrr6FYo2oi5CTo7poOTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=In0H1HeRaahBqHRJG3WYCn/jPrfcT39VxygZWdrKz0U=;
 b=YRRE93BkDOWSb1umDbGoC9Sbxe4OHZ3fA8AKbeMdugAiVMYCQtr8GKHRgzz1mzV6yv
 l2vm+A0YB9mBkTxAadGOLiV8xdZ7uv2rq88LRATKPxsYqwDtmAuEePOJDqcyu55ZVcOE
 C9khRiL09JMbaCOaTIvHYsuBVQu93Whvn11XNRL54kC3II9g4rEFJdt3rJWsoCHcQYD0
 yZKIz9zcSl0YIGX4yQrYFc+Flie4+16ySiw3vKW/YMsSAYX5AhdqPekKTm+SosFKtMoU
 Py3tQLcB9h/oKOMjnnrSL58O4bA4ORGxY140hC/iNRfzSkALzwcpjUxPW5ydt9bDnDbI
 5xDw==
X-Gm-Message-State: AOAM531uXVtJ4i5w741bxO550IJ6Tp2Gg9pUEdnIlaIayzabM4VoMxbo
 Rf+hE/TpwWZj84Q9xr7X+Pylln+SzH/F5jpe0fa/+g==
X-Google-Smtp-Source: ABdhPJwb2udB+ti8/BSw9azKpCYNapb5vn8dmsFNQ+jSRevONoZR7A89yIg5NYGsYY62/1FIqsrs3xTq/GQw/OTXO8g=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr364384otj.303.1601921943802; 
 Mon, 05 Oct 2020 11:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201005092419.15608-1-hdanton@sina.com>
 <20201005140203.GS438822@phenom.ffwll.local>
 <CAF6AEGveqvvv9MfBMAr34y9664fPouGjwPrK=v9OLVXv4dHzxg@mail.gmail.com>
In-Reply-To: <CAF6AEGveqvvv9MfBMAr34y9664fPouGjwPrK=v9OLVXv4dHzxg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 5 Oct 2020 20:18:52 +0200
Message-ID: <CAKMK7uHH2imD+8pG-bN8kXcOjvkcta88LXFC2Yb8hw25-cLBeQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 13/14] drm/msm: Drop struct_mutex in
 shrinker path
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, Hillf Danton <hdanton@sina.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 6:49 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Oct 5, 2020 at 7:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Oct 05, 2020 at 05:24:19PM +0800, Hillf Danton wrote:
> > >
> > > On Sun,  4 Oct 2020 12:21:45
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Now that the inactive_list is protected by mm_lock, and everything
> > > > else on per-obj basis is protected by obj->lock, we no longer depend
> > > > on struct_mutex.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem.c          |  1 -
> > > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
> > > >  2 files changed, 55 deletions(-)
> > > >
> > > [...]
> > >
> > > > @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> > > >  {
> > > >     struct msm_drm_private *priv =
> > > >             container_of(shrinker, struct msm_drm_private, shrinker);
> > > > -   struct drm_device *dev = priv->dev;
> > > >     struct msm_gem_object *msm_obj;
> > > >     unsigned long freed = 0;
> > > > -   bool unlock;
> > > > -
> > > > -   if (!msm_gem_shrinker_lock(dev, &unlock))
> > > > -           return SHRINK_STOP;
> > > >
> > > >     mutex_lock(&priv->mm_lock);
> > >
> > > Better if the change in behavior is documented that SHRINK_STOP will
> > > no longer be needed.
> >
> > btw I read through this and noticed you have your own obj lock, plus
> > mutex_lock_nested. I strongly recommend to just cut over to dma_resv_lock
> > for all object lock needs (soc drivers have been terrible with this
> > unfortuntaly), and in the shrinker just use dma_resv_trylock instead of
> > trying to play clever games outsmarting lockdep.
> >
> > I recently wrote an entire blog length rant on why I think
> > mutex_lock_nested is too dangerous to be useful:
> >
> > https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> >
> > Not anything about this here, just general comment. The problem extends to
> > shmem helpers and all that also having their own locks for everything.
>
> the shrinker lock class has existed for a while.. and is based on the
> idea that anything in the get-pages/vmap path cannot happen on a
> WONTNEED bo.. although perhaps there should be a few more 'if
> (WARN_ON(obj->madv != WILLNEED)) return -EBUSY'..

Yeah it works, but it's the kind of really clever stuff that
eventually bites again. For pretty much no benefit, if the lock is
held then you can assume someone else is using the object and you
won't be able to shrink it anyway. So trylock is enough.

> replacing obj->lock with dma_resv lock, might be a nice cleanup.. but
> I think it will be a bit churny..

Oh fully agreed, I tried to push the helpers a bit in that direction
for shmem/cma and gave up. Just something I think we should have in
mind. And in case your gpu ever becomes discrete ... yes the churn is
terrible :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
