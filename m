Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188BC8B3877
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 15:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AB41123D2;
	Fri, 26 Apr 2024 13:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hYykuq3g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53691123D4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 13:31:51 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-de54c2a4145so2512971276.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714138311; x=1714743111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z9qAe36Cj6tNkkF7VwFJ0JlfB/3eMv2UT/DeO4zC6Bo=;
 b=hYykuq3gMB6OdX+Y2RYDgXCtqX5U4iTTKpba77uIORUctzk/VnhW0zqbJ+lFJX67DO
 m7jmPvN1Z70iOf/6JnPxgRPy1hamz4iUVanxTcge66vPOrtN1VsJx9cbPOptC9IellFc
 S4fa+2yvha56Je0LPZ5r3U+ee7YXhK8fDMMeVaZiUPNslBFudzixmFW2Z5RabtRQntNN
 BPRMy6nyBcE0H0YtmdRPdQB4QwIoH4wOa0W6yEMQPWiB5q7wXUwdwqmX8qdjUFb4q8qw
 ojxBHXy6FjfASlHxUt4vOXLCM5N2XY+IND5MG994aYT8GkOv2kp/BaTro6xKQqpfgidc
 ozDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714138311; x=1714743111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z9qAe36Cj6tNkkF7VwFJ0JlfB/3eMv2UT/DeO4zC6Bo=;
 b=asKT8yXwUhjZ7imGfzLAMZ619JP0P7HuU//hOiPd0cxJbR1UtaBotKLF/aqBqdmVxt
 qIqhaw4iM+95yg/qPOXeKnSpZhh4aD7rWW2V1N0NJMRVqP4GCNi7du547b1vbKkT4yJD
 FEfzNtGS/Nu0bhV2DCnRIuhNdkgsl2u7QQ86QujjjqBU1jyVvW4ISiDGa/a9NJUU1H07
 CSk3nCcFU6JTGAoavxzEtEu07Q/G+GaAQf0D20wmB0XKn5jJDgw1rHFopgiIi60HPvgt
 pGvTi3+d+rbRsjbeZCj87ZpxwqrrjrUHPWv8IJtZ53t52LUNkVOiuMC3lWBqF1JAuQh9
 IbAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhLrVhLeDhVOlvnyw31jYYiiB9wEUTKQNHaUWnOb4YwiS0SgPJEmbo+QxK2cZXQVKzcmq+cuRImZGQxlp3CGOcGzaCAMEFd/aPfKyEP2aT
X-Gm-Message-State: AOJu0YwDXpv5ARAktzRmVoXjiOU8bKX/eBn9zAH8uk9YaJ9syaeaXmjw
 6A2kW0IE31easctrUwYB6Mo7BbIkAZiFSzBwJtjTTnZCiyP3rfDKzwZqsJanbVXh0YfZb1hNtcs
 YFu533qudmObO7T4PB/ymr1DSkBIHAe7z5QrDJA==
X-Google-Smtp-Source: AGHT+IGRS1b6FBVwW8+cIPrgKO3C49UgnZkg1LJV4sNTUOD5x7UhBEmPEP1Nu3drSgYTsXYlnueFid/FlHxHIowg1K0=
X-Received: by 2002:a25:acdc:0:b0:de4:613c:a63 with SMTP id
 x28-20020a25acdc000000b00de4613c0a63mr2792665ybd.53.1714138310698; Fri, 26
 Apr 2024 06:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
