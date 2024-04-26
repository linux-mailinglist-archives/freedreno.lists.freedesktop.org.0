Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD58B3BC0
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 17:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D1810F139;
	Fri, 26 Apr 2024 15:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WC+rH31p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428CD11202D
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 15:38:38 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-de5a4d737f1so1118128276.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714145917; x=1714750717; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FrNVNm/BQxWOaQvKnZtXRgkoyqYp/lJb6Bzn2DSA720=;
 b=WC+rH31pj4+0uvRpKTvxWYhZ8M5xyWCKZKI5C/Kl1cOuctdE7iw7H0RwkHo0uX3NVL
 +YidxlUsO2r8/PHoURh2jOTidzDJ8SVbEszhWInFm/aXF1d9zHC0vzJh/H+3mu2U9pzR
 KvlYRmtjSkQ2lCwKrTNKyYbsx8WEqn6fa8uCNQFBe7XtxCZ/O6SVlLZQ78n8i8yFhl0s
 PCqHMynRW8wc9NKCtXcazZk/zk7SZ5hXp7SmKu7o702BAjtLbsetS4LUVo8rk7IOWmuo
 q9me7+x/tApe2Y23orBF+7lt5GVeH8bu5DY4p11BSUt6qGaGPVuFi997ErQdDOrGv6rp
 6xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714145917; x=1714750717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FrNVNm/BQxWOaQvKnZtXRgkoyqYp/lJb6Bzn2DSA720=;
 b=U0wLaS7FQw0HrwBpouaaK4XTYCt5W7YGKuc0TL+7AAk3pntkFHBW0K/iCNw/cCwVzH
 67qNEKwruSkMtswhw0fQFpfajPs3wwuM1rrLp+4t/+DLu30mmUWqHa0R9lXxT339829g
 VDn2Yumb9rvkEc3XzDaKpxt3Fny4I9V/r2wjbH3zgrj+IMYMmBekVJI5DYF9rfBsOP/u
 80Cw4+clFAwwes6Dvbl5rfrF43WomP+srFW8d+HWX2PuyxfaDX+BfaKajtPDI2Csk0XE
 JXZv27O/neGdNdjFi8mDzC3qaM/Lc4d7WKFbh2gALKbrryVIKgejZ0H2mFGvy9VXNaw+
 Yg0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpMIEu5+2k7HU0g5Xen44Z4ku0buyS4FS65X6jItYC29I0SVHdxYowdaUkJzMrVXNnDhA9WDRt4NiO7KuipNOwi5MKl7AYa866enKdQQwj
X-Gm-Message-State: AOJu0YzV5mdObZQBFaJB643F8TN3xOZu8TeiaXD81WbR52HoxWhAWjVG
 METCw/LymAMqS6VbGHIKXhGLrq7C2Ip4peNETaksJHDJMY1Ps/LInUgU/qqS93IycOAvYlrfjM9
 xUMsmlOL9BqPLVKJggBmaYVodf9zWjvDuyl3lpBx2EhJiHyJ/
X-Google-Smtp-Source: AGHT+IEGkClZRr+xlbfgODhgvDt/HwMTBpEWnMA2E25Rz0p1uYBpRc1MCrNi3WiMk4Isi6MDyQE37MMeM752V/188YA=
X-Received: by 2002:a25:d00d:0:b0:dc7:4067:9f85 with SMTP id
 h13-20020a25d00d000000b00dc740679f85mr3521113ybg.58.1714145916961; Fri, 26
 Apr 2024 08:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
 <20240425134354.1233862-5-cwabbott0@gmail.com>
 <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
 <CACu1E7E_xMQvBLCEiP_0JozmGCMTEcRc-Lq4sAOHU520q6j2mQ@mail.gmail.com>
 <CAA8EJpo7NtVkOYGM0DeACmkjpToMtKihS-HkkiVhigsBf3xXRg@mail.gmail.com>
 <CACu1E7HzDJz4JvwnO6uFa8uwTdQAUtazdJLKbZnN2AtxcVzGQQ@mail.gmail.com>
 <CAA8EJppVbMGT5r0WJ93gxGDeyYxu4yc4bXYHXt1yyTyX=nEUSQ@mail.gmail.com>
 <CACu1E7FuW48HLC2abdapaE4eGzw9DzOe0C5q_FJNMLEcpR3Q7g@mail.gmail.com>
 <CAA8EJpoqwvfoK4AP1jCk2YRAfeMk3bpJHwrGEvBFXCPMyXU3CA@mail.gmail.com>
 <CACu1E7EAcPtPsQAsozcq-cY9VCUY8xU6_D9i73_qehSqOyv29Q@mail.gmail.com>
