Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E399E0FC
	for <lists+freedreno@lfdr.de>; Tue, 15 Oct 2024 10:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDD410E54A;
	Tue, 15 Oct 2024 08:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vgr2yqBl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F37F10E54A
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 08:27:24 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e2972abc807so186766276.3
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728980843; x=1729585643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kh7NkmDAM9m5O1uSrySh2RZX18Uua/RhFygWOGIe73E=;
 b=vgr2yqBlXLIu/3QpgZXGMlvVcjGMCd5s/rUh0X205F7bFHwirpiX1aJ0eKOiyyqeDO
 u1fYF1K1bTWTAAtSFy8UvNR9VClOZOjJxSQ2sYG/xg+Ok0vxLNCTjXjxZfIU5MSzUIGo
 4rCIDOofT7/JIDyi/OPLyvzc/VL1+zO3ywWCHKv8V5Mqe3zu2FVWTztLKwWK4LdhLziL
 wfIC1E6drnHfQW1oUhHkF1dg9teGc/Z3WhuTWVHGowQ9eIOh2+X5t/pXNW8GZc4Q2d6F
 TyJIhdNj0r4acL6pIlvoazc9otjonU1j39flafeosIpiRpfhmUHBb7VWruHIERwAset3
 UfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728980843; x=1729585643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kh7NkmDAM9m5O1uSrySh2RZX18Uua/RhFygWOGIe73E=;
 b=heNHEGKCAqu9nwB2y9CXwIhmVZBoiXKw6wqGy3btqeNwyvzaTwHT5CoWlm/zObn7Ep
 RMNzkdhl33DSkkwmt7Wm6WB7ySs2Slu59sqadt5Z+hydL2SHesJCXO4e6argChadeCTT
 beQRpoHHPw6cu4lqt0i4hr08Rg3Feib2NPITUc7/T6IOWIVEOro0uAyHyGRLg/eZ+Z1b
 z3Xg9yGC1RBlaU/LKX9YcujZNSDl6CWbf/4FdzRyydOniNGgnG+T0SaN0Mk2o52q8igh
 56f6/aQewyK5I1IsKRc/5Fmx+TwsfKl0yuiJ8t+RAk+3o6Ymp9QQu4UQN5/xPIlaDcXO
 upyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5DNcv6dmhLzazIGrSSDjtgCwOH/HyloiR+ON3X/wNIrNFzKcrMdli22A60aE6ZwLThw7g7COmWv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxGVXbPIMpRYCEnQY9yjY6xoNYvYi/aEz4fSzV7HNtqATxg1pe
 L9TtiiOfKjLDBd7FWfTEpqRLXPmpbLxj+rJjn/DHSPJkGH6CDTbg69lDrhuV2FknyC/Q66yOZ4Q
 KEBtky70avZ5uVs0anWpVH7EuMMEdjeMZ5okIzg==
X-Google-Smtp-Source: AGHT+IFkKg4baqyI1mR+ynKg6uqf1M6RVbil+T3rXQaW6Bdg4AXGejHp/kAEANso21Z43EVZ9cmSocT4SYoeks7pIAU=
X-Received: by 2002:a05:6902:1893:b0:e29:2f00:803e with SMTP id
 3f1490d57ef6-e292f00c843mr9386451276.33.1728980843258; Tue, 15 Oct 2024
 01:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
 <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
 <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
 <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com>
 <CAA8EJppMu5o7juhKUN2Y_4CRYKtaWN9G01aPU2ZfksE_tzjqCQ@mail.gmail.com>
