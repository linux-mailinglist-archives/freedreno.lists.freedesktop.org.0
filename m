Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9A696A3BC
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 18:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FAA10E5E6;
	Tue,  3 Sep 2024 16:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o/y1t0ko";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE6110E5E9
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 16:09:46 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53560b2b444so923916e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Sep 2024 09:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379784; x=1725984584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pA4+e6iz7B2aVNnWGkq9LpoEssVLpjsdYRVXZGTjr7Y=;
 b=o/y1t0koOIkhD0n07HH7DDViV7XRgfoDWQbT0VnoL/CfiitFSMtBJ/JV/j4sxxk+Ac
 Olo71509GVDwKSa2e8yGx3Tg/Bb4hX+qdY/wX3x24/pZ0h95rbntFCQ1y9yafwz9ex0t
 Y2zhzFKz0rq1A6LVk9XnK6h/sWQFqbBTaha7iA42lIpnDY6CiMzX9TbZ2h2s7O3c4hNc
 4w7PfQ/7AECFhkIIhrukO/iYHPl60s8qmQjU3NvgorSMHReFh3nyV7wXkRML/zsWb4Eb
 tOk/tJzMdRTsnf40pNSZl9K1Fc2gCsRQ8H1YdlsnFjawo8QtUInIajnmEePMY28pl6+9
 zIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379784; x=1725984584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pA4+e6iz7B2aVNnWGkq9LpoEssVLpjsdYRVXZGTjr7Y=;
 b=JIHAI26r/rzU6kfbPox3hE4a0iP1P5Pl+yNJHL461zjhsumSGEuMhKB6bf4Lb3YXsi
 eJ4jYW7Qyks6xJXoGc0DhKo2vhPemrfl7Af+P56yfFsR7xIpbGZsuKxA6XPF/0OKZurO
 uTnTQe/r9Z2rYLG6pkSfIUSCi4shgXcRcPiD6H30QNsZ3oukqn9tYL6NIci1HccIl9PF
 aL9y2bzN7uYx4v0RrYPsQ9l/qjNSVCLU33hkWkIBjOVfOGtUOpnfxU+Ks25tZUW+hesA
 he7Bm0Oc5RgQ1IURm3iDsS6p1sMqapO21jcH50iXCjgN67zBDFv9ooQrHL1XbT+nb9ND
 p8nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWFI2vH0G4Nu5T7urcI9x7HnI784/MQ1bxsBZMYZZtYE9WapgLI3z8bMzJAcsj68wyqQvN9XO8syY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5/2SbOfxAbgMCRxTvVONygcqU2BeglLcRi77qoDBndLeOhUvC
 rbAeiSX3qDeAnYOhmuIMuPXlLUwMF//iHzoXnfaKtf152sPNOzH8ITmrkKJHhWosBUMsB7MGsom
 uFVCnCRCohsI7oHO5En3EhlapEyMUAQv6y3p3IQ==
X-Google-Smtp-Source: AGHT+IGRHktsRm1HDEhsFIDzbmUbTSXuUPrZPQCHgHDmunk/OKRP5dnXPD28QHNSKkwKkLB34FVrCkcx7HSZCUjaQxg=
X-Received: by 2002:a05:6512:1045:b0:52c:dc56:ce62 with SMTP id
 2adb3069b0e04-5353ebafcbdmr5681695e87.12.1725379783701; Tue, 03 Sep 2024
 09:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
 <6kecwqe5npysc3rup5tkij5iepgk3pf5erattfv25caedixaml@6zev3sdwjjbu>
In-Reply-To: <6kecwqe5npysc3rup5tkij5iepgk3pf5erattfv25caedixaml@6zev3sdwjjbu>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 4 Sep 2024 00:09:29 +0800
Message-ID: <CABymUCM8zu1TY20kuEn7Dt9uDDC0hL9YAimWsTXnxDJeJFuiog@mail.gmail.com>
Subject: Re: [PATCH 03/21] drm/msm/dsi: pass the right width to dsc
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
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

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2024=E5=B9=B49=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=BA=8C 18:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2024-08-29 18:17:32, Jun Nie wrote:
> > Data width for dsc engine is aligned with pipe, not with whole screen
> > width. Because the width may be halved in DSI bonded case.
> >
> > The dsc width is not related to the timing with back front porch in
> > later stage, so update dsc timing earlier.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> I already sent a patch for this:
> https://lore.kernel.org/linux-arm-msm/20240417-drm-msm-initial-dualpipe-d=
sc-fixes-v1-2-78ae3ee9a697@somainline.org/
>
> And then came up with a better solution, outlined in:
> https://lore.kernel.org/linux-arm-msm/7fqwkryeumkt7zxsec6va7ys22nfs3tr4rr=
cz323extdz3f6zv@w4uu2lk4uh7v/
>
> Would you mind dropping this patch so that I can send a better solution?

Sure. I am happy with a better solution from you.
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index 7a4d9c071be5a..5abade8f26b88 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host *m=
sm_host, bool is_bonded_dsi)
> >                       return;
> >               }
> >
> > -             dsc->pic_width =3D mode->hdisplay;
> > +             dsc->pic_width =3D hdisplay;
>
> The other part of this already happened in patch 02/21?
>
> - Marijn
>
Patch 02/21 is just for parameter validation, not directly related to
this patch.

-Jun
