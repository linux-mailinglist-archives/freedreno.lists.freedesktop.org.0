Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EDB999D31
	for <lists+freedreno@lfdr.de>; Fri, 11 Oct 2024 08:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1591310EA45;
	Fri, 11 Oct 2024 06:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b/YVyCFX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C4410E2D9
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2024 06:54:01 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e290333a62cso1531587276.2
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728629640; x=1729234440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17oCjGzef/2UE8bCOde+fsQlgIs92oMXKbycZ1wrAZI=;
 b=b/YVyCFXLKJrGS9u0GJQjHKn1a9ST/V2vtdrGQ5YZ6/HzjuDloCnFzDUMkvHP/EIIn
 RIB5U5Ncb41NXnfHINB/BALUniukQgkNsQnPFSeW2QLLURfObjg2ywu1gCdAFHAhMAje
 cgFYLaN/p2/7Dfn87Li5OF2F1/qbR8b98aPPW9CfgFuzDaym/lTsqdb/qWciAkkOXfiX
 p02McF1H7SvwxbvcS+4vXbmOitP+wvvBwP3rkjCI6WfUyz6En7x2OvqQ9IWrzID3xGQn
 X+wiBpo1n6XBxYndNlUmMm9vhWQtWBdQYE/EK7XBkzjKO77COB6C1GC2Szt2qVWXxxTe
 x6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728629640; x=1729234440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17oCjGzef/2UE8bCOde+fsQlgIs92oMXKbycZ1wrAZI=;
 b=fDAa8WVrvQ5yTFj58me1cUOiDV8Py3IRra4TCkNZAIqnjmiSPzWRKTTR7zGM4iPRmU
 tm1xswIhuWEGwUqUWaJCl1vdD8kSu+o0/OqaRL76n10wp8AoFoA4ezugUjIwQVH6Ghhu
 pu7j/s3HJq1lMBJt1TNN+OpYDVqN0N6SzEYtu0LoNs2PG5iXz8G2grUiMLmfr7/tqX7r
 Qx3duqKEmAjDgioIlC2/qisrv5NlM17iZY5XiNYFewopS8bs/CJ1ebW/zvKeMN3WIPRS
 scQlESXycEWRpomlpGknHPGDAMWfWiCEbLTMIkCo31lIufV205BpgCNpL80m3I1m4QZj
 RwaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnvLwY4B2ewffFruRI04P3cJcMNcZoiPR7q2UROA6uyIW4XP5B7yzjAWn54uS+DQ5GdgjTDaZ1fgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQzoa0FLkHCVn2DQfrcj0H05HiRa16HswATDsvra9AMXeYxlHb
 oJcNSqfJhGug+5P+Mw27S1ID9JQ2f3NHRsD6hNr3h8o4MAAzV1hzinq8pSftMDUuVfqJxfo8RQK
 99hqziz+WSTu/mYwkzrKaG2GvNrSM83Oo7g1R7w==
X-Google-Smtp-Source: AGHT+IEcKrVhYkTlegrRYlks5vwNXkS8Zs44m1DY8Xw3QedwmulZZ7MGGC1XpVbTOaR1CUfuKx1qdvJf7YjcaChKFkY=
X-Received: by 2002:a05:6902:e06:b0:e28:e5e8:5e3d with SMTP id
 3f1490d57ef6-e2918e5e2dcmr1023240276.0.1728629640142; Thu, 10 Oct 2024
 23:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
 <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
In-Reply-To: <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 14:53:49 +0800
Message-ID: <CABymUCO0u8hOLtie7typUQ3XV4AAds3RhT_hF23WB5Ruiz9AnQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] drm/msm/dpu: Share SSPP info for multi-rect case
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
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:24PM GMT, Jun Nie wrote:
> > Share SSPP info for multi-rect case if virtual plane is not enabled.
> > Otherwise, the 2nd half of DMA content is not displayed due to sspp
> > pointer of r_pipe is null.
>
> Fixes?

Yeah. It is to fix bug in non virtual plane mode. Do you suggest to split
to another patch set?
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 904ebec1c8a18..898fc2937954e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1042,6 +1042,11 @@ static int dpu_plane_atomic_check(struct drm_pla=
ne *plane,
> >               pipe->multirect_index =3D DPU_SSPP_RECT_0;
> >               pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> >
> > +             /*
> > +              * Signifies that r_pipe is to be used if the width of th=
e 2nd
> > +              * pipe is not 0. This does not apply to virtual plane ca=
se.
> > +              */
> > +             r_pipe->sspp =3D pipe->sspp;
> >               r_pipe->multirect_index =3D DPU_SSPP_RECT_1;
> >               r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> >       }
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
