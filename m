Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048883B1C4
	for <lists+freedreno@lfdr.de>; Wed, 24 Jan 2024 20:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AE710F7BD;
	Wed, 24 Jan 2024 19:05:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B03A10F7C3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Jan 2024 19:05:13 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5ff7ec8772dso51192057b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 Jan 2024 11:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706123052; x=1706727852; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KmnZ+4qU2kGjhoMztUUbFnIgPcRcY/5mbRQaBPPJztg=;
 b=q5H6/mfEd/56KoJA5V6+X5WPgirhR+Xo+Or+Txp5jIfk+F/3v9cJmweSlM0RSKRFcW
 Y3m2tI7FUlWw8TYMnpEOYygTfiHXhtcG3JqptFuedtvS5Yw8KSC/vtfQJaTbLNLRDWtC
 hij4vucUJEgbOmolAg+6g9F6HNzATDkICgNSe9TWzjgMXE+px6TlKXSFuX4ScAy4FLk1
 QXMkCoUd6DzNswpEQxk5bfWv5LOaqis7OJNjQVwOg5nxGGuBiYP1ljpWdv0MhAmlyDDB
 cYzlE7PefvtnqRT/sMh5Rr8C88etDihqXvnH33Q4/tRdnKACgnJe0rPFPN6+8eRQrrQI
 5xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706123052; x=1706727852;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KmnZ+4qU2kGjhoMztUUbFnIgPcRcY/5mbRQaBPPJztg=;
 b=reaK+Dx3kGTviaJnEH1gxJ3f3V8RZ1qLT0+eKLvLIK3kMxHRb1/1xUNuuCiShvd/Y4
 kv4vfDv4nE+UPGyWKxQzE5lNweEDGTi7HLIZGv/1A9ruXR2IpvY+VP/Sx2bRZqvWNdNs
 UeoBZsqqUUCO4JaU5IrbEinWGWN/h5PtpKP+kuYk2naEhkgiCUqzQx8jYPd8mQiM/sGH
 aWO+3gryB8VGf/Sj78YORzUk12i8IdoQaymS1CizESvI3MT1QNxY+gBdO2YS9GWQIWsf
 pBu/R3WvOg0LSR/CDVUwWdezrdRpFsXuTkZCeKq3uJ2hVTMMBzMH5nAJe0dQl5k8V6eT
 MNcQ==
X-Gm-Message-State: AOJu0Yxe+OT3CV+TjVTQQpIOkhSCpGSjx0iO3pIDHQhgoMzp+WxEXqn+
 M2+USdm+gW5m7CMhg7t2LThJ8TVLLm2Dh6xJHH/OVzhXvHJOwosWHX9POlpuag/X7gZ/rnfgiAE
 W3hp9bMF/ztS0LvTFhCZ6iBTrEZm6O3Zwcihzct/p6GkSPqeI
X-Google-Smtp-Source: AGHT+IHSEPyZclZ3jWHL/AqXx86hPUnY1ANQkuWp2HJuMRnsJ3Bj63IM9Jhy+hVYq6pIrY/xvsulKAmFaTci3fyfHzk=
X-Received: by 2002:a0d:d547:0:b0:5ff:e1fe:d083 with SMTP id
 x68-20020a0dd547000000b005ffe1fed083mr1377249ywd.81.1706123051765; Wed, 24
 Jan 2024 11:04:11 -0800 (PST)
MIME-Version: 1.0
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
 <20231225130853.3659424-5-dmitry.baryshkov@linaro.org>
 <211f0818-04a2-7dc3-fe37-c09b756765d1@quicinc.com>
