Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E819A50C05
	for <lists+freedreno@lfdr.de>; Wed,  5 Mar 2025 20:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DCD89CE3;
	Wed,  5 Mar 2025 19:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lPRz8OqA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B48A89CE3
 for <freedreno@lists.freedesktop.org>; Wed,  5 Mar 2025 19:56:41 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3d0465a8d34so63291425ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 11:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741204599; x=1741809399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EK4b3HyJgM3hGDfJ0A/txTzVctgiGO140h7Vyc0X/Ho=;
 b=lPRz8OqAf/LH3aVsw6Mnf9ERhvpprwLIpwlYStvm0zdOqiqCdLCqAALVJcxf6j8l8M
 M3AzBXLQVU7XnbWJFq5ZiT4To0qX4RWUfL2aPPjjsslsoGd5116ubpngc/HQWYeosCSz
 WXKil74ISQqNSUnyKWt92mYrPWrHWHUNNP5Mod8bywkesINcwqCv2udZXsR5eDu0x0NM
 XnWFUnt1W2c3T3cxxY3I+VOYT2zSNEp3BFgAdxRkmYOQ+0PpgFT1A0S1kGe5Gc7gXDqS
 HzuUVH33a1NAh0+XJ5nhAeOHBBq83Xg/6W8Tz+DpDNdjCJxJ1hKyBUHe6vb2tGdIltGl
 gpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741204599; x=1741809399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EK4b3HyJgM3hGDfJ0A/txTzVctgiGO140h7Vyc0X/Ho=;
 b=GVmLTJCD7FPDs9oV/x4JWLe4RrcWo1jnE9R9pe8x/jj4Mp54jXPF77ZUzS3eQttV2V
 UagDO7UZLieYO9LY4KDZXPwGCRj61nahompH7B9OGAVK3cTw7JBP/eHbPO6qV7xCD5F2
 hQAffxDdk96cfj/YRtlPnjJimoM3kKsSTaQs5fwTAiHvVDChzHA1KW3OYGQQo1+mJqff
 feh9puZ0bO0nLtxuUk3KRyiU+MmeC4ci/ua2R9IX0/HTy08DPMf52Ot9GUZi/Jv18Aop
 v9MEzgtc7Kc7gJGWjaEoMgDhC7uVOmcC13eahsDNjZNtXMDzzNe+nceaSv69hUSB9hHO
 hDZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4dRJfc94F9fl+o7gSTdbItGMDzKFhHfpHvNMinZuaBPxJgA36gixW2htVQm74pZXuhDaOdsDwQR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvc2VjZpkK9tXD7Bcfif9uNxDGewuKa8xRlIIyvv62485i3rcJ
 tYuTzgHE14SD9UMuFmvPsQmGo2qFweUqwF2e5y4Tr/X0yJVd669vJXeuEPkQfwpn8zFIhHOisKe
 HAhzQQwcUXeUc1xYsnWJclINHe94=
X-Gm-Gg: ASbGncukzEEZSaipLl7MRMaGRNr8Ucq5sFQ/DCbToimWS2sGL+T7moLts6unxpPAfeZ
 NsfpY5F0TC5FQMZGRa/YNDTVpbuliH5WXbXjbvCfnf5/3EtnEefPNa5/lIRnavayYm6T4GTVW/U
 U1yRUoa6LO404K8BrjptqEbaft6g==
X-Google-Smtp-Source: AGHT+IEvt+UeE/beJRdg2VM3BUepDP4RJEo89AbGQ5rVgDSPcu2ds6I3XEN68wZm8UcUBUrYG/0mZAlqvUDAOGYFzYg=
X-Received: by 2002:a05:6e02:216d:b0:3d1:9999:4f62 with SMTP id
 e9e14a558f8ab-3d42b873b43mr55740585ab.2.1741204598734; Wed, 05 Mar 2025
 11:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-5-be14be37f4c3@gmail.com>
 <CAF6AEGufRP9NuqC1gYy6jrQ9z+XqGFd7KNsbQw8C8NscSOJnJQ@mail.gmail.com>
 <CACu1E7FPO253T+EvdJdaBuqh3kb7H_r7WhBE+bVxSHMPq6ixEg@mail.gmail.com>
