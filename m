Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310C8B376A
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 14:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4F0112374;
	Fri, 26 Apr 2024 12:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B6py9bMn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846FE112374
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 12:46:06 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-572511ae0c2so1109731a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714135565; x=1714740365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5CwkAJFaRv/R172rdeEa6HWxAEiRbT+tG1ITreVX4Y=;
 b=B6py9bMnOpqwtCEqVp5BPD5xhZTmf2eC8J1nJHozmTfWs1eqEdZFMM48l5XSdKnRcL
 dBZD1R3wAAeZEZVBuw3eYPeKU8UnDwQh0bOyC7duZRsa6tpsjFBZ1MtMmoKKEbHdsYTF
 hkG8HAJOfyapSJNEy9+SkLmwEdVqWp/GFhzZn1RtyRUI5xLzltC1PKLVxqp5EODVLQuO
 lfFEd/iSD9wiU8jxob360oLCNIjRLlqbK9UEeR7uCbudpQlwl/4FEMGKFwf5HDSMDcSt
 GlyO7NxHuIpHo8+7+wUPdlKOdsNmUcpMGv43GhKQ1emRpsaoPr459eQ4ToFPWGjD9lht
 eEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714135565; x=1714740365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5CwkAJFaRv/R172rdeEa6HWxAEiRbT+tG1ITreVX4Y=;
 b=ClNFbqq1Bfpjq+P+0FUkLXqikMzhOeqOPW1McXjW0Q69KC8qlQH/AHews6yF9JdCAc
 1p4V9dNhWSYetL7SJsOKvGNcV61jDAneM2wPJPA4oo5U1b2WdwSF3hhmh/zo4YQ3735U
 hIbzfkJudooJkqz+NM6aeJy942YzC0+tUhY5/esPcBreC02J6RMJBQiM89eFBDY9tXKh
 E69YK9mlqLAPvn2TfgGWnM/ciZCm5AhHwlGMNauqaGyjdcvEE0zz0fF1gkGBffIIqHD1
 X3utrar1SyE3VgZz68+a5Fm8079MuqLRtLitcjJyvsc+VGMqHv4o3VGtfxCyb3CXDFjV
 izjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW035gw72ECZhez/PIAI4rIDqmsdDUbiOrKsGadICXDEk8QIdn6OFAXeGnlq9yF6ikf1wv80nBzVPwMf7Bxmyq0DlhI74EHJDO57IjKxnOu
X-Gm-Message-State: AOJu0YwCS0NJdiF66i658f4jPxh2mC6Ygiwn7KMGQ/MkVMKeNFeIdx0J
 bZcCRhXJ3tu4a+sVm9vAQXnfxd9mc68ps7zLapZVm7v4Y4AmSE3AwaGhirUw5c8IGtZbcHru6Mn
 Fss2JPxyEiVdv5SjO1hrt+HdG5VO03g==
X-Google-Smtp-Source: AGHT+IGyZ1NCDF1QBer043koI2q2uIzYGq1pFRG6Yr4x14Gv/EGPKFmDNN7ZS8zjpMbTOxijagvGmFsRiG/EZtRj31E=
X-Received: by 2002:a50:d6c5:0:b0:56e:2daf:1ed9 with SMTP id
 l5-20020a50d6c5000000b0056e2daf1ed9mr1796697edj.23.1714135564389; Fri, 26 Apr
 2024 05:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
In-Reply-To: <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 26 Apr 2024 05:45:52 -0700
Message-ID: <CAF6AEGu-sXnz1A_abzTByQHJMEZOJtLAn7iH=VaVwqJ21DZqWg@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Connor Abbott <cwabbott0@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 25, 2024 at 4:02=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> > initialize cx_mem. Copy this from downstream (minus BCL which we
> > currently don't support). On a750, this includes a new "fuse" register
> > which can be used by qcom_scm to fuse off certain features like
> > raytracing in software. The fuse is default off, and is initialized by
> > calling the method. Afterwards we have to read it to find out which
> > features were enabled.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 ++++++++++++++++++++++++-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> >  2 files changed, 90 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index cf0b1de1c071..fb2722574ae5 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -10,6 +10,7 @@
> >
> >  #include <linux/bitfield.h>
> >  #include <linux/devfreq.h>
> > +#include <linux/firmware/qcom/qcom_scm.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/soc/qcom/llcc-qcom.h>
> >
> > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu *g=
pu)
> >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
> >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> >
> >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm_gpu=
 *gpu)
