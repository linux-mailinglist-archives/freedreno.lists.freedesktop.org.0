Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE415390B2
	for <lists+freedreno@lfdr.de>; Tue, 31 May 2022 14:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DB3112123;
	Tue, 31 May 2022 12:32:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F5911220F
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 12:32:31 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 1-20020a4a1701000000b0040e90b56d03so2476881ooe.12
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b5n2e4xJe4nQRM9S+eJYL96ssz1qtMJPh3cecd/u2F4=;
 b=JJ+o//A34GebRbOJoHtnLj39Zi8DsGE1hjWaF5Yleq55rZ5bJCBipkp6EPDIE8WxT7
 YE6XSDgz7cL8BGPmpugti3iz78JnNisFF1n9+wBnkSVtJtsuRU78JcSDzHoyGKN+zROb
 Sv3O2XUm+gJKXhEy2Uu2o0ZLGWhpeDEBJyiAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b5n2e4xJe4nQRM9S+eJYL96ssz1qtMJPh3cecd/u2F4=;
 b=Mko2u7F1A+zz3ieg/G8rbms85Sj595EuC7qAwv5zdfDflE0UU6EKKrziAZrdH3BBI9
 X1ctP5x98Gl5Trz/KGgC+Zdjr6tR38c/S6PCZafay1UpCqHh0fNMRyJPx/h30LgTwyKt
 /XRQkRkX89rqOmAQejVZQONyBUF1qA0UprBOUajIb1hBN12ZUHhe67ofdPyJg6V7gkUS
 VD66VTwZZ2ukpCf69os8bnRNJdqg+Ev4ovUXHQA+RfoxA+6XeoGFk/nzrWHAOfuUnTgk
 dFVnf756rw2s30RcvsvZubdAsYxkmTuwAgjQmHlXqw1y7MsTg7oLGxi8EDOE2to1posI
 DnIw==
X-Gm-Message-State: AOAM533TxrICJ4hT5xqFDD0GWeQ/MZByZd9iLhTKUlTwQtRytTxWETJt
 A7JPhYSrE//lUcWjR/SEivU+CeKPmanZRIUI6SibmA==
X-Google-Smtp-Source: ABdhPJz1znTWlLdZXrBa1EEGMEdqekYP8msNxFFVPQ7Y9QZwe+Us0gduhZqingQrUbIhjjOVxoxX0MjqxnUvsbGqScU=
X-Received: by 2002:a4a:870d:0:b0:35f:7c65:1340 with SMTP id
 z13-20020a4a870d000000b0035f7c651340mr23177842ooh.46.1654000350734; Tue, 31
 May 2022 05:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220529162936.2539901-1-robdclark@gmail.com>
 <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
 <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
 <CAKMK7uG9=EcmD4hPqm4zYsDHiS9Mr=y_5tUa_R1veDxSSK-P-Q@mail.gmail.com>
 <CAF6AEGuLeLmD4m+yi5csGdb0XZbnAOfYOKx6c-wEgMGt6rj7Cw@mail.gmail.com>