In-Reply-To: <CACu1E7FPO253T+EvdJdaBuqh3kb7H_r7WhBE+bVxSHMPq6ixEg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:56:27 -0800
X-Gm-Features: AQ5f1Jo3pnEpBqQToA3LD72hOF_KzihlX-Y2K6yNJMcq_UDDF0AT1ChF9aDzUjw
Message-ID: <CAF6AEGu+eHBzSu-4vsGJEcJtDhOV=LnDM1xMZJVK3=1o71B0KQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/msm: Temporarily disable stall-on-fault after
 a page fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
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

On Wed, Mar 5, 2025 at 11:38=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Wed, Mar 5, 2025 at 2:07=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
> >
> > On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.c=
om> wrote:
> > >
> > > When things go wrong, the GPU is capable of quickly generating millio=
ns
> > > of faulting translation requests per second. When that happens, in th=
e
> > > stall-on-fault model each access will stall until it wins the race to
> > > signal the fault and then the RESUME register is written. This slows
> > > processing page faults to a crawl as the GPU can generate faults much
> > > faster than the CPU can acknowledge them. It also means that all
> > > available resources in the SMMU are saturated waiting for the stalled
> > > transactions, so that other transactions such as transactions generat=
ed
> > > by the GMU, which shares a context bank with the GPU, cannot proceed.
> >
> > Nit, the GMU does not actually share a cb.. looking on x1e80100.dtsi,
> > the GMU has cb 5 and gpu has 0 and 1.  (Currently we just use the
> > first, but I guess the 2nd would be used if we supported protected
> > content?)
>
> Yeah, I realized after writing this that's the case. But I guess the
> QoS issues happen even with separate context banks due to the way they
> allocate translation units?

Right, however resources are allocated to track pending translations
seems to be shared across CBs

BR,
-R

