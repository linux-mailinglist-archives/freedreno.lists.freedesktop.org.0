Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971238B3B3F
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 17:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C0D1124B6;
	Fri, 26 Apr 2024 15:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LT6lO1rI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A691124B6
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 15:24:28 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-de467733156so2447568276.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714145067; x=1714749867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JBzkBCm78qyNFfCQLmJXJ4kF+yVvPrUVj5isrgfib4=;
 b=LT6lO1rIhsUOp3zIB16PKSxloPMi5/cldJeticegV393n4AHOZBEYzuxSOk4CgSszb
 0K2sOsf7lXFZswpuos7QJclcAAL29HhKRetisUHOFUTYIZZnW6HJ29poOiSTDoBCg+rZ
 fE4w1qhvwTSmX8cbZLCc7nMvJa/umqr5PTu+dQ4qFn6vDnqqtGENC4rrGYeHE9e/I0s0
 pxmafH2B4D4aCM/ZOJD++1QdgKg382DZ6LBqdYEOZfd9/85c78qb+wXPyAQF3EQFBy3+
 Ijic/nGDpgrvjxFIkOo3cD4bNdqcvd2NUsYJBxKNOxmik5w6yDfszV/obaX54ASS9wxL
 mqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714145067; x=1714749867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JBzkBCm78qyNFfCQLmJXJ4kF+yVvPrUVj5isrgfib4=;
 b=Bxq1gK0jev8kighPxSGvaErrqCw72fm+NynW8Aqwamm0GG9tS/utlg4VB8mf8CfWcm
 CZri9jA9o/4Si3YYybA4llu41VFSPvcyN2gOxFWdu5Azb51SCq4y6HcDSHBb1a7v0lr2
 BRYXHco8XiC/UBEDd8i16Xc16/EfeZA1wnROcMAuBDgYn22kxZKnNq2c1sJ2imztAE5Y
 2ixSVasIfip707q58ooOi+LVmRAms1BWCwKfMby6EyHii0FY3lTRUuzlPKhUVO8TSPpv
 ZJb/CwjTxKPRRj+GtSZKxb0lEGiNG4c3JZd/USXsgy1i3UTpIqnDPoZ2nj9f5NThysg6
 c/XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURwoj/BSZj5vq/ZUv7us8UgIui0bBpWkBMY2r4a6SlP9KuPtoLPoNhcmPx669E7bcw3sV5BA0H+lNgj6vxZbyjfVZcbeBouzFf4OUl5c/l
X-Gm-Message-State: AOJu0YxHZcozB3ijxA5tt8TE79Z1mQReEikO8urkNEx8mSrTjmLxFkeu
 7rO5O8JdNBoFBHwmv0TaZvYCACQuc610WgS+UuQQLRzvRay6OfsKAilHZM6LzfhpAmPqftvYXGm
 WG8ubnaIdgn3LHpyhLTg0EelQksACi4xkvXedAg==
X-Google-Smtp-Source: AGHT+IHYTQSjKpyXzmmiIfMqjyBEUgkdIdiUpsX/56GjFaNIdClf2ptwSTQXRF2jdJuN0RrriEeUYFc/nGEEZSkbiys=
X-Received: by 2002:a25:d353:0:b0:dc6:c2b2:c039 with SMTP id
 e80-20020a25d353000000b00dc6c2b2c039mr3649296ybf.41.1714145066577; Fri, 26
 Apr 2024 08:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
 <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
 <CACu1E7HzDJz4JvwnO6uFa8uwTdQAUtazdJLKbZnN2AtxcVzGQQ@mail.gmail.com>
 <CAA8EJppVbMGT5r0WJ93gxGDeyYxu4yc4bXYHXt1yyTyX=nEUSQ@mail.gmail.com>
 <CACu1E7FuW48HLC2abdapaE4eGzw9DzOe0C5q_FJNMLEcpR3Q7g@mail.gmail.com>
In-Reply-To: <CACu1E7FuW48HLC2abdapaE4eGzw9DzOe0C5q_FJNMLEcpR3Q7g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 18:24:15 +0300
Message-ID: <CAA8EJpoqwvfoK4AP1jCk2YRAfeMk3bpJHwrGEvBFXCPMyXU3CA@mail.gmail.com>
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

