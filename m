Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765A796980E
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 10:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088C110E448;
	Tue,  3 Sep 2024 08:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AkgdDZas";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E6F10E440
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 08:59:24 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6d49cec2a5dso31897777b3.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Sep 2024 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725353963; x=1725958763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjMrP6ByPwO+xl7QUgd6pIme65ZPvQHEPoRMFWbC26U=;
 b=AkgdDZasdE0rqiRwz0/VUwWGlHcrviuKHz9RtCSjdTMWpZXHLGxGmCAqhOJzTg8gcP
 4jmJ5IaHXHe1jn95riKLO/QVsj+RRSsGGFGW97rzuM34Cepkt89hculWPEVHgsxYaIb0
 imGTQROa9kQOpUw0fBdvwi1pUMv6FfeGZmrDJ/uuLK2ZnYHE/77l+JjX7/JH0Ld0pCu8
 r9yOh6Rd+jfjBZp1X+1KTAq2TQPFsWhYPusUEIM6RuG7crY2JG47LGBttqNo798KzhlT
 084JwDqyAQPGc0UqhEt5e0AfPT1GrtECshto/0ahqJVNmyqPWRSZ0JQA8C97+Gy2zDng
 poaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725353963; x=1725958763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zjMrP6ByPwO+xl7QUgd6pIme65ZPvQHEPoRMFWbC26U=;
 b=fMbTY/vzYZx6CjIkiWAstHNZg3Exf0Bx8IN7pPXi4V0IXAiITuhZmYbHTVJLBunDRw
 v2ioquaGq6ailUGFvKLwAhCegYfYVhdJ8tdMDqLgYISHdIzhCR0tWKfDRNdAfrA42dkA
 QkwXjVIv2NnwU38lLVEurSEPwVRAUxxo0+zmSpILo7ZbnAMaRWYuDzEbiK86Zx435FhX
 cm04ZTHn8wAdNYH+pbYl6+K3AsUxActisKcV/LhR4svf69cRNZXxXP8SbY/M0vNDcGDn
 PkIXTlYSPEChi8GIbJHXv9mxckfBWIeCFLQqX7XzwNn8q6NCuPzWqRSXaCAJUFgI7nBX
 xyxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcmGHOQsWZNnlKYzkGEn82JzUcNlV0jfsqnMRi77eV1RlQN4vG+ItGQ9Hp1uxHvaXIPSmRFtvV1yM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPLpIH2FkRu/X5A+pDHLetXCZSA3CCeHPropls72F59BLbwm50
 jqtaECOBLuRxphP7vbphD5nJS/d3xPsxgiE6GHOnkH4qrsoUoD2TMqiO0+h3y7HtqD4DKrJOS0T
 +eOrvWh+fCUdGxkM0hXgk4zs+V6I6IucuEoZB8w==
X-Google-Smtp-Source: AGHT+IHS0GzsmdR0si/TrTMH3ZQl3LYKdLuzZSFZv49wDd4H/iof6WJG/gETGwxahkV73EWWQ97UX7TrN4rJsUmUCi4=
X-Received: by 2002:a05:690c:dca:b0:65f:93c1:fee9 with SMTP id
 00721157ae682-6d40ee5716cmr147698137b3.9.1725353962947; Tue, 03 Sep 2024
 01:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-13-bdb05b4b5a2e@linaro.org>
 <CAA8EJpoRiF5uYUeeVog6QU+5f64eBzVDwafopXLnRkW5EiW6Eg@mail.gmail.com>
 <CABymUCPPXk3Nc-GUCy63V9HcCUyywx7tMCjbHzrTz3joA5=8ng@mail.gmail.com>
In-Reply-To: <CABymUCPPXk3Nc-GUCy63V9HcCUyywx7tMCjbHzrTz3joA5=8ng@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 11:59:11 +0300
Message-ID: <CAA8EJpqDWZiGawPtMXgY9evOWOZ6bTqmgBgks7rXxr4VC5tCXw@mail.gmail.com>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Support quad pipe in header files
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 3 Sept 2024 at 10:51, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:30=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Support 4 pipes and their configs at most. They are for 2 SSPP
> > > and their multi-rect mode. Because one SSPP can co-work with
> > > 2 mixer at most, 2 pair of mixer are needed for 2 SSPP in quad-
> > > pipe case. So 2 mixer configs are needed in quad-pipe case.
> >
> > As you wrote this is based (depends?) on the virtual planes, then you
> > know that the code already uses either one or two SSPP blocks to drive
> > one sw_pipe. I'm not sure what do you mean by "2 mixer configs". There
> > are 4 LMs and 4 mixer configurations in the quad-pipe case. The commit
> > message is thus misleading.
>
> This patch set depends on the virtual plane patch set. The mixer config i=
s
> not a proper term per your response. It is from DPU2 branch. Maybe
> clip_config is a better term for this. The config is used to split the pl=
ane
> into 2 mixers pairs and 2 DSI interface with 2 halves of full screen.

Let's understand why you need it at all. The sw_pipe should be
agnostic of the "left-or-right-half" part of the story.

