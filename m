Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F189BC76
	for <lists+freedreno@lfdr.de>; Mon,  8 Apr 2024 11:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3DC1123BB;
	Mon,  8 Apr 2024 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X5PrIvnW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C4310F8A5
 for <freedreno@lists.freedesktop.org>; Mon,  8 Apr 2024 09:58:31 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d717603aa5so50717411fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Apr 2024 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712570309; x=1713175109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hOCibkj9n2YGDsJnfwHwezgEyxL9relr5LeEYsYkEw=;
 b=X5PrIvnWYqfRzkNak/7fWkWBdToC71Hq3Zz2ubCdtMIQf/EAdf0lZIUSI1hbFsxt45
 MnfSK9y5nZct4YfFzK7FmnO2yNMDDJ9+NqQlgZScYa8kgUanYPgCe1A7l0YfyO9Cpf+2
 igNBc9Ps1JLWx5JkaHFV6p39RaJYlGmGMDtXCLz7QsF3np3mlcIfg2SjrwEA8VyGV8Jp
 P4r+osIOfub6V1lVUzYjXhoDTGHe4Pue3VDT9LY+2TmoOY4DN8iwxn7L4CQoKi4fZYH9
 ppCQGpRR6u0JzqXSyXS5eM21i/wnl3zDMxZO1zox6dF89O4lrmzScI8vppuhqww3hD1c
 YX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712570309; x=1713175109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hOCibkj9n2YGDsJnfwHwezgEyxL9relr5LeEYsYkEw=;
 b=VV60zJG1oobzg2EkQYcsjX8sh6V0MOOVrLGbZhXfq9gE8kPrblFVCCqBuQj247G92L
 HZqhygbsStwwuWV5amVzgIsodxjNK/JLth4MUrZJ1ErTMDLNLjmyyIQmS60HaYpTPCNg
 qDdDlbv3V0l5s2W3v5o7Iq7PHj1BSX6KCxSt0Niw0K5DkDcCsImX8GsDRsYVjgM0bWWD
 4cQI5FAwYq9GUk0Dv6jg5pkRF/Uzq5pC5fEnE8hzDnPSNrzrlvmDQ66W/G31g9BFi6rC
 +Hp3f2FCbi5MLHSDIiP01DS5wk3i1nPBK/0SQmt7J4zUXRHcUs+7ZBWqEdPzyMSo3vz7
 A63w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEg4qu+YiJc6DyNhvQmY3WaTTZyZUDzU6w62EjR/xw/qdGcS6pcDtq8WU2bQEcPQnov1wP7NYiDEOe/wIkdoDbjJKv6+Z0K3hyc2Hy9bvg
X-Gm-Message-State: AOJu0Yx+Pi1eZdJsv5KZAtYUn7kNnXLM54LZmUciwgZK3E1joNI77kF4
 VkIZ/obP1G1C5/tM/m9frZzwSdDSvdLSPjuUTArkuVwkg69HAvMqt2YUwzNNnDXDaP16fPjNwsW
 oD4dNaeo4LyviLvyULCejODT1/IW6EeeRDscibQ==
X-Google-Smtp-Source: AGHT+IF5c4jsXWpkr+/3vLya5n3g4BNibhFwlejcq2PyVJvdHniMxg/DIX5Gp4G6Yhf4NEEvzMeFaVsCDgpIQ9cZjiw=
X-Received: by 2002:a2e:97d6:0:b0:2d8:274a:db16 with SMTP id
 m22-20020a2e97d6000000b002d8274adb16mr5817920ljj.17.1712570309500; Mon, 08
 Apr 2024 02:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
 <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
In-Reply-To: <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 8 Apr 2024 17:58:29 +0800
Message-ID: <CABymUCODHQ=bobQNhttY-RqLDjEGf75yAm2YD--ZnfXjAtzNMw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Add variable for slice number of a DSC compression bit stream packet.
> > Its value shall be specified in panel driver, or default value can be s=
et
> > in display controller driver if panel driver does not set it.
>
> This is not a part of the standard. Please justify it.

Right, I read the standard but did not find any details of packet descripti=
on.
Looks like msm silicon support tuning of number of slice packing per downst=
ream
code.
The slice_per_pkt can be set in the downstream msm device tree. And I test =
the
values 1 and 2 on vtdr6130 panel and both work. So I guess this is related =
to
performance or something like that. I will have more test with different pa=
nel
to check the impact.
drivers/gpu/drm/panel/panel-raydium-rm692e5.c also mentions to pass new val=
ue
to slice_per_pkt.

Hi Konrad,
Do you remember why value 2 is TODO for slice_per_pkt for panel rm692e5?

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  include/drm/display/drm_dsc.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_ds=
c.h
> > index bc90273d06a6..4fac0a2746ae 100644
> > --- a/include/drm/display/drm_dsc.h
> > +++ b/include/drm/display/drm_dsc.h
> > @@ -82,6 +82,10 @@ struct drm_dsc_config {
> >          * @bits_per_component: Bits per component to code (8/10/12)
> >          */
> >         u8 bits_per_component;
> > +       /**
> > +        * @slice_per_pkt: slice number per DSC bit stream packet
> > +        */
> > +       u8 slice_per_pkt;
> >         /**
> >          * @convert_rgb:
> >          * Flag to indicate if RGB - YCoCg conversion is needed
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
