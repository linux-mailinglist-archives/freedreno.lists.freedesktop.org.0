Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D058A1AFD4
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2025 06:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C7410E8CF;
	Fri, 24 Jan 2025 05:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r2CPAlYs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6958110E253
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 05:19:53 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso1902924e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 21:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737695991; x=1738300791; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3o8gTZu6BR29eomWLMiFERLH4W2XG5CknLwAkj4XFWs=;
 b=r2CPAlYsIZasqmSlEfoUQd3s5elhvIaCtVuH1BGNVYG2dlbMW8/ttS8HTVK/rU2BZX
 fgKKVO78/h+M6j8GgOA5znvdaV+BO3nz/LmNmVBzxRKkg8z1Hs5Qbvwa89yqea6evx9B
 e/znayMvrQ+3jeCBRQqjrLMF3qOs1zIkMtTzSRNnHkmieZBLcOKDsNCU1HnxNe83/Ci9
 gi5eCszkLMEI0l96ZpjGH417DUnGBEd4XtpaDJlWr5UWTWknST/EHmfwdQlCwGepytKG
 1jAoUA8BuRju4PFHCgsMyDIp/gmCbdRk78zdZqYe9TvOV9pwTbTMEFSc3Y1z2MsK6hEo
 WGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737695991; x=1738300791;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3o8gTZu6BR29eomWLMiFERLH4W2XG5CknLwAkj4XFWs=;
 b=Sr+/Cyss7tGkfitzOLc1rVbp7Lof5wfh6NrnLIG2v+eFfhlZwcVoX8Jl9xtux1S7nf
 dvHMwBD2HCcxbvt62Rzvg6dnhK6QqarxQ08f2TOYx/0pDV4jbwr+6nEeT7Z1KQyRLHHa
 9HN9LIF4LM7n+N0tFJV/20BVjnwWF4F7hlNpMtS7PAahAKxDwC8ybG8HSeM6w7Ig3Zhk
 ha3YiSOjHp1fy4JoSlg70X7f8/pZd61+Sn/8m0udnB3DlalPaKEH5rwXO3CZBRNTdsXo
 MCtxrZQNsOd3BuVJrJYXnFpokKJ2uu6nYMhUClORO6oChCg6qLDPJodCM04Dl7WnAp9W
 6Oqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtfSdfol+LYkntKeCCC6/5awd4zW+kG1yXkze25O8xA/BagVMTgJSZMDIn8R3ydnMPsHagzKf1/ac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrgDf12OgaYK50uAl2RQd8KU1EmCnTovybYcWuS55XRQIBn8c/
 zo4X818QV5QTQtzE3zcZo/LBwyLCuB8vCyBTyovbdCB7lLZSfFAgYfooON90Nyw=
X-Gm-Gg: ASbGnctRWMfV+5oYPanqWsDDnn6fWVHJgEaFRKQH72JMvywN5d328E6aerjzHrxSfov
 T8zJh+GU2BTnrUUm4gbA0jqniPtCAnFDCzSIilKxcEenf5moUJ6Wgd31v5DPvAOehMLA6QSo7LE
 MutGBlQoOaXlXTvemFPxrNP6z3jCz7AzVCVAs3gemyDRg0H0iFICINO8xIJPnUpjRduR7hi5ueS
 jnDfth60hnKiMaT2JQ4KXvfc3gQjcLkjVZGpvnDjyczt//kk0aiziYMfky+wA1Gx7T866UhQZ9h
 SwtJEyZe9si4wfDPfkOHHqCakSgzUauxSXYGv7gmfqylIz11zu/Jo2tfglUq
X-Google-Smtp-Source: AGHT+IEwnJ9j1k553+NJYN6NU1urekTvAiaOkFEFC2RQFT0hhnn33FzgCNI1K9Ys6RSk3s/xp4ZF6A==
X-Received: by 2002:ac2:550a:0:b0:53e:38fd:7518 with SMTP id
 2adb3069b0e04-5439c22d6e5mr9306949e87.3.1737695991441; 
 Thu, 23 Jan 2025 21:19:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8379953sm166799e87.187.2025.01.23.21.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 21:19:50 -0800 (PST)
Date: Fri, 24 Jan 2025 07:19:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
Message-ID: <esyb2hdp3rutcoiblqnxshta3x47ymdyotphasliprmkp643ic@eyopzwlihcpk>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
 <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
 <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
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

On Thu, Jan 23, 2025 at 01:41:14PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/23/2025 1:32 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > > Continue migration to the MDSS-revision based checks and replace
> > > DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10
> > > ++--------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
> > >   7 files changed, 5 insertions(+), 20 deletions(-)
> > > 
> > 
> > <snip>
> > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0
> > > 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > @@ -319,7 +319,7 @@ struct dpu_hw_pingpong
> > > *dpu_hw_pingpong_init(struct drm_device *dev,
> > >           c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> > >       }
> > > -    if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> > > +    if (mdss_rev->core_major_ver < 7) {
> > >           c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> > >           c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> > >           c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> > > 
> > 
> > So far in this series, we replaced the feature bits with >= checks of
> > core_revisions. That kind of works as usually feature bits get added
> > after a specific version.
> > 
> > With this patch and later, whenever we use < checks it gets a bit tricky
> > as we might also need an upper bound. Feature bits gave individual
> > control of chipsets but generalizing that all chipsets < 7 have PP DSC
> > is also not correct. I have to really cross-check but there could be
> > some old chipsets which do not have DSC at all.
> 
> This raises another question as well.
> 
> what if some register was introduced >= X version but was then dropped in a
> newer chipset.
> 
> Is it not difficult for the user to go back to the files of each of the
> sub-blocks and alter these checks rather than just fixing up the catalog.

Well, the obvious example we are going to have is the CTL_LAYER_EXT4,
but if I understand correctly the whole block is going to be dropped, so
maybe it's not that relevant.

Another example might be CWB, where we are going to have 5.x-7.x and
8.x+ DPU ranges.

Basically, yes, when adding support for a new platform we have to audit
HW blocks. But this applied even beforehand, where new platforms could
be drooping existing regs (8.x+ dropping a part of the TOP region).

-- 
With best wishes
Dmitry
