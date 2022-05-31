Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14376539874
	for <lists+freedreno@lfdr.de>; Tue, 31 May 2022 23:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF66210E1DE;
	Tue, 31 May 2022 21:11:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82DB10E2E4
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 21:11:27 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id k12so1305607qtx.13
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BUEy9SeMTjRe3Rjyc2r8IDQhV6fRs2+aWRaD5gsRiCs=;
 b=icNabeEtLMJq1bW2k166x8acMMz/tTMK3oe9Eys5MH7qjvMVWhZ2ntg9EwgqMRXYAn
 gik1eqDf8KzfZB0SMCkeYKHwwkm5Wy8qw4PvFLyqO4WjfVaKraeeWbOqItDmow11kGcM
 ZT6q9qw4qmw7se+RTeaf4nC1Tg6u99zLHs9fusGYFOKCw+9Ymqm6ipxfw0ru+d7G6iaG
 Jny6jkMCEpRzd6swztlPw1JbgeRo2KnQ6gsv5AqMZV2bHLy2mYXKutCLs3PdIn+JUsl8
 EsBBXFyHDReJqpYA5XW6QadlzVT325biVxIxq7sgJkDQsHvO+CG58sVX8FlBUEI4cwzo
 qADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BUEy9SeMTjRe3Rjyc2r8IDQhV6fRs2+aWRaD5gsRiCs=;
 b=IPNPQSbY8B+Nb1Qcmjt4R/fvgPDcyAe/pFZ2mfZ1xyoK3QMEzf7NuIuJG9QiCxwAi0
 bCyH7i1flZOhl4ezFTol5sdelrr+cMg6I/rpelJiPbWu0M9UqTyPh9WebtluKbWZhd3h
 i4f6U/4XlqTLlOpOD9FV+714QmPBP+P4kHvlxxH0imi7MIFLwlmEwzawG1KuTC0IDgEj
 lho6DTYVSerU1Y8npyAlfC3VRYJopzt5ntywexGDp3LWbRYzGvHDXhCXtdyRA5hVnLOD
 trshXO3d/c8RmrTazcCpA+6mlNWDO2DAfDkxpeGvkAyhzrPXdBu4ILb3v9R5LeLkJN6l
 mXFg==
X-Gm-Message-State: AOAM530oCf827TGsAMYtttfd8oWXuPK3RDzbh4p5tTX+Syux03edygiV
 rr41Hf3LHVBxPbdZIGKGwLKBuxOYBwhg4hSy0gFGog==
X-Google-Smtp-Source: ABdhPJwqvf9GT/CoaWbEcCU8y4NQt8y/aWM6RCv17U1OuAG6bzkxUvarHTp1/r0HQSzqUeSCf36W6Hu6C2bcJ9TPgX8=
X-Received: by 2002:a05:622a:1895:b0:304:8024:332d with SMTP id
 v21-20020a05622a189500b003048024332dmr9588698qtc.682.1654031487001; Tue, 31
 May 2022 14:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220531200857.136547-1-robdclark@gmail.com>
 <CAA8EJpouqO9KfhAQSqEHP8MUGTkntx7iARRRqrvx3uMFQd4-dQ@mail.gmail.com>
 <CAF6AEGtauTPR5Gp8Sjy1_W4yHfYgTahRzJU=9A8XkY1RMZBwyA@mail.gmail.com>
In-Reply-To: <CAF6AEGtauTPR5Gp8Sjy1_W4yHfYgTahRzJU=9A8XkY1RMZBwyA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 Jun 2022 00:11:15 +0300
Message-ID: <CAA8EJpr77BkkaH6euX9cJ_H5bHofcFr=evTN32ARF+BR-6CD0Q@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Ensure mmap offset is initialized
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
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 31 May 2022 at 23:37, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, May 31, 2022 at 1:34 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, 31 May 2022 at 23:08, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > If a GEM object is allocated, and then exported as a dma-buf fd which is
> > > mmap'd before or without the GEM buffer being directly mmap'd, the
> > > vma_node could be unitialized.  This leads to a situation where the CPU
> > > mapping is not correctly torn down in drm_vma_node_unmap().
> > >
> > > Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with fake offset")
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.c       |  2 +-
> > >  drivers/gpu/drm/msm/msm_drv.h       |  1 +
> > >  drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
> > >  3 files changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index 44485363f37a..14ab9a627d8b 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -964,7 +964,7 @@ static const struct drm_driver msm_driver = {
> > >         .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > >         .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > >         .gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
> > > -       .gem_prime_mmap     = drm_gem_prime_mmap,
> > > +       .gem_prime_mmap     = msm_gem_prime_mmap,
> > >  #ifdef CONFIG_DEBUG_FS
> > >         .debugfs_init       = msm_debugfs_init,
> > >  #endif
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > > index bb052071b16d..090b8074fec7 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.h
> > > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > > @@ -275,6 +275,7 @@ unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_t
> > >  void msm_gem_shrinker_init(struct drm_device *dev);
> > >  void msm_gem_shrinker_cleanup(struct drm_device *dev);
> > >
> > > +int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> > >  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
> > >  int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
> > >  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> > > index 94ab705e9b8a..dcc8a573bc76 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> > > @@ -11,6 +11,21 @@
> > >  #include "msm_drv.h"
> > >  #include "msm_gem.h"
> > >
> > > +int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> > > +{
> > > +       int ret;
> > > +
> > > +       /* Ensure the mmap offset is initialized.  We lazily initialize it,
> > > +        * so if it has not been first mmap'd directly as a GEM object, the
> > > +        * mmap offset will not be already initialized.
> > > +        */
> > > +       ret = drm_gem_create_mmap_offset(obj);
> > > +       if (ret)
> > > +               return ret;
> >
> > Wouldn't it be better to have this call directly in the
> > drm_gem_prime_mmap() ? This way all drivers can be lazy.
> >
>
> yes.. that was my first[1] proposal.  But there are differences of
> opinion, and in the mean time I want to get this particular issue
> fixed ;-)

Ack, excuse me, I probably skipped the thread.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> BR,
> -R
>
> [1] https://patchwork.freedesktop.org/patch/487597/
>
> >
> > > +
> > > +       return drm_gem_prime_mmap(obj, vma);
> > > +}
> > > +
> > >  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
> > >  {
> > >         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > > --
> > > 2.36.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
