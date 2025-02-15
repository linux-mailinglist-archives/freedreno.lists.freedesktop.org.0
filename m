Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3884A36F10
	for <lists+freedreno@lfdr.de>; Sat, 15 Feb 2025 16:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847B510E191;
	Sat, 15 Feb 2025 15:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GlRxK2xL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0A510E191
 for <freedreno@lists.freedesktop.org>; Sat, 15 Feb 2025 15:22:53 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6f679788fd1so21540017b3.2
 for <freedreno@lists.freedesktop.org>; Sat, 15 Feb 2025 07:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739632972; x=1740237772; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2ya1HOp4At8o4rZdZ1CZR9DS9vtC+SlJcJNAQgmy2no=;
 b=GlRxK2xLgzzL3vd+L7enMFcjNIrQH/yeyfKNsTzxgQga7GGb0wIUlhO4qv/y5iuWSb
 lAouaDFkRrdCEpZ/JsQLxFLf7Dy4VBeBoq6n3UdUnQzdOusoU1fwaGn1vVErXoMRUEeh
 0g9ftMDLpT9jkgdSt766nGiGqNqHTU6IkJ7GiGiO2PuYMjQhVHuTKQm1SSqPec8rpZvl
 L2W8Dxi6vFkOYpJmqC4shHUusl4Zuy4g1Eiwl5F4R3Zghk2337iNQFeUEN4qUkXctcsF
 Sqr6yNAGJYV/wFpsrBUR+poXQi6wKlZFs2VROkmwuknxNbxkwrxfBF1/azlMrrMSf83b
 Timw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739632972; x=1740237772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ya1HOp4At8o4rZdZ1CZR9DS9vtC+SlJcJNAQgmy2no=;
 b=gS2+6+OtuIgbZLKCV3t5PRS6dGDh5KsP3QYzlmmKvpa4NDJZB/yvsPL1XAwh4ZZlbH
 jW4u5zSAG4hnJ74sJyq4J2/G6ARSCT7cAVpXtpZPRK8DP9jyM2wsnRbYO1NSIo2TPm+j
 wCKVvgjHz1j3Ipm+C5S9VJwp9HQ0mEzsk3sGXBhMJeJJM6JskxopyR5IycL5G/Jcnxpc
 xzxGBlh5pEfZazpm0xlJJ0WKoP6CDp4hsPxtpr3ZY+V7fwqvj/xBF/kdy5AjWnrf3e9f
 5+yYFRYkw5EOVA/4+9TXf6c/sc5mWHnNMahAwWqBseEGdDVoepxXMFA4WqkyYI1+tzUn
 bLZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLnnGJINeWrcpw0k2BcmQPrKAVJKG3u1JKjRLiLgWEg4cGux7e/GwS92pZUI2dnwKK4tNIjSFk0N0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxH+sI32aD5T2HrqKj/KP4sDoTgrh9ivSTXT9yhimgurdajoXq
 Z2eXNIsAh/K6OO3JGeIlyS8CTv6i4btrob3VeC6HUsiJJpS3aDrMdJc0cXgC5PxTp9bGqxoCVWc
 zHW8I1xpImJyAhneFSU4I+b/fMjzIonhTccqjVw==
X-Gm-Gg: ASbGncte+ykORPsRlwtp4ksFZkQEXJet0jcwXMc2IPZAzSZpioW+cqACMPfegln7ztw
 CGv1oR8Fcldz0X4891a5q3Y/0p6aMZ8WZydwEzewsTxS5Jx6/u7ZT3+KVaQ/lgAaHd32HGK72WC
 gBDhNy1PpFW2LlsTebAGevGgnpxw==
X-Google-Smtp-Source: AGHT+IHCM9nGvMBLMHM0urprzaVEMr1E9JJGwJN2aU4oCsO5lmJSn8L5sb5ABAdmNNdEk78PHDTei2/liPwZS3V/suk=
X-Received: by 2002:a05:690c:6405:b0:6ef:6f24:d093 with SMTP id
 00721157ae682-6fb58260edamr32798287b3.6.1739632972228; Sat, 15 Feb 2025
 07:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
 <ttipuo56z76svx3womcrrqurglvovkqehsx2orgnegjj2z7uxn@d3cov6qmmalm>
 <182b7896-9cfc-4f94-b9d4-759fd85fd997@quicinc.com>
