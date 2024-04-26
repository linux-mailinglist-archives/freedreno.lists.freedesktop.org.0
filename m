Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F68B3974
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 16:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220DF11243B;
	Fri, 26 Apr 2024 14:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DKsblSDJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5CB112441
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 14:05:54 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2a2da57ab3aso1920202a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714140354; x=1714745154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5dTpmBdvDBHOQz9u6EbUQ2ugbHPDpDdNDCCOVQblDM=;
 b=DKsblSDJMEABLkAOmAJEQlajrRlrfetdANYSnzR32C8WhaysRBTD2SGJvxM9Dfw3LY
 bOQIGX1LFJHhdkfa5hbCdDsM6E7d7OA7rmcVFzDhPca5hELFJAIE7FgZFxhqZ29ACi/g
 tyGyMTPEpvgt5anj1X/lhLVPDmDVQXLH69mmjZY9cf/L0LgW4HuXo9YwTf6RG/bB9osk
 dk/jM8JuR3v2XpH2F2qKR6ajLjmtM/byoKgAR4Dy8b7fRBDMDAwZg+tmOZc73262S2Vt
 oYEepoVhC9XPmgRZyiZL+6naayjSsgiGoZB28NK02cKAoppQ9JEE3t3fuuzK3VHBF6HI
 RJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714140354; x=1714745154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5dTpmBdvDBHOQz9u6EbUQ2ugbHPDpDdNDCCOVQblDM=;
 b=gOmXqwBuL+VYLIbm46sQ2cTbP+IlaPIgyiOBMwErO4zk0N4bZGfystdOQVby6u6cE5
 B6IEvx6UnnfSPthJTKzpCUXQsg2+XRl06uA+DhuX+GWCYj9vd+U2zlV7bPfoKFOMDNsF
 20XRfAAgCYRC1aNgn4xnrCh+nB0GcAVhWp6L8F7rSrjZ78IQnGupP9UfrRHtAVsXnMrg
 hcx3zH0+Y/OWBucn8jgEjdrtwC9bWNxuUeP8TOK/Mna+FntSSsZvxDUH6JlBvGQWus94
 ovHO+Cgv+cu2fPPFtnrHIKWIsPTwKIBvHiQGCecfbSC4voeJ8Z8yI294do5gk6RraS5a
 gkZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUahmeuM/wZb8Wb1rcGd9/58vP0H1cQDSjeSP3FpIdAlR7IE3+9TzTSODMilpJQVHZq8fIZsh9/E3wD97CvAdPj7cxPet8m3uJNXGaddC8y
X-Gm-Message-State: AOJu0YyQgAjIArjlFnBQgNiourodaSXHexcONjN1Ws3vs2GXPZcg0Xj9
 vkZMdOPD9nmpU7s1TbeoNRnAjJszojo40hJ9ixGGQnCcoFfhpH4xw60vEKno3o1vqNOeOVi49Hw
 itYl7Q7m5pZ/+wfY26GOHPfAMNN8=
X-Google-Smtp-Source: AGHT+IE9sSl2KSHnMdleuvQ8PE1Ie+5o9K1s7alGLa74eGpTI7mTupjf52xQkM4quMYL/+FpXatWxXFTgbNRFxBWiXw=
X-Received: by 2002:a17:90b:3d86:b0:2ac:40c8:1ed3 with SMTP id
 pq6-20020a17090b3d8600b002ac40c81ed3mr2951022pjb.5.1714140353892; Fri, 26 Apr
 2024 07:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
 <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
In-Reply-To: <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 15:05:42 +0100
Message-ID: <CACu1E7HzDJz4JvwnO6uFa8uwTdQAUtazdJLKbZnN2AtxcVzGQQ@mail.gmail.com>
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

On Fri, Apr 26, 2024 at 2:31=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wro=
te:
> > > >
> > > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a metho=
d to
> > > > initialize cx_mem. Copy this from downstream (minus BCL which we
> > > > currently don't support). On a750, this includes a new "fuse" regis=
ter
> > > > which can be used by qcom_scm to fuse off certain features like
> > > > raytracing in software. The fuse is default off, and is initialized=
 by
> > > > calling the method. Afterwards we have to read it to find out which
> > > > features were enabled.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu.c
> > > > index cf0b1de1c071..fb2722574ae5 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > @@ -10,6 +10,7 @@
> > > >
> > > >  #include <linux/bitfield.h>
> > > >  #include <linux/devfreq.h>
> > > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > >  #include <linux/pm_domain.h>
> > > >  #include <linux/soc/qcom/llcc-qcom.h>
> > > >
> > > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gp=
u *gpu)
> > > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
> > > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> > > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > >
> > > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm=
_gpu *gpu)
> > > >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > >  }
> > > >
> > > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > > > +{
> > > > +       u32 status;
> > > > +
> > > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> > > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > > +
> > > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation sta=
tus=3D%8.8x\n", status);
> > > > +
> > > > +       /* Ignore FASTBLEND violations, because the HW will silentl=
y fall back
> > > > +        * to legacy blending.
> > > > +        */
> > > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > > +               del_timer(&gpu->hangcheck_timer);
> > > > +
> > > > +               kthread_queue_work(gpu->worker, &gpu->recover_work)=
;
> > > > +       }
> > > > +}
> > > > +
> > > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > > >  {
> > > >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *g=
pu)
> > > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of=
 bounds access\n");
