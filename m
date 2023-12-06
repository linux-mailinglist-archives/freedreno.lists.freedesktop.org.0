Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBD80702F
	for <lists+freedreno@lfdr.de>; Wed,  6 Dec 2023 13:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8638010E721;
	Wed,  6 Dec 2023 12:49:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95F010E722
 for <freedreno@lists.freedesktop.org>; Wed,  6 Dec 2023 12:49:48 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-db5311eab29so5096666276.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Dec 2023 04:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701866988; x=1702471788; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jrpEd8RJRtQUwtVg9+y681GZcu+Yhv9ko2OvFWCbawE=;
 b=vH0KVj1WOenV+g/KPUvGNFig5Q4kdABXxkB9SVJ7LMfh4tzwMG/gUybZKnSxioFbpd
 wRqKYWapnpHDtzRW4R0C8enVYPO/rI/c82BJfbsFrOWqJ34Fcf4DU+UaGVuB81wxoWAp
 dP+JgeJLkA4PA8Yi+ljOBSC0uBwAU+KCnS0gbqIf8N8kQwWg7byfl5Mgh893eHeZNA3q
 e+y1GK2Z/1sGZoZkl64DW5SXW0T9aMde7bEGYX0j5FnbJZuyAt7M/eqRycI1ohkbDxnj
 Ds+TPLA3tG0LWcVgrDGt1DOllQYe5URc6vT3Pa51uJpp6Pau1ND5DQwWdyvgFX9UDgpy
 lhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701866988; x=1702471788;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jrpEd8RJRtQUwtVg9+y681GZcu+Yhv9ko2OvFWCbawE=;
 b=W4ICRAY1V1JjI1TibUVzcKhAqkOuUM0bGXLAbWTlq9pZnjhqyhAXZGj5iCl1o6VZbz
 lYGYOBm1s1F84tjErHssok4tPzcUlGYmAQLO8PgMKGX+Yp06TwYmEJqxP8pwfNBOBRWD
 XKTB8yv0iBUBcE3ZNHJBDAVVJ00mfA59jHzObiErkG1S/hc33CB/nqeh3EedkhBPJkpO
 q57ZFzIYToBp0MkXvbB7kGqfYhV3VPlemYb8WW+doo8HCV6oVCGqDaY7zFB97X4YZ/io
 +vnKS94M+5+bS1DyM6IcOAEG01nusT0wrnUaveiyUGII8lTUOdRb6wbxmpjqFeWVbwk7
 xUjg==
X-Gm-Message-State: AOJu0YxsZ3ToZONk1MvGq9jG6JFZRPxwcCUoo/Fz6QmRtpY9gY9hDnWW
 E0lgqK7Wc1rw1uh5mKH8bzh3aD2pvXXgW6nHFAALMw==
X-Google-Smtp-Source: AGHT+IHeqJ1eTYAQg7X0GkSNud8ldZu9UODzg7lAQ9auwRFlAMgP9S/UuJtWfqYW2ZPM/Qhaz91I9uCvRVyAd2//C24=
X-Received: by 2002:a25:d80a:0:b0:db5:4857:5fdf with SMTP id
 p10-20020a25d80a000000b00db548575fdfmr582661ybg.37.1701866987913; Wed, 06 Dec
 2023 04:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-2-robdclark@gmail.com>
 <19ca53ae-b180-4ec6-9294-dd45825af653@linaro.org>
In-Reply-To: <19ca53ae-b180-4ec6-9294-dd45825af653@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 14:49:36 +0200
Message-ID: <CAA8EJprhH_HgftREL4UQuKEDiNsTOUrCh74v8OLwm6bm75SqyA@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/adreno: Split up giant device
 table
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 at 14:29, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 12/5/23 23:03, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Split into a separate table per generation, in preparation to move each
> > gen's device table to it's own file.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 59 +++++++++++++++++++---
> >   1 file changed, 51 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 41b13dec9bef..36392801f929 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
> >   MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
> >   module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
> >
> > -static const struct adreno_info gpulist[] = {
> > +static const struct adreno_info a2xx_gpus[] = {
> >       {
> >               .chip_ids = ADRENO_CHIP_IDS(0x02000000),
> >               .family = ADRENO_2XX_GEN1,
> > @@ -55,6 +55,12 @@ static const struct adreno_info gpulist[] = {
> >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >               .init  = a2xx_gpu_init,
> >       }, {
> > +             /* sentinal */
> sentinel?
>
> > +     }
> > +};
> > +
> > +static const struct adreno_info a3xx_gpus[] = {
> > +     {
> >               .chip_ids = ADRENO_CHIP_IDS(
> >                       0x03000512,
> >                       0x03000520
> > @@ -110,6 +116,12 @@ static const struct adreno_info gpulist[] = {
> >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >               .init  = a3xx_gpu_init,
> >       }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info a4xx_gpus[] = {
> > +     {
> >               .chip_ids = ADRENO_CHIP_IDS(0x04000500),
> >               .family = ADRENO_4XX,
> >               .revn  = 405,
> > @@ -143,6 +155,12 @@ static const struct adreno_info gpulist[] = {
> >               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >               .init  = a4xx_gpu_init,
> >       }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info a5xx_gpus[] = {
> > +     {
> >               .chip_ids = ADRENO_CHIP_IDS(0x05000600),
> >               .family = ADRENO_5XX,
> >               .revn = 506,
> > @@ -268,6 +286,12 @@ static const struct adreno_info gpulist[] = {
> >               .init = a5xx_gpu_init,
> >               .zapfw = "a540_zap.mdt",
> >       }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info a6xx_gpus[] = {
> > +     {
> >               .chip_ids = ADRENO_CHIP_IDS(0x06010000),
> >               .family = ADRENO_6XX_GEN1,
> >               .revn = 610,
> > @@ -493,6 +517,12 @@ static const struct adreno_info gpulist[] = {
> >               .hwcg = a690_hwcg,
> >               .address_space_size = SZ_16G,
> >       }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info a7xx_gpus[] = {
> > +     {
> >               .chip_ids = ADRENO_CHIP_IDS(0x07030001),
> >               .family = ADRENO_7XX_GEN1,
> >               .fw = {
> > @@ -522,7 +552,18 @@ static const struct adreno_info gpulist[] = {
> >               .zapfw = "a740_zap.mdt",
> >               .hwcg = a740_hwcg,
> >               .address_space_size = SZ_16G,
> > -     },
> > +     }, {
> > +             /* sentinal */
> > +     }
> > +};
> > +
> > +static const struct adreno_info *gpulist[] = {
> > +     a2xx_gpus,
> > +     a3xx_gpus,
> > +     a4xx_gpus,
> > +     a5xx_gpus,
> > +     a6xx_gpus,
> > +     a7xx_gpus,
> >   };
> >
> >   MODULE_FIRMWARE("qcom/a300_pm4.fw");
> > @@ -557,12 +598,14 @@ static const struct adreno_info *adreno_info(uint32_t chip_id)
> >   {
> >       /* identify gpu: */
> >       for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
> > -             const struct adreno_info *info = &gpulist[i];
> > -             if (info->machine && !of_machine_is_compatible(info->machine))
> > -                     continue;
> > -             for (int j = 0; info->chip_ids[j]; j++)
> I'm not sure using sentinels here is a good idea, it adds a
> whole lot of stack size. Perhaps gpulist could be a struct
> of array pointers and an array of sizes?

My 2c would be to reimplement it as a of_device_id.data and thus the
device_match_data.

-- 
With best wishes
Dmitry
