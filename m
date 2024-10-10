Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF9997A42
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2024 03:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25E710E127;
	Thu, 10 Oct 2024 01:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VYUL5hhz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E2610E127
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 01:47:16 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6e2e427b07dso3819787b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 09 Oct 2024 18:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728524835; x=1729129635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdcTNAl/zNhJjLlHdVeR2ByMa+E2JXdIstKxPRioi6g=;
 b=VYUL5hhzKg5dEM/Gp8jtblQ1xpx5JYxZK3PodXcPbiVLoEKxo8i9vaIfG6D+M1DRzP
 7sdLx9uVbEUeY+yYOIIKdN8wTI15PUwXlCFsdKnXSfWPTf5Yih2MutECHZRjrWq2PrrJ
 2EgMDW12By5PHf2o5inr007jm3oCs+9T9Q9acoBsb4dhoVBf7Q6O35ClA3+uE5t+sjuV
 3YlkwqLvfvZwGrtsCQ1w9CmCqMg+ABMmq1xrxkggPygHiLpHOqpo18ZsY6Nvu88iI00k
 oq19eCc7figbu3nDg/Y/+Dye+zhsAUF4I3ygz4iQ4Wh4VHqpxpH4kGVP6tymjcJh4Ewv
 fMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728524835; x=1729129635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdcTNAl/zNhJjLlHdVeR2ByMa+E2JXdIstKxPRioi6g=;
 b=ORMWpeKXAlwY6Ag35VoHRrPIs9hw/KJVE94nfOQ28KO33PMRzszvQUnUhIHT5hPuyI
 VuCsrTkugvRGIbrDSCrZKGnPJm12LlXnKdO203vh0qI8d/IZo2hJFN36vg/HjF5ROSYh
 nBrRspzEkjtErA1W3PptO9aZXS3dwvP/zzsazbb6BYN0N3+8LqpnEZAlJIKJJviYEAh6
 98lMO86ltLu78VbyMYEBKipHUha7ubrPTtPN/yW3iQf/caLJMIO+iL3+7DDxFWbn/im2
 03RWlrHuX7f8Pr1qmAJwg8zY9WbGKdKmvx0u4i6WdRpi4dMl6rfcPnaJ7kf1crcLaujb
 Tz2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWAhgaMDcNEAeJh1I8XtlEZ3dqPP/6qM3HktnZihGa6CvyfNShu7VOpsQSwwp3dMo7Z8jrJF4LBrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIghFf/oB3CX2mJJv1MVtEua3UTsHhWDJgTSIOiWA8XdzVzTQm
 RP/zr8CYT5KkLjISf73mIGB/cFbzjP6u+xZk3BqQPjjv9FI8JvGCThSRkk9Z8V62vqYW6haZDsi
 ko813nEe+HkD12355NWGvR20lJEVeI8sHLuQghA==
X-Google-Smtp-Source: AGHT+IEXCaAqs23+faG84Xbw0uLAys4Y42dQjl9KJR547/GRJW2/9mYWarS+Ua7dASs4AVA+2dWVFy8+L5nX5SMGZDE=
X-Received: by 2002:a05:690c:d8e:b0:6e3:21a9:d3c2 with SMTP id
 00721157ae682-6e32210dfe7mr45994217b3.8.1728524835161; Wed, 09 Oct 2024
 18:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
 <CAA8EJpr-B2OZbn5_6dUnojf9ZTXkVcE2nUL1QHohTmk0Qa+bPg@mail.gmail.com>
In-Reply-To: <CAA8EJpr-B2OZbn5_6dUnojf9ZTXkVcE2nUL1QHohTmk0Qa+bPg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 10 Oct 2024 09:47:04 +0800
Message-ID: <CABymUCMAsXFz4tMdNexxU8UVGu_khcD6EE+KBt=5EHmKbXvG5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
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
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 06:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 9 Oct 2024 at 09:39, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Only 2 DSC engines are allowed, or no DSC is involved currently.
>
> Can't parse this phrase.

How about this:
If DSC is enabled, the only case is with 2 DSC engines so far.


>
> > We need 4 DSC in quad-pipe topology in future. So let's only configure
> > DSC engines in use, instread of maximum number of DSC engines.
>
> Nit: instead

Yep.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 39700b13e92f3..e8400b494687c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu=
_hw_ctl *ctl,
> >                 ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
> >  }
> >
> > -static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> > -                                struct drm_dsc_config *dsc)
> > +static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
> >  {
> >         /* coding only for 2LM, 2enc, 1 dsc config */
> > +       struct dpu_encoder_virt *dpu_enc =3D to_dpu_encoder_virt(drm_en=
c);
> > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(drm_enc->cr=
tc->state);
> > +       struct drm_dsc_config *dsc =3D dpu_enc->dsc;
>
> Why? This doesn't seem to be related to num_dscs introduction.

You mean the comments above these 3 lines? Yeah, it should be removed.
>
> > +       int num_dsc =3D cstate->num_dscs;
> >         struct dpu_encoder_phys *enc_master =3D dpu_enc->cur_master;
> >         struct dpu_hw_ctl *ctl =3D enc_master->hw_ctl;
> >         struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>
> [...]
>
> > @@ -1953,7 +1956,7 @@ void dpu_encoder_prepare_for_kickoff(struct drm_e=
ncoder *drm_enc)
> >         }
> >
> >         if (dpu_enc->dsc)
> > -               dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
> > +               dpu_encoder_prep_dsc(drm_enc);
> >  }
> >
> >  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
