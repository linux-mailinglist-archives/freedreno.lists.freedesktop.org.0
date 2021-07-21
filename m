Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477503D16D8
	for <lists+freedreno@lfdr.de>; Wed, 21 Jul 2021 21:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70CB6ECFB;
	Wed, 21 Jul 2021 19:03:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532BB6ECFB
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 19:03:26 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gb6so4794231ejc.5
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=++tgyshRvxlgbKnxZVEXxedsZvd2u9+anyBU9UM8Xho=;
 b=B+ZMCYMEBA7TCugxdS96PT2yzHfPnFBenpQsw1uxTHDSE0amhbipWWAm1DENubb1HB
 qmn2VFdZsXfDzOWjfW7eFldgAPNzGL4PYnCaOIDSYc68GjATwHGyAP45fTM343lcNnOH
 Qbxxx+aJbRGccoyxoUWcn+tnKkNKJriyFU2XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=++tgyshRvxlgbKnxZVEXxedsZvd2u9+anyBU9UM8Xho=;
 b=ACo9pKdISKT+xQZ5d2AIAwVF396wB2WlwSSqrEtKSBeQ/RPx8zpmnHCRvcKkKfdQf0
 +NG+MZuBha14XROtcxOLaRubg3PV0ryVNEVkBczVUj1yo1oCP8jE9kPp35yd7N0CaVdR
 tnrH+liQ5FbTKu/qWkyscKhIFtzGPhIm4VNP2ggiPg4lTLoTejq+pE7H5I21Jv3n18zh
 VZw27ZO3Zu92SOASXlLD1q96Z3KT70SXltFTOQsSd4oHnTTLSPgl25PSWuh+7iWuTERA
 Vpz4toW7GTHkI2QBlv2tYwRzZNf7axBy0078oOhUYxRvihpIdBCqV0fwz+7HO1eMs36P
 FsFA==
X-Gm-Message-State: AOAM533nhFRROXgufVmQNMYQTOlv4+hy4WBdnqGU+srTcuELVUVqNHDC
 6lxiM3wLPWtObkku8YQaH0YHzA==
X-Google-Smtp-Source: ABdhPJzRzeP4RRoslhkL+sfcipP2tBusBU19nwhsPrBS8Te754Ug8WzWQs0xJeUdghEQbKoPAJh0vQ==
X-Received: by 2002:a17:906:e51:: with SMTP id
 q17mr40233574eji.140.1626894204918; 
 Wed, 21 Jul 2021 12:03:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k1sm8648459eji.84.2021.07.21.12.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 12:03:24 -0700 (PDT)