> >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> >  }
> >
> > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > +{
> > +       u32 status;
> > +
> > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > +
> > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=
=3D%8.8x\n", status);
> > +
> > +       /* Ignore FASTBLEND violations, because the HW will silently fa=
ll back
> > +        * to legacy blending.
> > +        */
> > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > +               del_timer(&gpu->hangcheck_timer);
> > +
> > +               kthread_queue_work(gpu->worker, &gpu->recover_work);
> > +       }
> > +}
> > +
> >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >  {
> >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bou=
nds access\n");
> >
> > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > +               a7xx_sw_fuse_violation_irq(gpu);
> > +
> >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> >                 msm_gpu_retire(gpu);
> >
> > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct platform=
_device *pdev,
> >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> >  }
> >
> > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > +{
> > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > +       u32 fuse_val;
> > +       int ret;
> > +
> > +       if (adreno_is_a740(adreno_gpu)) {
> > +               /* Raytracing is always enabled on a740 */
> > +               adreno_gpu->has_ray_tracing =3D true;
> > +       }
> > +
> > +       if (!qcom_scm_is_available()) {
> > +               /* Assume that if qcom scm isn't available, that whatev=
er
> > +                * replacement allows writing the fuse register ourselv=
es.
> > +                * Users of alternative firmware need to make sure this
> > +                * register is writeable or indicate that it's not some=
how.
> > +                * Print a warning because if you mess this up you're a=
bout to
> > +                * crash horribly.
> > +                */
> > +               if (adreno_is_a750(adreno_gpu)) {
> > +                       dev_warn_once(gpu->dev->dev,
> > +                               "SCM is not available, poking fuse regi=
ster\n");
> > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FU=
SE_VALUE,
> > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > +                       adreno_gpu->has_ray_tracing =3D true;
> > +               }
> > +
> > +               return 0;
> > +       }
> > +
> > +       if (adreno_is_a750(adreno_gpu))
>
> Most of the function is under the if (adreno_is_a750) conditions. Can
> we invert the logic and add a single block of if(adreno_is_a750) and
> then place all the code underneath?
>
> > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > +
> > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* On a750 raytracing may be disabled by the firmware, find out=
 whether
> > +        * that's the case. The scm call above sets the fuse register.
> > +        */
> > +       if (adreno_is_a750(adreno_gpu)) {
> > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_S=
W_FUSE_VALUE);
>
> This register isn't accessible with the current sm8650.dtsi. Since DT
> and driver are going through different trees, please add safety guards
> here, so that the driver doesn't crash if used with older dtsi
> (not to mention that dts is considered to be an ABI and newer kernels
> are supposed not to break with older DT files).

I'd be happy if older kernels consistently worked with newer dtb, the
other direction is too much to ask.  If necessary we can ask for ack
to land the dts fix thru msm-next somehow, but since the gpu is newly
enabled device landing in the same merge window I think that is not
necessary.

BR,
-R

> > +               adreno_gpu->has_ray_tracing =3D
> > +                       !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRA=
CING);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +
> >  #define GBIF_CLIENT_HALT_MASK          BIT(0)
> >  #define GBIF_ARB_HALT_MASK             BIT(1)
> >  #define VBIF_XIN_HALT_CTRL0_MASK       GENMASK(3, 0)
> > @@ -3094,6 +3173,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device =
*dev)
> >                 return ERR_PTR(ret);
> >         }
> >
> > +       if (adreno_is_a7xx(adreno_gpu)) {
> > +               ret =3D a7xx_cx_mem_init(a6xx_gpu);
> > +               if (ret) {
> > +                       a6xx_destroy(&(a6xx_gpu->base.base));
> > +                       return ERR_PTR(ret);
> > +               }
> > +       }
> > +
> >         if (gpu->aspace)
> >                 msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
> >                                 a6xx_fault_handler);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 77526892eb8c..4180f3149dd8 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -182,6 +182,8 @@ struct adreno_gpu {
> >          */
> >         const unsigned int *reg_offsets;
> >         bool gmu_is_wrapper;
> > +
> > +       bool has_ray_tracing;
> >  };
> >  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> >
> > --
> > 2.31.1
> >
>
>
> --
> With best wishes
> Dmitry
