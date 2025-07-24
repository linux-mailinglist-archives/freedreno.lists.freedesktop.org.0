Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1FB111F3
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 22:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECD410E2A2;
	Thu, 24 Jul 2025 20:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZTfj1rwU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE5C10E29D
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 20:01:18 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-313336f8438so43000a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753387278; x=1753992078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YVZhtijekIW/92qFTf+Oe+xPDMC02tgXfuwwVtfYSI=;
 b=ZTfj1rwU9+nBEbQQZdZzqNJayXn3szjNuP2qZqLToU/WLA+x4h8jfeAndiHey7FE3Q
 wJB63aEdlYGWSmB1DgAMKA5aXuvLu85/Vc3EV+AxW524AscmA3rapeMN7bypHrcbTQ6M
 TAH25oHo4HKDfp7v9fQDfQYEdQ9VzgzPos518boFkB+ttzNXeLHgiKI0uJWTdSilk4kE
 /bCMi8G89aLjnAKl3k0HmMkPX5mT7aWh1T3rVxjNAvKudgd96qnI1QkqtaWxbdnixl4b
 X1/QRmrcik/ZND24UVHDcmwEaO5+D/8TruVgqdf01ZDf24wD/Pu4o0+ZsOUvFL1XWqNC
 NVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753387278; x=1753992078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YVZhtijekIW/92qFTf+Oe+xPDMC02tgXfuwwVtfYSI=;
 b=VY3Tm++rjD8t4vnlhXxETO45feLy1CwCoC1gtRGo9nFd4Yahd1Zt2EtEObpeuvflp4
 8neiaqjtdXA6A+qTTmHPzB2mS4kFkxo4uYdvhsWmZhWG43wPFWutf364mbqDVw5ormTF
 0WXOud4U9xRu51YIGaNwyuMVV9E4PgZ5PUXm4zpJ5iaYfGK6Q7+R3gDWO1k0UlrP+l/O
 PSzzsW5iS28eWhow0uf1DAlqabmVZkDfyPdQ68FfJ09RRS3XXhFWFZ1dcVLj1pHrFWHW
 DOFHJRlrdIXUs5u5KrnR4g9sNHM5eWmPZlIEUCTj1rHDhskp3yyI1Hf+ZOVC59n800n7
 vTWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoQgIStEpIUmNyL/UoLkgQnB1GsXGXDP+E+8vzX2SIFWF4g+N86Y0zJCWvH70KLFgwVuO6FWfmXO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPl8IjIUzs+EtEmrJXvcKwU3/YB971DFAcoexT95/R2xYL9h3C
 8dGFn/IE3av5nWmZTP3E5Elq1NjYu/PX8/SpO5to7+v6WIfQZuD4eJrQR+aG37UfxthpA8A1XW3
 j6ENifDPANigKstb4wEU9URJrgzl/+k4=
X-Gm-Gg: ASbGnctcqY/MLnmKd1iJXDojPZZOaSiudhAVXsHlByxbLwmBDMSFX13VPq0yp/0Jf7H
 IsmvslcmBd06hISOIHhQX05LQh40ix2zMz9TBBG/4YliJr9xztJgJl5bjTdQIPHE600sEKo0NUU
 AaN5RKiX2P9Tcql7VtX/kIcTgBFn3lt4RKLropsk2syVhQgukF2oZ3D1B7xVF9mP+RxzW80pLNC
 sehQR4=
X-Google-Smtp-Source: AGHT+IEywbJAAkTGz+hnYFVLzpBw5QA8DweVZDJ4Oe2m2pnxOIP7gvawN1ZP+mydg2QW0xhuQz8f4TpUp6wqYJgnlFQ=
X-Received: by 2002:a17:90b:1b45:b0:31c:3871:27ad with SMTP id
 98e67ed59e1d1-31e506937b3mr5278925a91.0.1753387277346; Thu, 24 Jul 2025
 13:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
 <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com>
 <6cca1521-a806-4c43-a003-36a045cf007c@oss.qualcomm.com>
