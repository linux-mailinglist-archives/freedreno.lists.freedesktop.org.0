Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFDE11ED1E
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2019 22:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1ED6EDDD;
	Fri, 13 Dec 2019 21:43:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB676EDDE
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2019 21:43:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z17so207205ljk.13
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2019 13:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d1dqZmlN6wtZ4Bk73UD3YMJdSI9oY7E0XauOGfRocNg=;
 b=FNIzZBTGcAGwQtyQWIHTc2FT4kaoV+xoI1SVwsFZwZGywnVyK/R2P8vDiTsQ7UO6rZ
 PNHSxkGmFQDtJ/vS2irNWLlfp8YTB7euE3Ps6Wnc3jxwLp+nd3ccNGsBu9yV4VMfoTE6
 sqycY542dafg1VVA2HvsewuvcdReGVGgRQVxjSqdSosxaNtg5Hb01NUwD3mvEwF5AkbF
 z0S6b6joCxTic6WCyTaDYeDG+PoAB4bJWQSzocBaRMdqL4E0qG1Pc4RYipiSJ9q6JuH9
 jiEqfgJLyjCDOzzDS1Ashx1nBwUAj3MKY7E6mibyI8/+L/NUxNAsRO3WVYigXT/kItHt
 Oe9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1dqZmlN6wtZ4Bk73UD3YMJdSI9oY7E0XauOGfRocNg=;
 b=hJciESCGQMBNHDPCYYxDmBssPwlcc/KPgOGoXxVq3HdbXlRRGs4PLc81i4pBNC2GXs
 /ZxpXBWxAkBnKjU+i9NnkomvoN8ei7f7JELWi8RA09arjEOA4iYPmVaZ5Bs0jXqer1O7
 vobR1q1CSk5Dz+nnjPwUieTJu6BvPwMX8DxuJrJDBUPlSGFe/JwPPvUQTX0AiP8DXcqv
 Wxcl6/xDTNy/Hz9tjzL3vUcOgCkkRVqLF+QZ4KutJmGU0skuBmlTLdOuFBQuPyjAUIb2
 pMx1n7etbFCVj96vnxACV6HKgAl9y1lmiGYtUb6RkJsv4azyqYZ+fbJoMgSFI96/wZJT
 CAdg==
X-Gm-Message-State: APjAAAVjdjgvw3nDYbtX6qwmivYSroZYlML7ZDcrPBjJJ/wimyAzA3SZ
 aZIleHxcBADrmQjsXarSGgjAXFgcOjEuRxexE+OgbQ==
X-Google-Smtp-Source: APXvYqxrwXpFensePEvAhUtMCpBDyxM2AkB/737EJXgxOA60qb+ARhLag7tWVkc4+QmWh8ooFkeutE74P47rtVf8EZs=
X-Received: by 2002:a2e:808a:: with SMTP id i10mr10469003ljg.151.1576273401824; 
 Fri, 13 Dec 2019 13:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
 <20191125094356.161941-4-daniel.vetter@ffwll.ch>
 <20191213200848.GL624164@phenom.ffwll.local>
In-Reply-To: <20191213200848.GL624164@phenom.ffwll.local>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 13 Dec 2019 13:43:30 -0800
Message-ID: <CADaigPXxgiWSd20BkVFXXxcqDrwY0yGmqgQM+0G0X0mob8nt8g@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm: Use dma_resv locking wrappers
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 12:08 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Nov 25, 2019 at 10:43:55AM +0100, Daniel Vetter wrote:
> > I'll add more fancy logic to them soon, so everyone really has to use
> > them. Plus they already provide some nice additional debug
> > infrastructure on top of direct ww_mutex usage for the fences tracked
> > by dma_resv.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
>
> Ping for some review/acks.
>
> Thanks, Daniel
>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index 7d04c47d0023..385d4965a8d0 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -157,7 +157,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
> >               msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
> >
> >       if (submit->bos[i].flags & BO_LOCKED)
> > -             ww_mutex_unlock(&msm_obj->base.resv->lock);
> > +             dma_resv_unlock(msm_obj->base.resv);
> >
> >       if (backoff && !(submit->bos[i].flags & BO_VALID))
> >               submit->bos[i].iova = 0;
> > @@ -180,8 +180,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> >               contended = i;
> >
> >               if (!(submit->bos[i].flags & BO_LOCKED)) {
> > -                     ret = ww_mutex_lock_interruptible(&msm_obj->base.resv->lock,
> > -                                     &submit->ticket);
> > +                     ret = dma_resv_lock_interruptible(msm_obj->base.resv,
> > +                                                       &submit->ticket);
> >                       if (ret)
> >                               goto fail;
> >                       submit->bos[i].flags |= BO_LOCKED;
> > @@ -202,8 +202,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> >       if (ret == -EDEADLK) {
> >               struct msm_gem_object *msm_obj = submit->bos[contended].obj;
> >               /* we lost out in a seqno race, lock and retry.. */
> > -             ret = ww_mutex_lock_slow_interruptible(&msm_obj->base.resv->lock,
> > -                             &submit->ticket);
> > +             ret = dma_resv_lock_slow_interruptible(msm_obj->base.resv,
> > +                                                    &submit->ticket);
> >               if (!ret) {
> >                       submit->bos[contended].flags |= BO_LOCKED;
> >                       slow_locked = contended;
> > --
> > 2.24.0
> >

Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
