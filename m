Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6BA13708
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 10:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B7610E918;
	Thu, 16 Jan 2025 09:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ABHGOroQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85B110E918
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 09:52:59 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e549a71dd3dso1368205276.0
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 01:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737021119; x=1737625919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHkHmJVyVw2q8SHd/lGtIIaMHF7t+fsEzhn65ZBqGG0=;
 b=ABHGOroQElHoV+dzKUoQbhUVxFjE+dPazpiIy4Z7Afoz/3sQQpMj7hPu4yZ49kgYgx
 5TkrtBdxLmEPxZuRi6BE9MNZpTPBvt9mt0yQ1o8rs1loVt7/qoe2sPjYUlEEmTx/YNYI
 vmNfZpCZ2OUTrwQ0ZjnEuNf2Q5GADdzDehZBMCiQRdnnplA9tpLxIZxQSh5c/2pXwDG2
 WAOZVNexcZGXJeTChhOMJyVEIrUsb5pvnyQ/eaZ5a2w/jmFwEpfR/ct0zSphImZRZIqE
 bX9yjKaYcPqbQ6lkUe9usiJ4dcAVLxkNSnPe3oicbonAG01R4vNtdTjjmOVdlf/wty6E
 cjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737021119; x=1737625919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHkHmJVyVw2q8SHd/lGtIIaMHF7t+fsEzhn65ZBqGG0=;
 b=UU2WSrYPNlC1EIgWmBBO8HP81SXakM2zK1z1B5dpCpgG2vqXEKZgwY6/Ueb4HsoLFH
 kmpRfgiuCrJ4NFuRjNltLQ9SYZeUmMR1RXEK0KFR2vhjji0MnZ22hIswWTfa8jhLCVeO
 O68smCji8Jvgs3iTIPFbaIhwTXmulSAyjqr7a1iuCgaLQqObZerLOSpy7U8zkmZ2g+2a
 eY2y+ZYK/Czep82B8C1okQAIILobIDrZIh0YugQgdiuO6lcTuRuQcDvozyUnrRPnaB9c
 c9qGXyi32kgNKvncI5037jRQljDXqp2wubllwcRk4cmhl5UPQi+LQGcOMNHQQarpWGQR
 jU8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULBzq3IPIvBwnFaY/S7OVwsAwwfIw3NIyK+yhUw5BYWXHcHKQ98UvaM52QsoARwBE9g9HenWBenYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOtuGq+Nl2Kv+oshOB3VY24u4NgCRpLk6+D6o0bXFaGC9aXwEA
 EU+vDs9/8qAjHE/g86mhwgIIprF6NsoYd5u5AlNf5EK58xEAWHNJaDZ6OYEdWW1aFWP746joUy4
 gJtTGKpaYnN7FKcZPojcRTgDi5LoP78XqEBR9Ew==
X-Gm-Gg: ASbGnctudw3vWMs4jDN1U9a9EWPpk3GrXGsRyx4QYtxWkkN0JZGfJtb+79cL6ErbDUF
 Xzq1+EScZnnnZ83QCbXtgFZUm4cZhDm+Lgb4f4A==
X-Google-Smtp-Source: AGHT+IEPamgQ8A4umLwLWvzdOq5abqzsKPymyE869UdE7JGW5hBM/FhvB7/cu7uZnuZjcd4X4d8keygBo36mKeTM5aA=
X-Received: by 2002:a05:6902:2001:b0:e38:c0ed:8128 with SMTP id
 3f1490d57ef6-e54edf4181emr26876714276.3.1737021119084; Thu, 16 Jan 2025
 01:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
 <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
 <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
In-Reply-To: <CABymUCOdtePUgcbtY3Xtf9detcfwm=RjG1D_sfDOSbSP-EjwXA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 17:51:48 +0800
X-Gm-Features: AbW1kvZx8A6GtE-n-Wp7iPIdMM92jpshgFLQ0sM3KOw4L6IGEW1Av757xu2vCFE
Message-ID: <CABymUCPeaG0PVBhNdvhXp=GK9RGqsqDfLLv0w+icBmHwn_hiKg@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
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

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=9C=8816=E6=97=A5=E5=
=91=A8=E5=9B=9B 17:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:00=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> > > Store pipes in array with removing dedicated r_pipe. There are
> > > 2 pipes in a drm plane at most currently, while 4 pipes are
> > > required for quad-pipe case. Generalize the handling to pipe pair
> > > and ease handling to another pipe pair later.
> >
> > With the first sentence being moved to the end of the commit message:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Minor issues below, please address them in the next version.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++---=
----------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > >  3 files changed, 112 insertions(+), 102 deletions(-)
> >
> > > @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> > >               return -EINVAL;
> > >       }
> > >
> > > +     /* move the assignment here, to ease handling to another pairs =
later */
> >
> > Is it a TODO comment? It reads like an order.
> >
> > > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > >       /* state->src is 16.16, src_rect is not */
> > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > >
> >
> > > @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct =
drm_plane *plane)
> > >  {
> > >       struct drm_plane_state *state =3D plane->state;
> > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > +     struct dpu_sw_pipe *pipe;
> > > +     int i;
> > >
> > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > -                             pstate->pipe.multirect_mode);
> > > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > > +             pipe =3D &pstate->pipe[i];
> > > +             if (!pipe->sspp)
> > > +                     continue;
> > >
> > > -     if (r_pipe->sspp) {
> > > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > +                                     pstate->pipe[i].multirect_mode)=
;
> > >
> > > -             if (r_pipe->sspp->ops.setup_multirect)
> > > -                     r_pipe->sspp->ops.setup_multirect(r_pipe);
> > > +             /*
> > > +              * clear multirect for the right pipe so that the SSPP
> > > +              * can be further reused in the solo mode
> > > +              */
> > > +             if (pipe->sspp && i =3D=3D 1) {
> >
> > Wouldn't it be better to `&& i % 2 !=3D 0`? Then, I think, this conditi=
on
> > can stay even in quad-pipe case.
>
> If all pipes are in solo mode, there is no need to test ' i %2 !=3D 0 '. =
Below
> test shall be better, right?
> if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_RECT_1)

See your comments for later patch. Let's keep it as:
i % PIPES_PER_STAGE !=3D 0
>
> >
> > > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > > +
> > > +                     if (pipe->sspp->ops.setup_multirect)
> > > +                             pipe->sspp->ops.setup_multirect(pipe);
> > > +             }
> > >       }
> > >
> > >       pstate->pending =3D true;
> >
> > --
> > With best wishes
> > Dmitry
