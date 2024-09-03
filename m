Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B82D96981C
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 11:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E8510E446;
	Tue,  3 Sep 2024 09:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mEqimGQP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC91310E44A
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 09:00:51 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6b47ff8a59aso45262417b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Sep 2024 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725354051; x=1725958851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzXI1qraFC32y8PSZHxs3qrZ1v3I2001PgDQyaVPFY8=;
 b=mEqimGQP78LK3RgGlpCVec9NOCdb6uyYNhtxge2flXsrWVSIIoo9pKP+eRgdnaIa1D
 RotIgDxa3TLbDKBX6+7YnFyTHZ7LldZVqLxMxrfaMtLyV/lwbsen3wFvlU9l2W6yVfTa
 9JemaN3uulFAYls36CZpF+u20SaamsrremKm6u7k1Y06R0Px+fUfBCAI03cLLBx1wz3d
 5OrS5WJCQGNjSz29bafpSAM89Oo8hWHQ/b2rDtmD3KNFlG1akcVwbdoPxyThJhM3Wk+i
 LNVl50drwd4nsBG+H4qaadIHrxD7NrP4p9X8nTKj8nz55NWZyiIXtNNPEl7zjRNIvNEV
 5KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725354051; x=1725958851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzXI1qraFC32y8PSZHxs3qrZ1v3I2001PgDQyaVPFY8=;
 b=LzqtyS3j0p7xMni4jcuF/mWANd1Vj52rzACj1/Mmsk2zEry+4XSYyk5wtHZcfH1A4+
 iNtbEbLBpaHDdLOgiGA9g0iXHfUdIJ2gHNyTfv32O6yTe5ptk49oH0J3ICcPlr207hZl
 zPTFpWEP3Aud4HYEL/9o2acbg6YUUAewaHgchZk9y9iJ36Nh+kTk2KzgtsqJpldI+n7f
 c6rkyRks3Z2XvZc5ysRVHQuTSyxJgaod4BEnlxstqc/G1cn15L5lA7cCgVtV4YAJah/4
 ld/gFmedw2RcPuvrgDUzRlaiapp2nD2RY4XZwJffKqcz5rOJq5y5hVzSs9Ov8HJfTJHJ
 okLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlFebM5msBsz7fxD5a8hJIIoa/anT7jqmyQ6hV+l0YfvOfwotNO8QedmATqf6zEL9dlfHU3dYj96k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+aZpBNRoPJp40xM6ttuSvdumBIREGv3zggarMF+11ol8Ns3vy
 Oe01IV3V/34VZihR0IIW0m66s0hm4GfngQvGdVcMzZqQRQpO723on8J9P1/amg7S6X2fwkb3Y5E
 HC3Ip8DUpPffa2G0Unqa3W2mMvDALI4d6V3VZMQ==
X-Google-Smtp-Source: AGHT+IEtqczCdvweUykaC6gAScFx3adGVghBsWc2cZOE9ORfMTjKVTP6UEs2Qza961LkgKnkP3BZH+Lmp9Oru9Wqm7w=
X-Received: by 2002:a05:690c:39c:b0:6b1:735c:a2fc with SMTP id
 00721157ae682-6d40fe14bcdmr140534407b3.27.1725354050728; Tue, 03 Sep 2024
 02:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
 <CAA8EJpp5TwzCZ6bpQQzzVBpEwhi28s-fX9wwOtrasCAGDBdykA@mail.gmail.com>
 <CABymUCOWXUMgA-x8z3DonANYnUqTyJYgoekXTxALK05ihE+tGA@mail.gmail.com>
In-Reply-To: <CABymUCOWXUMgA-x8z3DonANYnUqTyJYgoekXTxALK05ihE+tGA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 12:00:40 +0300
Message-ID: <CAA8EJppK=ngrNOXF8EbPubqWFAER6JqWp1z-GXYuL5hdAe_4mg@mail.gmail.com>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Support quad-pipe in SSPP checking
To: Jun Nie <jun.nie@linaro.org>
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

On Tue, 3 Sept 2024 at 10:53, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:38=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > @@ -1033,13 +1030,10 @@ static int dpu_plane_atomic_check(struct drm_=
plane *plane,
> > >                         return -E2BIG;
> > >                 }
> > >
> > > -               /*
> > > -                * Use multirect for wide plane. We do not support dy=
namic
> > > -                * assignment of SSPPs, so we know the configuration.
> > > -                */
> > >                 pipe->multirect_index =3D DPU_SSPP_RECT_0;
> > >                 pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> > >
> > > +               r_pipe->sspp =3D pipe->sspp;
> >
> > NAK
> >
> I do not understand what's your point here. If multi-rectangle mode is
> used, the 2 sw_pipe share a
> SSPP structure. Otherwise the right half of mixer pair does not work
> and no display on that side,
> because there is no SSPP to handle in r_pipe setup.

r_pipe->sspp is assigned dynamically and it signifies if r_pipe is to
be used or not. Also if the virtual planes are enabled, r_pipe->sspp
can differ from pipe->sspp.

--=20
With best wishes
Dmitry
