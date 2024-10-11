Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2088999CA6
	for <lists+freedreno@lfdr.de>; Fri, 11 Oct 2024 08:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F4C10EA3E;
	Fri, 11 Oct 2024 06:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LoIKRx4E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E2E10EA3E
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2024 06:30:19 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e28fd83b5bbso1722675276.0
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 23:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728628218; x=1729233018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVcEDroOEZwsIMVrx+9WRohn0DDzskEXWSGatUhqlGY=;
 b=LoIKRx4EGK6+7MCvV0066gS+Y5GCrheatUV9y2jtq9JNzMHqMn5atBwWykwsxLbRGp
 hQ3zE9nNweKqB23uykY/W0fCmAoYt6LjziSZntvKA9mGbNkqct0vLHlLWSprRUuPRSvY
 /jhcqFgaJK0/cUuTPZafwrZ0qYVvMKwR5vXaq4wQqD9PITQHFyrHNMwFcJN6A53vy+qv
 T2rnB1aQ4BH8px0WiSzLrjAQHR8v4ExnYrb54lCuXGjHMGKcKLB6hmVM8XA1BAOrIDLD
 qlygymay1zWMFNdcxK1iNzL0uBaI046htRLZlD3jDT7n9+AQEsVVOb/AX+grTzI01KIb
 H6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728628218; x=1729233018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVcEDroOEZwsIMVrx+9WRohn0DDzskEXWSGatUhqlGY=;
 b=jkcprkBEJwm1gI7BvePMXq+UEJcADwSqJezrNJ72aJWdKh53BoIKwkCsLRl0AX2Ig9
 vEXbI0X3u1rgduKNwDNE8iDvAeVFfbtVxFhGuItd97bPkKVYK5ZB5/pNFG9V1276Zj89
 k39Jd1+tVVy+loNaeDqiZyASYglN3yEzLetnQLIz5AIRYqkKbTz5OWgRWadFU4LS02Df
 dGT8KSox/WrWOzkEieOP3uAPSUB+WuBEz84cFVQncuQ4ahxYolO3NKebKSoQWQNwrCCL
 ikvz8UK51PFAvYC+uPpMQqt+C69S0VK9lG5otVbyj6DndPnomSTebuEMJGYKgCNQAa9G
 W6SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5bKyRPzFqGtaPx1sgKKf2RLj59Jxy+nmLvbD4a3Y2/+q+ZKX18uPE6xRyGo7fWtMUKlFXQQsQYhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzznybqwSG39p3MyqlgSEpPMK7rX/8QBVRlBmghc/iACajVEDc4
 ou8ekNlzi5sxccp4dHl6W6sGrUry5eG6+QkMy4CBW9niVl6wDaCZSrXoffUPZiS7pGqb7pamdDV
 GHZEMPFOMqBDZpMqN+fpnK3OivlKUChcXVZQTlA==
X-Google-Smtp-Source: AGHT+IHJdQGSufApLca8LjP+ezebvoTYvY+Iadu6v7iZqW7H9NHt7SSVE59XTNWKkbubvse0s188tLVmRhsmcUOf89Q=
X-Received: by 2002:a05:6902:1441:b0:e29:2e8:5c95 with SMTP id
 3f1490d57ef6-e2919fff5aemr1088090276.51.1728628218609; Thu, 10 Oct 2024
 23:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
 <n7bkvvxph2wxaxf2s7vonj273ouonlb2nisl7n7ora6j5stnlv@tt3v3uawwh2q>
In-Reply-To: <n7bkvvxph2wxaxf2s7vonj273ouonlb2nisl7n7ora6j5stnlv@tt3v3uawwh2q>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 14:30:07 +0800
Message-ID: <CABymUCPV+bu-MNGCRp_0A+jC9Z6hY3XRm4vZ5Ju2XxT5YuRzPA@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] drm/msm/dpu: update mixer number info earlier
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
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:21PM GMT, Jun Nie wrote:
> > Update mixer number info earlier so that the plane nopipe check
> > can have the info to clip the plane. Otherwise, the first nonpipe
> > check will have mixer number as 0 and plane is not checked.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index dfe282c607933..68655c8817bf8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -638,6 +638,7 @@ static int dpu_encoder_virt_atomic_check(
> >       struct dpu_global_state *global_state;
> >       struct drm_framebuffer *fb;
> >       struct drm_dsc_config *dsc;
> > +     struct dpu_crtc_state *cstate;
> >       int ret =3D 0;
> >
> >       if (!drm_enc || !crtc_state || !conn_state) {
> > @@ -662,6 +663,8 @@ static int dpu_encoder_virt_atomic_check(
> >       dsc =3D dpu_encoder_get_dsc_config(drm_enc);
> >
> >       topology =3D dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode,=
 crtc_state, dsc);
> > +     cstate =3D to_dpu_crtc_state(crtc_state);
> > +     cstate->num_mixers =3D topology.num_lm;
> >
> >       /*
> >        * Use CDM only for writeback or DP at the moment as other interf=
aces cannot handle it.
> > @@ -1170,7 +1173,13 @@ static void dpu_encoder_virt_atomic_mode_set(str=
uct drm_encoder *drm_enc,
> >       }
> >
> >       cstate->num_dscs =3D num_dsc;
> > -     cstate->num_mixers =3D num_lm;
> > +     if (cstate->num_mixers !=3D num_lm) {
> > +             if (!cstate->num_mixers)
> > +                     DPU_ERROR_ENC(dpu_enc,
> > +                                   "mixer number %d is not as expected=
 %d\n",
> > +                                   num_lm, cstate->num_mixers);
> > +             cstate->num_mixers =3D num_lm;
> > +     }
>
> Is it a possible case or just defensive coding?

The value is initialized beforehand only in virtual plane case. So we
still need this
for non virtual plane case.
>
> >       dpu_enc->connector =3D conn_state->connector;
> >
> >       /*
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
