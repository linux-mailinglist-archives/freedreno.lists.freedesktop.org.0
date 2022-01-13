Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5648D2A7
	for <lists+freedreno@lfdr.de>; Thu, 13 Jan 2022 08:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD63112274;
	Thu, 13 Jan 2022 07:13:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0696B112282
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jan 2022 07:13:12 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id g21so5916219qtk.4
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jan 2022 23:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8M7DHNqIGb8T38MhtK9zvNv2bpY/lvWtx3YDXV9Tj8I=;
 b=qIohtgfLM8Muy/S/qrETPOgzJmX+T5sA52nuKD/xxF+ot3vn2MIoZBE68IfKR1a+45
 TyXpS/HG+q56nfitHBfuPmvvx0Mu8UwbVEMk4evAy7/yUat4phet2r+zUyk3JgQ4dw7Z
 u5bu/qzWNCTZQuqY8ty/ufTcD2i59VwX/+iJ72rzYOD1jSDUc7mTWBe93TdLyPe9QlGg
 iGig5sX3ELfg2m707GTjJV1ib2bewI/C9ydgL9UPMRr6Y39CEnHy++ZbY0n2tqnne3yP
 +K37pfg+jPJsjwJ8A8IxbGnR1MGqgrpgG1vwZjzKI95/TO/0ha/lBkzZ/sk2jWZmBe1w
 ByjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8M7DHNqIGb8T38MhtK9zvNv2bpY/lvWtx3YDXV9Tj8I=;
 b=vdCJvM5u5maLAn8lGHh5EjsQk1V9EG8LswiSBbMdAcL8dmgc+xhn9Ysm6Zfuexo8PZ
 nL33luglQnuV2pl59HXQUkiTvQYrC2fmcO7ldBE9yZaCXzSiLe4MDRS3wjJvxl+/sUsZ
 a2OlrGfpsixNunRv8wcM6Y0/HRlaojHQ2wkMRG7h63EUtiZq5lHkdeGsWhqkfcOMrK2s
 +ZNcdVMUxBWIIEO3P8i7mQ3HVSC48LasOrWY1ErvXf47Zhv7HqIq2NZF2BnQEUWm3GLn
 1rDEqZB22jWUrjAY28s5cqOAi1qeBTp9WZCrkjvXpMnI+r1wCV66nbqGQAZK3pgLK1ML
 Xb+A==
X-Gm-Message-State: AOAM5334m1TqLp3FwW3YK3iSmJYB1zZ4mw2wX5kOotX7h/wcmn5uBjzy
 sATQhI1DobemwG2JCwnBwoBUxioBuwFQefkhu8es+Q==
X-Google-Smtp-Source: ABdhPJx1y+5qzqGkdufL1lymNEVHc7WenfzCCuu3h0YYxZ5tyyugQGLAy7qBvf0pJG+6kg1ogk/QxcaYNvPlUCDNeXE=
X-Received: by 2002:a05:622a:1883:: with SMTP id
 v3mr2520046qtc.682.1642057991028; 
 Wed, 12 Jan 2022 23:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20220112030115.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
 <20220112030115.3.I86c32730e08cba9e5c83f02ec17885124d45fa56@changeid>
 <CAF6AEGuJxdrYM5XXt6sUGmjossqZTRzwQ6Y8qYsnfCYDvGQurw@mail.gmail.com>
In-Reply-To: <CAF6AEGuJxdrYM5XXt6sUGmjossqZTRzwQ6Y8qYsnfCYDvGQurw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jan 2022 10:13:00 +0300
Message-ID: <CAA8EJpokgiUbqj9BOF52a9QjJK53PinNHfxy_6nbNq53JnO2Og@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm/adreno: Expose speedbin to
 userspace
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 13 Jan 2022 at 00:19, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jan 11, 2022 at 1:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > Expose speedbin through MSM_PARAM_CHIP_ID parameter to help userspace
> > identify the sku.
> >
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index f33cfa4..e970e6a 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -242,10 +242,11 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
> >                 *value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
> >                 return 0;
> >         case MSM_PARAM_CHIP_ID:
> > -               *value = adreno_gpu->rev.patchid |
> > -                               (adreno_gpu->rev.minor << 8) |
> > -                               (adreno_gpu->rev.major << 16) |
> > -                               (adreno_gpu->rev.core << 24);
> > +               *value = (uint64_t) adreno_gpu->rev.patchid |
> > +                               (uint64_t) (adreno_gpu->rev.minor << 8) |
> > +                               (uint64_t) (adreno_gpu->rev.major << 16) |
> > +                               (uint64_t) (adreno_gpu->rev.core << 24) |
> > +                               (((uint64_t) adreno_gpu->rev.sku) << 32);
>
> How about this instead, so we are only changing the behavior for
> new/unreleased devices:
>
> *value = adreno_gpu->rev.patchid |
> (adreno_gpu->rev.minor << 8) |
> (adreno_gpu->rev.major << 16) |
> (adreno_gpu->rev.core << 24);
> if (!adreno_gpu->info->revn)
> *value |= (((uint64_t) adreno_gpu->rev.sku) << 32);
>
> (sorry about the butchered indentation.. somehow gmail has become
> antagonistic about pasting code)

I assume that you would like to keep userspace compat for older chips.
thus the if.
Maybe we should introduce MSM_PARAM_CHIP_ID_SKU instead (and gradually
make userspace switch to it)?

>
> BR,
> -R
>
> >                 return 0;
> >         case MSM_PARAM_MAX_FREQ:
> >                 *value = adreno_gpu->base.fast_rate;
> > --
> > 2.7.4
> >



-- 
With best wishes
Dmitry