In-Reply-To: <CACu1E7EAcPtPsQAsozcq-cY9VCUY8xU6_D9i73_qehSqOyv29Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 18:38:25 +0300
Message-ID: <CAA8EJpq9-G2jLmjZfy1wEWc88ChGm_pW53ZKkx7yeszRSn7tBw@mail.gmail.com>
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

On Fri, 26 Apr 2024 at 18:36, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Fri, Apr 26, 2024 at 4:24=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, 26 Apr 2024 at 18:08, Connor Abbott <cwabbott0@gmail.com> wrote=
:
> > >
> > > On Fri, Apr 26, 2024 at 3:53=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Fri, 26 Apr 2024 at 17:05, Connor Abbott <cwabbott0@gmail.com> w=
rote:
> > > > >
> > > > > On Fri, Apr 26, 2024 at 2:31=E2=80=AFPM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On Fri, 26 Apr 2024 at 15:35, Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> > > > > > >
> > > > > > > On Fri, Apr 26, 2024 at 12:02=E2=80=AFAM Dmitry Baryshkov
> > > > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > > > >
> > > > > > > > On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> > > > > > > > >
> > > > > > > > > On all Qualcomm platforms with a7xx GPUs, qcom_scm provid=
es a method to
> > > > > > > > > initialize cx_mem. Copy this from downstream (minus BCL w=
hich we
> > > > > > > > > currently don't support). On a750, this includes a new "f=
use" register
> > > > > > > > > which can be used by qcom_scm to fuse off certain feature=
s like
> > > > > > > > > raytracing in software. The fuse is default off, and is i=
nitialized by
> > > > > > > > > calling the method. Afterwards we have to read it to find=
 out which
> > > > > > > > > features were enabled.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 +++++++++++=
+++++++++++++-
> > > > > > > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
> > > > > > > > >  2 files changed, 90 insertions(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/driv=
ers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > > > index cf0b1de1c071..fb2722574ae5 100644
> > > > > > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > > > > > @@ -10,6 +10,7 @@
> > > > > > > > >
> > > > > > > > >  #include <linux/bitfield.h>
> > > > > > > > >  #include <linux/devfreq.h>
> > > > > > > > > +#include <linux/firmware/qcom/qcom_scm.h>
> > > > > > > > >  #include <linux/pm_domain.h>
> > > > > > > > >  #include <linux/soc/qcom/llcc-qcom.h>
> > > > > > > > >
> > > > > > > > > @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(str=
uct msm_gpu *gpu)
> > > > > > > > >                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DET=
ECT | \
> > > > > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCE=
SS | \
> > > > > > > > >                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INT=
R | \
> > > > > > > > > -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR=
)
> > > > > > > > > +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR=
 | \
> > > > > > > > > +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATI=
ON)
> > > > > > > > >
> > > > > > > > >  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
> > > > > > > > >                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> > > > > > > > > @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(=
struct msm_gpu *gpu)
> > > > > > > > >         kthread_queue_work(gpu->worker, &gpu->recover_wor=
k);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *g=
pu)
> > > > > > > > > +{
> > > > > > > > > +       u32 status;
> > > > > > > > > +
> > > > > > > > > +       status =3D gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_IN=
T_STATUS);
> > > > > > > > > +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0)=
;
> > > > > > > > > +
> > > > > > > > > +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse vio=
lation status=3D%8.8x\n", status);
> > > > > > > > > +
> > > > > > > > > +       /* Ignore FASTBLEND violations, because the HW wi=
ll silently fall back
> > > > > > > > > +        * to legacy blending.
> > > > > > > > > +        */
> > > > > > > > > +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACI=
NG |
> > > > > > > > > +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> > > > > > > > > +               del_timer(&gpu->hangcheck_timer);
> > > > > > > > > +
> > > > > > > > > +               kthread_queue_work(gpu->worker, &gpu->rec=
over_work);
> > > > > > > > > +       }
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
> > > > > > > > >  {
> > > > > > > > >         struct msm_drm_private *priv =3D gpu->dev->dev_pr=
ivate;
> > > > > > > > > @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct =
msm_gpu *gpu)
> > > > > > > > >         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS=
)
> > > > > > > > >                 dev_err_ratelimited(&gpu->pdev->dev, "UCH=
E | Out of bounds access\n");
> > > > > > > > >
> > > > > > > > > +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION=
)
> > > > > > > > > +               a7xx_sw_fuse_violation_irq(gpu);
> > > > > > > > > +
> > > > > > > > >         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_=
TS)
> > > > > > > > >                 msm_gpu_retire(gpu);
> > > > > > > > >
> > > > > > > > > @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(s=
truct platform_device *pdev,
> > > > > > > > >                 a6xx_gpu->llc_mmio =3D ERR_PTR(-EINVAL);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> > > > > > > > > +{
> > > > > > > > > +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base=
;
> > > > > > > > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > > > > > > +       u32 gpu_req =3D QCOM_SCM_GPU_ALWAYS_EN_REQ;
> > > > > > > > > +       u32 fuse_val;
> > > > > > > > > +       int ret;
> > > > > > > > > +
> > > > > > > > > +       if (adreno_is_a740(adreno_gpu)) {
> > > > > > > > > +               /* Raytracing is always enabled on a740 *=
/
> > > > > > > > > +               adreno_gpu->has_ray_tracing =3D true;
> > > > > > > > > +       }
> > > > > > > > > +
> > > > > > > > > +       if (!qcom_scm_is_available()) {
> > > > > > > > > +               /* Assume that if qcom scm isn't availabl=
e, that whatever
> > > > > > > > > +                * replacement allows writing the fuse re=
gister ourselves.
> > > > > > > > > +                * Users of alternative firmware need to =
make sure this
> > > > > > > > > +                * register is writeable or indicate that=
 it's not somehow.
> > > > > > > > > +                * Print a warning because if you mess th=
is up you're about to
> > > > > > > > > +                * crash horribly.
> > > > > > > > > +                */
> > > > > > > > > +               if (adreno_is_a750(adreno_gpu)) {
> > > > > > > > > +                       dev_warn_once(gpu->dev->dev,
> > > > > > > > > +                               "SCM is not available, po=
king fuse register\n");
> > > > > > > > > +                       a6xx_llc_write(a6xx_gpu, REG_A7XX=
_CX_MISC_SW_FUSE_VALUE,
> > > > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALU=
E_RAYTRACING |
> > > > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALU=
E_FASTBLEND |
> > > > > > > > > +                               A7XX_CX_MISC_SW_FUSE_VALU=
E_LPAC);
> > > > > > > > > +                       adreno_gpu->has_ray_tracing =3D t=
rue;
> > > > > > > > > +               }
> > > > > > > > > +
> > > > > > > > > +               return 0;
> > > > > > > > > +       }
> > > > > > > > > +
> > > > > > > > > +       if (adreno_is_a750(adreno_gpu))
> > > > > > > >
> > > > > > > > Most of the function is under the if (adreno_is_a750) condi=
tions. Can
> > > > > > > > we invert the logic and add a single block of if(adreno_is_=
a750) and
> > > > > > > > then place all the code underneath?
> > > > > > >
> > > > > > > You mean to duplicate the qcom_scm_is_available check and qco=
m_scm_
> > > > > > >
> > > > > > > >
> > > > > > > > > +               gpu_req |=3D QCOM_SCM_GPU_TSENSE_EN_REQ;
> > > > > > > > > +
> > > > > > > > > +       ret =3D qcom_scm_gpu_init_regs(gpu_req);
> > > > > > > > > +       if (ret)
> > > > > > > > > +               return ret;
> > > > > > > > > +
> > > > > > > > > +       /* On a750 raytracing may be disabled by the firm=
ware, find out whether
> > > > > > > > > +        * that's the case. The scm call above sets the f=
use register.
> > > > > > > > > +        */
> > > > > > > > > +       if (adreno_is_a750(adreno_gpu)) {
> > > > > > > > > +               fuse_val =3D a6xx_llc_read(a6xx_gpu, REG_=
A7XX_CX_MISC_SW_FUSE_VALUE);
> > > > > > > >
> > > > > > > > This register isn't accessible with the current sm8650.dtsi=
. Since DT
> > > > > > > > and driver are going through different trees, please add sa=
fety guards
> > > > > > > > here, so that the driver doesn't crash if used with older d=
tsi
> > > > > > >
> > > > > > > I don't see how this is an issue. msm-next is currently based=
 on 6.9,
> > > > > > > which doesn't have the GPU defined in sm8650.dtsi. AFAIK patc=
hes 1 and
> > > > > > > 2 will have to go through the linux-arm-msm tree, which will =
have to
> > > > > > > be merged into msm-next before this patch lands there, so the=
re will
> > > > > > > never be any breakage.
> > > > > >
> > > > > > linux-arm-msm isn't going to be merged into msm-next. If we do =
not ask
> > > > > > for ack for the fix to go through msm-next, they will get these
> > > > > > patches in parallel.
> > > > >
> > > > > I'm not familiar with how complicated cross-tree changes like thi=
s get
> > > > > merged, but why would we merge these in parallel given that this =
patch
> > > > > depends on the previous patch that introduces
> > > > > qcom_scm_gpu_init_regs(), and that would (I assume?) normally go
> > > > > through the same tree as patch 1? Even if patch 1 gets merged in
> > > > > parallel in linux-arm-msm, in what scenario would we have a broke=
n
> > > > > boot? You won't have a devicetree with a working sm8650 GPU and
> > > > > drm/msm with raytracing until linux-arm-msm is merged into msm-ne=
xt at
> > > > > which point patch 1 will have landed somehow.
> > > >
> > > > arch/arm64/qcom/dts and drivers/firmware/qcom are two separate tree=
s.
> > > > So yes, this needs a lot of coordination.
> > >
> > >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > Another option is to get dtsi fix into 6.9 and delay the raytra=
cing
> > > > > > until 6.10-rc which doesn't make a lot of sense from my POV).
> > > > > >
> > > > > > >
> > > > > > > > (not to mention that dts is considered to be an ABI and new=
er kernels
> > > > > > > > are supposed not to break with older DT files).
> > > > > > >
> > > > > > > That policy only applies to released kernels, so that's irrel=
evant here.
> > > > > >
> > > > > > It applies to all kernels, the reason being pretty simple: git-=
bisect
> > > > > > should not be broken.
> > > > >
> > > > > As I wrote above, this is not an issue. The point I was making is=
 that
> > > > > mixing and matching dtb's from one unmerged subsystem tree and a
> > > > > kernel from another isn't supported AFAIK, and that's the only
> > > > > scenario where this could break.
> > > >
> > > > And it can happen if somebody running a bisect ends up in the branc=
h
> > > > with these patches in, but with the dtsi bits not being picked up.
> > >
> > > That wouldn't be possible unless we merged the "bad" commit
> > > introducing the GPU node to sm8650.dtsi into msm-next but not the fix=
.
> > > So yeah, it's going to require a lot of careful cooperation but it
> > > should be possible to avoid that happening.
> >
> > Well, the GPU node is already there in the linux-next.
>
> And? As long as the devicetree fix lands first, linux-next will never be =
broken.

So we need to land dtsi for 6.10 and delay the drm/msm changes for
6.11. If that's fine with you and Bjorn, I'm ok with that.

>
> > Anyway. Please. Don't break compat with old DTS. That is a rule of thum=
b.
>
> It's exactly that, a rule of thumb. This is obviously a bit of an
> exceptional case, and you haven't articulated any reason why we should
> follow it in this case when there's an obvious reason not to.



--=20
With best wishes
Dmitry
