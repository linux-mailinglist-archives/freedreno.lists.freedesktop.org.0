Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2688911C5
	for <lists+freedreno@lfdr.de>; Fri, 29 Mar 2024 03:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493C110F8E8;
	Fri, 29 Mar 2024 02:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o5DZY/2L";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC9410F8E8
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 02:48:40 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d700beb6beso21007071fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Mar 2024 19:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711680456; x=1712285256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rSETHpMqQALVwCbYm94Jc+2S/pi/8MN4MsDFLYYekkU=;
 b=o5DZY/2LvXCfef2OALRoAI+oBfUxyuzid9hQEnqF989AbvQiX0KlnWSFd99m9iqSre
 nB+zGkFY84L76pEw/QCNxw7sUCz49a7TS0+hvyKkoahA75HiNfszNmS4TORC4BfJe/qr
 SEKA/ptWVY2gAHHJkLgBOJwZ7zH7cPGGiKdE2zGA1din7/udAMaPlCGL+cdvYA5OpRp4
 17edGeutvxDUO0zqewq35LkISO6TFmdgd9WbRLsOBja5pLVKMff1Zur3aUGzWheG9Fdb
 pSZ9j66nHJdqllhc9JPNBdf5pkK+A1XJ0a7u0qBdzJaM2p/82GTYSU9KM1EACHwnhlpi
 MKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711680456; x=1712285256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rSETHpMqQALVwCbYm94Jc+2S/pi/8MN4MsDFLYYekkU=;
 b=K7h3lUFFB6RVS/nFxAJvUC6BmgRgdkRy0soG4LNQintICUTsg0sbTbm5KAOp9tU48x
 z6nnJwJ8nvIP4hiBs0ylXe3o1/YGcdrp/AvMDnY7EH68OFXtanhOo71k1OyKk/jkv5Lo
 qJN+PshuWNpMLDAj/ILcHfciTvRikn13ZTqRyC/1epSJ05ndLNbdi6FOjn9viy9+BxI8
 C3rtGD6sJxzTLQpppQd/WQTWD4hMzOE6//Tg+YA+U4x8j3p5JyznaV8RCGxjRpSNRooC
 cDEiZ+pDnIHzeBYLSqJl9MSdRhveUg2kKYPTJPEIBCuO81mc++uxhrfq3dEWvwswGS88
 C00A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+uL6IbNjaB5VEIk3sur7sUz/T/SU1JRhw+jY2JaTiyWMzUojedTWlot1zx5XHG4l5TMcLRlRJ0rTywl6q70wqD1vIjoPV6WFzyAQUJ9vk
X-Gm-Message-State: AOJu0Yxs85rLsNBCtOJMEhrPFIRGE7LJygO2qoVfXZ/6uK2CKo6GaYvw
 kNi1gQQeyNuMwgJARsWZecXk9CEstiJaACOEY2wBJgRENmzPCQYHa8nwKElVh2ZO8p2TmecBHdL
 bFd+1GynwRCxyKe1VA88w2MkweECA6mtQQhR7Sg==
X-Google-Smtp-Source: AGHT+IGkPfHE2Cb4ujRPE2lteIEJE/6vhbAkZFZyGBXNMNjknZyJOjV3GSO913me8KPFw4nJCc4SYzvo3L5pLLRwgX4=
X-Received: by 2002:a2e:bc21:0:b0:2d6:a699:4bae with SMTP id
 b33-20020a2ebc21000000b002d6a6994baemr603365ljf.6.1711680455712; Thu, 28 Mar
 2024 19:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org>
 <CAA8EJpq7eHgryrNnnR=Yh46PdkAQA-YNzTz_0gaWbr_g9CWSxA@mail.gmail.com>
In-Reply-To: <CAA8EJpq7eHgryrNnnR=Yh46PdkAQA-YNzTz_0gaWbr_g9CWSxA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 29 Mar 2024 10:47:24 +0800
Message-ID: <CABymUCOdZO7K1F3FMR_KD5sgCUCSKreSYr3BWbNdYMO==+AErA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: fix DSC for DSI video mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 marijn.suijten@somainline.org, sean@poorly.run
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B43=E6=
=9C=8828=E6=97=A5=E5=91=A8=E5=9B=9B 23:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Fix DSC timing and control configurations in DPU for DSI video mode.
> > Only compression ratio 3:1 is handled and tested.
> >
> > This patch is modified from patchs of Jonathan Marek.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> This almost looks like a joke, except it isn't the 1st of April yet.
> The patch lacks proper Author / Sign-off tags from Jonathan.
> This is pretty close to copyright infringement. I'm sorry, but I'd
> have to ask you to abstain from sending patches w/o prior internal
> review.

Thanks for pointing me the previous version. I am not aware of it actually.
The only version I knew is from internal repo. It is my fault. I see the sl=
ides
says that Jonathan does not want to disturbed, so only his name is
mentioned in the commit message.

What's the patch set status? I do not see it in mainline yet. If it is
in pipeline,
I can just forget the DPU side change.

Thanks!
Jun

>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
> >  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 12 +++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 10 +++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
> >  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
> >  drivers/gpu/drm/msm/dsi/dsi_host.c            | 48 +++++++++++--------
> >  include/drm/display/drm_dsc.h                 |  4 ++
>
> Ok. The feedback for the original patchset [1]  was that it should be
> split logically. Instead you pile everything together into a single
> patch. This is a complete no-go.
>
> Also, this patchset lacks changelog in comparison to the previous
> patchseris. I don't think I'll continue the review of this patch.
> Please rework it properly and add corresponding changelog.
>
> [1] https://patchwork.freedesktop.org/patch/567518/?series=3D126430&rev=
=3D1
>
> >  8 files changed, 56 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 6a4b489d44e5..c1b9da06dde2 100644
>
> --
> With best wishes
> Dmitry
