Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C08B2D67
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 01:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CCC10E9BE;
	Thu, 25 Apr 2024 23:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yOaxMZqY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0DA10E9BE
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 23:02:56 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-de46b113a5dso1684497276.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714086175; x=1714690975; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ge3PAHOg60y1TdFqr8eD5p70+jK718M53W6KDyTrkOY=;
 b=yOaxMZqYKLmgBKVQVFt+yEVm4QUfyizHc3K6Qfvb6WtcP1FQPUQGXEcg6Eq6cd6Nmt
 TUjfYE79p9gMmVATsg/jQDDVP1UpPZr/qI23MX/Gx32006frcoZ7Tnhh8U4eB0+Bjvag
 6C0ueNbdp7SVC8qBFf3FrO2s8fhWnw2NrmR1VkeQ5TjXzkneh4INFTfi9CUgLJTbmTCb
 7dM6EtBjjcoCAAF6VG1SGvcbDoP+0Pesf4mED1761DoYglCTaQZ2lWxkqd2K5kOyNMG8
 Q+6ZtBXEm/RdVYsOPZtMtNCCrT7b2gtrdsMH8r3h2UanMcHw3mYyOgh0Op0/Jh2pGTp8
 Kjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714086175; x=1714690975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ge3PAHOg60y1TdFqr8eD5p70+jK718M53W6KDyTrkOY=;
 b=vD2KVmdTS09OE1Oi/HyHMNvQTz8bgdszwpLVQnKrFSdwo6MycaUzUZlrVtvKbtTDow
 oLNOsmoS20ZpX4XK4fbozoz0d6w4S0JOQfa/DZ2RgVEpbsUle+EUA/iV7G6lZQQMAytz
 GW8vGoBM3FIRLII3QBBOvP4VI5PKO25Iq+bcm+GXf4LCbrRmMJbnBTcQNiFTjj2hAlS8
 EDn5Q2Cf4mljvUZZB/gdjEbH8NGACZvsCYdjHS7pbCHoDVZR59bj8+vg3U9eEq+BAKnN
 cKaqcxu7iIC/ERaK1l/tegZ5+UWGcWwh75vg78KjH1AAoJPgF3HHZLgztjUql7iuHRH/
 VjJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN9tzBiyFlJXWHXa+1pZybNQVTyci/f/rfUSh4Qp1X1rsyBivY2cVBqaXzTmGcxy5mgJqBHj5c3zWVn17hEuibiYQ9NKCHer8c34yrkvCJ
X-Gm-Message-State: AOJu0Yx/wAGbjLpsYa2/kecpzM61zMR16NZL0PpvegnMmzSoT5JE/zFL
 FbtOXfyd5tszuwpIsGfjC406r73sSMQbEY/rNVRbACHAfxylRJAUtXCRw4pmjhgjIWua8fzb6uw
 T1HXUKubQCDOu8fyUEml3r2KdABle+wTDiH0bhA==
X-Google-Smtp-Source: AGHT+IGqnzs/B1VeZDEybr3g50mLsiiUGJQ3dMXNulNRYO0RDCNcKOsjWkmq1U6VZ8Qp7jzKniLtPYneiMeH+4Juqag=
X-Received: by 2002:a25:108:0:b0:dda:a550:4e92 with SMTP id
 8-20020a250108000000b00ddaa5504e92mr1095176ybb.46.1714086175096; Thu, 25 Apr
 2024 16:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
