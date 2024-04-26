Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30938B3A6B
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 16:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F0310F2CD;
	Fri, 26 Apr 2024 14:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Pazpsh5X";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A9210F0E7
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 14:53:37 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-ddda842c399so2304951276.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714143217; x=1714748017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhTklF2ssw03aSEnPuH/7wuRfYWVRoL485tWE+/Aod0=;
 b=Pazpsh5X7aIJj5Rhn6N21AJzYuHAvuZ3xtzArOoCmHes7P4wbxrLdbc6Xs3s/y0epF
 4gFyTTjp/QB1I6r2NNAlLaD/saIRlXS562fwPJxQJYjF9pfo3GFfE81EeAEVDJVDCizM
 d5t/HFOqJeREC8pfKKYD2c8lxnfuYEheFuq7bXb+sG+AfbbRww6vfHNV4AnFSBTGUCV/
 3h2yV+6V80e7HSGYqmqQ2Fs93NnwGa0Pf4nlG7BC7c2H0WfXVK2bA8mW8VIeLFyDLKOR
 sRhoUFm0zHDzTK/oEtO56ZHfuX0rS/HgxvtAXra4MeXjG4vzfAeaKMFH0w0BekJJPjUj
 OZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714143217; x=1714748017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhTklF2ssw03aSEnPuH/7wuRfYWVRoL485tWE+/Aod0=;
 b=aAYZ0XIAqOnN0nsZGzfPNxh6sDfhpcQytxD+nK38XTp2Z2a9YXlUT9GZ5luO0SGs6g
 hqSeWQd3WqR6GEOj09O7tsVSTCv7FK+p6e1tE7Jm090AiQg2mMv7LjDWu2ufdEkHQILD
 zX4mE4eDNh6TnQ5WVv1vte7Z4p4xvSzoE4+auNaKyz2k8VN3ydSUBiAQoCxetCIEK8QL
 I6lkfv1tWE409fmPmwQK4RH94sWF+RST2stF1tumRPb4kLUCxZWJXFTzZpftAyNhytDe
 N5ZhexoGIblsYzAcpGTRhFsaYD3XUp+DDALMtSu7YTbGxO2+pmQxhn43HH+TfuPGQ0ey
 l+kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtb/TgEaY09T4VEgxxfvTjCy/hh/V/oXg1Is+Sx35XodEyBktrD2zgU+kM0ipEqtqlFqJtgPGZOwRkc7clBLraWfxAAVxfP3AyZNXBeUkh
X-Gm-Message-State: AOJu0YzlGUCkkFcF0hF3FGldp/pELld799xfF80flqYkeEoC8BmSi+E6
 oPjs3TNAiCaNrIenLiTwG7pcskI0NRHlL+pUa7syJhefrOot7F4d0KavW4NSDGsuPz/CjCM2Cs8
 WiBb5zszD2qRxqQnubUVfqih+FDqARE/xoPWIuw==
X-Google-Smtp-Source: AGHT+IHom/4/jqDtGGAX6E3bCdeQXmUtQv6RYoq6Z3Vii4M3VzC7Cd6xLjdGWXyWi7qzfecBCnl7fXcNuVR1k1fxIxU=
X-Received: by 2002:a25:9347:0:b0:de0:deb0:c363 with SMTP id
 g7-20020a259347000000b00de0deb0c363mr3496389ybo.31.1714143216763; Fri, 26 Apr
 2024 07:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
 <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
 <CACu1E7HzDJz4JvwnO6uFa8uwTdQAUtazdJLKbZnN2AtxcVzGQQ@mail.gmail.com>
In-Reply-To: <CACu1E7HzDJz4JvwnO6uFa8uwTdQAUtazdJLKbZnN2AtxcVzGQQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 17:53:25 +0300
Message-ID: <CAA8EJppVbMGT5r0WJ93gxGDeyYxu4yc4bXYHXt1yyTyX=nEUSQ@mail.gmail.com>
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

