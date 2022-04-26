Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8253E51050D
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 19:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B7E10E8F2;
	Tue, 26 Apr 2022 17:16:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A2D10E8EF
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 17:16:16 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id h12so27127829plf.12
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8N/olBTMX6m2KUUfwtQ/PQwAKnFQsB+gSNHy/8mAD9w=;
 b=AKGMRsMmiks1knJFd2PZ6g/1E9nVWMxzXSqrwc7WuhfPeQB2bQ4wRPb6QkLNH1IrQo
 OgttFPiz12UD5hekpy79aLb3Zss+hWHOzNo5BFOpuQoqwUYZJsrtbHkYcUdSKdaMvpAg
 SOFCK0D9MpK3FCz0QsbJUckFULIua1Vo01uSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8N/olBTMX6m2KUUfwtQ/PQwAKnFQsB+gSNHy/8mAD9w=;
 b=aCaQwV4JnNEgcmHRvKSXHQcbQGCZR/D6RK+zpyiz1K8SHfuF/fNwfzzjpXT5oMpRHY
 qz0+9m7GI6V7wVkYuM6sBFzCD+OsfGHziNBuBy/XFojVFSXkoa1S2LYxyQnrHEfIdCRb
 eCTg6VywU0AHChzPpoaKJM1PP2SnvSYgXLsCzYpIgcM9erbWJmi+3XxnDRF51460IsYV
 MzPUgFHFzRkB9LIaGFrA4GCF67oNJhX7Iw8G0mi/i028OS+bkW7FD5pUyVKyZFhxM/Bo
 m3MNtmjC2Ou7vFDIIQGLRithxfXE4NGOFkKd2QMPqvJDT+EWRLlNP0du/83/BshUXG0K
 +mIQ==
X-Gm-Message-State: AOAM532Lak2jFxy9YFPyWMraE4YUL9Oy610X2/iQcxV11Ib9eqZht/Rk
 xxggomYD5S/p4q2V149vcRwHxQ962G9RNKVZ39urTD+RhVw=
X-Google-Smtp-Source: ABdhPJwQYJDMG4HHGAXB69CyOV61s/x5aYmAWxELbcZ3/zM7/HAB4j4xfRf0ycAWJ4779M3CqzvSkF6k96srobeqZh4=
X-Received: by 2002:a17:902:ea4f:b0:158:5013:1403 with SMTP id
 r15-20020a170902ea4f00b0015850131403mr24232493plg.75.1650993376099; Tue, 26
 Apr 2022 10:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
 <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
In-Reply-To: <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 26 Apr 2022 10:16:05 -0700
Message-ID: <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v2] drm/msm: add trace_dma_fence_emit to
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 10:08 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 19:05 schrieb Rob Clark:
> > On Tue, Apr 26, 2022 at 9:42 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
> >>> On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >>>> In practice, trace_dma_fence_init called from dma_fence_init is good
> >>>> enough and almost no driver calls trace_dma_fence_emit.  But drm_sch=
ed
> >>>> and virtio both have cases where trace_dma_fence_init and
> >>>> trace_dma_fence_emit can be apart.  It is easier for visualization t=
ools
> >>>> to always use the more correct trace_dma_fence_emit when visualizing
> >>>> fence timelines.
> >>>>
> >>>> v2: improve commit message (Dmitry)
> >>>>
> >>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >>>> Cc: Rob Clark <robdclark@chromium.org>
> >>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> This has been reviewed.  Should we land it?
> >> No, there are still open discussions about it.
> > I think if it is needed for trace visualization, that is justification
> > enough for me
> >
> > I don't really see otherwise how a generic trace visualization tool
> > like perfetto would handle the case that some fence timelines have
> > separate events but others do not.
>
> Well I just send a patch to completely remove the trace point.
>
> As I said it absolutely doesn't make sense to use this for
> visualization, that's what the trace_dma_fence_init trace point is good f=
or.
>
> The only use case is for debugging the GPU scheduler and we should
> probably introduce a separate GPU scheduler specific trace point for
> this instead if we should ever need it.

Hmm, AFAIU from Chia-I, virtgpu has a separation of init and emit..
OTOH if using separate events in these special cases is better, then
I'm ok with that and can revert this patch.  Chia-I is more familiar
with the visualization end of it, so I'll let him comment on whether
that is a workable approach.

BR,
-R

> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> (Or, how do I check if it has landed?)
>
