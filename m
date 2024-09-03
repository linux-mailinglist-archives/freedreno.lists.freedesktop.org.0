Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44859695FE
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 09:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7715410E41D;
	Tue,  3 Sep 2024 07:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xVpM6oyJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B1A10E41D
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 07:48:49 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-533496017f8so6708377e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Sep 2024 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725349728; x=1725954528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Sv5UiL21b/b3TY87F39nvEWfHp31hMXSNIqU/zuTOg=;
 b=xVpM6oyJwdjczMmBWI5uh2FTzvn2a6SJwqi2q8vYqYNDp1yJHWKhHp3ZAeKyiwid11
 wiQc418iBO++CxG7EXJTAwH2JJ1EFt3u3UQy8c0eO8nmpyf7qejTjv9D7sqtm0zMZxdG
 sv630FlXygrSx2aTiqxgw36B/KFWwKRlTf3GUJ6ySfNeMzJ3wb3Yklh7dc6dZUh5pGUl
 huJhHPIKblpIjhmUzD1j7xrXGklliVZZsNcanrktuoN7pld86XFpBLvtjXV26KObppSA
 +lAjlrYreCf8gm+C5lAJJ6A3MYjIEyvaYxZ+kZDgGXl2+x5/wOIhHIYvINOAxl1vNAVm
 jILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349728; x=1725954528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Sv5UiL21b/b3TY87F39nvEWfHp31hMXSNIqU/zuTOg=;
 b=TZ6UbhM4EVMVk0zyncoesKb0oiJk9EnIRKAs1g/vLnLs/cRIQQ29XSW9ESfTo33MQB
 Sr3ieJNPO0QTcCLz/LlSXuOpKn2PG+vRuYy+Q8r+zNOPdD4qH6hs76U2WQwNJ6xaBBpM
 Hvgq9rEiOv/WsPtS9/06+dzVnZiz8ws2QQdfYGwzSwzX8GGJS4vAR2R/I3wrG1tIQfUn
 /Eocp8CXBzfeZBsqQ1xRq120s+yLuqiFDDxDiYq2jW2RxPkevjg13NRjiR1GgnTSxWT2
 IPrIHkXliFRcm2fn64/hy4VLYutTwtkLma+CJhzwMYebAuMbAZ8W0RSKSZW5dysQODKY
 Hhpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW74gTzOXcty57P1qWB8liYZpx0KoJJ9JZGMa+Iz5qOszobkHHBabMUUhfW9duwmwooBpLUE5pxL9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1p5chwk7QMOisJ6GL0HHycKhej5nSyOte0VbbqwlyUvhTT6im
 e0FsuSTWPdm5lciQj3WrThBwocWP+yZfGBk8Ye/UK66AK3/d++Zgb3Ws08n4kpfNtnchtuEqsFR
 MKLgc4yaxoFU+JxD3MwEouJnyXdS1g5QDo+y/hQ==
X-Google-Smtp-Source: AGHT+IFb2cMkBKbVeiCZ5IYK8mCct3VX/awajZsJGd8T3xn5cm3YhWirCQaajtw1ZZucaT8Vf7utkyeAzyWgGqbZRv8=
X-Received: by 2002:a05:6512:1282:b0:533:d3e:16fe with SMTP id
 2adb3069b0e04-53546b69245mr7439461e87.38.1725349727618; Tue, 03 Sep 2024
 00:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
 <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com>
In-Reply-To: <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:48:36 +0800
Message-ID: <CABymUCMCjYfXBOqXcLGZvH6CxU7Z_Qq1kKioZGC8PCORjtJM8Q@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Do not assume DSC number as 2. Because there are 4 DSC in
> > quad pipe case.
>
> Please expand the commit message. You prefer brevity, but your
> comments lack clarifications.

Is below message OK?

Current DSC number is fixed to 2 for any DSC usage case. While there are
more usage case that involve different number of DSC engine, such 4 in
quad-pipe case with bonded-DSI scenario. So retrieve the real number with
this change.

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 6bdd9c21ff3ed..05b203be2a9bc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *=
drm_enc)
> >                 if (dpu_enc->phys_encs[i])
> >                         intf_count++;
> >
> > -       /* See dpu_encoder_get_topology, we only support 2:2:1 topology=
 */
> > +       /* DSC and mixer are mapped 1:1, so reuse the mixer number */
>
> Why? DSCmerge is a valid topology even if it is not supported yet.

DSC merge is already supported in 2:2:1 topology without this patch
set. This change
is to get real DSC number in 4:4:2 topology, so that DSC merge can be
enabled for the
case.

>
> >         if (dpu_enc->dsc)
> > -               num_dsc =3D 2;
> > +               num_dsc =3D dpu_crtc_get_lm_num(drm_enc->crtc->state);
> >
> >         return (num_dsc > 0) && (num_dsc > intf_count);
> >  }
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
