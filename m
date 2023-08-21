Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CC7782BD6
	for <lists+freedreno@lfdr.de>; Mon, 21 Aug 2023 16:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED9910E27C;
	Mon, 21 Aug 2023 14:30:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1610E27A
 for <freedreno@lists.freedesktop.org>; Mon, 21 Aug 2023 14:30:46 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-58fba83feb0so21922147b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 21 Aug 2023 07:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692628245; x=1693233045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nLZAfwWae+l7KovvQb+xvjIIf9zbIN7GukHDovbcWdU=;
 b=wkhk4IBHW4nyUq9sDk45zUvDNZ2LgmkjW/6P7OlrngQasHMDRd2pNfaZfztdGLUAUG
 ZzURPCJwzrY/GwrBV0HdGK0d1t+PyWJ517+SnEObWUef60OO6CFVlurjW2opXCVIZ3ww
 o0/Ec+tUMqj+8lKMwwEDtQs9RcDI7vTYOkThkTIs2ViDamUoLgwf7LjjaRm6rLOdbo1+
 BULkM8FLEPPMi9IoBE+OqIYohKQ8z5BveWxt1KkRTb5mmDAmQsshAgf8RNDNmGPweegb
 GU6uBF29clTmjwCnquHPUuEt04Cr6vB92FLA4MWzKVZoZvfYidLFHqIt+nNCNpOLJmLz
 s9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692628245; x=1693233045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLZAfwWae+l7KovvQb+xvjIIf9zbIN7GukHDovbcWdU=;
 b=He+frYRazL5KhUxQCEN+P1vrj+zwODxl45zT4A292i3hw5r29euI+p+T1xIWx9x/q0
 55dcuAj/amYL/pFQJQbVchpmBNak4t5P3Fq5nN1WIwn0hYCHKy00KI0Dug6gx5cD5grT
 9Pjqh+bUxlU/nDzukuEHf38G82FYMrYNQqMHFwyLuHYJvrk0ZNri+pgbz/0VDQws9ztO
 QHv++xEuL+qEEi9KzxprpTgu7iZ5bu5nRIKqmbl0C7VD2wvjH2nAF7sfhrBEAVJ6cvsD
 Yb4caTYTIqWrolWkwZpbe6aCWynEy1qsfriP0dOjJ8qt+i/hlsAkc+ZTrdPeJs2xlDuC
 BX6g==
X-Gm-Message-State: AOJu0Yw6K0GE7GIuwp/PTzKq5zEfV2NuzEE0P1L/bo0wdIG4/pSUvGie
 vco6I8Nsk73ue6k2G2MgJMV1X3AHPCR5Yra9zr69Gg==
X-Google-Smtp-Source: AGHT+IEtI7kyvzHlCjmS2t5LAWH1HO1EYTttLTmUAkp9ChovA1koUFNUJoeIE4gvFDjLiS2vuBccKf4ylGjPcMOM6ZA=
X-Received: by 2002:a25:ae08:0:b0:d09:d53:ce41 with SMTP id
 a8-20020a25ae08000000b00d090d53ce41mr6390313ybj.55.1692628232389; Mon, 21 Aug
 2023 07:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
 <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
 <CA+hFU4y38MTTUsbri1jy=n4Vyp7xx2CosD9Nmk97z_au6NHCdQ@mail.gmail.com>
 <CAA8EJpoFpUcQL_7pb0toDoLFsK=9GdBLQH+h_MMffrp9k7eCyw@mail.gmail.com>
 <20230818135133.3fdeddba@eldfell>
 <c4b7e9eb-fb5d-4b2f-8358-f41598d7d983@linaro.org>
 <20230818165500.50360195@eldfell>
In-Reply-To: <20230818165500.50360195@eldfell>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Aug 2023 17:30:21 +0300
Message-ID: <CAA8EJpqigb8OJ-u7W9VeZtXp5rhXyU30_5wALeUDsf+rhe-kEA@mail.gmail.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH RFC v5 02/10] drm: Introduce solid fill DRM
 plane property
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sebastian Wick <sebastian.wick@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, laurent.pinchart@ideasonboard.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, contact@emersion.fr,
 David Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 18 Aug 2023 at 16:55, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri, 18 Aug 2023 14:03:14 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On 18/08/2023 13:51, Pekka Paalanen wrote:
> > > On Fri, 4 Aug 2023 16:59:00 +0300
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > >
> > >> On Fri, 4 Aug 2023 at 16:44, Sebastian Wick <sebastian.wick@redhat.c=
om> wrote:
> > >>>
> > >>> On Fri, Aug 4, 2023 at 3:27=E2=80=AFPM Dmitry Baryshkov
> > >>> <dmitry.baryshkov@linaro.org> wrote:
> > >>>>
> > >>>> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc=
.com> wrote:
> > >>>>>
> > >>>>> Document and add support for solid_fill property to drm_plane. In
> > >>>>> addition, add support for setting and getting the values for soli=
d_fill.
> > >>>>>
> > >>>>> To enable solid fill planes, userspace must assign a property blo=
b to
> > >>>>> the "solid_fill" plane property containing the following informat=
ion:
> > >>>>>
> > >>>>> struct drm_mode_solid_fill {
> > >>>>>          u32 version;
> > >>>>>          u32 r, g, b;
> > >>>>> };
> > >>>>>
> > >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > >>>>> ---
> > >>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
> > >>>>>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 ++++++++++++++++=
+++++++++++++++
> > >>>>>   drivers/gpu/drm/drm_blend.c               | 30 ++++++++++++++++=
+
> > >>>>>   include/drm/drm_blend.h                   |  1 +
> > >>>>>   include/drm/drm_plane.h                   | 35 ++++++++++++++++=
++++
> > >>>>>   include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
> > >>>>>   6 files changed, 154 insertions(+)
> > >>>>>
> > >>>>
> > >>>> [skipped most of the patch]
>
> ...
>
> > >>> Maybe another COLOR_FILL enum value
> > >>> with alpha might be better? Maybe just doing the alpha via the alph=
a
> > >>> property is good enough.
> > >>
> > >> One of our customers has a use case for setting the opaque solid fil=
l,
> > >> while keeping the plane's alpha intact.
> > >
> > > Could you explain more about why they must keep plane alpha intact
> > > instead of reprogramming everything with atomic? Is there some
> > > combination that just cannot reach the same end result via userspace
> > > manipulation of the solid fill values with plane alpha?
> > >
> > > Or is it a matter of userspace architecture where you have independen=
t
> > > components responsible for different KMS property values?
>
> > The latter one. The goal is to be able to switch between pixel sources
> > without touching any additional properties (including plane's alpha val=
ue).
>
> Sorry, but that does not seem like a good justification for KMS UAPI
> design.
>
> It is even in conflict with how atomic KMS UAPI was designed to work:
> collect all your changes into a single commit, and push it at once.
> Here we are talking about separate components changing the different
> properties of the same KMS plane even. If you want to change both plane
> opacity and contents, does it mean you need two refresh cycles, one at
> a time? Could the two components be even racing with each other,
> stalling each other randomly?

Most likely I was not verbose enough.

We want to setup the blending scene, including the FB and the solid
fill properties for the plane. FB is set up in the RGBA format, each
pixel having its own alpha value in addition to the plane's alpha
value. Then under certain circumstances, the plane gets hidden by the
solid fill (think of a curtain). We do not want to touch the global
scene setup (including plane alpha value), just switch the curtain on
and off.
I think this plays good enough with the defined plane blending rules,
where one can use pre-multiplied blending mode or use coverage
blending mode.



--
With best wishes
Dmitry