In-Reply-To: <6cca1521-a806-4c43-a003-36a045cf007c@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 24 Jul 2025 16:01:06 -0400
X-Gm-Features: Ac12FXwGoeDZgwfQOG90WaluaEzfX64KjMyzuxK7C8G3NFvRCh0bDTf5-rS3sXI
Message-ID: <CACu1E7EApr6Ne3XxFv4cUa2JuwNW2kfo1c5wSsAUN78iWyQ2sg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Wait for MMU devcoredump when waiting for GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
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

On Thu, Jul 24, 2025 at 3:48=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 7/21/2025 9:02 PM, Rob Clark wrote:
> > On Fri, Jul 18, 2025 at 6:50=E2=80=AFAM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> >>
> >> If there is a flood of faults then the MMU can become saturated while =
it
> >> waits for the kernel to process the first fault and resume it, so that
> >> the GMU becomes blocked. This is mainly a problem when the kernel read=
s
> >> the state of the GPU for a devcoredump, because this takes a while. If
> >> we timeout waiting for the GMU, check if this has happened and retry
> >> after we're finished.
> >>
> >> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 21 ++++++++++++++++++---
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 21 ++++++++++++++++++---
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
> >>  4 files changed, 49 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gmu.c
> >> index 28e6705c6da682c7b41c748e375dda59a6551898..6ec396fab22d194481a76d=
30b2d36ea5fb662241 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> @@ -340,6 +340,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6=
xx_gmu_oob_state state)
> >>         int ret;
> >>         u32 val;
> >>         int request, ack;
> >> +       struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, struct a6xx_gp=
u, gmu);
> >>
> >>         WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
> >>
> >> @@ -363,9 +364,23 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a=
6xx_gmu_oob_state state)
> >>         /* Trigger the equested OOB operation */
> >>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
> >>
> >> -       /* Wait for the acknowledge interrupt */
> >> -       ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO,=
 val,
> >> -               val & (1 << ack), 100, 10000);
> >> +       do {
> >> +               /* Wait for the acknowledge interrupt */
> >> +               ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_IN=
TR_INFO, val,
> >> +                       val & (1 << ack), 100, 10000);
> >> +
> >> +               if (!ret)
> >> +                       break;
> >> +
> >> +               if (completion_done(&a6xx_gpu->base.fault_coredump_don=
e))
>
> I didn't get why this is required. Could you please add a comment?

Without this, if the GMU timed out for some other reason not related
to SMMU then we'd loop infinitely. This gives up if there isn't
currently a crashstate pending.

>
> >> +                       break;
> >> +
> >> +               /* We may timeout because the GMU is temporarily wedge=
d from
> >> +                * pending faults from the GPU and we are taking a dev=
coredump.
> >> +                * Wait until the MMU is resumed and try again.
> >> +                */
> >> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_don=
e);
> >> +       } while (true);
> >
> > It is a bit sad to duplicate this nearly identical code twice.  And I
> > wonder if other gmu_poll_timeout()'s need similar treatment?  Maybe
> > Akhil has an opinion about whether we should just build this into
> > gmu_poll_timeout() instead?
>
> Yeah. That make sense. A potential issue I see is that we might be
> holding both gpu and gmu locks here and the crashstate capture in the pf
> handler tries to lock gpu, which can result in a dead lock.

I think there would already be a deadlock, or at least timeout in that
situation now. Any task waiting for the GMU to complete while holding
the GPU lock would block the crashstate capture from completing and
allowing the GMU to continue.

Connor