In-Reply-To: <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 16:31:39 +0300
Message-ID: <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote=
:
> > >
> > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method =
to
> > > initialize cx_mem. Copy this from downstream (minus BCL which we
> > > currently don't support). On a750, this includes a new "fuse" registe=
r
> > > which can be used by qcom_scm to fuse off certain features like
> > > raytracing in software. The fuse is default off, and is initialized b=
y
> > > calling the method. Afterwards we have to read it to find out which
> > > features were enabled.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> > > index cf0b1de1c071..fb2722574ae5 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -10,6 +10,7 @@
> > >
> > >  #include <linux/bitfield.h>
> > >  #include <linux/devfreq.h>
> > > +#include <linux/firmware/qcom/qcom_scm.h>
> > >  #include <linux/pm_domain.h>
> > >  #include <linux/soc/qcom/llcc-qcom.h>
> > >
> > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu =
*gpu)
> > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
> > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > >
> > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm_g=
pu *gpu)
> > >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> > >  }
> > >
> > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > > +{
> > > +       u32 status;
> > > +
> > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > +
> > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation statu=
s=3D%8.8x\n", status);
> > > +
> > > +       /* Ignore FASTBLEND violations, because the HW will silently =
fall back
> > > +        * to legacy blending.
> > > +        */
> > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > +               del_timer(&gpu->hangcheck_timer);
> > > +
> > > +               kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > +       }
> > > +}
> > > +
> > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > >  {
> > >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu=
)
> > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of b=
ounds access\n");
> > >
> > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > +
> > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > >                 msm_gpu_retire(gpu);
> > >
> > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct platfo=
rm_device *pdev,
> > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > >  }
> > >
> > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > +{
> > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > +       u32 fuse_val;
> > > +       int ret;
> > > +
> > > +       if (adreno_is_a740(adreno_gpu)) {
> > > +               /* Raytracing is always enabled on a740 */
> > > +               adreno_gpu->has_ray_tracing =3D true;
> > > +       }
> > > +
> > > +       if (!qcom_scm_is_available()) {
> > > +               /* Assume that if qcom scm isn't available, that what=
ever
> > > +                * replacement allows writing the fuse register ourse=
lves.
> > > +                * Users of alternative firmware need to make sure th=
is
> > > +                * register is writeable or indicate that it's not so=
mehow.
> > > +                * Print a warning because if you mess this up you're=
 about to
> > > +                * crash horribly.
> > > +                */
> > > +               if (adreno_is_a750(adreno_gpu)) {
> > > +                       dev_warn_once(gpu->dev->dev,
> > > +                               "SCM is not available, poking fuse re=
gister\n");
> > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_=
FUSE_VALUE,
> > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING=
 |
> > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND =
|
> > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > > +                       adreno_gpu->has_ray_tracing =3D true;
> > > +               }
> > > +
> > > +               return 0;
> > > +       }
> > > +
> > > +       if (adreno_is_a750(adreno_gpu))
> >
> > Most of the function is under the if (adreno_is_a750) conditions. Can
> > we invert the logic and add a single block of if(adreno_is_a750) and
> > then place all the code underneath?
>
> You mean to duplicate the qcom_scm_is_available check and qcom_scm_
>
> >
> > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > +
> > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       /* On a750 raytracing may be disabled by the firmware, find o=
ut whether
> > > +        * that's the case. The scm call above sets the fuse register=
.
> > > +        */
> > > +       if (adreno_is_a750(adreno_gpu)) {
> > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC=
_SW_FUSE_VALUE);
> >
> > This register isn't accessible with the current sm8650.dtsi. Since DT
> > and driver are going through different trees, please add safety guards
> > here, so that the driver doesn't crash if used with older dtsi
>
> I don't see how this is an issue. msm-next is currently based on 6.9,
> which doesn't have the GPU defined in sm8650.dtsi. AFAIK patches 1 and
> 2 will have to go through the linux-arm-msm tree, which will have to
> be merged into msm-next before this patch lands there, so there will
> never be any breakage.

linux-arm-msm isn't going to be merged into msm-next. If we do not ask
for ack for the fix to go through msm-next, they will get these
patches in parallel.

Another option is to get dtsi fix into 6.9 and delay the raytracing
until 6.10-rc which doesn't make a lot of sense from my POV).

>
> > (not to mention that dts is considered to be an ABI and newer kernels
> > are supposed not to break with older DT files).
>
> That policy only applies to released kernels, so that's irrelevant here.

It applies to all kernels, the reason being pretty simple: git-bisect
should not be broken.

--=20
With best wishes
Dmitry