In-Reply-To: <211f0818-04a2-7dc3-fe37-c09b756765d1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Jan 2024 21:03:59 +0200
Message-ID: <CAA8EJpqoUqMmqz1bUjWJT5shgMqLj0ta47s81t5vLbG0NragqA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 24 Jan 2024 at 00:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 12/25/2023 5:08 AM, Dmitry Baryshkov wrote:
> > dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> > Move corresponding checks to drm_writeback_connector's implementation
> > and drop the dpu_encoder_phys_wb_atomic_check() function.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
> >   4 files changed, 64 insertions(+), 59 deletions(-)
> >
>
> While validating this change with kms_writeback, we found that this is
> breaking back to back validate of kms_writeback with a NULL ptr
> dereference in below stack:
>
> [   86.701062] Call trace:
> [   86.701067]  dpu_wb_conn_atomic_check+0x118/0x18c
> [   86.701076]  drm_atomic_helper_check_modeset+0x2d8/0x688
> [   86.701084]  drm_atomic_helper_check+0x24/0x98
> [   86.701095]  msm_atomic_check+0x90/0x9c
> [   86.701103]  drm_atomic_check_only+0x4f4/0x8e8
> [   86.701111]  drm_atomic_commit+0x64/0xd8
> [   86.701120]  drm_mode_atomic_ioctl+0xbfc/0xe74
> [   86.701129]  drm_ioctl_kernel+0xd4/0x114
> [   86.701137]  drm_ioctl+0x274/0x508
> [   86.701143]  __arm64_sys_ioctl+0x98/0xd0
> [   86.701152]  invoke_syscall+0x48/0xfc
> [   86.701161]  el0_svc_common+0x88/0xe4
> [   86.701167]  do_el0_svc+0x24/0x30
> [   86.701175]  el0_svc+0x34/0x80
> [   86.701184]  el0t_64_sync_handler+0x44/0xec
> [   86.701192]  el0t_64_sync+0x1a8/0x1ac
> [   86.701200] ---[ end trace 0000000000000000 ]---
>
> We analysed this and found why. Please see below.
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > index a0a28230fc31..8220cd920e6f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > @@ -354,59 +354,6 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
> >       }
> >   }
> >
> > -/**
> > - * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
> > - * @phys_enc:        Pointer to physical encoder
> > - * @crtc_state:      Pointer to CRTC atomic state
> > - * @conn_state:      Pointer to connector atomic state
> > - */
> > -static int dpu_encoder_phys_wb_atomic_check(
> > -             struct dpu_encoder_phys *phys_enc,
> > -             struct drm_crtc_state *crtc_state,
> > -             struct drm_connector_state *conn_state)
> > -{
> > -     struct drm_framebuffer *fb;
> > -     const struct drm_display_mode *mode = &crtc_state->mode;
> > -
> > -     DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> > -                     phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> > -
> > -     if (!conn_state || !conn_state->connector) {
> > -             DPU_ERROR("invalid connector state\n");
> > -             return -EINVAL;
> > -     } else if (conn_state->connector->status !=
> > -                     connector_status_connected) {
> > -             DPU_ERROR("connector not connected %d\n",
> > -                             conn_state->connector->status);
> > -             return -EINVAL;
> > -     }
> > -
> > -     if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> > -             return 0;
> > -
> > -     fb = conn_state->writeback_job->fb;
> > -
> > -     DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
> > -                     fb->width, fb->height);
> > -
> > -     if (fb->width != mode->hdisplay) {
> > -             DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width,
> > -                             mode->hdisplay);
> > -             return -EINVAL;
> > -     } else if (fb->height != mode->vdisplay) {
> > -             DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
> > -                               mode->vdisplay);
> > -             return -EINVAL;
> > -     } else if (fb->width > phys_enc->hw_wb->caps->maxlinewidth) {
> > -             DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
> > -                               fb->width, phys_enc->hw_wb->caps->maxlinewidth);
> > -             return -EINVAL;
> > -     }
> > -
> > -     return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> > -}
> > -
> > -
> >   /**
> >    * _dpu_encoder_phys_wb_update_flush - flush hardware update
> >    * @phys_enc:       Pointer to physical encoder
> > @@ -777,7 +724,6 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
> >       ops->is_master = dpu_encoder_phys_wb_is_master;
> >       ops->enable = dpu_encoder_phys_wb_enable;
> >       ops->disable = dpu_encoder_phys_wb_disable;
> > -     ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
> >       ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
> >       ops->prepare_for_kickoff = dpu_encoder_phys_wb_prepare_for_kickoff;
> >       ops->handle_post_kickoff = dpu_encoder_phys_wb_handle_post_kickoff;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 723cc1d82143..48728be27e15 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -630,23 +630,26 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
> >   {
> >       struct drm_encoder *encoder = NULL;
> >       struct msm_display_info info;
> > +     const enum dpu_wb wb_idx = WB_2;
> > +     u32 maxlinewidth;
> >       int rc;
> >
> >       memset(&info, 0, sizeof(info));
> >
> >       info.num_of_h_tiles = 1;
> >       /* use only WB idx 2 instance for DPU */
> > -     info.h_tile_instance[0] = WB_2;
> > +     info.h_tile_instance[0] = wb_idx;
> >       info.intf_type = INTF_WB;
> >
> > +     maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
> > +
> >       encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
> >       if (IS_ERR(encoder)) {
> >               DPU_ERROR("encoder init failed for dsi display\n");
> >               return PTR_ERR(encoder);
> >       }
> >
> > -     rc = dpu_writeback_init(dev, encoder, wb_formats,
> > -                     n_formats);
> > +     rc = dpu_writeback_init(dev, encoder, wb_formats, n_formats, maxlinewidth);
> >       if (rc) {
> >               DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
> >               return rc;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > index 2a5a68366582..232b5f410de8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > @@ -4,6 +4,7 @@
> >    */
> >
> >   #include <drm/drm_edid.h>
> > +#include <drm/drm_framebuffer.h>
> >
> >   #include "dpu_writeback.h"
> >
> > @@ -24,6 +25,57 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
> >                       dev->mode_config.max_height);
> >   }
> >
> > +static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> > +                                 struct drm_atomic_state *state)
> > +{
> > +     struct drm_writeback_connector *wb_conn = drm_connector_to_writeback(connector);
> > +     struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(wb_conn);
> > +     struct drm_connector_state *conn_state =
> > +             drm_atomic_get_new_connector_state(state, connector);
> > +     struct drm_crtc *crtc = conn_state->crtc;
> > +     struct drm_crtc_state *crtc_state;
> > +     const struct drm_display_mode *mode;
> > +     struct drm_framebuffer *fb;
> > +
> > +     crtc_state = drm_atomic_get_crtc_state(state, crtc);
>
> To detach the CRTC associated with the connector, IGT will set the
> associated CRTC_ID to 0 and the associated conn_state->crtc will be NULL.
>
> This is valid as val will be 0 in this case:
>
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_uapi.c#L722
>
> Before this patch, for these cases, we used to call the encoder's
> atomic_check which gets skipped when there is no valid crtc:
>
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_helper.c#L440
>
> But now with connector atomic check, these calls are allowed by the DRM
>
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_helper.c#L712
>
> So questions:
>
> 1) Should we add protection in DRM to check if conn_state->crtc is valid
> before calling connector's atomic_check()?

I think this is correct. So if !crtc, just return 0. I'll send next
iteration in the next few days.

>
> OR
>
> 2) Is it incorrect for us to dereference conn->crtc in connector's
> atomic_check as its not guaranteed to be valid.
>
> We cannot fail atomic_check for !crtc, because if we add a !crtc check
> and fail those checks, it bails out these disable commit calls thus
> failing those commits.
>
> > +     if (IS_ERR(crtc_state))
> > +             return PTR_ERR(crtc_state);
> > +


-- 
With best wishes
Dmitry
