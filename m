Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3188B3AA4
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 17:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D068910EEDE;
	Fri, 26 Apr 2024 15:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EUWzcLcv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9DE10F104
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 15:08:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1e86d56b3bcso20615065ad.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714144092; x=1714748892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ctu0m4rM6+USl2xcHMefQK5yQcIRHLN6sIxyq7B3ozc=;
 b=EUWzcLcvW6Ni3KCX40Jct/U6QuojxHddGEO7T/mZDTCvAaDaG0lyoSxSWoxrdpI9J4
 BzHx03Vj1FH0YT+rPB1VXJNLgyJeQj7Oi1Wy2MIJ3s+40h30/Z2xKrhgjMUJEyRjvJXd
 OQ2DYuJ9bnop6ZVSKnrynTMFSGzuUjLH3B9hKOQ4CNFa15W9fjnWaOTAb7PMpj9bGlmb
 J7pCvwUZ+9qTO0i/N1V9eeJfGiCm+D53aBueCRCOpQNJDYpSlaQ8jTwtEK5p5Vx4RcIE
 sFM7vmqba06iqKktACYoVVqXDigqt9mMCwsJTcpGFdqTKD8RwJ1MbrSsv33rljw5Q9be
 nIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714144092; x=1714748892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctu0m4rM6+USl2xcHMefQK5yQcIRHLN6sIxyq7B3ozc=;
 b=rdzUirg6dUJAvCzCxe06hrZ1pSsYaEoZLJVI7krvEeA/tgmhm/mI/2lakM1xKSwXFi
 JnwaxjLewTOp7wZzxko1/UJQhPO8+zKTGuxDUYdBt9SG8ygvvWs4+zxfTM3242noR+Uf
 1zq7z2vkhZwJRZmO6V/rf6UBPxh5lxpCI1WjXYo8FUlV+wSL+cyhWxLZbAWHqJ4oJ912
 SK6hHyvKEMp5kiKpysyMTQ/LMB/R8TLue3A49KRMpmXDTrJpfJCV/oYIJ6wWduq0+yF2
 5bzxyEvyQfwPeXvNeMDQeuzVODexBweqI9Q9/udJUEyr/HWnXHS/txl787SOjdy5G4jH
 MPEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHCU7Z2ehXjLaSY9q3A6hp/HvqD/kbIVqCz9AeeE0KGffgAGIQHi090yV9W1O12True7bQDlQFJDJrQbgNzAQhnBWo9Bh0yqp89LtBGiTE
X-Gm-Message-State: AOJu0YwED8ccbxOawj0knsYA7bvat5UOKHpkvoFX8nhH3miG2C4eIRNm
 2mDOP1fmYEG5Nj/709EL75vvWNpB7fIJ2wr+obvAuQz0mKgU6i/8zPcstY0tNqK2quGDIhIb/AM
 jTut/GQIMaXN95QnMozEZs3sg/Bczgw==
X-Google-Smtp-Source: AGHT+IHL5Ivl2RDCWHbWaLV8CntELtFfdBiGDW53jCFsLGqxctCm6DXJ/RAHfnglm+21ZTWsNhtEezL9xIn/ZBTRzp4=
X-Received: by 2002:a17:902:d506:b0:1eb:fe3:3436 with SMTP id
 b6-20020a170902d50600b001eb0fe33436mr1888980plg.52.1714144091717; Fri, 26 Apr
 2024 08:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
 <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
 <CACu1E7HzDJz4JvwnO6uFa8uwTdQAUtazdJLKbZnN2AtxcVzGQQ@mail.gmail.com>
 <CAA8EJppVbMGT5r0WJ93gxGDeyYxu4yc4bXYHXt1yyTyX=nEUSQ@mail.gmail.com>
In-Reply-To: <CAA8EJppVbMGT5r0WJ93gxGDeyYxu4yc4bXYHXt1yyTyX=nEUSQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 16:08:00 +0100
Message-ID: <CACu1E7FuW48HLC2abdapaE4eGzw9DzOe0C5q_FJNMLEcpR3Q7g@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Fri, Apr 26, 2024 at 3:53=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 26 Apr 2024 at 17:05, Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Fri, Apr 26, 2024 at 2:31=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.com> wro=
te:
> > > >
> > > > On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com>=
 wrote:
> > > > > >
> > > > > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a m=
ethod to
> > > > > > initialize cx_mem. Copy this from downstream (minus BCL which w=
e
> > > > > > currently don't support). On a750, this includes a new "fuse" r=
egister
> > > > > > which can be used by qcom_scm to fuse off certain features like
> > > > > > raytracing in software. The fuse is default off, and is initial=
ized by
> > > > > > calling the method. Afterwards we have to read it to find out w=
hich
> > > > > > features were enabled.
> > > > > >
> > > > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++=
+++++++-
> > > > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > > > > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gp=
u/drm/msm/adreno/a6xx_gpu.c
> > > > > > index cf0b1de1c071..fb2722574ae5 100644
> > > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > @@ -10,6 +10,7 @@
> > > > > >
> > > > > >  #include <linux/bitfield.h>
> > > > > >  #include <linux/devfreq.h>
> > > > > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > > > >  #include <linux/pm_domain.h>
> > > > > >  #include <linux/soc/qcom/llcc-qcom.h>
> > > > > >
> > > > > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct ms=
m_gpu *gpu)
> > > > > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | =
\
> > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > > > > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > > > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > > > > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > > >
> > > > > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > > > > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > > > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct=
 msm_gpu *gpu)
> > > > > >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > > > >  }
> > > > > >
> > > > > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > > > > > +{
> > > > > > +       u32 status;
> > > > > > +
> > > > > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STAT=
US);
> > > > > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > > > > +
> > > > > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation=
 status=3D%8.8x\n", status);