Date: Wed, 21 Jul 2021 21:03:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YPhvein5e8do2AR+@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Freedreno] [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait()
 op
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
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 09:34:43AM -0700, Rob Clark wrote:
> On Wed, Jul 21, 2021 at 12:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jul 21, 2021 at 12:32 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Tue, Jul 20, 2021 at 1:55 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wro=
te:
> > > > >
> > > > > On Tue, Jul 20, 2021 at 11:03 AM Christian K=F6nig
> > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > >
> > > > > > Hi Rob,
> > > > > >
> > > > > > Am 20.07.21 um 17:07 schrieb Rob Clark:
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > Somehow we had neither ->wait() nor dma_fence_signal() calls,=
 and no
> > > > > > > one noticed.  Oops.
> > > > > >
> > > > > >
> > > > > > I'm not sure if that is a good idea.
> > > > > >
> > > > > > The dma_fence->wait() callback is pretty much deprecated and sh=
ould not
> > > > > > be used any more.
> > > > > >
> > > > > > What exactly do you need that for?
> > > > >
> > > > > Well, the alternative is to track the set of fences which have
> > > > > signalling enabled, and then figure out which ones to signal, whi=
ch
> > > > > seems like a lot more work, vs just re-purposing the wait
> > > > > implementation we already have for non-dma_fence cases ;-)
> > > > >
> > > > > Why is the ->wait() callback (pretty much) deprecated?
> > > >
> > > > Because if you need it that means for your driver dma_fence_add_cb =
is
> > > > broken, which means a _lot_ of things don't work. Like dma_buf poll
> > > > (compositors have patches to start using that), and I think
> > > > drm/scheduler also becomes rather unhappy.
> > >
> > > I'm starting to page back in how this works.. fence cb's aren't broken
> > > (which is also why dma_fence_wait() was not completely broken),
> > > because in retire_submits() we call
> > > dma_fence_is_signaled(submit->hw_fence).
> > >
> > > But the reason that the custom wait function cleans up a tiny bit of
> > > jank is that the wait_queue_head_t gets signaled earlier, before we
> > > start iterating the submits and doing all that retire_submit() stuff
> > > (unpin/unref bo's, etc).  I suppose I could just split things up to
> > > call dma_fence_signal() earlier, and *then* do the retire_submits()
> > > stuff.
> >
> > Yeah reducing the latency there sounds like a good idea.
> > -Daniel
> >
> =

> Hmm, no, turns out that isn't the problem.. or, well, it is probably a
> good idea to call drm_fence_signal() earlier.  But it seems like
> waking up from wait_event_* is faster than wake_up_state(wait->task,
> TASK_NORMAL).  I suppose the wake_up_state() approach still needs for
> the scheduler to get around to schedule the runnable task.
> =

> So for now, I'm going back to my own wait function (plus earlier
> drm_fence_signal())
> =

> Before removing dma_fence_opps::wait(), I guess we want to re-think
> dma_fence_default_wait().. but I think that would require a
> dma_fence_context base class (rather than just a raw integer).

Uh that's not great ... can't we fix this instead of papering over it in
drivers? Aside from maybe different wakeup flags it all is supposed to
work exactly the same underneath, and whether using a wait queue or not
really shouldn't matter.
-Daniel

> =

> BR,
> -R
> =

