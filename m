Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106E8D5C86
	for <lists+freedreno@lfdr.de>; Fri, 31 May 2024 10:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F2F10E602;
	Fri, 31 May 2024 08:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZDOHcIzJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C4C113886
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2024 08:16:34 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-627f3265898so17460937b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2024 01:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717143393; x=1717748193; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bIrhnunVBUnQyrbNG299hSoNmJr03nYh4HIQ6p7Sw4Q=;
 b=ZDOHcIzJpd7OBtWE45ur3cBxBFGw2UebS4FMbf+RC3TcAoeAnujtIL8YeJfc5q6Eop
 XfrNE+UGPetQ0EyY9StxyiZF2bF+KHsXmLv56B/x0/jU9NcgiT/DhEGKkvgg94W3IaIz
 hXQP1lkjf0NvDckxxRcESNWDukTYJJJNcBox7VJHmJy1m1celpii7oKUwKIIAsr8uDf3
 VFBnyKmB5v1L7F0k8z7kUEWlu8TRzFrpOgZA1SAheAQglSeMpgAWZ2AOczpILSDIw380
 /pil5vWxln4ZbzFotdRBiKckssuTY1W+l6vpqmvof98DqJwGaeJ9solecktvd2QRdGBb
 ivCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717143393; x=1717748193;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bIrhnunVBUnQyrbNG299hSoNmJr03nYh4HIQ6p7Sw4Q=;
 b=bC+uSx5YgC11FkBf4w5VP20EfqJdUi9atLd7Jf0zb3n2qOaIeoFEYd20Jy1kOjwMcI
 E7BCF8kOQKST2PJExjgEyRsYn4GvzbWe8/R7D59p2A5fa9tDB25rvxM5c1o4nILXtilJ
 nhptUAUSuZfPyM/2DgwHShZ9ewIc1aGFcnT6sG8trAY5+6SaHD7L0VHzX4bQs21fUG/z
 jtPikhp7lt9VgWT9fTMPRAkE9YGJMPOEbyDNXUeOW6AiPajbObmdV+/MxuaoTfRmAoY0
 Qxfst95T1WVO+yHh+RRaZFLiZLYC3q8RwlhCqjFvnQQtLYNnVG09M7elqhAqJBiIpTRx
 QFjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/OmVT0sxpbPEoftxtb66ERFoOJS/uKREBT5SUwNpaMIciF/2KRp7cM0ETxlMYjnH/UcSsPXzZvEdjCVE0K2kQ1/zzUK+HrHv7utoGAl0z
X-Gm-Message-State: AOJu0Yxo7HTcgwDEaNdH11X5BUkte2hgr6F4/cRQRXztWuJi1d33uqG1
 lFnj6AI6jtgbO5Hm2j8fcbZhjqF5J2lPzInHLe/uGJrlwp7dfoz7jCTdZwdE3rCPkRfLRfpMnsP
 0Y9VLSHn+HNQ/wt0qwA2y2IPq7u8aM3o0x5rgEQ==
X-Google-Smtp-Source: AGHT+IG/fn4yvDuVujCLL19BjnG0MrbOU321zzu3JqLux3NA6uPKcuLSf3NhlOeWgVpVZF7pjTgVjR4u1dLQ0MBKfEE=
X-Received: by 2002:a25:ce92:0:b0:de5:1553:4351 with SMTP id
 3f1490d57ef6-dfa73be7b64mr1196776276.15.1717143391373; Fri, 31 May 2024
 01:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-6-dmitry.baryshkov@linaro.org>
 <6a335026-77c1-a112-69af-a8d9d86d5528@quicinc.com>
In-Reply-To: <6a335026-77c1-a112-69af-a8d9d86d5528@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 11:16:20 +0300
Message-ID: <CAA8EJpqKkTOkhrgJexw-D5TbgGYjBoUup3FHC80boR_cAUb2dA@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 31 May 2024 at 04:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > Max upscale / downscale factors are constant between platforms. In
> > preparation to adding support for virtual planes and allocating SSPP
> > blocks on demand move max scaling factors out of the HW catalog and
> > handle them in the dpu_plane directly. If any of the scaling blocks gets
> > different limitations, this will have to be handled separately, after
> > the plane refactoring.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
> >   3 files changed, 13 insertions(+), 19 deletions(-)
> >
>
> <Snip>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 70d6a8989e1a..6360052523b5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -785,12 +785,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >       return 0;
> >   }
> >
> > +#define MAX_UPSCALE_RATIO    20
> > +#define MAX_DOWNSCALE_RATIO  4
> > +
> >   static int dpu_plane_atomic_check(struct drm_plane *plane,
> >                                 struct drm_atomic_state *state)
> >   {
> >       struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> >                                                                                plane);
> > -     int ret = 0, min_scale;
> > +     int ret = 0, min_scale, max_scale;
> >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> >       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> >       u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> > @@ -822,10 +825,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       pipe_hw_caps = pipe->sspp->cap;
> >       sblk = pipe->sspp->cap->sblk;
> >
> > -     min_scale = FRAC_16_16(1, sblk->maxupscale);
> > +     if (sblk->scaler_blk.len) {
> > +             min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > +             max_scale = MAX_DOWNSCALE_RATIO << 16;
> > +     } else {
> > +             min_scale = 1 << 16;
> > +             max_scale = 1 << 16;
>
> You can use DRM_PLANE_NO_SCALING instead.

Ack

>
> > +     }
> > +
> >       ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >                                                 min_scale,
> > -                                               sblk->maxdwnscale << 16,
> > +                                               max_scale,
> >                                                 true, true);
>
> I am missing something here.
>
> As per the documentation of this API, min and max are the scaling limits
> of both directions and not max_upscale and max_downscale.
>
> **
> 837  * drm_atomic_helper_check_plane_state() - Check plane state for
> validity
> 838  * @plane_state: plane state to check
> 839  * @crtc_state: CRTC state to check
> 840  * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> 841  * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> 842  * @can_position: is it legal to position the plane such that it
>
>
> But this change is passing max_upscale and max_downscale as the min and
> max resp. Isnt that wrong?

First of all, please notice that I'm not changing the values that are
passed to the function. What was being passed beforehand gets passed
after this commit. I just moved it out of the catalog.

Second, if we take a look at drm_calc_scale(), we can see that it
calculates src / dst and checks that it is within the min_scale and
max_scale boundaries, just like documented.
In our case, the boundaries are (I'm omitting 16.16 math):
- upscale 20 times. dst = 20 * src, scale = src/dst = 1/20
- downscale 4 times. dst = 1/4 * src, scale = src/dst = 4

So, from the point of view of drm_calc_scale(), the min_scale is
1/MAX_UPSCALE, max_scale = MAX_DOWNSCALE and the values the code is
passing are correct.

>
>
> >       if (ret) {
> >               DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);



-- 
With best wishes
Dmitry
