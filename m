Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A58B3788
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 14:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA0D10F059;
	Fri, 26 Apr 2024 12:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S/KFDkMU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C47410F059
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 12:54:29 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6ee0642f718so2382704b3a.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714136069; x=1714740869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvHSmxPO3bv3+Us8pqufuGCxhhyShCntoTklTfCkcKc=;
 b=S/KFDkMUkQhf3oFM2F0qCJZ/TimLtcrkkcOKeT6naKqOvcmvgLDQfZT+pKnGAoCLX7
 p9iSsdk8lBVoCbOkNkTMRqHqHLVXLsh1OwMH5DY1rRmJ8uNv63+uyvz9vESXnw5slXKe
 4oEM30u8Eh2LjrW/hrdP/BLJfy84XDgQN7q9knOgLPpBMnO9nyPtJ7EaQ69eLkba8B4v
 URnmsHzbOpI4WqUJiLuvL32mUYShHcTzvbguMDsrXMXhroN+MPDSMMkN6AEXhQc6ZWSH
 bKfty8e3QJPqRs+6j/VjgSTEDHTo6WSNPAK6u003mnrA0PPZBldnhu3gBpFYeHrqVKV3
 MBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714136069; x=1714740869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xvHSmxPO3bv3+Us8pqufuGCxhhyShCntoTklTfCkcKc=;
 b=QXJJfpxC0QiX9gvM603M1kmMf7CleU0UMVtWFJKHDFrEF52UhTltF8vuhNyUsJOn8w
 WmNwVsR1C0ue9tf34xy9OhnLX7hSl5VmPBbEGQ0kDBJGTOAex1k8JXF1k9Ovm2FnnhFh
 NHC14zhnj3+YvBhTLxsmFyGbG2uT7hPN9We6ZoQsveuslP2EomuW5o6PQ9S0dAIl187X
 XPsBxzXSdaEoRrDX095zlaYXaDfV6IF2E09/2LNh+tdiKCpQ/zN2TP26f9zfG8XdpdCq
 U3RfP3sQhTNLFdNdEdMZ6u+dtDexH/OqIF5PDcXhH//hR+lIT07NSsRb597ul2wStGt0
 WVqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP1YqBVxG+FExLKkR3oar4yag8TBFcQunJ0LzvPcYmyyAUhRNWgK4ZvV42eDJDABk4gN6I1+EGbJS6BI1UVaHS23P46CSz59DZUcZjCzFJ
X-Gm-Message-State: AOJu0YxeWYYdc5pJb/yxB0CZ6X7JhUwMjgIaN2Zxuv1rVZpeJJCgyC4e
 h3BrofWpF73w9ZNRG9NYHDIHRk3yLrCXLYC/nAjdqJkSQqA/Bm7Rpu/M+Fuu9+m+AxLx/F/K3g4
 CeO9SW6esO9AoOjqwHZMlDMAyajE=
X-Google-Smtp-Source: AGHT+IGdoLx1QCZOfeq4n84Twe7LZbV2iZvSOpXCn1CtGXnHhGz7vJG63eUdIau/vYs7quyysf4OUXRGM75ALultSic=
X-Received: by 2002:a17:90b:3911:b0:2a5:3367:604b with SMTP id
 ob17-20020a17090b391100b002a53367604bmr4076806pjb.19.1714136068792; Fri, 26
 Apr 2024 05:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
In-Reply-To: <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 13:54:17 +0100
Message-ID: <CACu1E7H=A+qBQ8vDbAyzmQ85e-xFmAZsArWjstCdLSGuBupf8g@mail.gmail.com>
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

On Fri, Apr 26, 2024 at 1:35=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
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

Sorry, didn't finish this thought. I meant to ask if you wanted to
duplicate qcom_scm_is_available check and qcom_scm_gpu_init_regs
between a750+ and everything else.

Connor
