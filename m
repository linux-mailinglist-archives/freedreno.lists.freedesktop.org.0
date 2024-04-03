Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF68A897344
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 17:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A1E112BAF;
	Wed,  3 Apr 2024 15:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vcqGVuX1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7EB112BB2
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 15:00:48 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcc6fc978ddso970486276.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712156448; x=1712761248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzSRFLsznPK3uNgAw548RIHGK9k926CGGelW0csLXJA=;
 b=vcqGVuX1Ei/iOa88WHxys3C4KkUnlHbzlqOfNC2LgRLKJjDTnmLn5faEzu84rLDKRB
 kl5fbR47vORdYLZtsoA9QzNTqavlsYl8Nl+ydlRs9i1CMzDqtPrDc2D5rDXJeQEJA3A1
 scT7pgTU79bkgwlLVtGteQDzIF0c1e07tng42DWaJl41MgA69n4zg3HHukuj3NN3k2fB
 N1p79+bjuP3nJzvfkcNVBSqMe/u7w0HQ7YT6V2VX7FvfEU7KsRk3f5fM+nTIJWaFNK20
 tbCXv4hrylFdQwRX6iiovODnDaSll5PP5IiXhsTG6RMmvMNdB8zgaRKk0Ro0OJ4t+1dY
 h8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712156448; x=1712761248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzSRFLsznPK3uNgAw548RIHGK9k926CGGelW0csLXJA=;
 b=wc7Ya2OO77SWqU7BB19l2YZjjCxDTZTcZxW7OOACbi8ovekFVd53Gnri+WdKAU0bE+
 KvsCZMS7qVMzxPakhERW1qQW8p2j3aIM+XV+/veqAddbe10lev3dHJnbscZyRiYg1roI
 NTm9MReey5Z1IZBeaRLmgh2YlRBz7hCTf7Hd59gkfWA8F9sub0xczAV+Baw2HnnCxyk/
 /DKAois1udIasJQ8s1G1+IWpmAByMxjH4Rdm1OJgqajWVmuKsz8s45S8TTR8MWNi9jvN
 nmuV28RdskcjSLpFQ3VvLkgrp7/HAuvEgezejUcWnNnJMTrkAlaVqJo2di9WXEx1labi
 pg9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGgJyGH41V04/t2XINPYRqaDcVLLTeQ6iM/wpZEC4pAfPmYV4Colaf4dBkvnOXnsk+TiivaYcxRErVo6XWVvjKI9Ews7yNZScu6VvJ5d8E
X-Gm-Message-State: AOJu0YzKOPCNNqMY0sduJnNIITZl56O9zIBrciIRATW8pxazooPWucLx
 mAbXszioc2k0tcF+8TRUc8F+IfLUR15yD21jFNEHrxkKWXezH5N2ZNiyB7KDOHS/txyexcR+fKI
 62OzjEyF5FYc2NkxF90amE0DGsz8GK6j/8OlFsw==
X-Google-Smtp-Source: AGHT+IFMWq+bKOySlKpu/7NA/TV8AEAmhob3YdjdiXNZxuBQ1lQvwLaAC8inv18M4l6Ln7Ef9PWW8gox3RQR0bQVUro=
X-Received: by 2002:a25:8692:0:b0:dc6:d102:a0bb with SMTP id
 z18-20020a258692000000b00dc6d102a0bbmr1904903ybk.24.1712156448065; Wed, 03
 Apr 2024 08:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
 <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com>
 <CABymUCNNhFTQZ6NSOL8SmLzCSOktvR_Sj0s2TSmqa0_56CSvDg@mail.gmail.com>
In-Reply-To: <CABymUCNNhFTQZ6NSOL8SmLzCSOktvR_Sj0s2TSmqa0_56CSvDg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 18:00:36 +0300
Message-ID: <CAA8EJpo_TXTsuK6XsLx_3aFTXHjoe6FRRqOjcN6zd-FdAXZQAg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

On Wed, 3 Apr 2024 at 17:44, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:57=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > Add necessary DPU timing and control changes for DSC to work with DSI
> > > video mode.
> > >
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
> > >  2 files changed, 17 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/d=
rivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > index d9e7dbf0499c..c7b009a60b63 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > @@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
> > >                 timing->h_front_porch =3D timing->h_front_porch >> 1;
> > >                 timing->hsync_pulse_width =3D timing->hsync_pulse_wid=
th >> 1;
> > >         }
> > > +
> > > +       /*
> > > +        * for DSI, if compression is enabled, then divide the horizo=
nal active
> > > +        * timing parameters by compression ratio.
> > > +        */
> > > +       if (phys_enc->hw_intf->cap->type !=3D INTF_DP && timing->comp=
ression_en) {
> > > +               timing->width =3D timing->width / 3; /* XXX: don't as=
sume 3:1 compression ratio */
> > > +               timing->xres =3D timing->width;
> > > +       }
> > >  }
> > >
> > >  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_para=
ms *timing)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > index 965692ef7892..079efb48db05 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > @@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(stru=
ct dpu_hw_intf *ctx,
> > >                 intf_cfg2 |=3D INTF_CFG2_DATABUS_WIDEN;
> > >
> > >         data_width =3D p->width;
> > > +       if (p->wide_bus_en && !dp_intf)
> > > +               data_width =3D p->width >> 1;
> >
> > How is wide_bus relevant to the DSC case?
> > Is there a need for the Fixes tag?
>
> 48bit bus width should be used when DSC is enabled. Without the
> widebus configuration,
> a lot dsi error happens as below in DSC case.
> [  206.275992] dsi_err_worker: status=3D4

Still, separate patch please.

>
> For the Fixes tag, the previous patch mentioned to enable the widebus
> mode for any DSC case. So it is fair to add the tag.

Yes, please.

> >
> > > +
> > > +       if (p->compression_en)
> > > +               intf_cfg2 |=3D INTF_CFG2_DCE_DATA_COMPRESS;
> > > +
> > > +       if (p->compression_en && dp_intf)
> > > +               DPU_ERROR("missing adjustments for DSC+DP\n");
> > >
> > >         hsync_data_start_x =3D hsync_start_x;
> > >         hsync_data_end_x =3D  hsync_start_x + data_width - 1;
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
