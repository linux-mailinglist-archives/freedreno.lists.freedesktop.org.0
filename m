Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFA18FBF58
	for <lists+freedreno@lfdr.de>; Wed,  5 Jun 2024 00:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A1F10E61C;
	Tue,  4 Jun 2024 22:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="etN/bq0a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971D910E61C
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 22:55:06 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-6cb6b9ada16so2360283a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 15:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717541705; x=1718146505; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SQevM+iAWilYVFaIm59IJ4p3nypKMOp+UN8VS5oKnP0=;
 b=etN/bq0alduXPerbyLjUD3XI6icFjI+YxVsgeKEb+yDWr7COCUqN2L7pQ6gR9uBNNT
 +vQEFvES9+vJjIRwI9OklxrDZJ9fupVxTo44eivg5IZpDXKWPqzm3uGY6/6Bl7ll6npd
 k6TnYu+PT8AgQfwNm3OjAPjtQKBpK6dvvcdOTVY0fItUgdWzGkGSuBdk1r4sJeONyWbe
 TAAHD8J5R6Z+bxve0t+r/LRiiC44Ss7+qpKINbwL14IlAcb1777Gi3USWp5cCNkt6Rul
 Lcf5vDKn2LHyTPE+CGGBmVbL9BeGjir11qVBrC5NdUU8Jo44rV/JaSYVTWNdl2pjLRGo
 CKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717541705; x=1718146505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SQevM+iAWilYVFaIm59IJ4p3nypKMOp+UN8VS5oKnP0=;
 b=kBsJAXCam/KtoEpvlkS+piSsAcHS0PyRO9Vy8RNOaFu/k9T2IRxl0fvbJULAQDsyTl
 I0qsfRJnSzb4SLyzlYiOOM1PySdJQwfu2cxtPjFpum4Fhr0bn7y9ylgzqQYvX9T6khCE
 ny6Db7vg2nn05UJMZxUOFeh9MHmE3DOrh2iBGAekUOvJI34ncCHrays6O0/Uhgs1BWad
 tqPEOqKi7b+S3hqhxqPbNKeNCuB6nHXZAaC0XUK9qwTUyvH2oaZ4csc2+GPd2qP1xdoI
 O6h/bax/WaJwUXYJ7x0VhYaC+BLRB3mGkl+EqRYaw4KpM8QbB9CJCf3oIETlKm10dpqQ
 vpFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdAGF6jB9ZNrIM0/60OIiRDZDt/9UzhtPXkdvCPwQVAe/OnoViE4TszkvEUGuziZN+rhLAdg0oUMw07Hex9+D55epE6LDpdiJ4yt4jR9lE
X-Gm-Message-State: AOJu0YxKlTDauE6zAsHR/sf6G7JWcedWWv4JkQOoehYOYPmfnTUBZTuo
 60qk1V0CaUGx+E/jyKMUoc5UbIJY35vW/WYD+Mo9DohaVooMlfu9JLjA3rOG2f7UjzDhQColLxA
 TzcUEv1iPi4K9bl45nVOx1sfo2OwhNeeRmdz4QQ==
X-Google-Smtp-Source: AGHT+IEdxJwvadlhULTZyWilBXhj3SiFyCHIB/1Em0OwEwBh1H9runBVla3t1ChZKYRpSeG0b/daRqpR7likHUus/TA=
X-Received: by 2002:a17:90a:408f:b0:2bd:f439:546b with SMTP id
 98e67ed59e1d1-2c27db0f54amr812983a91.19.1717541705422; Tue, 04 Jun 2024
 15:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240604214018.238153-1-pbrobinson@gmail.com>
 <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
 <CALeDE9O9QmX2YUvMxbfVNcC+nmNNh2dgQkLvMqNaQNr+3S9Beg@mail.gmail.com>
In-Reply-To: <CALeDE9O9QmX2YUvMxbfVNcC+nmNNh2dgQkLvMqNaQNr+3S9Beg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jun 2024 01:54:52 +0300
Message-ID: <CAA8EJpomhPJ9o-tWKRmuCzbZDn7CA4qkYMFWYs9qaGWOczq=sg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 5 Jun 2024 at 01:30, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> On Tue, 4 Jun 2024 at 23:18, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 5 Jun 2024 at 00:40, Peter Robinson <pbrobinson@gmail.com> wrote:
> > >
> > > Add missing MODULE_FIRMWARE for firmware in linux-firmware,
> > > this is needed for automatically adding firmware to things
> > > like initrds when the drivers are built as modules. This is
> > > useful for devices like the X13s and the RBx devices on
> > > general distros.
> > >
> > > Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
> > > Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
> > > Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
> > > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > index c3703a51287b4..fede5159e7f5b 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
> > >  MODULE_FIRMWARE("qcom/a650_sqe.fw");
> > >  MODULE_FIRMWARE("qcom/a660_gmu.bin");
> > >  MODULE_FIRMWARE("qcom/a660_sqe.fw");
> > > +MODULE_FIRMWARE("qcom/a660_zap.mbn");
> >
> > -ENOSUCHFILE. It should qcom/particular-SoC/a660_zap.mbn
>
> > > +MODULE_FIRMWARE("qcom/a702_sqe.fw");
> > >  MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> > >  MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> > > +MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");
> >
> > I'm a bit sceptical here. Each device has its own zap MBN file (this
> > one is also a fancy named a690_zap.mbn).  Do we want to list all such
> > files? Consider all the vendors, which are open-source / Linux
> > friendly, like FairPhone, OnePlus, etc.
>
> That's what's in linux-firmware, I would have thought they would be
> SoC specific as opposed to device specific, but that's not what we
> currently have, are we supposed to have devices that selectively work
> based on what firmware they have?

The firmware is signed with the manufacturer's key. End-user devices
verify the signature while loading the firmware and decline firmware
without vendor's signature.

>
> > >  MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> > >  MODULE_FIRMWARE("qcom/yamato_pm4.fw");



-- 
With best wishes
Dmitry
