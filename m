Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E2999D6E
	for <lists+freedreno@lfdr.de>; Fri, 11 Oct 2024 09:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB5D10EA59;
	Fri, 11 Oct 2024 07:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zwbjy4uW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7386810EA58
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2024 07:06:53 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6e2772f7df9so15960507b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2024 00:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728630412; x=1729235212; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KbDvhzRE0GcC1Dd4Kqw9/lX4StqtF0AG6/j/dYmGN1o=;
 b=zwbjy4uWp2SFC8b8cdtaCHDCLhsuNisWrC61r5fwReXO117kQk/+cchesSE/shmcUp
 wLWaFheroU476rve4LQimo6DVWVzqpwAvegZ/OWA2B4hMhqAHNX8703EwNSZ/kHdXX4c
 om0+Bn3CkE06KuXckavtjIH0rHSxYyd097C6/iEoN/ZEWktEclD79Qm/xknH6bV+pn5d
 c6E1B8IYxbxJWKDvYhXti0XBrWX8En4hOrL+atu6E17B8qadIh8WRN6BNQUvE7aZHQjJ
 Apv0eNlvNuPfYpY4iu3M6Chfkgih8BLmktktqLdFm5d973bh3S7klYRN5JU3f+CJeE9Z
 YeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728630412; x=1729235212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KbDvhzRE0GcC1Dd4Kqw9/lX4StqtF0AG6/j/dYmGN1o=;
 b=myXYkerNeY/0PHZqRXicUwAfLAoTGM8nlmDfs3W0WUWjj8vUmPKqjGh6mm5OtoiJQO
 WdfnpybbOOfqUjLrOzQCJj75msIK7n9M5uA7KFltXQOC7CgMe8o48XJ3eFN0N0yQFilO
 LXEzBMhJZsOjB7znd+xmVXnpL3rTIRaiydWwVgF/ONQzdDNeUsFywlEpBYyvfNHGjSqy
 FmHcJ7OzMyV0nX4tZ/qZ1CsB35BuTw+21O248utsbvrLG9LTaa3P9CVRv9SKN1qaQECG
 LvktiEWDSv+P3WAeaGIUVn4fTx0RmW1dz8eC69Fbb6ZCuETeBNZvgNE7VjxZIP5uBnM3
 Wqwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0cu4e29c/V49xdON7qbKMiK+i+1Vf/YXDeNrLKCY35k+hafP9HSdTKDoQKbEjYiQ+DV30QBvslLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/3kZyxfHE3wX9jH7uosy//EURyXfFWcDDJog7DwvKO4hiK/ya
 sM9wztd+Qv15WMEVAoRVeo+k7M25o6R1DWKWtF4cu/kGwE4S2e7vKfHbGv/jYV+7oogcLLr3vyl
 SDF+POavJ3h3AAZnqtroXCsQIEv0ix9fpsHK11w==
X-Google-Smtp-Source: AGHT+IGAqFf1aCWRylzQD2egBbLwi3qRNqcNEIYZaTvmCmq4ukOzJTKIvCqu2AgBinqdnGTEhCOpEXxLoURFTP8BrkA=
X-Received: by 2002:a05:690c:fc7:b0:6e2:b263:1045 with SMTP id
 00721157ae682-6e3477befe2mr12970867b3.6.1728630412570; Fri, 11 Oct 2024
 00:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
 <n7bkvvxph2wxaxf2s7vonj273ouonlb2nisl7n7ora6j5stnlv@tt3v3uawwh2q>
 <CABymUCPV+bu-MNGCRp_0A+jC9Z6hY3XRm4vZ5Ju2XxT5YuRzPA@mail.gmail.com>
In-Reply-To: <CABymUCPV+bu-MNGCRp_0A+jC9Z6hY3XRm4vZ5Ju2XxT5YuRzPA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 10:06:41 +0300
Message-ID: <CAA8EJpprO9pZ7bRf5HDA7-8UYKn5RiK2Yg9eW1NTYSEAE8ZDFw@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] drm/msm/dpu: update mixer number info earlier
To: Jun Nie <jun.nie@linaro.org>
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

On Fri, 11 Oct 2024 at 09:30, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:12=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Oct 09, 2024 at 04:50:21PM GMT, Jun Nie wrote:
> > > Update mixer number info earlier so that the plane nopipe check
> > > can have the info to clip the plane. Otherwise, the first nonpipe
> > > check will have mixer number as 0 and plane is not checked.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index dfe282c607933..68655c8817bf8 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -638,6 +638,7 @@ static int dpu_encoder_virt_atomic_check(
> > >       struct dpu_global_state *global_state;
> > >       struct drm_framebuffer *fb;
> > >       struct drm_dsc_config *dsc;
> > > +     struct dpu_crtc_state *cstate;
> > >       int ret =3D 0;
> > >
> > >       if (!drm_enc || !crtc_state || !conn_state) {
> > > @@ -662,6 +663,8 @@ static int dpu_encoder_virt_atomic_check(
> > >       dsc =3D dpu_encoder_get_dsc_config(drm_enc);
> > >
> > >       topology =3D dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mod=
e, crtc_state, dsc);
> > > +     cstate =3D to_dpu_crtc_state(crtc_state);
> > > +     cstate->num_mixers =3D topology.num_lm;
> > >
> > >       /*
> > >        * Use CDM only for writeback or DP at the moment as other inte=
rfaces cannot handle it.
> > > @@ -1170,7 +1173,13 @@ static void dpu_encoder_virt_atomic_mode_set(s=
truct drm_encoder *drm_enc,
> > >       }
> > >
> > >       cstate->num_dscs =3D num_dsc;
> > > -     cstate->num_mixers =3D num_lm;
> > > +     if (cstate->num_mixers !=3D num_lm) {
> > > +             if (!cstate->num_mixers)
> > > +                     DPU_ERROR_ENC(dpu_enc,
> > > +                                   "mixer number %d is not as expect=
ed %d\n",
> > > +                                   num_lm, cstate->num_mixers);
> > > +             cstate->num_mixers =3D num_lm;
> > > +     }
> >
> > Is it a possible case or just defensive coding?
>
> The value is initialized beforehand only in virtual plane case. So we
> still need this
> for non virtual plane case.

It looks better if it's handled in the non-virtual code instead.

--=20
With best wishes
Dmitry
