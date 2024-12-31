Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D75F9FEFFE
	for <lists+freedreno@lfdr.de>; Tue, 31 Dec 2024 15:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60E210E089;
	Tue, 31 Dec 2024 14:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sui7PozA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E82E10E089
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 14:34:56 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6dcdd9a3e54so101047856d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 06:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735655635; x=1736260435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rL17eu52TPn+FxCKD51YSXrmc7q5Hp1A9+hdV9KvlH0=;
 b=sui7PozARhx0i4ok5GXlFwHgh246/TSNMHsJU/FnIL+pjoVU/jGb+TDFMAe8soi6ia
 rwTdRDpFzqh311bDcL1rqY3y/X46BI/QjyjNoHY7GNMtVxJ6bvdfxgTHZ3doZD3FzAG4
 sXd1ge301YFrG8ZDo53M8SzTmYPmr4hTB/sVcQzptJwNS/CgfPwRmIzepl3qWvK3jpHT
 /sT2qxektbK6szVqVffWpAwlO4SklG3MKKSRFM0vDiIZWf70LG3ri5El1pUoUbIU6Z7y
 tGk7vPUjUuFQBe7ZJK7omILy4iuuxPCJiN3uyYOqcrmZv7na5GPUFnwOchd0z/7KbW4U
 n6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735655635; x=1736260435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rL17eu52TPn+FxCKD51YSXrmc7q5Hp1A9+hdV9KvlH0=;
 b=FrsCwbGKq3XBXzdnt2XnXvCZwB/zfVigno59+5EYrFiltBJZIGQ+L7WIzi4oyBfuVi
 UM4aaPFdTrk+iq0qApjILUTSU0tTLVvFejS9Fz4I+iVDINGZ4p91gd8mLXxoObqivR3h
 J4zr8y1tFMZ8s/Cns3NXzNnkA5c0iOWwrqwKdCkyO8Tf2kcsxcAe1W2NiM24ZLgMHXR5
 nS1RAsrFdDwCK+6sERK1OnsTHa/lEVObq0nETRUTBEsyTVCMsomlryE4EOmBtWqE+Vtf
 fhwVmWP1aRNA1eNoYTHogXPtdLD9uoFXHvxHXjHUakyBlamzNFFz/RYnBfghl1HmUm0q
 5hjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFRagc5TcEuJD0TWZlBwvEm+OOvbzMopBaKuy73NdlWyck5cGLYBgbos3p+cwSCriYKOKY2vFpRCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw429Ryl6jrYipBvUYg5305N6SquxKtL2YvGbdIoRoJItlaB98C
 h6U6MqOtG/CnjzEwZNxVU35hOeYsdRA4oGZjpx7Mntt3gReV8UHflLOXoR5uNxzdoAtio542xH2
 xZ/Cdrv15A3QzEcpk6rlMEfT/RquWM5kWf7VTRLbYflLviUdP
X-Gm-Gg: ASbGncscK/dNmQ2h0LqWX3VZ8vADGBcSuVCHO08zfZOMTefF1HexS7Fa2RRCFW4rgl/
 b9t7jjN+JLm66FhC9xZ9mn7jILsiPzCKDj8rpeAmPCkMsLGxZsq7PjYFUi28FuTkoEQmWV28=
X-Google-Smtp-Source: AGHT+IHu5RvYyC4nB2qf+XDJ+++3gqSi2Op4GcMB04A2jw0fnQSrmJDmXEVSJBJcKxrFc2tdYxydWafdNf7U76/hxNI=
X-Received: by 2002:a05:690c:113:b0:6ef:96f8:b609 with SMTP id
 00721157ae682-6f3f821a21dmr343989677b3.31.1735653873018; Tue, 31 Dec 2024
 06:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
 <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
 <CABymUCPDTxR7drbanHpjYmVgQyHqWSWwL-_rsFWZ9=uOFj2kPQ@mail.gmail.com>
In-Reply-To: <CABymUCPDTxR7drbanHpjYmVgQyHqWSWwL-_rsFWZ9=uOFj2kPQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Dec 2024 16:04:22 +0200
Message-ID: <CAA8EJpp-sRDLWMYHO_m6J=iFQArqiRF143QEj-KzntQXgyc0ow@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
To: Jun Nie <jun.nie@linaro.org>
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

On Tue, 31 Dec 2024 at 15:24, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=
=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 06:29=E5=86=99=E9=81=93=EF=BC=9A
>
>
> >
> > On Thu, Dec 19, 2024 at 03:49:28PM +0800, Jun Nie wrote:
> > > Add pipe as trace argument to ease converting pipe into
> > > pipe array later.
> >
> > Isn't it already converted in on of the previous patches? Also you are
> > adding it to a particular trace function, trace_dpu_crtc_setup_mixer().
>
> It is converted in this patch. But this patch should be earlier than
> the patch to
> convert pipe into array actually. Will reverse the sequence in next versi=
on.
> Yes, I am adding it to a particular trace function. Do you mean I should =
mention
> the specific function in title?

Mentioning it in the commit message is enough.

>
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
> > >  2 files changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 72ed8749cd716..6841d0504d450 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm=
_crtc *crtc,
> > >
> > >       trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
> > >                                  state, to_dpu_plane_state(state), st=
age_idx,
> > > -                                format->pixel_format,
> > > +                                format->pixel_format, pipe,
> > >                                  modifier);
> > >
> > >       DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d mul=
tirect_idx %d\n",
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_trace.h
> > > index 5307cbc2007c5..cb24ad2a6d8d3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > > @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> > >       TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
> > >                struct drm_plane_state *state, struct dpu_plane_state =
*pstate,
> > >                uint32_t stage_idx, uint32_t pixel_format,
> > > -              uint64_t modifier),
> > > +              struct dpu_sw_pipe *pipe, uint64_t modifier),
> > >       TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> > > -             pixel_format, modifier),
> > > +             pixel_format, pipe, modifier),
> > >       TP_STRUCT__entry(
> > >               __field(        uint32_t,               crtc_id        =
 )
> > >               __field(        uint32_t,               plane_id       =
 )
> > > @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> > >               __entry->dst_rect =3D drm_plane_state_dest(state);
> > >               __entry->stage_idx =3D stage_idx;
> > >               __entry->stage =3D pstate->stage;
> > > -             __entry->sspp =3D pstate->pipe.sspp->idx;
> > > -             __entry->multirect_idx =3D pstate->pipe.multirect_index=
;
> > > -             __entry->multirect_mode =3D pstate->pipe.multirect_mode=
;
> > > +             __entry->sspp =3D pipe->sspp->idx;
> > > +             __entry->multirect_idx =3D pipe->multirect_index;
> > > +             __entry->multirect_mode =3D pipe->multirect_mode;
> > >               __entry->pixel_format =3D pixel_format;
> > >               __entry->modifier =3D modifier;
> > >       ),
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