In-Reply-To: <CAF6AEGuLeLmD4m+yi5csGdb0XZbnAOfYOKx6c-wEgMGt6rj7Cw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 31 May 2022 14:32:19 +0200
Message-ID: <CAKMK7uE2sywR9qpVqGqk4s71pini3iU47iBfYakz=V=xfm8DZg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/prime: Ensure mmap offset is initialized
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
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 30 May 2022 at 17:41, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 30, 2022 at 7:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, 30 May 2022 at 15:54, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, May 30, 2022 at 12:26 AM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> > > >
> > > > Hi
> > > >
> > > > Am 29.05.22 um 18:29 schrieb Rob Clark:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > If a GEM object is allocated, and then exported as a dma-buf fd w=
hich is
> > > > > mmap'd before or without the GEM buffer being directly mmap'd, th=
e
> > > > > vma_node could be unitialized.  This leads to a situation where t=
he CPU
> > > > > mapping is not correctly torn down in drm_vma_node_unmap().
> > > >
> > > > Which drivers are affected by this problem?
> > > >
> > > > I checked several drivers and most appear to be initializing the of=
fset
> > > > during object construction, such as GEM SHMEM. [1] TTM-based driver=
s
> > > > also seem unaffected. [2]
> > > >
> > > >  From a quick grep, only etnaviv, msm and omapdrm appear to be affe=
cted?
> > > > They only seem to run drm_gem_create_mmap_offset() from their
> > > > ioctl-handling code.
> > > >
> > > > If so, I'd say it's preferable to fix these drivers and put a
> > > > drm_WARN_ONCE() into drm_gem_prime_mmap().
> > >
> > > That is good if fewer drivers are affected, however I disagree with
> > > your proposal.  At least for freedreno userspace, a lot of bo's never
> > > get mmap'd (either directly of via dmabuf), so we should not be
> > > allocating a mmap offset unnecessarily.
> >
> > Does this actually matter in the grand scheme of things? We originally
> > allocated mmap offset only on demand because userspace only had 32bit
> > loff_t support and so simply couldn't mmap anything if the offset
> > ended up above 32bit (even if there was still va space available).
> >
> > But those days are long gone (about 10 years or so) and the allocation
> > overhead for an mmap offset is tiny. So I think unless you can
> > benchmark an impact allocating it at bo alloc seems like the simplest
> > design overall, and hence what we should be doing. And if the vma
> > offset allocation every gets too slow due to fragmentation we can lift
> > the hole tree from i915 into drm_mm and the job should be done. At
> > that point we could also allocate the offset unconditionally in the
> > gem_init function and be done with it.
> >
> > Iow I concur with Thomas here, unless there's hard data contrary
> > simplicity imo trumps here.
>
> 32b userspace is still alive and well, at least on arm chromebooks ;-)

There's lots of different 32b userspace. The old thing was about
userspace which didn't use mmap64, but only mmap. Which could only
mmap the lower 4GB of a file, and so if you ended up with mmap_offset
above 4G then you'd blow up.

But mmap64 is a thing since forever, and if you compile with the right
glibc switch (loff_t is the magic thing iirc) it all works even with
default mmap. So I really don't think you should have this problem
anymore (except when cros is doing something really, really silly).
-Daniel

>
> BR,
> -R
>
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > > > Best regards
> > > > Thomas
> > > >
> > > > [1]
> > > > https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/drm_g=
em_shmem_helper.c#L85
> > > > [2]
> > > > https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/ttm/t=
tm_bo.c#L1002
> > > >
> > > > >
> > > > > Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with fa=
ke offset")
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > > Note, it's possible the issue existed in some related form prior =
to the
> > > > > commit tagged with Fixes.
> > > > >
> > > > >   drivers/gpu/drm/drm_prime.c | 5 +++++
> > > > >   1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_pr=
ime.c
> > > > > index e3f09f18110c..849eea154dfc 100644
> > > > > --- a/drivers/gpu/drm/drm_prime.c
> > > > > +++ b/drivers/gpu/drm/drm_prime.c
> > > > > @@ -716,6 +716,11 @@ int drm_gem_prime_mmap(struct drm_gem_object=
 *obj, struct vm_area_struct *vma)
> > > > >       struct file *fil;
> > > > >       int ret;
> > > > >
> > > > > +     /* Ensure that the vma_node is initialized: */
> > > > > +     ret =3D drm_gem_create_mmap_offset(obj);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > >       /* Add the fake offset */
> > > > >       vma->vm_pgoff +=3D drm_vma_node_start(&obj->vma_node);
> > > > >
> > > >
> > > > --
> > > > Thomas Zimmermann
> > > > Graphics Driver Developer
> > > > SUSE Software Solutions Germany GmbH
> > > > Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > > > (HRB 36809, AG N=C3=BCrnberg)
> > > > Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
