Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ACA999CD0
	for <lists+freedreno@lfdr.de>; Fri, 11 Oct 2024 08:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EFD10EA43;
	Fri, 11 Oct 2024 06:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DzuVrhl3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2224610EA43
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2024 06:40:13 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e0875f1e9edso1498680276.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 23:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728628812; x=1729233612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qfSM9AJ7ULCOORqVQMeKLRHN4Z/ZES4kfQKS10nrPyo=;
 b=DzuVrhl3ttTQGuG3uQXAcHnsw2ZayEyOtyBiTjknrvdZf/OhC4THhHev7yuB31gwOJ
 bH2BS6zrOtjVziTzqVcciOkMZ8jPYcLwqGe5uHCU/b6C3YBPbQEZzrh+q0nslasc6Xql
 85ybPxrpxpwivFK5kHc5wbxxhF/NCHRK+Klgvim4RpRRLr/fE/NhxbpziO9dCgbwbxPV
 CTCmiKXxxug/3CpmJBxjKFT7z+lCD/jZ41CzUINt5A0MQcb+G1LoyGyRyHTefWc2EZg3
 3Lb2Wwl44NYwcwmi85ecMD9FVsIcBWJDob1AAbTR18TbmxPTBK7zbQz90+2GKOXPGPm2
 2R8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728628812; x=1729233612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qfSM9AJ7ULCOORqVQMeKLRHN4Z/ZES4kfQKS10nrPyo=;
 b=o7Jkpi/UfRUKZheWS7BqGO6IU+vJvIbYcoZd6UvB/WlJdYcE9EEoHqmyU+KFErRuiT
 +VfVBImx6yya3rImLMw5u2o7s4Asv/lo9zNvhHrTTaxeTpUnnH1zXwDJWcJurrLRoAeH
 A6eOrvQreV7g352S1ZdbNmJx47cpHUCPpKv19e0fHQAV5ZJog9kt+cJ7o0mTnt47ys0s
 gYP+MyWH1SU6DwVxMvZYvGn1+5gfNcp3QtDUtvrxea+WmttE3OuJQ4vnjlFEAunEn7v4
 93X+jgF/asga26k52SeXEs+x3sI7DGgcXedu3MYqI/qlvbx9WC3GQ2Mxs9qI4sGqk0a1
 9bzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVahUy7Bb/6ouakB0X3jYG7TfdcYanyCg+xNyPNumlG3IXZVDbRUc59MPy27eit7Kky2nFtZZ0qhaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfJZce+jXM53jT02DCEhtrOED/iNJjAZPCicZD+CLnh7OKSbzp
 zXpvRX7C4Y1TiyoFWsEps8qvJer2VTyOGRyWFs3S5JwSgnE+/AJSoUEGRbr/tIJ5MwFaWy77rUf
 OTRidqzBiAXg82YRfJ8yaeQCSz64L0qDODV9jzQ==
X-Google-Smtp-Source: AGHT+IEp7H558OS0vMf/lCfx7nv2J5NRDmMZ5UvSeTPYRs3ovFyldfgKvbQdJiW43i1yheMmuw+j0rRtlg+9hMGjFZg=
X-Received: by 2002:a05:6902:1003:b0:e28:ead2:2270 with SMTP id
 3f1490d57ef6-e2919def5dbmr941314276.41.1728628812086; Thu, 10 Oct 2024
 23:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
In-Reply-To: <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 14:40:00 +0800
Message-ID: <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
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
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > Blend pipes by set of mixer pair config. The first 2 pipes are for left
> > half screen with the first set of mixer pair config. And the later 2 pi=
pes
> > are for right in quad pipe case.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++---=
--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >  2 files changed, 25 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 43d9817cd858f..66f745399a602 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_=
crtc *crtc,
> >       const struct msm_format *format;
> >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> >
> > -     uint32_t lm_idx, i;
> > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> >       bool bg_alpha_enable =3D false;
> >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> >
> > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct dr=
m_crtc *crtc,
> >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->alpha_=
enable)
> >                       bg_alpha_enable =3D true;
> >
> > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > -                     if (!pstate->pipe[i].sspp)
> > -                             continue;
> > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > -                                                mixer, cstate->num_mix=
ers,
> > -                                                pstate->stage,
> > -                                                format, fb ? fb->modif=
ier : 0,
> > -                                                &pstate->pipe[i], i, s=
tage_cfg);
> > +             /* loop pipe per mixer pair */
> > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2; lm_pai=
r++) {
> > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > +                             pipe_idx =3D i + lm_pair * PIPES_PER_LM_P=
AIR;
> > +                             if (!pstate->pipe[pipe_idx].sspp)
> > +                                     continue;
> > +                             set_bit(pstate->pipe[pipe_idx].sspp->idx,=
 fetch_active);
> > +                             _dpu_crtc_blend_setup_pipe(crtc, plane,
> > +                                                        mixer, cstate-=
>num_mixers,
> > +                                                        pstate->stage,
> > +                                                        format, fb ? f=
b->modifier : 0,
> > +                                                        &pstate->pipe[=
pipe_idx], i,
> > +                                                        &stage_cfg[lm_=
pair]);
> > +                     }
> >               }
> >
> >               /* blend config update */
> > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *=
crtc)
> >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> >       struct dpu_hw_ctl *ctl;
> >       struct dpu_hw_mixer *lm;
> > -     struct dpu_hw_stage_cfg stage_cfg;
> > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
>
> After seeing this code, can we define STAGES_PER_PLANE (and
> also keep PLANES_PER_STAGE defined to 2)?
>
Could you elaborate it? Stages describe how many layers to be blended.
Plane is a DRM concept that describe a buffer to be display in specific
display driver. Plane is already mapped to SSPP/multi-rect in DPU driver
 in blending stage level. So I am confused here.

-  Jun