>
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 11 ++++++++++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   | 30 +++++++++++++++++++=
++--------
> > >  3 files changed, 33 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > index a2eff36a2224c..424725303ccad 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > @@ -32,7 +32,7 @@
> > >  #define DPU_MAX_PLANES                 4
> > >  #endif
> > >
> > > -#define PIPES_PER_STAGE                        2
> > > +#define PIPES_PER_STAGE                        4
> > >  #ifndef DPU_MAX_DE_CURVES
> > >  #define DPU_MAX_DE_CURVES              3
> > >  #endif
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > index fc54625ae5d4f..ae6beff2c294b 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > > @@ -143,11 +143,20 @@ struct dpu_hw_pixel_ext {
> > >   *             such as decimation, flip etc to program this field
> > >   * @dest_rect: destination ROI.
> > >   * @rotation: simplified drm rotation hint
> > > + * @visible: mark this cfg is valid
> >
> > So is it valid or visible?
> Yeah, valid is better than visible.
> >
> > > + * @mxcfg_id: mixer config ID for left or right half screen.
> > > + *             We have single SSPP, dual SSPP, single SSPP+multi_rec=
t or dual
> > > + *             SSPP+multi_rect case. mxcfg_id mark current pipe will=
 use
> > > + *             which mixer cfg. The first mxcfg is for the left half=
 of screen,
> > > + *             the 2nd mxcfg is for the right half screen. The headi=
ng cfg may
> > > + *             be skipped by pipe with the first mxcfg_id =3D 1 if t=
he plane is
> > > + *             only displayed in the right side, thus SSPP goes to l=
ater mixers.
> >
> > too long description for an unreadable name.
>
> Maybe the clip_id is better per above discussion?

No. Please use clip when something gets clipped (e.g. because the
plane displays just a part of the framebuffer).

> >
> > >   */
> > >  struct dpu_sw_pipe_cfg {
> > >         struct drm_rect src_rect;
> > >         struct drm_rect dst_rect;
> > > -       unsigned int rotation;
> > > +       unsigned int rotation, mxcfg_id;
> > > +       bool visible;
> > >  };
> > >
> > >  /**
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.h
> > > index e225d5baceb09..9e79cf9eba264 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > @@ -14,14 +14,30 @@
> > >  #include "dpu_hw_mdss.h"
> > >  #include "dpu_hw_sspp.h"
> > >
> > > +/**
> > > + * Max number of mixer configs. Because we support 4 pipes at most,
> > > + * the 4 pipes are with 2 SSPP and their multi-rect mode. While one
> >
> > Or 4 SSPPs. Or 3 SSPPs. Or even a single SSPP if it doesn't cover the
> > whole screen.
> >
> > I'm really sorry to say, but I can not understand this text.
>
> Yeah, lots of usage cases are not mentioned here. It just describe how th=
e
> config number come from. It should be the number for screen clip rectangl=
e
> in a full screen.
>
> >
> > > + * SSPP can co-work with 2 mixer at most, then 2 pair of mixer are
> > > + * needed for 2 SSPP in quad-pipe case. Thus 2 mixer configs are
> > > + * needed in quad-pipe case.
> > > + */
> > > +#define MIX_CFGS_IN_CRTC 2
> > > +
> > >  /**
> > >   * struct dpu_plane_state: Define dpu extension of drm plane state o=
bject
> > >   * @base:      base drm plane state object
> > >   * @aspace:    pointer to address space for input/output buffers
> > > - * @pipe:      software pipe description
> > > - * @r_pipe:    software pipe description of the second pipe
> > > - * @pipe_cfg:  software pipe configuration
> > > - * @r_pipe_cfg:        software pipe configuration for the second pi=
pe
> > > + * @pipe:      software pipe description. Some or all of fields in a=
rray can
> >
> > array has elements, not fields.
> >
> > > + *             be in use per topology. The heading fields are used f=
irst,
> > > + *             and the later fields is invalid if visible field of p=
ipe_cfg
> > > + *             is not set. For example, the visible fields of pipe_c=
fg are set
> > > + *             in the first 2 pipe_cfg fields, and the mxcfg_id for =
them are
> > > + *             0 and 1. That means the first pipe is for left half s=
creen and
> > > + *             the 2nd pipe is for right half. The visible field of =
the 3rd
> > > + *             pipe_cfg is not set, which means the 3rd and 4th pipe=
 are not
> > > + *             in use.
> >
> > NAK. A single LM pair might already need two sw pipes.
> > After reading the comment I have doubts that you understand what the
> > code is currently doing.
>
> This describes that  a right half only plane will only use the first
> pipe/pipe_cfg with
> valid flag and clip_id flag. So the later 2 elements of
> sw_pipe/pipe_cfg arrary are not
> used.

I'd suggest doing it in the opposite way: always use 0/1 for the left
part, 2/3 for the right part. It should save you from all the
"visible" and "mxcfg_id" story.

>
> >
> > > + * @pipe_cfg:  software pipe configuration. The 4 fields are for SSP=
P and their
> > > +               parallel rect as above pipes.
> > >   * @stage:     assigned by crtc blender
> > >   * @needs_qos_remap: qos remap settings need to be updated
> > >   * @multirect_index: index of the rectangle of SSPP
> > > @@ -34,10 +50,8 @@
> > >  struct dpu_plane_state {
> > >         struct drm_plane_state base;
> > >         struct msm_gem_address_space *aspace;
> > > -       struct dpu_sw_pipe pipe;
> > > -       struct dpu_sw_pipe r_pipe;
> > > -       struct dpu_sw_pipe_cfg pipe_cfg;
> > > -       struct dpu_sw_pipe_cfg r_pipe_cfg;
> > > +       struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> > > +       struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
> > >         enum dpu_stage stage;
> > >         bool needs_qos_remap;
> > >         bool pending;
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--
With best wishes
Dmitry
