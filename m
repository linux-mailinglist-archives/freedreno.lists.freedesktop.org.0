Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D669E41E
	for <lists+freedreno@lfdr.de>; Tue, 21 Feb 2023 17:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE2910E32F;
	Tue, 21 Feb 2023 16:01:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4EA10E33F
 for <freedreno@lists.freedesktop.org>; Tue, 21 Feb 2023 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676995315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9izMAfpyPSC2j4KF6KccqxxHP0NMJSdJ01aiq+ruxRA=;
 b=VfwxykXCgwI/ETuEJbB5z0hMuL0ahGIHKNJfLAGIH6sgqrjt7HF1HlGKlM3zr5Tl03lLlZ
 6jGtojIJMVPdRa3bmR+QJ5Geob5M9VTGgUhb2gNy2hlX6tRyq1pIgahvA1LUVc5YfFsn6s
 4VNxnX+Udaxe9GulArf4RhADyWXqfnE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-y0WCO43tN3OnuePwOxTj_Q-1; Tue, 21 Feb 2023 11:01:51 -0500
X-MC-Unique: y0WCO43tN3OnuePwOxTj_Q-1
Received: by mail-pj1-f70.google.com with SMTP id
 c13-20020a17090ab28d00b0023406b78560so1705342pjr.8
 for <freedreno@lists.freedesktop.org>; Tue, 21 Feb 2023 08:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9izMAfpyPSC2j4KF6KccqxxHP0NMJSdJ01aiq+ruxRA=;
 b=WK8zNfDmxR8COhdkBuyUqdjyyW9P8eSJSct00NKnUSzADnl+xtYZHWqi6TDQNtTf13
 G6wMGHjwgEl6h5g9AuLaJF6qvzBYegNpoT4b8dw39iay4clb/ng5k/mNeI2qd4lArsVR
 WB1aUyZdyfEBeIaRF3xI3bwhiwRuOpFQlz5cpRMvafeVm6X5GdvblySXdQSYcs96GJqW
 EaCYoDHhPRkckrnxAT47GCLwnXlEP37gxwfGcTFk1FIOmO/CvsGDuxgnZ7trG13rwUtg
 g5nDhQ4AxrYdJ7oGs8DrlP9VZDcsltvOOj2WMLs4Bb8JrGLBFQmnjvyLZV6Cv0wsCKFX
 jpyQ==
X-Gm-Message-State: AO0yUKVkbI62hr2nMpEg0iZbKEd0nc+5oYrd/NDAbZJlBWqLni/vfsM1
 r1YSSG+YhyOy019tAMbioK/VieHYHSlQg9CnW/Zbcbe1tWVxePPbNQsSvoO7I3rFp4llZlj4nT/
 aW9c67vGrgfVLgNtbvp3CfUhvDHUwiT4gQrLuHdAr8Xfp
X-Received: by 2002:a17:90b:2645:b0:237:39b1:7c5f with SMTP id
 pa5-20020a17090b264500b0023739b17c5fmr9692pjb.96.1676995310470; 
 Tue, 21 Feb 2023 08:01:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+7t/vLNHtsxzvT2bollF+HO+l6TckmTWA3PewfgaKv+tlYXZrcfQ/NIzB6QL95XtxeqfTMakmosPDQgkjw3lw=
X-Received: by 2002:a17:90b:2645:b0:237:39b1:7c5f with SMTP id
 pa5-20020a17090b264500b0023739b17c5fmr9677pjb.96.1676995310112; Tue, 21 Feb
 2023 08:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <20230221103753.205082d3@eldfell>
In-Reply-To: <20230221103753.205082d3@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 21 Feb 2023 17:01:36 +0100
Message-ID: <CA+hFU4xexaHAYsbGm6PdNfVFHBgOS4WiMo=AU0Gi5cYt566aTg@mail.gmail.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 06/14] dma-buf/sync_file: Support
 (E)POLLPRI
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 9:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 20 Feb 2023 08:14:47 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Sat, 18 Feb 2023 13:15:49 -0800
> > > Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> > > > wait (as opposed to a "housekeeping" wait to know when to cleanup after
> > > > some work has completed).  Usermode components of GPU driver stacks
> > > > often poll() on fence fd's to know when it is safe to do things like
> > > > free or reuse a buffer, but they can also poll() on a fence fd when
> > > > waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> > > > lets the kernel differentiate these two cases.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >
> > > Hi,
> > >
> > > where would the UAPI documentation of this go?
> > > It seems to be missing.
> >
> > Good question, I am not sure.  The poll() man page has a description,
> > but my usage doesn't fit that _exactly_ (but OTOH the description is a
> > bit vague).
> >
> > > If a Wayland compositor is polling application fences to know which
> > > client buffer to use in its rendering, should the compositor poll with
> > > PRI or not? If a compositor polls with PRI, then all fences from all
> > > applications would always be PRI. Would that be harmful somehow or
> > > would it be beneficial?
> >
> > I think a compositor would rather use the deadline ioctl and then poll
> > without PRI.  Otherwise you are giving an urgency signal to the fence
> > signaller which might not necessarily be needed.
> >
> > The places where I expect PRI to be useful is more in mesa (things
> > like glFinish(), readpix, and other similar sorts of blocking APIs)
>
> Sounds good. Docs... ;-)
>
> Hmm, so a compositor should set the deadline when it processes the
> wl_surface.commit, and not when it actually starts repainting, to give
> time for the driver to react and the GPU to do some more work. The
> deadline would be the time when the compositor starts its repaint, so
> it knows if the buffer is ready or not.

Technically we don't know when the commit is supposed to be shown.
Just passing a deadline of the next possible deadline however is
probably a good enough guess for this feature to be useful.

One thing that neither API allows us to do is tell the kernel in
advance when we're going to submit work and what the deadline for it
is and unfortunately that work is the most timing sensitive.

>
>
> Thanks,
> pq
>
>
> >
> > BR,
> > -R
> >
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > > > ---
> > > >  drivers/dma-buf/sync_file.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > > index fb6ca1032885..c30b2085ee0a 100644
> > > > --- a/drivers/dma-buf/sync_file.c
> > > > +++ b/drivers/dma-buf/sync_file.c
> > > > @@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
> > > >  {
> > > >       struct sync_file *sync_file = file->private_data;
> > > >
> > > > +     /*
> > > > +      * The POLLPRI/EPOLLPRI flag can be used to signal that
> > > > +      * userspace wants the fence to signal ASAP, express this
> > > > +      * as an immediate deadline.
> > > > +      */
> > > > +     if (poll_requested_events(wait) & EPOLLPRI)
> > > > +             dma_fence_set_deadline(sync_file->fence, ktime_get());
> > > > +
> > > >       poll_wait(file, &sync_file->wq, wait);
> > > >
> > > >       if (list_empty(&sync_file->cb.node) &&
> > >
>