In-Reply-To: <CAA8EJppMu5o7juhKUN2Y_4CRYKtaWN9G01aPU2ZfksE_tzjqCQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 15 Oct 2024 16:27:12 +0800
Message-ID: <CABymUCNbwY5hoaOxydPccFAdbnCQgUMspJLHkNziQyf=NxOj2A@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/msm/dpu: blend pipes per mixer pairs config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 11 Oct 2024 at 10:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:03=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Fri, 11 Oct 2024 at 09:40, Jun Nie <jun.nie@linaro.org> wrote:
> > > >
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=
=B410=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=
=9A
> > > > >
> > > > > On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > > > > > Blend pipes by set of mixer pair config. The first 2 pipes are =
for left
> > > > > > half screen with the first set of mixer pair config. And the la=
ter 2 pipes
> > > > > > are for right in quad pipe case.
> > > > > >
> > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 +++++++++++++=
+++++-----------
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > > >  2 files changed, 25 insertions(+), 14 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > index 43d9817cd858f..66f745399a602 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(str=
uct drm_crtc *crtc,
> > > > > >       const struct msm_format *format;
> > > > > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > > > > >
> > > > > > -     uint32_t lm_idx, i;
> > > > > > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> > > > > >       bool bg_alpha_enable =3D false;
> > > > > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > > > > >
> > > > > > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(s=
truct drm_crtc *crtc,
> > > > > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format=
->alpha_enable)
> > > > > >                       bg_alpha_enable =3D true;
> > > > > >
> > > > > > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > > > -                     if (!pstate->pipe[i].sspp)
> > > > > > -                             continue;
> > > > > > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_=
active);
> > > > > > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > > > > -                                                mixer, cstate-=
>num_mixers,
> > > > > > -                                                pstate->stage,
> > > > > > -                                                format, fb ? f=
b->modifier : 0,
> > > > > > -                                                &pstate->pipe[=
i], i, stage_cfg);
> > > > > > +             /* loop pipe per mixer pair */
> > > > > > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2=
; lm_pair++) {
> > > > > > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++)=
 {
> > > > > > +                             pipe_idx =3D i + lm_pair * PIPES_=
PER_LM_PAIR;
> > > > > > +                             if (!pstate->pipe[pipe_idx].sspp)
> > > > > > +                                     continue;
> > > > > > +                             set_bit(pstate->pipe[pipe_idx].ss=
pp->idx, fetch_active);
> > > > > > +                             _dpu_crtc_blend_setup_pipe(crtc, =
plane,
> > > > > > +                                                        mixer,=
 cstate->num_mixers,
> > > > > > +                                                        pstate=
->stage,
> > > > > > +                                                        format=
, fb ? fb->modifier : 0,
> > > > > > +                                                        &pstat=
e->pipe[pipe_idx], i,
> > > > > > +                                                        &stage=
_cfg[lm_pair]);
> > > > > > +                     }
> > > > > >               }
> > > > > >
> > > > > >               /* blend config update */
> > > > > > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct dr=
m_crtc *crtc)
> > > > > >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> > > > > >       struct dpu_hw_ctl *ctl;
> > > > > >       struct dpu_hw_mixer *lm;
> > > > > > -     struct dpu_hw_stage_cfg stage_cfg;
> > > > > > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
> > > > >
> > > > > After seeing this code, can we define STAGES_PER_PLANE (and
> > > > > also keep PLANES_PER_STAGE defined to 2)?
> > > > >
> > > > Could you elaborate it? Stages describe how many layers to be blend=
ed.
> > > > Plane is a DRM concept that describe a buffer to be display in spec=
ific
> > > > display driver. Plane is already mapped to SSPP/multi-rect in DPU d=
river
> > > >  in blending stage level. So I am confused here.
> > >
> > > We have dpu_hw_stage_cfg, you are adding a second instance of it. So
> > > we now have two stages per plane.
> >
> > So you suggest to replace LM_PAIRS_PER_PLANE with STAGES_PER_PLANE,
> > right? I assume a stage is coupled with a LM pair.
> >
> > But for PLANES_PER_STAGE, I am still confused. A stage or a LM pair can
> > involve many SSPP layers. How it related to planes? Plane is a concepts=
 from
> > higher level.
>
> PIPES_PER_STAGE, excuse me.

Do you mean to keep PIPES_PER_STAGE and do not introduce PIPES_PER_LM_PAIR,
or use both? Looks like they are equal in hardware nature. A stage
structure serves
a mixer pair with 2 pipes. We can use PIPES_PER_LM_PAIR and add comment to
 indicate it, thus avoid defining too many macro.

>
> --
> With best wishes
> Dmitry
