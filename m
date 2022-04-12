Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9302F4FE8DA
	for <lists+freedreno@lfdr.de>; Tue, 12 Apr 2022 21:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A9810E728;
	Tue, 12 Apr 2022 19:40:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD7010E6CB
 for <freedreno@lists.freedesktop.org>; Tue, 12 Apr 2022 19:40:41 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso4099761pjh.3
 for <freedreno@lists.freedesktop.org>; Tue, 12 Apr 2022 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KcAH7mF9eHpU+lzQ0ZOVf7kLghMZDIfYqzoC1pN6kTM=;
 b=lvdmYsNPUPYWEsyu97OOGiswPuqEO5+U6hmLz19+U3z1EhfM40k+q3vdyFLwSVjxYq
 HyuqZIKnAZNpXj1GgNiUIwAGq/wXIDrmKGdOeUgMmLGSLnsCIuw5tP/vgQDv+CVY5c9K
 PdTW8Fc/CJKDbvFX7+TUPjQOlYkFKnMMGTVOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KcAH7mF9eHpU+lzQ0ZOVf7kLghMZDIfYqzoC1pN6kTM=;
 b=jzqTrrs0mEU0be9uIXlSBje0k7KYwUCkulf0oDzRvH3xVKXQece0AAYHZ8udWpV6Eh
 v9cFWIqmhWY+tLFOffCSzxpH8+fzWwlGBl9zF9yypA5S+nSbAjwhKomWmV6waYNHVDOz
 Rh/8rqlLjn1tjaEkzq7y7Thd6Lbx6SDbEU4OoUbWJYaz49s8vV6X6RCBGBYOqGJOnmvq
 FJXPnjMWdchn3b15E++j5sVzIkLAqQGIpbS4fgYLi3wGWNsLvjT1URYQQuQ3Aa3CuNyL
 XyQvMUCE9amJyr7ht+fHuzqxiJougBBwgkUbXguuFryXBwckdmgE6rnf3cRkCidbjeLP
 ic3A==
X-Gm-Message-State: AOAM533L27/AC/pCuXzFEZckjf+GInaq8UK6x6nJphu0sT0CZvRAIRVD
 kRhJRm0pr/YeFya1D7hKFepFhUCJOGsPbsE0uXurTQ==
X-Google-Smtp-Source: ABdhPJySFUINMJMixO8zjYrN5d3dPQurR2XuF6FeIqDtLCfyJ3PnvHW2g+hJC7Fln34M7qkAWjkWthog0cz8f1w8sAY=
X-Received: by 2002:a17:903:1248:b0:151:9708:d586 with SMTP id
 u8-20020a170903124800b001519708d586mr39321437plh.15.1649792440697; Tue, 12
 Apr 2022 12:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220408211230.601475-1-olvaffe@gmail.com>
 <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
In-Reply-To: <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 12 Apr 2022 12:41:40 -0700
Message-ID: <CAJs_Fx6ehFu4Fzvo93XCN+7yufU0NQCshreDniRk37V4f6fmPA@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm: add trace_dma_fence_emit to
 msm_gpu_submit
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Apr 9, 2022 at 7:33 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 08.04.22 um 23:12 schrieb Chia-I Wu:
> > In practice, trace_dma_fence_init is good enough and almost no driver
> > calls trace_dma_fence_emit.  But this is still more correct in theory.
>
> Well, the reason why basically no driver is calling this is because it
> is pretty much deprecated.
>
> We do have a case in the GPU scheduler where it makes sense to distinct
> between init and emit, but it doesn't really matter for drivers.
>
> So I'm not sure if it's a good idea to add that here.

visualization can't easily differentiate between drivers/timelines
where the split matters and ones where it doesn't..  IMO it is better
to just have the extra trace even in the cases where it comes at the
same time as the init trace

BR,
-R

> Regards,
> Christian.
>
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > Cc: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index faf0c242874e..a82193f41ea2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/string_helpers.h>
> >   #include <linux/devcoredump.h>
> >   #include <linux/sched/task.h>
> > +#include <trace/events/dma_fence.h>
> >
> >   /*
> >    * Power Management:
> > @@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm=
_gem_submit *submit)
> >       gpu->active_submits++;
> >       mutex_unlock(&gpu->active_lock);
> >
> > +     trace_dma_fence_emit(submit->hw_fence);
> >       gpu->funcs->submit(gpu, submit);
> >       gpu->cur_ctx_seqno =3D submit->queue->ctx->seqno;
> >
>