>
> Connor
>
> >
> > fwiw, you can read this from dtsi, ie. in the GMU node, "iommus =3D
> > <&adreno_smmu 5 0x0>;"
> >
> > > This causes a GMU watchdog timeout, which leads to a failed reset
> > > because GX cannot collapse when there is a transaction pending and a
> > > permanently hung GPU.
> > >
> > > On older platforms with qcom,smmu-v2, it seems that when one transact=
ion
> > > is stalled subsequent faulting transactions are terminated, which avo=
ids
> > > this problem, but the MMU-500 follows the spec here.
> > >
> > > To work around these problem, disable stall-on-fault as soon as we ge=
t a
> > > page fault until a cooldown period after pagefaults stop. This allows
> > > the GMU some guaranteed time to continue working. We only use
> > > stall-on-fault to halt the GPU while we collect a devcoredump and we
> > > always terminate the transaction afterward, so it's fine to miss some
> > > subsequent page faults. We also keep it disabled so long as the curre=
nt
> > > devcoredump hasn't been deleted, because in that case we likely won't
> > > capture another one if there's a fault.
> > >
> > > After this commit HFI messages still occasionally time out, because t=
he
> > > crashdump handler doesn't run fast enough to let the GMU resume, but =
the
> > > driver seems to recover from it. This will probably go away after the
> > > HFI timeout is increased.
> > >
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++++
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 42 +++++++++++++++++++++++=
+++++++++-
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 24 +++++++++++++++++++
> > >  drivers/gpu/drm/msm/msm_iommu.c         |  9 +++++++
> > >  drivers/gpu/drm/msm/msm_mmu.h           |  1 +
> > >  6 files changed, 81 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a5xx_gpu.c
> > > index 71dca78cd7a5324e9ff5b14f173e2209fa42e196..670141531112c9d29cef8=
ef1fd51b74759fdd6d2 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > @@ -131,6 +131,8 @@ static void a5xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> > >         struct msm_ringbuffer *ring =3D submit->ring;
> > >         unsigned int i, ibs =3D 0;
> > >
> > > +       adreno_check_and_reenable_stall(adreno_gpu);
> > > +
> > >         if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
> > >                 ring->cur_ctx_seqno =3D 0;
> > >                 a5xx_submit_in_rb(gpu, submit);
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> > > index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..5a34cd2109a2d74c92841=
448a61ccb0d4f34e264 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -212,6 +212,8 @@ static void a6xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> > >         struct msm_ringbuffer *ring =3D submit->ring;
> > >         unsigned int i, ibs =3D 0;
> > >
> > > +       adreno_check_and_reenable_stall(adreno_gpu);
> > > +
> > >         a6xx_set_pagetable(a6xx_gpu, ring, submit);
> > >
> > >         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
> > > @@ -335,6 +337,8 @@ static void a7xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> > >         struct msm_ringbuffer *ring =3D submit->ring;
> > >         unsigned int i, ibs =3D 0;
> > >
> > > +       adreno_check_and_reenable_stall(adreno_gpu);
> > > +
> > >         /*
> > >          * Toggle concurrent binning for pagetable switch and set the=
 thread to
> > >          * BR since only it can execute the pagetable switch packets.
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.c
> > > index 1238f326597808eb28b4c6822cbd41a26e555eb9..bac586101dc0494f46b06=
9a8440a45825dfe9b5e 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -246,16 +246,53 @@ u64 adreno_private_address_space_size(struct ms=
m_gpu *gpu)
> > >         return SZ_4G;
> > >  }
> > >
> > > +void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
> > > +{
> > > +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > +       unsigned long flags;
> > > +
> > > +       /*
> > > +        * Wait until the cooldown period has passed and we would act=
ually
> > > +        * collect a crashdump to re-enable stall-on-fault.
> > > +        */
> > > +       spin_lock_irqsave(&adreno_gpu->fault_stall_lock, flags);
> > > +       if (!adreno_gpu->stall_enabled &&
> > > +                       ktime_after(ktime_get(), adreno_gpu->stall_re=
enable_time) &&
> > > +                       !READ_ONCE(gpu->crashstate)) {
> > > +               adreno_gpu->stall_enabled =3D true;
> > > +
> > > +               gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, =
true);
> > > +       }
> > > +       spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, flags);
> > > +}
> > > +
> > >  #define ARM_SMMU_FSR_TF                 BIT(1)
> > >  #define ARM_SMMU_FSR_PF                        BIT(3)
> > >  #define ARM_SMMU_FSR_EF                        BIT(4)
> > > +#define ARM_SMMU_FSR_SS                        BIT(30)
> > >
> > >  int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, in=
t flags,
> > >                          struct adreno_smmu_fault_info *info, const c=
har *block,
> > >                          u32 scratch[4])
> > >  {
> > > +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > >         const char *type =3D "UNKNOWN";
> > > -       bool do_devcoredump =3D info && !READ_ONCE(gpu->crashstate);
> > > +       bool do_devcoredump =3D info && (info->fsr & ARM_SMMU_FSR_SS)=
 &&
> > > +               !READ_ONCE(gpu->crashstate);
> > > +       unsigned long irq_flags;
> > > +
> > > +       /*
> > > +        * In case there is a subsequent storm of pagefaults, disable
> > > +        * stall-on-fault for at least half a second.
> > > +        */
> > > +       spin_lock_irqsave(&adreno_gpu->fault_stall_lock, irq_flags);
> > > +       if (adreno_gpu->stall_enabled) {
> > > +               adreno_gpu->stall_enabled =3D false;
> > > +
> > > +               gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, =
false);
> > > +       }
> > > +       adreno_gpu->stall_reenable_time =3D ktime_add_ms(ktime_get(),=
 500);
