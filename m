Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B6B8AB88F
	for <lists+freedreno@lfdr.de>; Sat, 20 Apr 2024 03:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3932310E7C4;
	Sat, 20 Apr 2024 01:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rmgR1jAW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A451110E7C4
 for <freedreno@lists.freedesktop.org>; Sat, 20 Apr 2024 01:56:38 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516ef30b16eso3231828e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 19 Apr 2024 18:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713578197; x=1714182997; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sndLC/Sigbquk9j+pRCsPCc5+gdDBnQ4XzPelw3qRPA=;
 b=rmgR1jAWzuZwTuZ0d6jm+yRhEdYZnlueO5hcf2CLVN0IZZvdXKGgN4wiOpJd5int/c
 754drcBq2TRGt4BGTJK60h12ob0/vipm+34T5hLd+Zo3Egn0k4pdIunD2GNKuSEw7Anu
 JNywnOtuwfW0rDdjIORzwCcDHf0B+FcFLQYnXtlMMQhxtaT3tRn+EiJCNl0ApHUV6Xy3
 nu3DhyDzBLaq1zjBekdEV94M+MzbQJUQYrI0h4XBeUGUPFXTeyX1qcdSoc7QPw+1QaTn
 59NpptUQ9ePaq9n8qa4MLHZLfxytPiNaZsyzVZ3qrhPlc/hwX8N3rmpCtQm6gJ97nUNc
 zO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713578197; x=1714182997;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sndLC/Sigbquk9j+pRCsPCc5+gdDBnQ4XzPelw3qRPA=;
 b=hnjylT/mnlH/+GSZyQTyZNJqfs311sxxx3q5rG0ttIfiXEeduQ+I5y+Y4vBD18c0c+
 f7mgAyS8332m8JSpf27sGM/GYXljRIuOmzAO25n+r9439bAtlwL/DwYtWtbBSSTWVSu3
 bfYyKBiY4HLqJ+sCa3kgKi48Lh+gGUHQ7YMHU1cfHv7m2b21Kelr4WdncI0aqG4Q9p8L
 19ClXfj8ORwBVx3M6CtXlR+7JU3k+AeWqsl9wdkGd8kvOJcAgwkgaKK32iexGKbvf6V8
 GM+4gL/2Oapossor1W/LC+p+jC534anSw4Nxya/kKUyGfEx5Zawdv3rEZ0J3Cptmx//u
 DRAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPi8s4xiLulCexIB+vTwcrXv/MMSUBaw8McuJRgZeWXQiqRYdidmDpwWLBO1WuWkZLOCaO5zgiAdyvUxwaP2W8KD9LhoTLAAFo/TJCjdvF
X-Gm-Message-State: AOJu0Yz6L33tNpHjaVLl/I2voYia/KPBEJiZ6iBJaFtUrgFbOLUGnpeg
 NuEQUrRS47he423ysKI5ADKKGQXJI7nxIsTVbqUEIBF6xb818ki3T71mWKSpl2o=
X-Google-Smtp-Source: AGHT+IFlZmxspJ5s1nabisNjV/ZZTzXeDcowEwmiUMeJtNyoFgFtLKIE73ZiAOnm+X1BtLnMp2cPyg==
X-Received: by 2002:a19:ae10:0:b0:513:cf73:d8d2 with SMTP id
 f16-20020a19ae10000000b00513cf73d8d2mr2155905lfc.54.1713578196738; 
 Fri, 19 Apr 2024 18:56:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fb4-20020a056512124400b00516b069b27esm957979lfb.37.2024.04.19.18.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 18:56:36 -0700 (PDT)
Date: Sat, 20 Apr 2024 04:56:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/msm/dpu: check for the plane pitch overflow
Message-ID: <z6q5jkvtrjsutxps66idrxs7qldvz5rt7az7fn5meum62pybst@fmn7rxpuho6m>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-5-d0fe6bf81bf1@linaro.org>
 <2d0e922f-8d68-aa5b-ebbf-b1bde3e9e2af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d0e922f-8d68-aa5b-ebbf-b1bde3e9e2af@quicinc.com>
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

On Fri, Apr 19, 2024 at 05:16:30PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> > Check that the plane pitch doesn't overflow the maximum pitch size
> > allowed by the hardware.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
> >   2 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index b7dc52312c39..86b1defa5d21 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -12,6 +12,8 @@
> >   struct dpu_hw_sspp;
> > +#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
> > +
> 
> You obtained this value from below code right?

Yes. And also from DPU_MAX_IMG_WIDTH / MAX_IMG_WIDTH.

> 
> 	if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> 487 			ystride0 = (ystride0 & 0xFFFF0000) |
> 488 				(layout->plane_pitch[0] & 0x0000FFFF);
> 489 			ystride1 = (ystride1 & 0xFFFF0000)|
> 490 				(layout->plane_pitch[2] & 0x0000FFFF);
> 491 		} else {
> 492 			ystride0 = (ystride0 & 0x0000FFFF) |
> 493 				((layout->plane_pitch[0] << 16) &
> 494 				 0xFFFF0000);
> 495 			ystride1 = (ystride1 & 0x0000FFFF) |
> 496 				((layout->plane_pitch[2] << 16) &
> 497 				 0xFFFF0000);
> 498 		}
> 
> Seems correct, but was just curious
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
