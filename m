Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C29FF02A
	for <lists+freedreno@lfdr.de>; Tue, 31 Dec 2024 16:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E12110E038;
	Tue, 31 Dec 2024 15:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="abH63Bg4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD97A10E038
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 15:23:26 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-46792996074so98518661cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 07:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735658545; x=1736263345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=snA4yvwa/jOkFHRQZhhZPLDBB7J2xJa1ZDzy4VT0d/c=;
 b=abH63Bg4acX/Uc8tpH5GE0TqFh561aQWykeY4J3pJUE7w4ZUXo3HWnmnhsgu4IU6OU
 T4r5oXna1+2DWSzCimLMKjv9JTtVKk3ooAjBwzCkZzBOXjXSTSKPhe2LubJbHCVJxBgs
 9EckLMavXiUg5RhXWwmWcoj137uNBPxhgCdC7fOK+cI3RmFeZ3hzD7rYRZFzna77MoLK
 NGcCO4+Cl3QceHQg7FpsDuyUz7FYlP+s4YOTTX+T62XL4yr5bdy2Lqmby5jaWl7eydz9
 cxCNC+BjLu7UMSJJFB18uZf2/Qg5YfKbrw75G7p44Ax9ym/vXAd3f9DjlnProECg/D2S
 3UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735658545; x=1736263345;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=snA4yvwa/jOkFHRQZhhZPLDBB7J2xJa1ZDzy4VT0d/c=;
 b=I51+G5DxX/OfL+BsJnHh4jOYu07n4mUTMLb6MRiaIRsX2dRNs2KUUGRDKCxB7kQPJ2
 jsxRploYCpWln8zJxqY5wVPcbefHC3OYm+Ec2vJnwOrRTQg2XL+Bz72lgcE+pwujIBT0
 zYP7mJi2sxC3qfYJP8kqAv5htQH8KgBxzZZ5edrvwq+hbW7TpPZmvszxe/edSk0keQra
 j8hOakezlSFKmjssYswNb0BkpsIAk9gipjy1KmRSKJcUp8SPhv16QBfqZ+7xXzTP/R6W
 jLdHwUr7vlvl1eq6o61hl+WBAN+F0NEdQuJL35NxvGx5Af2b7g0wp80OpgSe5UDfJTZp
 tg5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8cudNiDMjQ47KiXX8BZ4taQy2ZZDFKHcLst3Ecii4b0HaXANaDUxWywtw5XanRZfqNT2U2X/MAW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywQu9dzzETjFCkZqn+OLzJlR21r4PbEl6jJcP/IAFwM6SHBSzy
 sNDEJiUdn3VZcbYDAWBnZJNwkvIG4YKwxzljwCvLXgIOU0wJfejYmW8d4DjgKX9FeHNLOqmkbj6
 XsDFfSNpSo7A+BoAaYj4/q2PlKBfVpu+L8KahPJMSlie3rhuIne1g+XcX
X-Gm-Gg: ASbGncs/0DAZ0NPERnShQFxIsv+OyGDY/l+STrL/k+/rg6HUXPb0SOQOZfeKAOoGGrA
 S4LJLEWfLURpKvK+eF3oL72xTBfuD41ev/oaVDJ0=
X-Google-Smtp-Source: AGHT+IFGsk0fupDwzj9lh6jZbL4bQlBTGOG6UckivqlqvTqjTO3DMHgfMLp19aQljkDCpVAtfntkoLcWya4LkRi7Rz4=
X-Received: by 2002:a05:690c:708a:b0:6ef:a187:f3a3 with SMTP id
 00721157ae682-6f3f822353fmr264399617b3.27.1735651464161; Tue, 31 Dec 2024
 05:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
 <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
In-Reply-To: <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 31 Dec 2024 21:24:12 +0800
Message-ID: <CABymUCPDTxR7drbanHpjYmVgQyHqWSWwL-_rsFWZ9=uOFj2kPQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 06:29=E5=86=99=E9=81=93=EF=BC=9A


>
> On Thu, Dec 19, 2024 at 03:49:28PM +0800, Jun Nie wrote:
> > Add pipe as trace argument to ease converting pipe into
> > pipe array later.
>
> Isn't it already converted in on of the previous patches? Also you are
> adding it to a particular trace function, trace_dpu_crtc_setup_mixer().

It is converted in this patch. But this patch should be earlier than
the patch to
convert pipe into array actually. Will reverse the sequence in next version=
.
Yes, I am adding it to a particular trace function. Do you mean I should me=
ntion
the specific function in title?

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 72ed8749cd716..6841d0504d450 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_c=
rtc *crtc,
> >
> >       trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
> >                                  state, to_dpu_plane_state(state), stag=
e_idx,
> > -                                format->pixel_format,
> > +                                format->pixel_format, pipe,
> >                                  modifier);
> >
> >       DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multi=
rect_idx %d\n",
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_trace.h
> > index 5307cbc2007c5..cb24ad2a6d8d3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> >       TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
> >                struct drm_plane_state *state, struct dpu_plane_state *p=
state,
> >                uint32_t stage_idx, uint32_t pixel_format,
> > -              uint64_t modifier),
> > +              struct dpu_sw_pipe *pipe, uint64_t modifier),
> >       TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> > -             pixel_format, modifier),
> > +             pixel_format, pipe, modifier),
> >       TP_STRUCT__entry(
> >               __field(        uint32_t,               crtc_id         )
> >               __field(        uint32_t,               plane_id        )
> > @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> >               __entry->dst_rect =3D drm_plane_state_dest(state);
> >               __entry->stage_idx =3D stage_idx;
> >               __entry->stage =3D pstate->stage;
> > -             __entry->sspp =3D pstate->pipe.sspp->idx;
> > -             __entry->multirect_idx =3D pstate->pipe.multirect_index;
> > -             __entry->multirect_mode =3D pstate->pipe.multirect_mode;
> > +             __entry->sspp =3D pipe->sspp->idx;
> > +             __entry->multirect_idx =3D pipe->multirect_index;
> > +             __entry->multirect_mode =3D pipe->multirect_mode;
> >               __entry->pixel_format =3D pixel_format;
> >               __entry->modifier =3D modifier;
> >       ),
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
