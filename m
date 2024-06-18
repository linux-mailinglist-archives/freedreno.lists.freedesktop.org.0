Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E757890DA99
	for <lists+freedreno@lfdr.de>; Tue, 18 Jun 2024 19:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FA110E750;
	Tue, 18 Jun 2024 17:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jegBqyEw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E97210E74B
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 17:26:59 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52cc14815c3so1514014e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718731617; x=1719336417; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W2XgDBRe+uXR1JhTiAW0H+F2QdLuA6dIQSH0HmfL2qI=;
 b=jegBqyEwWhBROpoqiEsg+UZV0V+oajjO1DCLBQz8Fzun4Ar/r9EoCHm+ICI66ilGHR
 ae5LeYCuUVnCR+s9R6mz255GCFqIQLF90TqOCUMJJlR0ulmB6I09FqTkw8oRwYC3ontM
 5jKdmAcEpAn9fvANVfDPH+mW1kNfyaqvYhl/vMzC0SEqQImA8aL4RSecCQZOOr7iq7RQ
 xBFVzQ/JiuFn6iUqrm63J1H0kdL+8UOFYr4kPvgWCHXMCOdjovBzLvKB0aYRPyw+bkkD
 GBGtt0ENJPhbMleK2KsvTI3dZ6+FvfS8C6hC4vLRLxhTku+YoB/95ngcM0Ot4P3E8H6U
 udtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718731617; x=1719336417;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W2XgDBRe+uXR1JhTiAW0H+F2QdLuA6dIQSH0HmfL2qI=;
 b=bAdEE5e1xrYqj7mzaJo1xBQEt5wyLZl94m7RYSwO4baV/ifyvEfPhpZwKTMdBrgico
 ivRyqEpURItYNPnJScoZak+jftTquy94+s8UweVQZNrBgN45GoJyFzaHPNbWyuveDvTV
 BWacmp+VpLoM5Sa7DGsEJT62Qjl3spJnNmv0VPBW79TAnTn8ydGNBtLFVg+ASAniyRWb
 GzAw8Wau3NjAa/p86GpSepx2yuYKYM/UVDwDu45w09zrd92u1At5Mol+kT3LoldD3WR/
 15ZUfBTjix/2Cib3mQ1S6OG8r4e6ILUN6ftEVl/aQUUWVfd2VvhQciY1CvCyckWvSLSI
 bGJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+nuUA+/fA/UaH/kgct28k/QXwOf8+KsDvkNNR3LuznMaLKFinsUt5uOrhqinGiEY42nGDZexJSS+1PCdB/r20eKUDxg7eWKInlBfpHPAG
X-Gm-Message-State: AOJu0Yw9GJ2Nl8Nfe9Qxj3+DljiCYfibL+Q+EcsBneGKPOabr0UZcZ14
 mB2UH+alXsRc8JHTwEsw0JttAAMNBiqaWVZXrlfIFSdpiztb7PpqyH1IYl/9DCU=
X-Google-Smtp-Source: AGHT+IHnlPq6SIHBVQIVyvhtZzEM4VjHJZd+R56nsfAoWok8bl5Nz8Rpo3Ive6lWbA3CpuueiYxIMA==
X-Received: by 2002:a05:6512:49a:b0:52b:c1d4:7df3 with SMTP id
 2adb3069b0e04-52ccaa36980mr190988e87.35.1718731617392; 
 Tue, 18 Jun 2024 10:26:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2889052sm1555203e87.299.2024.06.18.10.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 10:26:57 -0700 (PDT)
Date: Tue, 18 Jun 2024 20:26:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] drm/msm/adreno: Move hwcg table into a6xx
 specific info
Message-ID: <x64uencmmiqlozqhjnp2jclizjzhhhekkhvxqmm6dlilr7huyd@wmaikimb63jx>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-5-robdclark@gmail.com>
 <wnnjjljjyl5s3fkwiapux3f76243ngp2ppk2cm7kkhdp5dc4sz@v4wypnga3izv>
 <CAF6AEGvjeGxP+A2umyQHo49G1rAdZkY0bHuemvFP4jgNkspu3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvjeGxP+A2umyQHo49G1rAdZkY0bHuemvFP4jgNkspu3Q@mail.gmail.com>
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

On Tue, Jun 18, 2024 at 09:33:48AM GMT, Rob Clark wrote:
> On Tue, Jun 18, 2024 at 1:30 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Jun 17, 2024 at 03:51:14PM GMT, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Introduce a6xx_info where we can stash gen specific stuff without
> > > polluting the toplevel adreno_info struct.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
> > >  4 files changed, 67 insertions(+), 19 deletions(-)
> > >
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
> > > @@ -98,7 +100,9 @@ struct adreno_info {
> > >       struct msm_gpu *(*init)(struct drm_device *dev);
> > >       const char *zapfw;
> > >       u32 inactive_period;
> > > -     const struct adreno_reglist *hwcg;
> > > +     union {
> > > +             const struct a6xx_info *a6xx;
> > > +     };
> > >       u64 address_space_size;
> > >       /**
> > >        * @speedbins: Optional table of fuse to speedbin mappings
> >
> > My preference would be towards wrapping the adreno_gpu, but that would
> > require more significant rework of the driver. Let's see if we can get
> > to that later.
> >
> 
> yeah, it was going to be more re-work, and I'm neck deep in
> gpuvm/vm_bind.. I just wanted to land this since it is a pita (and
> error prone) to rebase as more gpu's get added ;-)

Yes, I'm fine with that. My note was more like a 'later todo' item.

> 
> It isn't entirely unlike how we handle gpu gen specific options in
> mesa, where we have a somewhat bigger set of options, so I wouldn't
> say that this approach was worse than extending adreno_info.. just
> different..


-- 
With best wishes
Dmitry