> > >
> > > BR,
> > > -R
> > >
> > > > It essentially exists only for old drivers where ->enable_signalling
> > > > is unreliable and we paper over that with a retry loop in ->wait and
> > > > pray no one notices that it's too butchered. The proper fix is to h=
ave
> > > > a driver thread to guarantee that ->enable_signalling works reliabl=
e,
> > > > so you don't need a ->wait.
> > > >
> > > > Can you type up a kerneldoc patch for dma_fence_ops->wait to hammer
> > > > this in please?
> > > > -Daniel
> > > >
> > > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > > > > Regards,
> > > > > > Christian.
> > > > > >
> > > > > > >
> > > > > > > Note that this removes the !timeout case, which has not been =
used in
> > > > > > > a long time.
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > ---
> > > > > > >   drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++---=
-----------
> > > > > > >   1 file changed, 34 insertions(+), 25 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/dr=
m/msm/msm_fence.c
> > > > > > > index cd59a5918038..8ee96b90ded6 100644
> > > > > > > --- a/drivers/gpu/drm/msm/msm_fence.c
> > > > > > > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > > > > > > @@ -38,11 +38,10 @@ static inline bool fence_completed(struct=
 msm_fence_context *fctx, uint32_t fenc
> > > > > > >       return (int32_t)(fctx->completed_fence - fence) >=3D 0;
> > > > > > >   }
> > > > > > >
> > > > > > > -/* legacy path for WAIT_FENCE ioctl: */
> > > > > > > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t =
fence,
> > > > > > > -             ktime_t *timeout, bool interruptible)
> > > > > > > +static signed long wait_fence(struct msm_fence_context *fctx=
, uint32_t fence,
> > > > > > > +             signed long remaining_jiffies, bool interruptib=
le)
> > > > > > >   {
> > > > > > > -     int ret;
> > > > > > > +     signed long ret;
> > > > > > >
> > > > > > >       if (fence > fctx->last_fence) {
> > > > > > >               DRM_ERROR_RATELIMITED("%s: waiting on invalid f=
ence: %u (of %u)\n",
> > > > > > > @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_conte=
xt *fctx, uint32_t fence,
> > > > > > >               return -EINVAL;
> > > > > > >       }
> > > > > > >
> > > > > > > -     if (!timeout) {
> > > > > > > -             /* no-wait: */
> > > > > > > -             ret =3D fence_completed(fctx, fence) ? 0 : -EBU=
SY;
> > > > > > > +     if (interruptible) {
> > > > > > > +             ret =3D wait_event_interruptible_timeout(fctx->=
event,
> > > > > > > +                     fence_completed(fctx, fence),
> > > > > > > +                     remaining_jiffies);
> > > > > > >       } else {
> > > > > > > -             unsigned long remaining_jiffies =3D timeout_to_=
jiffies(timeout);
> > > > > > > -
> > > > > > > -             if (interruptible)
> > > > > > > -                     ret =3D wait_event_interruptible_timeou=
t(fctx->event,
> > > > > > > -                             fence_completed(fctx, fence),
> > > > > > > -                             remaining_jiffies);
> > > > > > > -             else
> > > > > > > -                     ret =3D wait_event_timeout(fctx->event,
> > > > > > > -                             fence_completed(fctx, fence),
> > > > > > > -                             remaining_jiffies);
> > > > > > > -
> > > > > > > -             if (ret =3D=3D 0) {
> > > > > > > -                     DBG("timeout waiting for fence: %u (com=
pleted: %u)",
> > > > > > > -                                     fence, fctx->completed_=
fence);
> > > > > > > -                     ret =3D -ETIMEDOUT;
> > > > > > > -             } else if (ret !=3D -ERESTARTSYS) {
> > > > > > > -                     ret =3D 0;
> > > > > > > -             }
> > > > > > > +             ret =3D wait_event_timeout(fctx->event,
> > > > > > > +                     fence_completed(fctx, fence),
> > > > > > > +                     remaining_jiffies);
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     if (ret =3D=3D 0) {
> > > > > > > +             DBG("timeout waiting for fence: %u (completed: =
%u)",
> > > > > > > +                             fence, fctx->completed_fence);
> > > > > > > +             ret =3D -ETIMEDOUT;
> > > > > > > +     } else if (ret !=3D -ERESTARTSYS) {
> > > > > > > +             ret =3D 0;
> > > > > > >       }
> > > > > > >
> > > > > > >       return ret;
> > > > > > >   }
> > > > > > >
> > > > > > > +/* legacy path for WAIT_FENCE ioctl: */
> > > > > > > +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t =
fence,
> > > > > > > +             ktime_t *timeout, bool interruptible)
> > > > > > > +{
> > > > > > > +     return wait_fence(fctx, fence, timeout_to_jiffies(timeo=
ut), interruptible);
> > > > > > > +}
> > > > > > > +
> > > > > > >   /* called from workqueue */
> > > > > > >   void msm_update_fence(struct msm_fence_context *fctx, uint3=
2_t fence)
> > > > > > >   {
> > > > > > > @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct d=
ma_fence *fence)
> > > > > > >       return fence_completed(f->fctx, f->base.seqno);
> > > > > > >   }
> > > > > > >
> > > > > > > +static signed long msm_fence_wait(struct dma_fence *fence, b=
ool intr,
> > > > > > > +             signed long timeout)
> > > > > > > +{
> > > > > > > +     struct msm_fence *f =3D to_msm_fence(fence);
> > > > > > > +
> > > > > > > +     return wait_fence(f->fctx, fence->seqno, timeout, intr);
> > > > > > > +}
> > > > > > > +
> > > > > > >   static const struct dma_fence_ops msm_fence_ops =3D {
> > > > > > >       .get_driver_name =3D msm_fence_get_driver_name,
> > > > > > >       .get_timeline_name =3D msm_fence_get_timeline_name,
> > > > > > >       .signaled =3D msm_fence_signaled,
> > > > > > > +     .wait =3D msm_fence_wait,
> > > > > > >   };
> > > > > > >
> > > > > > >   struct dma_fence *
> > > > > >
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