In-Reply-To: <20240425134354.1233862-5-cwabbott0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 02:02:44 +0300
Message-ID: <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> initialize cx_mem. Copy this from downstream (minus BCL which we
> currently don't support). On a750, this includes a new "fuse" register
> which can be used by qcom_scm to fuse off certain features like
> raytracing in software. The fuse is default off, and is initialized by
> calling the method. Afterwards we have to read it to find out which
> features were enabled.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 ++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
>  2 files changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index cf0b1de1c071..fb2722574ae5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,6 +10,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/devfreq.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
> @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
>                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
>                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
>                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
>
>  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
>                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>         kthread_queue_work(gpu->worker, &gpu->recover_work);
>  }
>
> +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> +{
> +       u32 status;
> +
> +       status = gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> +
> +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=%8.8x\n", status);
> +
> +       /* Ignore FASTBLEND violations, because the HW will silently fall back
> +        * to legacy blending.
> +        */
> +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> +               del_timer(&gpu->hangcheck_timer);
> +
> +               kthread_queue_work(gpu->worker, &gpu->recover_work);
> +       }
> +}
> +
>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  {
>         struct msm_drm_private *priv = gpu->dev->dev_private;
> @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
>                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
>
> +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> +               a7xx_sw_fuse_violation_irq(gpu);
> +
>         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
>                 msm_gpu_retire(gpu);
>
> @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>                 a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
>  }
>
> +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> +{
> +       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +       struct msm_gpu *gpu = &adreno_gpu->base;
> +       u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ;
> +       u32 fuse_val;
> +       int ret;
> +
> +       if (adreno_is_a740(adreno_gpu)) {
> +               /* Raytracing is always enabled on a740 */
> +               adreno_gpu->has_ray_tracing = true;
> +       }
> +
> +       if (!qcom_scm_is_available()) {
> +               /* Assume that if qcom scm isn't available, that whatever
> +                * replacement allows writing the fuse register ourselves.
> +                * Users of alternative firmware need to make sure this
> +                * register is writeable or indicate that it's not somehow.
> +                * Print a warning because if you mess this up you're about to
> +                * crash horribly.
> +                */
> +               if (adreno_is_a750(adreno_gpu)) {
> +                       dev_warn_once(gpu->dev->dev,
> +                               "SCM is not available, poking fuse register\n");
> +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
> +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> +                       adreno_gpu->has_ray_tracing = true;
> +               }
> +
> +               return 0;
> +       }
> +
> +       if (adreno_is_a750(adreno_gpu))

Most of the function is under the if (adreno_is_a750) conditions. Can
we invert the logic and add a single block of if(adreno_is_a750) and
then place all the code underneath?

> +               gpu_req |= QCOM_SCM_GPU_TSENSE_EN_REQ;
> +
> +       ret = qcom_scm_gpu_init_regs(gpu_req);
> +       if (ret)
> +               return ret;
> +
> +       /* On a750 raytracing may be disabled by the firmware, find out whether
> +        * that's the case. The scm call above sets the fuse register.
> +        */
> +       if (adreno_is_a750(adreno_gpu)) {
> +               fuse_val = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE);

This register isn't accessible with the current sm8650.dtsi. Since DT
and driver are going through different trees, please add safety guards
here, so that the driver doesn't crash if used with older dtsi
(not to mention that dts is considered to be an ABI and newer kernels
are supposed not to break with older DT files).

> +               adreno_gpu->has_ray_tracing =
> +                       !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> +       }
> +
> +       return 0;
> +}
> +
> +
>  #define GBIF_CLIENT_HALT_MASK          BIT(0)
>  #define GBIF_ARB_HALT_MASK             BIT(1)
>  #define VBIF_XIN_HALT_CTRL0_MASK       GENMASK(3, 0)
> @@ -3094,6 +3173,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>                 return ERR_PTR(ret);
>         }
>
> +       if (adreno_is_a7xx(adreno_gpu)) {
> +               ret = a7xx_cx_mem_init(a6xx_gpu);
> +               if (ret) {
> +                       a6xx_destroy(&(a6xx_gpu->base.base));
> +                       return ERR_PTR(ret);
> +               }
> +       }
> +
>         if (gpu->aspace)
>                 msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>                                 a6xx_fault_handler);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 77526892eb8c..4180f3149dd8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -182,6 +182,8 @@ struct adreno_gpu {
>          */
>         const unsigned int *reg_offsets;
>         bool gmu_is_wrapper;
> +
> +       bool has_ray_tracing;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>
> --
> 2.31.1
>


-- 
With best wishes
Dmitry