> > > > > > +
> > > > > > +       /* Ignore FASTBLEND violations, because the HW will sil=
ently fall back
> > > > > > +        * to legacy blending.
> > > > > > +        */
> > > > > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > > > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > > > > +               del_timer(&gpu->hangcheck_timer);
> > > > > > +
> > > > > > +               kthread_queue_work(gpu->worker, &gpu->recover_w=
ork);
> > > > > > +       }
> > > > > > +}
> > > > > > +
> > > > > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > > > > >  {
> > > > > >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > > > > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gp=
u *gpu)
> > > > > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > > > > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Ou=
t of bounds access\n");
> > > > > >
> > > > > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > > > > +
> > > > > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > > > > >                 msm_gpu_retire(gpu);
> > > > > >
> > > > > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct =
platform_device *pdev,
> > > > > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > > > > >  }
> > > > > >
> > > > > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > > > > +{
> > > > > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > > > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > > > > +       u32 fuse_val;
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       if (adreno_is_a740(adreno_gpu)) {
> > > > > > +               /* Raytracing is always enabled on a740 */
> > > > > > +               adreno_gpu->has_ray_tracing =3D true;
> > > > > > +       }
> > > > > > +
> > > > > > +       if (!qcom_scm_is_available()) {
> > > > > > +               /* Assume that if qcom scm isn't available, tha=
t whatever
> > > > > > +                * replacement allows writing the fuse register=
 ourselves.
> > > > > > +                * Users of alternative firmware need to make s=
ure this
> > > > > > +                * register is writeable or indicate that it's =
not somehow.
> > > > > > +                * Print a warning because if you mess this up =
you're about to
> > > > > > +                * crash horribly.
> > > > > > +                */
> > > > > > +               if (adreno_is_a750(adreno_gpu)) {
> > > > > > +                       dev_warn_once(gpu->dev->dev,
> > > > > > +                               "SCM is not available, poking f=
use register\n");
> > > > > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MI=
SC_SW_FUSE_VALUE,
> > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYT=
RACING |
> > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FAST=
BLEND |
> > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC=
);
> > > > > > +                       adreno_gpu->has_ray_tracing =3D true;
> > > > > > +               }
> > > > > > +
> > > > > > +               return 0;
> > > > > > +       }
> > > > > > +
> > > > > > +       if (adreno_is_a750(adreno_gpu))
> > > > >
> > > > > Most of the function is under the if (adreno_is_a750) conditions.=
 Can
> > > > > we invert the logic and add a single block of if(adreno_is_a750) =
and
> > > > > then place all the code underneath?
> > > >
> > > > You mean to duplicate the qcom_scm_is_available check and qcom_scm_
> > > >
> > > > >
> > > > > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > > > > +
> > > > > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > > > > +       if (ret)
> > > > > > +               return ret;
> > > > > > +
> > > > > > +       /* On a750 raytracing may be disabled by the firmware, =
find out whether
> > > > > > +        * that's the case. The scm call above sets the fuse re=
gister.
> > > > > > +        */
> > > > > > +       if (adreno_is_a750(adreno_gpu)) {
> > > > > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_C=
X_MISC_SW_FUSE_VALUE);
> > > > >
> > > > > This register isn't accessible with the current sm8650.dtsi. Sinc=
e DT
> > > > > and driver are going through different trees, please add safety g=
uards
> > > > > here, so that the driver doesn't crash if used with older dtsi
> > > >
> > > > I don't see how this is an issue. msm-next is currently based on 6.=
9,
> > > > which doesn't have the GPU defined in sm8650.dtsi. AFAIK patches 1 =
and
> > > > 2 will have to go through the linux-arm-msm tree, which will have t=
o
> > > > be merged into msm-next before this patch lands there, so there wil=
l
> > > > never be any breakage.
> > >
> > > linux-arm-msm isn't going to be merged into msm-next. If we do not as=
k
> > > for ack for the fix to go through msm-next, they will get these
> > > patches in parallel.
> >
> > I'm not familiar with how complicated cross-tree changes like this get
> > merged, but why would we merge these in parallel given that this patch
> > depends on the previous patch that introduces
> > qcom_scm_gpu_init_regs(), and that would (I assume?) normally go
> > through the same tree as patch 1? Even if patch 1 gets merged in
> > parallel in linux-arm-msm, in what scenario would we have a broken
> > boot? You won't have a devicetree with a working sm8650 GPU and
> > drm/msm with raytracing until linux-arm-msm is merged into msm-next at
> > which point patch 1 will have landed somehow.
>
> arch/arm64/qcom/dts and drivers/firmware/qcom are two separate trees.
> So yes, this needs a lot of coordination.



>
> >
> > >
> > > Another option is to get dtsi fix into 6.9 and delay the raytracing
> > > until 6.10-rc which doesn't make a lot of sense from my POV).
> > >
> > > >
> > > > > (not to mention that dts is considered to be an ABI and newer ker=
nels
> > > > > are supposed not to break with older DT files).
> > > >
> > > > That policy only applies to released kernels, so that's irrelevant =
here.
> > >
> > > It applies to all kernels, the reason being pretty simple: git-bisect
> > > should not be broken.
> >
> > As I wrote above, this is not an issue. The point I was making is that
> > mixing and matching dtb's from one unmerged subsystem tree and a
> > kernel from another isn't supported AFAIK, and that's the only
> > scenario where this could break.
>
> And it can happen if somebody running a bisect ends up in the branch
> with these patches in, but with the dtsi bits not being picked up.

That wouldn't be possible unless we merged the "bad" commit
introducing the GPU node to sm8650.dtsi into msm-next but not the fix.
So yeah, it's going to require a lot of careful cooperation but it
should be possible to avoid that happening.

Connor