In-Reply-To: <182b7896-9cfc-4f94-b9d4-759fd85fd997@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Feb 2025 17:22:40 +0200
X-Gm-Features: AWEUYZkkpka5cr642Meq7bthCAe5gt3dTkRMkIvHVkAt9bN0FOufwH7vzAGO4cA
Message-ID: <CAA8EJppO6ob+oQTzPkx1D6Fmq7bfyNquEyXwFXhmiiTKtXrOAA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/a6xx: Add support for Adreno 623
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jie Zhang <quic_jiezh@quicinc.com>
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

On Sat, 15 Feb 2025 at 13:49, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 2/13/2025 10:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 13, 2025 at 09:40:07PM +0530, Akhil P Oommen wrote:
> >> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>
> >> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> >>
> >> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
> >>  4 files changed, 43 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> index edffb7737a97..ac156c8b5af9 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
> >>                      { 0, 0 },
> >>                      { 137, 1 },
> >>              ),
> >> +    }, {
> >> +            .chip_ids = ADRENO_CHIP_IDS(0x06020300),
> >> +            .family = ADRENO_6XX_GEN3,
> >> +            .fw = {
> >> +                    [ADRENO_FW_SQE] = "a650_sqe.fw",
> >> +                    [ADRENO_FW_GMU] = "a623_gmu.bin",
> >> +            },
> >> +            .gmem = SZ_512K,
> >> +            .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >> +            .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >> +                    ADRENO_QUIRK_HAS_HW_APRIV,
> >> +            .init = a6xx_gpu_init,
> >> +            .a6xx = &(const struct a6xx_info) {
> >> +                    .hwcg = a620_hwcg,
> >> +                    .protect = &a650_protect,
> >> +                    .gmu_cgc_mode = 0x00020200,
> >> +                    .prim_fifo_threshold = 0x00010000,
> >> +                    .bcms = (const struct a6xx_bcm[]) {
> >> +                            { .name = "SH0", .buswidth = 16 },
> >> +                            { .name = "MC0", .buswidth = 4 },
> >> +                            {
> >> +                                    .name = "ACV",
> >> +                                    .fixed = true,
> >> +                                    .perfmode = BIT(3),
> >> +                            },
> >> +                            { /* sentinel */ },
> >> +                    },
> >> +            },
> >> +            .address_space_size = SZ_16G,
> >>      }, {
> >>              .chip_ids = ADRENO_CHIP_IDS(
> >>                      0x06030001,
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 0ae29a7c8a4d..1820c167fcee 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>              gpu->ubwc_config.uavflagprd_inv = 2;
> >>      }
> >>
> >> +    if (adreno_is_a623(gpu)) {
> >> +            gpu->ubwc_config.highest_bank_bit = 16;
> >> +            gpu->ubwc_config.amsbc = 1;
> >
> > This bit causes my question: the patch for msm_mdss states that on the
> > display side both UBWC encoder and decoder are 4.0, which means that the
> > UBWC_AMSBC bit won't be set in the UBWC_STATIC register.
>
> Not sure, but my guess is that AMSBC encoding is probably implicitly
> enabled by MDSS HW when UBWC v4 is configured.

Ack.

>
> -Akhil
>
> >
> >> +            gpu->ubwc_config.rgb565_predicator = 1;
> >> +            gpu->ubwc_config.uavflagprd_inv = 2;
> >> +            gpu->ubwc_config.macrotile_mode = 1;
> >> +    }
> >> +
> >>      if (adreno_is_a640_family(gpu))
> >>              gpu->ubwc_config.amsbc = 1;
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> index 2c10474ccc95..3222a406d089 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> >> @@ -1227,7 +1227,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
> >>      _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
> >>              &a6xx_state->gmu_registers[1], true);
> >>
> >> -    if (adreno_is_a621(adreno_gpu))
> >> +    if (adreno_is_a621(adreno_gpu) || adreno_is_a623(adreno_gpu))
> >>              _a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
> >>                      &a6xx_state->gmu_registers[2], false);
> >>      else
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> index dcf454629ce0..92caba3584da 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -442,6 +442,11 @@ static inline int adreno_is_a621(const struct adreno_gpu *gpu)
> >>      return gpu->info->chip_ids[0] == 0x06020100;
> >>  }
> >>
> >> +static inline int adreno_is_a623(const struct adreno_gpu *gpu)
> >> +{
> >> +    return gpu->info->chip_ids[0] == 0x06020300;
> >> +}
> >> +
> >>  static inline int adreno_is_a630(const struct adreno_gpu *gpu)
> >>  {
> >>      return adreno_is_revn(gpu, 630);
> >>
> >> --
> >> 2.45.2
> >>
> >
>


-- 
With best wishes
Dmitry
