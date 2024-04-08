Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FC889BC26
	for <lists+freedreno@lfdr.de>; Mon,  8 Apr 2024 11:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC3D112375;
	Mon,  8 Apr 2024 09:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jz4Yb9hL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1363411238C
 for <freedreno@lists.freedesktop.org>; Mon,  8 Apr 2024 09:43:45 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so44390101fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Apr 2024 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712569424; x=1713174224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cPya01S6Zk3ZrZqtvKApfiBgMxDUZyecK666tWaDBy8=;
 b=Jz4Yb9hLRzTmUsAjarfVd1LZIIGqseURXBYkU9MV7c3ilPyAopR2FGPLKPBekQ5GCC
 3dJrFrKZ/teg4I91mgLCdpOFWQ9BZg4nQl5ke7u1QNIlVZOfgTA3tR3K4b2AjwHH+xtb
 vi24lR09KJj7prJRJWf3ZdAOAaUUWfZzXRLxur82ehSa3jTR6MfUYWMF1lCxaekIcG0G
 vz5W83O1j2X5g+TIxOSnWBcGK2gmRMq8HKgh4i/ntsp0wGv4lDjlBdLZcJFoYdEnBV3I
 GXf9h8Cs8cgjs2mxZuNw2lqT6MV8MZAipfz3rOpUakloj1ooy5dV5it9EjHEilqUmqQE
 D6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712569424; x=1713174224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPya01S6Zk3ZrZqtvKApfiBgMxDUZyecK666tWaDBy8=;
 b=RgwKxauRsHp5P2LH1+TBBWvUxT5Q+ktr/5PLRT1QW0KUXlhJa109ALN/u4YEKB/e9s
 UFNnz/ddhOI/L/LDwhG7JR4bQiPhMnAyvKkyXeD1ZpEo1ATnY+SJLOSD0UNHWdHWSn0q
 j/hjMw7NEHyHhNXe8uECeldWcCih6qGVP3AZVo6rEYYNmZqFMwZr5WKYKO7rsbHxwkzo
 U6BPH5sU8yjTMMFr2JsI56cRrYggUQdl5zR1JFEtbCAX001c0tZvcRuZDPozfhLH/X53
 AcAKItZdBeNcEpAQXwyS1n9FP66LwX4F6l2f0+RM07AspZEL42gsR37khrIWptO65kC1
 J3Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQbgMqR7cRGexH4QfFKSYVlP5SOWz48jIYZfK600rpp0F9cK0xzf6qIJY1QfKBX2VV9QLp6vIfUfOw5RMwAnRFiEl/DkzKojaHdBaLLSa5
X-Gm-Message-State: AOJu0YwiDOw4Kpa5I0R/wuaJb4A675EOU59OMw39RomCg0FTavsl/Nih
 PWWVjz44p5SSLDmVFgtIIRrKtalImj+bu0JEkAKzzTt0HiyucWX+AK9vCgpUmT5kxrmkcGD5Dsq
 XZ+rs91UjfH/yqlsW1ltZ9kUVNzA8iDfh59kAyQ==
X-Google-Smtp-Source: AGHT+IG02loiXTH2/8F9IqgC2gGyD1D1+rLbDNMI3wgXR6zMfH2ZR1scOgp/QJMJ+mhu/mYbcsEBISkQp7KwOmIrIAM=
X-Received: by 2002:a2e:90d6:0:b0:2d8:729f:cf3a with SMTP id
 o22-20020a2e90d6000000b002d8729fcf3amr4666714ljg.32.1712569423895; Mon, 08
 Apr 2024 02:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-2-db5036443545@linaro.org>
 <CAA8EJpo-tZSOD+B+4znyBmFPVOjc6yocsVwYMXPN5d3WQfbr=Q@mail.gmail.com>
In-Reply-To: <CAA8EJpo-tZSOD+B+4znyBmFPVOjc6yocsVwYMXPN5d3WQfbr=Q@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 8 Apr 2024 17:43:43 +0800
Message-ID: <CABymUCOFxHLE5QTiW4cVuSgmOhH5ZJd=G0VPZkHzQR==tew8gA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm/dsi: set video mode widebus enable bit
 when widebus is enabled
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 18:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> > driver is doing in video mode. Fix that by actually enabling widebus fo=
r
> > video mode.
> >
> > Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> You have ignored all the review comments that were provided for v1.
> None of the tags were picked up either.
Just find that It was an accident that I cherry-picked wrong patch.
>
> Have you posted this for internal review like I have explicitly asked you=
?
Sorry, I guess I skipped your word in depression when I read the email.
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/ds=
i/dsi.xml.h
> > index 2a7d980e12c3..f0b3cdc020a1 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > @@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(en=
um dsi_traffic_mode val)
> >  #define DSI_VID_CFG0_HSA_POWER_STOP                            0x00010=
000
> >  #define DSI_VID_CFG0_HBP_POWER_STOP                            0x00100=
000
> >  #define DSI_VID_CFG0_HFP_POWER_STOP                            0x01000=
000
> > +#define DSI_VID_CFG0_DATABUS_WIDEN                             0x02000=
000
> >  #define DSI_VID_CFG0_PULSE_MODE_HSA_HE                         0x10000=
000
>
> From the top of the file:
>
> /* Autogenerated file, DO NOT EDIT manually!
This is my fault, I did not notice the top of this file totally. Will
fix it in next version.

>
> >
> >  #define REG_DSI_VID_CFG1                                       0x00000=
01c
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index 9d86a6aca6f2..2a0422cad6de 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -754,6 +754,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *ms=
m_host,
> >                 data |=3D DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mod=
e(flags));
> >                 data |=3D DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_=
fmt));
> >                 data |=3D DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
> > +               if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
> > +                       data |=3D DSI_VID_CFG0_DATABUS_WIDEN;
> >                 dsi_write(msm_host, REG_DSI_VID_CFG0, data);
> >
> >                 /* Do not swap RGB colors */
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