On Fri, 26 Apr 2024 at 17:05, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Fri, Apr 26, 2024 at 2:31=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.com> wrote=
:
> > >
> > > On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> w=
rote:
> > > > >
> > > > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a met=
hod to
> > > > > initialize cx_mem. Copy this from downstream (minus BCL which we
> > > > > currently don't support). On a750, this includes a new "fuse" reg=
ister
> > > > > which can be used by qcom_scm to fuse off certain features like
> > > > > raytracing in software. The fuse is default off, and is initializ=
ed by
> > > > > calling the method. Afterwards we have to read it to find out whi=
ch
> > > > > features were enabled.
> > > > >
> > > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++++++++++=
+++++-
> > > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > > > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu.c
> > > > > index cf0b1de1c071..fb2722574ae5 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > @@ -10,6 +10,7 @@
> > > > >
> > > > >  #include <linux/bitfield.h>
> > > > >  #include <linux/devfreq.h>
> > > > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > > >  #include <linux/pm_domain.h>
> > > > >  #include <linux/soc/qcom/llcc-qcom.h>
> > > > >
> > > > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_=
gpu *gpu)
> > > > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
> > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
> > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> > > > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> > > > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> > > > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > >
> > > > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > > > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct m=
sm_gpu *gpu)
> > > > >         kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > > >  }
> > > > >
> > > > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> > > > > +{
> > > > > +       u32 status;
> > > > > +
> > > > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS=
);
> > > > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> > > > > +
> > > > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation s=
tatus=3D%8.8x\n", status);
> > > > > +
> > > > > +       /* Ignore FASTBLEND violations, because the HW will silen=
tly fall back
> > > > > +        * to legacy blending.
> > > > > +        */
> > > > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> > > > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > > > +               del_timer(&gpu->hangcheck_timer);
> > > > > +
> > > > > +               kthread_queue_work(gpu->worker, &gpu->recover_wor=
k);
> > > > > +       }
> > > > > +}
> > > > > +
> > > > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > > > >  {
> > > > >         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> > > > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu =
*gpu)
> > > > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
> > > > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out =
of bounds access\n");
> > > > >
> > > > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > > > +
> > > > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > > > >                 msm_gpu_retire(gpu);
> > > > >
> > > > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct pl=
atform_device *pdev,
> > > > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > > > >  }
> > > > >
> > > > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > > > +{
> > > > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > > > +       u32 fuse_val;
> > > > > +       int ret;
> > > > > +
> > > > > +       if (adreno_is_a740(adreno_gpu)) {
> > > > > +               /* Raytracing is always enabled on a740 */
> > > > > +               adreno_gpu->has_ray_tracing =3D true;
> > > > > +       }
> > > > > +
> > > > > +       if (!qcom_scm_is_available()) {
> > > > > +               /* Assume that if qcom scm isn't available, that =
whatever
> > > > > +                * replacement allows writing the fuse register o=
urselves.
> > > > > +                * Users of alternative firmware need to make sur=
e this
> > > > > +                * register is writeable or indicate that it's no=
t somehow.
> > > > > +                * Print a warning because if you mess this up yo=
u're about to
> > > > > +                * crash horribly.
> > > > > +                */
> > > > > +               if (adreno_is_a750(adreno_gpu)) {
> > > > > +                       dev_warn_once(gpu->dev->dev,
> > > > > +                               "SCM is not available, poking fus=
e register\n");
> > > > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC=
_SW_FUSE_VALUE,
> > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRA=
CING |
> > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBL=
END |
> > > > > +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> > > > > +                       adreno_gpu->has_ray_tracing =3D true;
> > > > > +               }
> > > > > +
> > > > > +               return 0;
> > > > > +       }
> > > > > +
> > > > > +       if (adreno_is_a750(adreno_gpu))
> > > >
> > > > Most of the function is under the if (adreno_is_a750) conditions. C=
an
> > > > we invert the logic and add a single block of if(adreno_is_a750) an=
d
> > > > then place all the code underneath?
> > >
> > > You mean to duplicate the qcom_scm_is_available check and qcom_scm_
> > >
> > > >
> > > > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > > > +
> > > > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       /* On a750 raytracing may be disabled by the firmware, fi=
nd out whether
> > > > > +        * that's the case. The scm call above sets the fuse regi=
ster.
> > > > > +        */
> > > > > +       if (adreno_is_a750(adreno_gpu)) {
> > > > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_=
MISC_SW_FUSE_VALUE);
> > > >
> > > > This register isn't accessible with the current sm8650.dtsi. Since =
DT
> > > > and driver are going through different trees, please add safety gua=
rds
> > > > here, so that the driver doesn't crash if used with older dtsi
> > >
> > > I don't see how this is an issue. msm-next is currently based on 6.9,
> > > which doesn't have the GPU defined in sm8650.dtsi. AFAIK patches 1 an=
d
> > > 2 will have to go through the linux-arm-msm tree, which will have to
> > > be merged into msm-next before this patch lands there, so there will
> > > never be any breakage.
> >
> > linux-arm-msm isn't going to be merged into msm-next. If we do not ask
> > for ack for the fix to go through msm-next, they will get these
> > patches in parallel.
>
> I'm not familiar with how complicated cross-tree changes like this get
> merged, but why would we merge these in parallel given that this patch
> depends on the previous patch that introduces
> qcom_scm_gpu_init_regs(), and that would (I assume?) normally go
> through the same tree as patch 1? Even if patch 1 gets merged in
> parallel in linux-arm-msm, in what scenario would we have a broken
> boot? You won't have a devicetree with a working sm8650 GPU and
> drm/msm with raytracing until linux-arm-msm is merged into msm-next at
> which point patch 1 will have landed somehow.

arch/arm64/qcom/dts and drivers/firmware/qcom are two separate trees.
So yes, this needs a lot of coordination.

>
> >
> > Another option is to get dtsi fix into 6.9 and delay the raytracing
> > until 6.10-rc which doesn't make a lot of sense from my POV).
> >
> > >
> > > > (not to mention that dts is considered to be an ABI and newer kerne=
ls
> > > > are supposed not to break with older DT files).
> > >
> > > That policy only applies to released kernels, so that's irrelevant he=
re.
> >
> > It applies to all kernels, the reason being pretty simple: git-bisect
> > should not be broken.
>
> As I wrote above, this is not an issue. The point I was making is that
> mixing and matching dtb's from one unmerged subsystem tree and a
> kernel from another isn't supported AFAIK, and that's the only
> scenario where this could break.

And it can happen if somebody running a bisect ends up in the branch
with these patches in, but with the dtsi bits not being picked up.


--=20
With best wishes
Dmitry
