Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D760A25879A
	for <lists+freedreno@lfdr.de>; Tue,  1 Sep 2020 07:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7646E049;
	Tue,  1 Sep 2020 05:42:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31F76E049
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 05:42:30 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id di5so4446qvb.13
 for <freedreno@lists.freedesktop.org>; Mon, 31 Aug 2020 22:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iGwUze2oGaJp8e7svDfyTEoxtCcK4dtRTXC+KcGij48=;
 b=QfisIazdqtTMNcoNEj0SZAReR2Pmf9qYrfEfbMonwSdEIA+7Dm9UminlBVvpKsDzQz
 ooApTWc7bJW1z5pJvKoZRm84JVjAFwpEFPLHCpp1LiPVEqCmoZHUb2nULe4GROFMFwoh
 I54TqoMJB0ewdpQDbp9U7wOfPA+BzG4yfQ4f0X35RQOYiAwQVz1FxsJKxf/kh306qN8x
 RwjkLSOhYHvD0QWaRZtJMYYJmaBR7W6HDqzfjOXfTAtuGqCB3Pvhz/h2c8MGfBGJziP9
 SfadU0eVMulNjZHEoD1OQLXkTLzbtdQFdunvmu8vMx2ep20SGcptpomomxA8Vnr57aH1
 5osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iGwUze2oGaJp8e7svDfyTEoxtCcK4dtRTXC+KcGij48=;
 b=KCSlzVM3AVXTwNY8AVcUngi7PmmD5jYiLYDVQ6OpRUNixsyoSkNL5np5v/ey7MB0az
 wC+mJBVLaR8u+HQ4f/SvrS9OYBtB7iHmI4hUH1gLIDm/OqP1fxXc4aC4ICx2nalZ2Rki
 2urNBJOJCI5NKw5Nsamho/kct6Ri0PQ6zgkhwIFq+d837JrsQDRq5i3CEQOvgB17jqpl
 CRnkDahfPAdQZFJwlJN9MqWonqRMUC+PvDgciE4HycwC2lvqdGJCcyB0MTflXa4wj801
 16HOHrqDXRLdUl/oozJQM+L4UGglmDkcA7iwCdzr1PWS7Gt2aCiTq3732VGjcxlDEyYV
 wKyQ==
X-Gm-Message-State: AOAM530iFLGIyov18Flh9wLpLQOnoxAFyHLm7J80t4m55oS3HKkZQbKi
 +YdWlUUFBX673h5mNAx3KNxP9A==
X-Google-Smtp-Source: ABdhPJxBeU18wZYbq6a0ep/R0bjilgWJcbebj3mDIgOZ/cwdY+tof6zfyzvZNJhxFh1hmNJtAPCKEQ==
X-Received: by 2002:a0c:ca87:: with SMTP id a7mr330935qvk.17.1598938949857;
 Mon, 31 Aug 2020 22:42:29 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
 by smtp.gmail.com with ESMTPSA id o25sm346909qkm.42.2020.08.31.22.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 22:42:29 -0700 (PDT)
Date: Tue, 1 Sep 2020 05:42:27 +0000
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200901054227.GB54956@uller>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-2-robdclark@gmail.com>
 <20200901023517.GA54956@uller>
 <CAF6AEGsx5mmUCuNApP692L-rS3wEbn4UqJBXuSr-38MAcVfoBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsx5mmUCuNApP692L-rS3wEbn4UqJBXuSr-38MAcVfoBw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 01/19] drm/msm: remove dangling submitqueue
 references
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 01 Sep 03:42 UTC 2020, Rob Clark wrote:

> On Mon, Aug 31, 2020 at 7:35 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Fri 14 Aug 02:40 UTC 2020, Rob Clark wrote:
> >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Currently it doesn't matter, since we free the ctx immediately.  But
> > > when we start refcnt'ing the ctx, we don't want old dangling list
> > > entries to hang around.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> > > index a1d94be7883a..90c9d84e6155 100644
> > > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > > @@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
> > >        * No lock needed in close and there won't
> > >        * be any more user ioctls coming our way
> > >        */
> > > -     list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
> > > +     list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
> > > +             list_del(&entry->node);
> >
> > If you refcount ctx, what does that do for the entries in the submit
> > queue?
> >
> > "entry" here is kref'ed, but you're popping it off the list regardless
> > of the put ends up freeing the object or not - which afaict would mean
> > leaking the object.
> >
> 
> What ends up happening is the submit has reference to submit-queue,
> which has reference to the ctx.. the submitqueue could be alive still
> pending in-flight submits (in a later patch), but dead from the PoV of
> userspace interface.
> 
> We aren't relying (or at least aren't in the end, and I *think* I
> didn't miss anything in the middle) relying on ctx->submitqueues list
> to clean anything up in the end, just track what is still a valid
> submitqueue from userspace PoV
> 

Looks reasonable, thanks for the explanation.

> BR,
> -R
> 
> >
> > On the other hand, with the current implementation an object with higher
> > refcount with adjacent objects of single refcount would end up with
> > dangling pointers after the put. So in itself this change seems like a
> > net gain, but I'm wondering about the plan described in the commit
> > message.
> >
> > Regards,
> > Bjorn
> >
> > >               msm_submitqueue_put(entry);
> > > +     }
> > >  }
> > >
> > >  int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
> > > --
> > > 2.26.2
> > >
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