> > > >
> > > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > > +
> > > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > > >                 msm_gpu_retire(gpu);
> > > >
> > > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct plat=
form_device *pdev,
> > > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > > >  }
> > > >
> > > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > > +{
> > > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > > +       u32 fuse_val;
> > > > +       int ret;
> > > > +
> > > > +       if (adreno_is_a740(adreno_gpu)) {
> > > > +               /* Raytracing is always enabled on a740 */
> > > > +               adreno_gpu->has_ray_tracing =3D true;
> > > > +       }
> > > > +
> > > > +       if (!qcom_scm_is_available()) {
> > > > +               /* Assume that if qcom scm isn't available, that wh=
atever
> > > > +                * replacement allows writing the fuse register our=
selves.
> > > > +                * Users of alternative firmware need to make sure =
this
> > > > +                * register is writeable or indicate that it's not =
somehow.
> > > > +                * Print a warning because if you mess this up you'=
re about to
> > > > +                * crash horribly.
> > > > +                */
> > > > +               if (adreno_is_a750(adreno_gpu)) {
> > > > +                       dev_warn_once(gpu->dev->dev,
> > > > +                               "SCM is not available, poking fuse =
register\n");
> > > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_S=
W_FUSE_VALUE,
> > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACI=
NG |
> > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEN=
D |
> > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > > > +                       adreno_gpu->has_ray_tracing =3D true;
> > > > +               }
> > > > +
> > > > +               return 0;
> > > > +       }
> > > > +
> > > > +       if (adreno_is_a750(adreno_gpu))
> > >
> > > Most of the function is under the if (adreno_is_a750) conditions. Can
> > > we invert the logic and add a single block of if(adreno_is_a750) and
> > > then place all the code underneath?
> >
> > You mean to duplicate the qcom_scm_is_available check and qcom_scm_
> >
> > >
> > > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > > +
> > > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       /* On a750 raytracing may be disabled by the firmware, find=
 out whether
> > > > +        * that's the case. The scm call above sets the fuse regist=
er.
> > > > +        */
> > > > +       if (adreno_is_a750(adreno_gpu)) {
> > > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MI=
SC_SW_FUSE_VALUE);
> > >
> > > This register isn't accessible with the current sm8650.dtsi. Since DT
> > > and driver are going through different trees, please add safety guard=
s
> > > here, so that the driver doesn't crash if used with older dtsi
> >
> > I don't see how this is an issue. msm-next is currently based on 6.9,
> > which doesn't have the GPU defined in sm8650.dtsi. AFAIK patches 1 and
> > 2 will have to go through the linux-arm-msm tree, which will have to
> > be merged into msm-next before this patch lands there, so there will
> > never be any breakage.
>
> linux-arm-msm isn't going to be merged into msm-next. If we do not ask
> for ack for the fix to go through msm-next, they will get these
> patches in parallel.

I'm not familiar with how complicated cross-tree changes like this get
merged, but why would we merge these in parallel given that this patch
depends on the previous patch that introduces
qcom_scm_gpu_init_regs(), and that would (I assume?) normally go
through the same tree as patch 1? Even if patch 1 gets merged in
parallel in linux-arm-msm, in what scenario would we have a broken
boot? You won't have a devicetree with a working sm8650 GPU and
drm/msm with raytracing until linux-arm-msm is merged into msm-next at
which point patch 1 will have landed somehow.

>
> Another option is to get dtsi fix into 6.9 and delay the raytracing
> until 6.10-rc which doesn't make a lot of sense from my POV).
>
> >
> > > (not to mention that dts is considered to be an ABI and newer kernels
> > > are supposed not to break with older DT files).
> >
> > That policy only applies to released kernels, so that's irrelevant here=
.
>
> It applies to all kernels, the reason being pretty simple: git-bisect
> should not be broken.

As I wrote above, this is not an issue. The point I was making is that
mixing and matching dtb's from one unmerged subsystem tree and a
kernel from another isn't supported AFAIK, and that's the only
scenario where this could break.

Connor