>
> -Akhil.
>
> >
> > BR,
> > -R
> >
> >>
> >>         if (ret)
> >>                 DRM_DEV_ERROR(gmu->dev,
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_hfi.c
> >> index 8e69b1e8465711837151725c8f70e7b4b16a368e..4e775ca757ce3649ac238d=
25cebfd7eb693fda61 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> @@ -104,10 +104,25 @@ static int a6xx_hfi_wait_for_msg_interrupt(struc=
t a6xx_gmu *gmu, u32 id, u32 seq
> >>  {
> >>         int ret;
> >>         u32 val;
> >> +       struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, struct a6xx_gp=
u, gmu);
> >> +
> >> +       do {
> >> +               /* Wait for a response */
> >> +               ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_IN=
TR_INFO, val,
> >> +                       val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1=
000000);
> >> +
> >> +               if (!ret)
> >> +                       break;
> >>
> >> -       /* Wait for a response */
> >> -       ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO,=
 val,
> >> -               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
> >> +               if (completion_done(&a6xx_gpu->base.fault_coredump_don=
e))
> >> +                       break;
> >> +
> >> +               /* We may timeout because the GMU is temporarily wedge=
d from
> >> +                * pending faults from the GPU and we are taking a dev=
coredump.
> >> +                * Wait until the MMU is resumed and try again.
> >> +                */
> >> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_don=
e);
> >> +       } while (true);
> >>
> >>         if (ret) {
> >>                 DRM_DEV_ERROR(gmu->dev,
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.c
> >> index f1230465bf0d0840274a6eb03a10c4df3a7a68d3..19181b6fddfd518e2f6032=
4da1a7087458115e40 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -293,6 +293,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsi=
gned long iova, int flags,
> >>                          struct adreno_smmu_fault_info *info, const ch=
ar *block,
> >>                          u32 scratch[4])
> >>  {
> >> +       struct adreno_gpu *adreno_gpu =3D container_of(gpu, struct adr=
eno_gpu, base);
> >>         struct msm_drm_private *priv =3D gpu->dev->dev_private;
> >>         struct msm_mmu *mmu =3D to_msm_vm(gpu->vm)->mmu;
> >>         const char *type =3D "UNKNOWN";
> >> @@ -345,6 +346,11 @@ int adreno_fault_handler(struct msm_gpu *gpu, uns=
igned long iova, int flags,
> >>                 /* Turn off the hangcheck timer to keep it from bother=
ing us */
> >>                 timer_delete(&gpu->hangcheck_timer);
> >>
> >> +               /* Let any concurrent GMU transactions know that the M=
MU may be
> >> +                * blocked for a while and they should wait on us.
> >> +                */
> >> +               reinit_completion(&adreno_gpu->fault_coredump_done);
> >> +
> >>                 fault_info.ttbr0 =3D info->ttbr0;
> >>                 fault_info.iova  =3D iova;
> >>                 fault_info.flags =3D flags;
> >> @@ -352,6 +358,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsi=
gned long iova, int flags,
> >>                 fault_info.block =3D block;
> >>
> >>                 msm_gpu_fault_crashstate_capture(gpu, &fault_info);
> >> +
> >> +               complete_all(&adreno_gpu->fault_coredump_done);
> >>         }
> >>
> >>         return 0;
> >> @@ -1238,6 +1246,9 @@ int adreno_gpu_init(struct drm_device *drm, stru=
ct platform_device *pdev,
> >>         if (ret)
> >>                 return ret;
> >>
> >> +       init_completion(&adreno_gpu->fault_coredump_done);
> >> +       complete_all(&adreno_gpu->fault_coredump_done);
> >> +
> >>         pm_runtime_set_autosuspend_delay(dev,
> >>                 adreno_gpu->info->inactive_period);
> >>         pm_runtime_use_autosuspend(dev);
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.h
> >> index 9dc93c247196d5b8b3659157f7aeea81809d4056..f16556c6f2921708e740ec=
d47f5b4668e87700aa 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -179,6 +179,8 @@ struct adreno_gpu {
> >>         uint16_t speedbin;
> >>         const struct adreno_gpu_funcs *funcs;
> >>
> >> +       struct completion fault_coredump_done;
> >> +
> >>         /* interesting register offsets to dump: */
> >>         const unsigned int *registers;
> >>
> >>
> >> ---
> >> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> >> change-id: 20250718-msm-gmu-fault-wait-465543a718fa
> >>
> >> Best regards,
> >> --
> >> Connor Abbott <cwabbott0@gmail.com>
> >>
>