On Fri, 26 Apr 2024 at 18:08, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Fri, Apr 26, 2024 at 3:53=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, 26 Apr 2024 at 17:05, Connor Abbott <cwabbott0@gmail.com> wrote=
:
> > >
> > > On Fri, Apr 26, 2024 at 2:31=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.com> w=
rote:
> > > > >
> > > > > On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> > > > > > >
> > > > > > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a=
 method to
> > > > > > > initialize cx_mem. Copy this from downstream (minus BCL which=
 we
> > > > > > > currently don't support). On a750, this includes a new "fuse"=
 register
> > > > > > > which can be used by qcom_scm to fuse off certain features li=
ke
> > > > > > > raytracing in software. The fuse is default off, and is initi=
alized by
> > > > > > > calling the method. Afterwards we have to read it to find out=
 which
> > > > > > > features were enabled.
> > > > > > >
> > > > > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++=
+++++++++-
> > > > > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > > > > > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/=
gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > index cf0b1de1c071..fb2722574ae5 100644
> > > > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > @@ -10,6 +10,7 @@
> > > > > > >
> > > > > > >  #include <linux/bitfield.h>
> > > > > > >  #include <linux/devfreq.h>
> > > > > > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > > > > >  #include <linux/pm_domain.h>
> > > > > > >  #include <linux/soc/qcom/llcc-qcom.h>
> > > > > > >
> > > > > > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct =
msm_gpu *gpu)
> > > > > > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT =
| \
> > > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS |=
 \
> > > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | =
\
> > > > > > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > > > > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > > > > > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > > > >
> > > > > > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > > > > > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > > > > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(stru=
ct msm_gpu *gpu)
> > > > > > >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > > > > >  }
> > > > > > >
> > > > > > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > > > > > > +{
> > > > > > > +       u32 status;
> > > > > > > +
> > > > > > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_ST=
ATUS);
> > > > > > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > > > > > +
> > > > > > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violati=
on status=3D%8.8x\n", status);
> > > > > > > +
> > > > > > > +       /* Ignore FASTBLEND violations, because the HW will s=
ilently fall back
> > > > > > > +        * to legacy blending.
> > > > > > > +        */
> > > > > > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > > > > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > > > > > +               del_timer(&gpu->hangcheck_timer);
> > > > > > > +
> > > > > > > +               kthread_queue_work(gpu->worker, &gpu->recover=
_work);
> > > > > > > +       }
> > > > > > > +}
> > > > > > > +
> > > > > > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > > > > > >  {
> > > > > > >         struct msm_drm_private *priv =3D gpu->dev->dev_privat=
e;
> > > > > > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_=
gpu *gpu)
> > > > > > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > > > > > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | =
Out of bounds access\n");
> > > > > > >
> > > > > > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > > > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > > > > > +
> > > > > > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > > > > > >                 msm_gpu_retire(gpu);
> > > > > > >
> > > > > > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struc=
t platform_device *pdev,
> > > > > > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > > > > > >  }
> > > > > > >
> > > > > > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > > > > > +{
> > > > > > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > > > > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > > > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > > > > > +       u32 fuse_val;
> > > > > > > +       int ret;
> > > > > > > +
> > > > > > > +       if (adreno_is_a740(adreno_gpu)) {
> > > > > > > +               /* Raytracing is always enabled on a740 */
> > > > > > > +               adreno_gpu->has_ray_tracing =3D true;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       if (!qcom_scm_is_available()) {
> > > > > > > +               /* Assume that if qcom scm isn't available, t=
hat whatever
> > > > > > > +                * replacement allows writing the fuse regist=
er ourselves.
> > > > > > > +                * Users of alternative firmware need to make=
 sure this
> > > > > > > +                * register is writeable or indicate that it'=
s not somehow.
> > > > > > > +                * Print a warning because if you mess this u=
p you're about to
> > > > > > > +                * crash horribly.
> > > > > > > +                */
> > > > > > > +               if (adreno_is_a750(adreno_gpu)) {
> > > > > > > +                       dev_warn_once(gpu->dev->dev,
> > > > > > > +                               "SCM is not available, poking=
 fuse register\n");
> > > > > > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_=
MISC_SW_FUSE_VALUE,
> > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RA=
YTRACING |
> > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FA=
STBLEND |
> > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LP=
AC);
> > > > > > > +                       adreno_gpu->has_ray_tracing =3D true;
> > > > > > > +               }
> > > > > > > +
> > > > > > > +               return 0;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       if (adreno_is_a750(adreno_gpu))
> > > > > >
> > > > > > Most of the function is under the if (adreno_is_a750) condition=
s. Can
> > > > > > we invert the logic and add a single block of if(adreno_is_a750=
) and
> > > > > > then place all the code underneath?
> > > > >
> > > > > You mean to duplicate the qcom_scm_is_available check and qcom_sc=
m_
> > > > >
> > > > > >
> > > > > > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > > > > > +
> > > > > > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > > > > > +       if (ret)
> > > > > > > +               return ret;
> > > > > > > +
> > > > > > > +       /* On a750 raytracing may be disabled by the firmware=
, find out whether
> > > > > > > +        * that's the case. The scm call above sets the fuse =
register.
> > > > > > > +        */
> > > > > > > +       if (adreno_is_a750(adreno_gpu)) {
> > > > > > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX=
_CX_MISC_SW_FUSE_VALUE);
> > > > > >
> > > > > > This register isn't accessible with the current sm8650.dtsi. Si=
nce DT
> > > > > > and driver are going through different trees, please add safety=
 guards
> > > > > > here, so that the driver doesn't crash if used with older dtsi
> > > > >
> > > > > I don't see how this is an issue. msm-next is currently based on =
6.9,
> > > > > which doesn't have the GPU defined in sm8650.dtsi. AFAIK patches =
1 and
> > > > > 2 will have to go through the linux-arm-msm tree, which will have=
 to
> > > > > be merged into msm-next before this patch lands there, so there w=
ill
> > > > > never be any breakage.
> > > >
> > > > linux-arm-msm isn't going to be merged into msm-next. If we do not =
ask
> > > > for ack for the fix to go through msm-next, they will get these
> > > > patches in parallel.
> > >
> > > I'm not familiar with how complicated cross-tree changes like this ge=
t
> > > merged, but why would we merge these in parallel given that this patc=
h
> > > depends on the previous patch that introduces
> > > qcom_scm_gpu_init_regs(), and that would (I assume?) normally go
> > > through the same tree as patch 1? Even if patch 1 gets merged in
> > > parallel in linux-arm-msm, in what scenario would we have a broken
> > > boot? You won't have a devicetree with a working sm8650 GPU and
> > > drm/msm with raytracing until linux-arm-msm is merged into msm-next a=
t
> > > which point patch 1 will have landed somehow.
> >
> > arch/arm64/qcom/dts and drivers/firmware/qcom are two separate trees.
> > So yes, this needs a lot of coordination.
>
>
>
> >
> > >
> > > >
> > > > Another option is to get dtsi fix into 6.9 and delay the raytracing
> > > > until 6.10-rc which doesn't make a lot of sense from my POV).
> > > >
> > > > >
> > > > > > (not to mention that dts is considered to be an ABI and newer k=
ernels
> > > > > > are supposed not to break with older DT files).
> > > > >
> > > > > That policy only applies to released kernels, so that's irrelevan=
t here.
> > > >
> > > > It applies to all kernels, the reason being pretty simple: git-bise=
ct
> > > > should not be broken.
> > >
> > > As I wrote above, this is not an issue. The point I was making is tha=
t
> > > mixing and matching dtb's from one unmerged subsystem tree and a
> > > kernel from another isn't supported AFAIK, and that's the only
> > > scenario where this could break.
> >
> > And it can happen if somebody running a bisect ends up in the branch
> > with these patches in, but with the dtsi bits not being picked up.
>
> That wouldn't be possible unless we merged the "bad" commit
> introducing the GPU node to sm8650.dtsi into msm-next but not the fix.
> So yeah, it's going to require a lot of careful cooperation but it
> should be possible to avoid that happening.

Well, the GPU node is already there in the linux-next.

Anyway. Please. Don't break compat with old DTS. That is a rule of thumb.


--=20
With best wishes
Dmitry
