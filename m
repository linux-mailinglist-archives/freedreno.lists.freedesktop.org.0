Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE3999D3B
	for <lists+freedreno@lfdr.de>; Fri, 11 Oct 2024 08:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8E710EA49;
	Fri, 11 Oct 2024 06:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wJc/Ba/N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1838710EA49
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2024 06:55:57 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6e305c2987bso16271377b3.0
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 23:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728629756; x=1729234556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leCB05U0kuVzNJlGaNnlHWm3c19kiX7kkCoAs5xAlbw=;
 b=wJc/Ba/N2Wjf4j8yraVwWZmWN/3w5wyI4EnylKwiOWi2aTMoffJc4tizRUieQbm/pa
 0NMz5rcpdMLmpc+yJgQqItTgXyEirMjtszOD6+Iv6HQfPrtx9UgbRE3qc2gjSz1qeY9F
 pyDnoYpLXmp5z3M8FaiyNyaA6AD4ncg+9RYvPOfRa8JD8HBevnT4KV6SW0PVJ7JbY8/r
 WV7J0CGiOx/DEIO+Ad+53fIO0AMyv+VEIhq4plDbrw2WcVxQHf3F9MdEAZ32qFD7eYA9
 B8A8HF9bwN09DjnjMBAk1PyXcDZQZRWugldcfI2ZTlG53WsuwmC7rn9fxI80k+3i2nHI
 WDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728629756; x=1729234556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=leCB05U0kuVzNJlGaNnlHWm3c19kiX7kkCoAs5xAlbw=;
 b=OwWLq+KYmJ58XHT4KXM5H2r3GMOq37ltUD7gMOJAmKdLgBHVxoJJu3H3psciVyD53a
 mlilGsphk0yTfDYvNq5wmK7eTm+mMlYb1bEA1XfYGE0VdzQ2GFwYnZ11R1Wrrj6wb92/
 xh5x+pDuDJNW0BCJ8a86Xt7zD8k053GQOZdpFPV8Fh8hSUGI9G5cMnF4XtBqN0u+ZY+f
 REO+gJc2Be9ZgRCp2Nn7TDEQeoixk2+dnaV2e528XONAdMzUHi5jXqQHrgPcW/pJFTWt
 zhfkyvZJuIgJs6LJLoXx1pYY4aIeOKnAJmH+E3i2gzEXjVXhCSRel9I+KpHcktAHYSQL
 sKqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8fU14pyJFiC6E8BxTld5rzGLUIMD5XuIwfI2EzcG2wIMjuOYeEK1K3LLaWruuKlbXoeD0XxrAJ/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi9cRLwH3i/+2Ypnii9jnmT0TSf6JTuQ9IegarXd4WS+fDfA7w
 gZ0VCe90NMXegL+FjRMoaHIH9EuCZ6r+LzDTHhhR+36d7o1Wdo1dpwiq1EsVo3pcDseSxkiFA4P
 o4GwJ0TM5Npgi/KGvamfEZnzAGZFLjD6C9kyddQ==
X-Google-Smtp-Source: AGHT+IH5YCiYsZRowEZPmtFGdrbCCLKiOnoDuw8fJ58ZsrP+V7juvFxX6T6bpQgDnFc1GnkYDzMRc7XK1/rJE9iA3fs=
X-Received: by 2002:a05:690c:fc3:b0:63b:f919:2e89 with SMTP id
 00721157ae682-6e3477b9bbcmr12907577b3.2.1728629756126; Thu, 10 Oct 2024
 23:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
 <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
 <CABymUCO0u8hOLtie7typUQ3XV4AAds3RhT_hF23WB5Ruiz9AnQ@mail.gmail.com>
In-Reply-To: <CABymUCO0u8hOLtie7typUQ3XV4AAds3RhT_hF23WB5Ruiz9AnQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 09:55:44 +0300
Message-ID: <CAA8EJpoioJ1CzeO0mwbQYJWBK0f1RDv-XZ2J7tX0N-Auf5JG2w@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] drm/msm/dpu: Share SSPP info for multi-rect case
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

On Fri, 11 Oct 2024 at 09:54, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:21=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Oct 09, 2024 at 04:50:24PM GMT, Jun Nie wrote:
> > > Share SSPP info for multi-rect case if virtual plane is not enabled.
> > > Otherwise, the 2nd half of DMA content is not displayed due to sspp
> > > pointer of r_pipe is null.
> >
> > Fixes?
>
> Yeah. It is to fix bug in non virtual plane mode. Do you suggest to split
> to another patch set?

No, I suggest to add Fixes trailer and to move fixes to the top of the seri=
es.

> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> > > index 904ebec1c8a18..898fc2937954e 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -1042,6 +1042,11 @@ static int dpu_plane_atomic_check(struct drm_p=
lane *plane,
> > >               pipe->multirect_index =3D DPU_SSPP_RECT_0;
> > >               pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> > >
> > > +             /*
> > > +              * Signifies that r_pipe is to be used if the width of =
the 2nd
> > > +              * pipe is not 0. This does not apply to virtual plane =
case.
> > > +              */
> > > +             r_pipe->sspp =3D pipe->sspp;
> > >               r_pipe->multirect_index =3D DPU_SSPP_RECT_1;
> > >               r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> > >       }
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
