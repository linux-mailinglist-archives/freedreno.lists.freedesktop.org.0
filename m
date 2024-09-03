Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91443969888
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 11:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126D410E44C;
	Tue,  3 Sep 2024 09:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uM8SNbmB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02AB10E44C
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 09:17:19 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6d6891012d5so18547967b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Sep 2024 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725355039; x=1725959839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHxPh6R8OUIMs2u3yUx/BuQ1WH7I4Ubp5ptPzIFLou8=;
 b=uM8SNbmBSN0oc9YRgwK/jUx3hUwC3wAzbi0EFy8nb+74DtByxOmubqR1WRbrTkW3zz
 wLGP2XhZFMHqqFFZPfIWRFXIpQugYXXQ099xbPvQmPaE4rM/x6s+YcbMbMTa6dKckVOU
 QBbOO13lm4zwqHNbrxpXE2A7+r8DgqkysQhWdgOcryJWGRgMLS5fWeA+pwCv68cPsz+5
 m45HLfTYUrFZ+9y3Hk8uPlLo7dx0420G7T/KNJPFqpL5EaZMOCXJMccRx69kzkZgFLAG
 U6Pbr99SC+FL7B/DrdMf+opciIZG9J/9JbyOnrKufBKxEbz3Y1xDRe2q0G+D9na7a3vq
 YmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725355039; x=1725959839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHxPh6R8OUIMs2u3yUx/BuQ1WH7I4Ubp5ptPzIFLou8=;
 b=wR0CdBq5VdBcTDgmpPUOYnh+Uypz4Nh7rTiHatV74u/C2JXF4hYMIhYf3o8x+bVHya
 G8KJFndtXnI3I908rUmDshuIkGsJ7IYaa1e402m7KUno1JF3wZGVHB7Wn0nydKaEjaeK
 zpJKkqVeHOwKHU67/uXkIxImd3p0KQrO+tgjV58inKHqwWb1ph7T9/PahoJaagY4aDQU
 FcwzVIDy6YCuZRWFHt4wCRujvdHuAmz70nF0piVIYL+YjmtD5yxJfN4VS6lDztjM/pOw
 z19dquth3w4Mg5ags/CDgSAbcfntU+RGhT515/lJBHiMICJsMe168RXHhai2AQls0Q2C
 4vag==
X-Forwarded-Encrypted: i=1;
 AJvYcCV25jKRd05y0j1q9/rFx4g8ePlvhidAZML7N3ge5ccJPqDC8+mXbtPH2vIEKcRJD2uk0soikUTc410=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbDshMNfVQdaarVd3jKBi8EPXgULfXVrLbdhPqFj4eLuvs9vlp
 IKudHPe354QWQdqBaLrDb3oZYj4sNWVpP9fWB6DnsM6c7woL+7Rb0/YU/Lv55CWS4lVV83bDdd6
 K47Zb8pdduB8z0jWLFUrwS3bqAGLLQl8SSHP09g==
X-Google-Smtp-Source: AGHT+IG81YDgPBRq6/EYuW4vKT6fy1SFqxRv2KyQLs6HLXZ1o9IbzXMNe+6OWbwaOtbCurnbVfpd3OtZMgL5A8LguhM=
X-Received: by 2002:a05:690c:81:b0:6b0:d9bc:5a29 with SMTP id
 00721157ae682-6d40f62dcf0mr167802017b3.32.1725355038732; Tue, 03 Sep 2024
 02:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
 <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
 <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
In-Reply-To: <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 12:17:07 +0300
Message-ID: <CAA8EJppZvWH1y-WeNW+9zSonoR7vem7N7q0o94ZymiZfvvUfJQ@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
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

On Tue, 3 Sept 2024 at 11:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:35=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > Add support to DSI CTRL v2.8.0 with priority support
> >
> > Proper description is missing
>
> Actually, there is no clear doc for this register. Any URL or
> doc key word to search?

Do you have a corresponding change in the vendor driver? If not, where
does this come from? What does it fix? What doesn't work if the
register isn't programmed? Answers to such questions should be a part
of the commit message.

> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >
> > Several tags are missing here.
>
> Co-develop and SoB tag, right?

yep

> >
> > Also, how is this patch related to quadpipe?
>
> It is a must per test. Maybe it is just related to dual-DSI.
> We can have answer if 2:2:2 is enabled.

Tests are a separate story. You can send a separate series and mention
it in the cover letter. However this is not a part of the quad-pipe
support per se.

--=20
With best wishes
Dmitry
