Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1B8FB902
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 18:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A8210E54F;
	Tue,  4 Jun 2024 16:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ejMAoaZN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F5010E54F
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 16:31:52 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dfa7790b11aso1338183276.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717518712; x=1718123512; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9DPwzzySNOh5jKdiFXhLh5D+q0fux/GGS8qouK+GFc=;
 b=ejMAoaZNqGp53M73fHzMWLE/fAOOD0+4eYkWMAuW6IRe10Iv7+TXNk0W1Rd7kOLPCm
 gqoW/zfLh9OoVtnkL1SwffTZWoxAeVM1iqQLX1qg37sDfZ01gLMS0ROARZzXXZivMLB0
 Jn8EASkdH3svitrxblGsfSbwGpPyfnYyfRkzGaARgaH5tOmbFDDVQbxHo+eFXyQtsTbO
 Tv6GjOhZLH79Zi4zKgaTPdebMmn0PF18X5Oz/UnANHYA/sl8wJ+0bzhH48uaqHrHDjiO
 HjGz7ifyJ5Qp9/SfB7NPAkwIIQPpX+YMXkE/zocY+qKlDBUngUn401NMRiMAxstHe50x
 oYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717518712; x=1718123512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z9DPwzzySNOh5jKdiFXhLh5D+q0fux/GGS8qouK+GFc=;
 b=ZzAh+XZvJ6igNWwyLiLPPWdb5geVDCT/xZzsxa/9QwbGExX5iqtL37gmauPNoayvLo
 v/8SVk25wZzwlbLuaf28NIw5lpD3VxjmLTZM3YioR1nXtjFqQuuncSo+caZtCEAght3B
 JYhYJz4LeUISKAkrWyyj6MrS5tjTaQl3jLKcytUof8oz1VTxmgeeZBUlAqz/Z8bNpC9A
 itwfRvhIG2DGaQIrCg51gx7pGhAqEY/WM9P8/OSjJzBagRMczQw2eU/AMh1oEhqoZsTL
 sQ4pbqUBiuaf42j2Ocgxq9pvY+aY4+tsGz5v96fnqCIuRndsqGNYzy/cXKKJOr8f9R0a
 db9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH+JXVAVyQGBWTYpNDZzobap2XvNm5kBVDwbFsuP/CsOQs3CY9fZ8Oe+1NkoFgXIXT9rF0wz8nrYaPw/u5/zK7vzds/k+0xfTBqwOwHOmg
X-Gm-Message-State: AOJu0YyLY1bg4ZnbQbRGrqDdm0X5CEV1K+PqqxQx1L3eftWxxotmpoLe
 GlqZZksmylyewVJKx7lNHVnmYiNFKknfUc99i61fNw6HcXgqun+nuMvhzyRDvbiSFMRTMcnF0Za
 Bo+491I+w2YAuatkn/KiXdZ9qQaURSlZyUS9v0g==
X-Google-Smtp-Source: AGHT+IG9nfkGErWgX+Z7kHFPw4NIX7CtJVxIwkdUh4P9tSgvXArctZcIqdy++fD/2bNlzKiw1xHKgyYr+lpeKljr+WU=
X-Received: by 2002:a25:d6d4:0:b0:df7:a75c:28e0 with SMTP id
 3f1490d57ef6-dfa73c40be0mr11980521276.36.1717518711395; Tue, 04 Jun 2024
 09:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240604154846.500357-1-robdclark@gmail.com>
In-Reply-To: <20240604154846.500357-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jun 2024 19:31:40 +0300
Message-ID: <CAA8EJpooN4gJMfBPam+iVS6rbYWgdk835UB4ruDBxLryHoOy5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Print SQE fw version
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, 4 Jun 2024 at 18:48, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add the SQE fw version to dmesg and devcoredump.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 32 +++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 ++
>  3 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 56bfb228808d..5a2a005003c8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -665,6 +665,32 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
>         return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
>  }
>
> +static uint32_t get_ucode_version(const uint32_t *data)
> +{
> +       uint32_t version;
> +
> +       /* NOTE: compared to kgsl, we've already stripped off the first dword: */
> +       version = data[0];
> +
> +       if ((version & 0xf) != 0xa)
> +               return version;
> +
> +       version &= ~0xfff;
> +       return  version | ((data[2] & 0xfff000) >> 12);
> +}
> +
> +uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu)
> +{
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       uint32_t *buf = msm_gem_get_vaddr(a6xx_gpu->sqe_bo);
> +       uint32_t version = get_ucode_version(buf);
> +
> +       msm_gem_put_vaddr(a6xx_gpu->sqe_bo);

Wouldn't it be easier to save the SQE version when the firmware is
loaded and then just return it?
Or the point is about reading the SQE version at runtime?

> +
> +       return version;
> +}
> +
>  /*
>   * Check that the microcode version is new enough to include several key
>   * security fixes. Return true if the ucode is safe.
> @@ -681,6 +707,8 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>         if (IS_ERR(buf))
>                 return false;
>
> +       DRM_DEV_INFO(&gpu->pdev->dev, "Have SQE version %03x\n", get_ucode_version(buf));

I'd suggest drm_dbg_driver() instead. I think the motto is to keep the
kernel more or less quiet.

> +
>         /* A7xx is safe! */
>         if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
>                 return true;
> @@ -714,7 +742,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>                 }
>
>                 DRM_DEV_ERROR(&gpu->pdev->dev,
> -                       "a630 SQE ucode is too old. Have version %x need at least %x\n",
> +                       "a630 SQE ucode is too old. Have version %03x need at least %03x\n",
>                         buf[0] & 0xfff, 0x190);
>         } else if (!strcmp(sqe_name, "a650_sqe.fw")) {
>                 if ((buf[0] & 0xfff) >= 0x095) {
> @@ -723,7 +751,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>                 }
>
>                 DRM_DEV_ERROR(&gpu->pdev->dev,
> -                       "a650 SQE ucode is too old. Have version %x need at least %x\n",
> +                       "a650 SQE ucode is too old. Have version %03x need at least %03x\n",
>                         buf[0] & 0xfff, 0x095);
>         } else if (!strcmp(sqe_name, "a660_sqe.fw")) {
>                 ret = true;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 1c3cc6df70fe..c206dab8bc08 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -109,6 +109,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>                        bool suspended);
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
>
> +uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu);
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>                 struct drm_printer *p);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 0a7717a4fc2f..1acfe39eb8e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1957,6 +1957,8 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>
>         adreno_show(gpu, state, p);
>
> +       drm_printf(p, "sqe-version: 0x%08x\n", a6xx_get_sqe_version(gpu));
> +
>         drm_puts(p, "gmu-log:\n");
>         if (a6xx_state->gmu_log) {
>                 struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
> --
> 2.45.1
>


-- 
With best wishes
Dmitry
