Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E585A217
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 12:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F346610E338;
	Mon, 19 Feb 2024 11:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RN/K2qp5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5F910E338
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 11:37:42 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-607c5679842so41481877b3.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 03:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708342661; x=1708947461; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GaUyZ50XjXvDF8jY3Q3ZEC7jLE1bXKIRWKK8kFzpxxY=;
 b=RN/K2qp524fZKa5yjuCCBCt5FgCh2HIQx42GrE1yJrO+XBMFwZEKAIoLqhGyCQi7WQ
 eu3vEmeM8VTqK+lt1wxLAFhqhzNeiFyDfiyDTUi9JbFZN8bhFxCSAtzjwgeGgMUTMA4j
 yZQAakBd50rSHybRuXPv0MyjUAS2MLOlE9qTEKlzt9Y0ByLk4Ioj6oeneJAlQbdaw/4F
 pnPl1OGhVJuljiTIZL0zax2jyJVPrdU2DQaotr1COx5ceo/ip35edvlgU6cLcwJGKHRw
 44FkRy4U3yQH4zPXi6GPGsYPo05cozViIm6TOfT8njx7va4rJYdZlk/nVWA5vpN+1DOy
 NkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708342661; x=1708947461;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GaUyZ50XjXvDF8jY3Q3ZEC7jLE1bXKIRWKK8kFzpxxY=;
 b=aI4QYxjb6JGsxJCVjB8vuZObtoHQuK2i2hzBfyKEUxt+BbgAytxS+705PafOiXPoK1
 7Ob1SBEqAgJB+/Z3dbXkIGfhHGxbY4mgRensO1hOo/CLWmSOKIzbsk1vJfTeBKHNc9Lh
 GtjG+9kN30p+mroWXbLzzITK7eChG7unY3rXL4A2NQglB9MlC2ujMH5uK/ZhP2sH2MKv
 NusDJVuauBKSA8/wLRzzgT+/LSpnkD5W8z4REbjKOQnC/eARuvsyQ3s7sB1OT0/Nl3Kv
 SKthepqjVeEWQKDQFmlmrsCHL/Y1bDWPBjoAWwBXxVUBvaKqi1Q5TfASj1DFRffLslmy
 0Kkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvJl9iGGfOHBZ74/FQhvyFisXIc7euPdw68c0XEQKhnV/yEak0C/WpMh0cUq4AK6+eBZlWn4xDDkWzxsarVlcBxqFBy4cShgtwRcvni3GT
X-Gm-Message-State: AOJu0Yw6w03d1lz9DUXSXChX5zuRu55KLahEjK3+D4/8kadf6eX2HB8C
 DveaUGTs/p+31JT4BnA+dkyFkfxp8cDNhhiHCD8dUTsIhQwf9fiOt9EuRBjUmqSSdR3Y8Fum7bk
 YqgUMyppNJW7loGAY7fl5e2k1MYBLDR8S9voeew==
X-Google-Smtp-Source: AGHT+IGQ1WnS7mBk+2g+qAwDGntsHIztsi8TubTD1INdibjvREVQvyi8hjDez2VQ2B6iwhTX0PVK/T0srPtjJXHbaAA=
X-Received: by 2002:a0d:dd94:0:b0:607:a0cf:d9ff with SMTP id
 g142-20020a0ddd94000000b00607a0cfd9ffmr11328416ywe.31.1708342661019; Mon, 19
 Feb 2024 03:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
 <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org>
 <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
 <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 13:37:29 +0200
Message-ID: <CAA8EJprrVnb-5fhq9oc6PanoM8hY1fhBv0NvmcXhbAC9yJGmLA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: support binding to the mdp5 devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Fri, 9 Feb 2024 at 20:58, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 9 Feb 2024 at 20:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 2/8/2024 7:01 AM, Dmitry Baryshkov wrote:
> > > Existing MDP5 devices have slightly different bindings. The main
> > > register region is called `mdp_phys' instead of `mdp'. Also vbif
> > > register regions are a part of the parent, MDSS device. Add support for
> > > handling this binding differences.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
> > >   drivers/gpu/drm/msm/msm_drv.h           |  3 +
> > >   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
> > >   3 files changed, 93 insertions(+), 21 deletions(-)
> > >
> >
> > I thought we had agreed on a quite version of msm_ioremap_mdss for
> > vbif_nrt_phys?
> >
> > Anyway, its not something to block this change. Hence,
>
> Excuse me, I'll fix it when applying, if I don't forget.

I took another glance. The  msm_ioremap_mdss is already quiet (it is
not printing warnings if the resource is not present), so this should
be fine by default. But I'll make a note that we might be able to
replace most of msm_ioremap functions with the standard devm ioremap
functions.

-- 
With best wishes
Dmitry