> > > +       spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, irq_fla=
gs);
> > >
> > >         /*
> > >          * If we aren't going to be resuming later from fault_worker,=
 then do
> > > @@ -1143,6 +1180,9 @@ int adreno_gpu_init(struct drm_device *drm, str=
uct platform_device *pdev,
> > >                 adreno_gpu->info->inactive_period);
> > >         pm_runtime_use_autosuspend(dev);
> > >
> > > +       spin_lock_init(&adreno_gpu->fault_stall_lock);
> > > +       adreno_gpu->stall_enabled =3D true;
> > > +
> > >         return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->bas=
e,
> > >                         gpu_name, &adreno_gpu_config);
> > >  }
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.h
> > > index dcf454629ce037b2a8274a6699674ad754ce1f07..a528036b46216bd898f6d=
48c5fb0555c4c4b053b 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -205,6 +205,28 @@ struct adreno_gpu {
> > >         /* firmware: */
> > >         const struct firmware *fw[ADRENO_FW_MAX];
> > >
> > > +       /**
> > > +        * fault_stall_lock:
> >
> > nit, @fault_stall_lock:  And for
> > fault_stall_reenable_time/stall_enabled, it wouldn't hurt to add
> > something along the lines of "Protected by @fault_stall_lock".  I've
> > been slowly trying to improve the comment docs over time, I have some
> > of that in my vmbind patchset.
> >
> > Anyways, with those nits addressed, r-b
> >
> > BR,
> > -R
> >
> > > +        *
> > > +        * Serialize changes to stall-on-fault state.
> > > +        */
> > > +       spinlock_t fault_stall_lock;
> > > +
> > > +       /**
> > > +        * fault_stall_reenable_time:
> > > +        *
> > > +        * if stall_enabled is false, when to reenable stall-on-fault=
.
> > > +        */
> > > +       ktime_t stall_reenable_time;
> > > +
> > > +       /**
> > > +        * stall_enabled:
> > > +        *
> > > +        * Whether stall-on-fault is currently enabled.
> > > +        */
> > > +       bool stall_enabled;
> > > +
> > > +
> > >         struct {
> > >                 /**
> > >                  * @rgb565_predicator: Unknown, introduced with A650 =
family,
> > > @@ -629,6 +651,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, uns=
igned long iova, int flags,
> > >                          struct adreno_smmu_fault_info *info, const c=
har *block,
> > >                          u32 scratch[4]);
> > >
> > > +void adreno_check_and_reenable_stall(struct adreno_gpu *gpu);
> > > +
> > >  int adreno_read_speedbin(struct device *dev, u32 *speedbin);
> > >
> > >  /*
> > > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/ms=
m_iommu.c
> > > index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..8d5380e6dcc217c7c209b=
51527bf15748b3ada71 100644
> > > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > > @@ -351,6 +351,14 @@ static void msm_iommu_resume_translation(struct =
msm_mmu *mmu)
> > >                 adreno_smmu->resume_translation(adreno_smmu->cookie, =
true);
> > >  }
> > >
> > > +static void msm_iommu_set_stall(struct msm_mmu *mmu, bool enable)
> > > +{
> > > +       struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(mmu-=
>dev);
> > > +
> > > +       if (adreno_smmu->set_stall)
> > > +               adreno_smmu->set_stall(adreno_smmu->cookie, enable);
> > > +}
> > > +
> > >  static void msm_iommu_detach(struct msm_mmu *mmu)
> > >  {
> > >         struct msm_iommu *iommu =3D to_msm_iommu(mmu);
> > > @@ -399,6 +407,7 @@ static const struct msm_mmu_funcs funcs =3D {
> > >                 .unmap =3D msm_iommu_unmap,
> > >                 .destroy =3D msm_iommu_destroy,
> > >                 .resume_translation =3D msm_iommu_resume_translation,
> > > +               .set_stall =3D msm_iommu_set_stall,
> > >  };
> > >
> > >  struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quir=
ks)
> > > diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_=
mmu.h
> > > index 88af4f490881f2a6789ae2d03e1c02d10046331a..2694a356a17904e7572b7=
67b16ed0cee806406cf 100644
> > > --- a/drivers/gpu/drm/msm/msm_mmu.h
> > > +++ b/drivers/gpu/drm/msm/msm_mmu.h
> > > @@ -16,6 +16,7 @@ struct msm_mmu_funcs {
> > >         int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
> > >         void (*destroy)(struct msm_mmu *mmu);
> > >         void (*resume_translation)(struct msm_mmu *mmu);
> > > +       void (*set_stall)(struct msm_mmu *mmu, bool enable);
> > >  };
> > >
> > >  enum msm_mmu_type {
> > >
> > > --
> > > 2.47.1
> > >
