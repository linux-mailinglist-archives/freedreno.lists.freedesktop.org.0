Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69400A50AEC
	for <lists+freedreno@lfdr.de>; Wed,  5 Mar 2025 20:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0389B57;
	Wed,  5 Mar 2025 19:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AZz1KmQW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF1C89B57
 for <freedreno@lists.freedesktop.org>; Wed,  5 Mar 2025 19:07:12 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3d03d2bd7d2so66187085ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 11:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741201632; x=1741806432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igyyFXxSN2EPjWaUS4Vz0/cPHllbqagXXxWfZOFJbH0=;
 b=AZz1KmQWRqf+xbd6YQ12No8wHRNMFyyO4Q1QoRiwTNX6TeoWcQGLJFn7qQPKm1qi8K
 Wmnzswt4DgsHnntoQ1KtMP9Fci4DvTyzcA7ZUKEd1nQVsc1Nwwgshs7TqYe9qkZEP8/8
 XLKDlncZncehXbKH48PLh5+99FscGb+lwVTgMC96ivVEkM9vS4pz/cvBbjtx/+nei4SP
 MUkNFBxCmxh5ADM8d76yHt17xdwMM/mQOyoJltHEKKTmZOPC3Z3ogZ7CEKHV+KzClCRx
 58YfK3zSaMtb0z7hqO99Go2pePa5Uoyf2PvDvCYNhcXQ079b906EF26s5DNdcHSm0J+o
 Ka5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741201632; x=1741806432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igyyFXxSN2EPjWaUS4Vz0/cPHllbqagXXxWfZOFJbH0=;
 b=AYRob9nY+Af5RYK6DRg7TuSFrAtLe1AblCKMG/PZmeWmpOumL/eZ7qmv3gKNCgWdlu
 osXFpfBEb1MFDKS/9pnLaLHjdSfP64BJyX150krNVACufIH2nA+H97PKKpKtUP/Qs4kO
 u1chlDlUdXJCnOkg65m7P2SjXmh0zBqHiHg+hHHVnv+hjQcASFlwPdRsnzHPT5Tf3uqW
 V38E2cfdDlIsOuPCUECnfqhDzm4O2PbYVvpQP7R9vpMoVah5C4tqmyMdYgVaFwiI+3NI
 910n38/g7YDN0/n15Np4EEgFkVaVsTo6b0DVbk5ZdQrjXwHqyPbSMgTATbZjAuNmAh59
 GA1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhh53B1Bs/Kq5SzNbGCX6pvHgAcP4lRs8F7wN6TX3moGC/k8FIDu0xtWlScm/ajXaCmBrJbSFZ15Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM+N2vMlts3oUZDmg/fa2NiVo412ahSPvqQKAoJ5NciII9iYpz
 778oeCyjt4g/EQcoPA0AQbgnRrpvpLm2CQK9NPc00YfD+248c/ISdsa47rGURirQmgQUq98LJzo
 siP5SxW6MK6aKzhvm1c0fa902Lbi0v+p6
X-Gm-Gg: ASbGncuJpEBlZ9hMOVvQbE5hnCStliI8FxLG/StYPwMFlHkptLP2i+/MBTrbUbRrFia
 SO+tnUAcvvLX++G1JEFaIvguR0SBrZvtj03vgpqLDKBUrIeuj/hfeasTgzkwe+uuouOZgTVV2nx
 eIt9V7bJlHgxZTMWOlh5LakF+0Zg==
X-Google-Smtp-Source: AGHT+IGYtR++XLGKg7WK1w3GYDj0e0n1QpvcnFkb204I5h9atpnxCMGvT/sEIHR5tT2MZc3jnLdXSP/4A5fmxG0fMts=
X-Received: by 2002:a05:6e02:188c:b0:3d0:237e:c29c with SMTP id
 e9e14a558f8ab-3d42b8d2344mr63739685ab.12.1741201631687; Wed, 05 Mar 2025
 11:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-5-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-5-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:07:00 -0800
X-Gm-Features: AQ5f1JqutkipSibnfC3SgjszgkeUqvo1oFxSOhTED1WYYvansmyVCncnRJGo40w
Message-ID: <CAF6AEGufRP9NuqC1gYy6jrQ9z+XqGFd7KNsbQw8C8NscSOJnJQ@mail.gmail.com>
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

On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> When things go wrong, the GPU is capable of quickly generating millions
> of faulting translation requests per second. When that happens, in the
> stall-on-fault model each access will stall until it wins the race to
> signal the fault and then the RESUME register is written. This slows
> processing page faults to a crawl as the GPU can generate faults much
> faster than the CPU can acknowledge them. It also means that all
> available resources in the SMMU are saturated waiting for the stalled
> transactions, so that other transactions such as transactions generated
> by the GMU, which shares a context bank with the GPU, cannot proceed.

Nit, the GMU does not actually share a cb.. looking on x1e80100.dtsi,
the GMU has cb 5 and gpu has 0 and 1.  (Currently we just use the
first, but I guess the 2nd would be used if we supported protected
content?)

fwiw, you can read this from dtsi, ie. in the GMU node, "iommus =3D
<&adreno_smmu 5 0x0>;"

> This causes a GMU watchdog timeout, which leads to a failed reset
> because GX cannot collapse when there is a transaction pending and a
> permanently hung GPU.
>
> On older platforms with qcom,smmu-v2, it seems that when one transaction
> is stalled subsequent faulting transactions are terminated, which avoids
> this problem, but the MMU-500 follows the spec here.
>
> To work around these problem, disable stall-on-fault as soon as we get a
> page fault until a cooldown period after pagefaults stop. This allows
> the GMU some guaranteed time to continue working. We only use
> stall-on-fault to halt the GPU while we collect a devcoredump and we
> always terminate the transaction afterward, so it's fine to miss some
> subsequent page faults. We also keep it disabled so long as the current
> devcoredump hasn't been deleted, because in that case we likely won't
> capture another one if there's a fault.
>
> After this commit HFI messages still occasionally time out, because the
> crashdump handler doesn't run fast enough to let the GMU resume, but the
> driver seems to recover from it. This will probably go away after the
> HFI timeout is increased.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 42 +++++++++++++++++++++++++++=
+++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 24 +++++++++++++++++++
>  drivers/gpu/drm/msm/msm_iommu.c         |  9 +++++++
>  drivers/gpu/drm/msm/msm_mmu.h           |  1 +
>  6 files changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 71dca78cd7a5324e9ff5b14f173e2209fa42e196..670141531112c9d29cef8ef1f=
d51b74759fdd6d2 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -131,6 +131,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         struct msm_ringbuffer *ring =3D submit->ring;
>         unsigned int i, ibs =3D 0;
>
> +       adreno_check_and_reenable_stall(adreno_gpu);
> +
>         if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
>                 ring->cur_ctx_seqno =3D 0;
>                 a5xx_submit_in_rb(gpu, submit);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..5a34cd2109a2d74c92841448a=
61ccb0d4f34e264 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -212,6 +212,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         struct msm_ringbuffer *ring =3D submit->ring;
>         unsigned int i, ibs =3D 0;
>
> +       adreno_check_and_reenable_stall(adreno_gpu);
> +
>         a6xx_set_pagetable(a6xx_gpu, ring, submit);
>
>         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
> @@ -335,6 +337,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         struct msm_ringbuffer *ring =3D submit->ring;
>         unsigned int i, ibs =3D 0;
>
> +       adreno_check_and_reenable_stall(adreno_gpu);
> +
>         /*
>          * Toggle concurrent binning for pagetable switch and set the thr=
ead to
>          * BR since only it can execute the pagetable switch packets.
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 1238f326597808eb28b4c6822cbd41a26e555eb9..bac586101dc0494f46b069a84=
40a45825dfe9b5e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -246,16 +246,53 @@ u64 adreno_private_address_space_size(struct msm_gp=
u *gpu)
>         return SZ_4G;
>  }
>
> +void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
> +{
> +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> +       unsigned long flags;
> +
> +       /*
> +        * Wait until the cooldown period has passed and we would actuall=
y
> +        * collect a crashdump to re-enable stall-on-fault.
> +        */
> +       spin_lock_irqsave(&adreno_gpu->fault_stall_lock, flags);
> +       if (!adreno_gpu->stall_enabled &&
> +                       ktime_after(ktime_get(), adreno_gpu->stall_reenab=
le_time) &&
> +                       !READ_ONCE(gpu->crashstate)) {
> +               adreno_gpu->stall_enabled =3D true;
> +
> +               gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, true=
);
> +       }
> +       spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, flags);
> +}
> +
>  #define ARM_SMMU_FSR_TF                 BIT(1)
>  #define ARM_SMMU_FSR_PF                        BIT(3)
>  #define ARM_SMMU_FSR_EF                        BIT(4)
> +#define ARM_SMMU_FSR_SS                        BIT(30)
>
>  int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int fl=
ags,
>                          struct adreno_smmu_fault_info *info, const char =
*block,
>                          u32 scratch[4])
>  {
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
>         const char *type =3D "UNKNOWN";
> -       bool do_devcoredump =3D info && !READ_ONCE(gpu->crashstate);
> +       bool do_devcoredump =3D info && (info->fsr & ARM_SMMU_FSR_SS) &&
> +               !READ_ONCE(gpu->crashstate);
> +       unsigned long irq_flags;
> +
> +       /*
> +        * In case there is a subsequent storm of pagefaults, disable
> +        * stall-on-fault for at least half a second.
> +        */
> +       spin_lock_irqsave(&adreno_gpu->fault_stall_lock, irq_flags);
> +       if (adreno_gpu->stall_enabled) {
> +               adreno_gpu->stall_enabled =3D false;
> +
> +               gpu->aspace->mmu->funcs->set_stall(gpu->aspace->mmu, fals=
e);
> +       }
> +       adreno_gpu->stall_reenable_time =3D ktime_add_ms(ktime_get(), 500=
);
> +       spin_unlock_irqrestore(&adreno_gpu->fault_stall_lock, irq_flags);
>
>         /*
>          * If we aren't going to be resuming later from fault_worker, the=
n do
> @@ -1143,6 +1180,9 @@ int adreno_gpu_init(struct drm_device *drm, struct =
platform_device *pdev,
>                 adreno_gpu->info->inactive_period);
>         pm_runtime_use_autosuspend(dev);
>
> +       spin_lock_init(&adreno_gpu->fault_stall_lock);
> +       adreno_gpu->stall_enabled =3D true;
> +
>         return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>                         gpu_name, &adreno_gpu_config);
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index dcf454629ce037b2a8274a6699674ad754ce1f07..a528036b46216bd898f6d48c5=
fb0555c4c4b053b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -205,6 +205,28 @@ struct adreno_gpu {
>         /* firmware: */
>         const struct firmware *fw[ADRENO_FW_MAX];
>
> +       /**
> +        * fault_stall_lock:

nit, @fault_stall_lock:  And for
fault_stall_reenable_time/stall_enabled, it wouldn't hurt to add
something along the lines of "Protected by @fault_stall_lock".  I've
been slowly trying to improve the comment docs over time, I have some
of that in my vmbind patchset.

Anyways, with those nits addressed, r-b

BR,
-R

> +        *
> +        * Serialize changes to stall-on-fault state.
> +        */
> +       spinlock_t fault_stall_lock;
> +
> +       /**
> +        * fault_stall_reenable_time:
> +        *
> +        * if stall_enabled is false, when to reenable stall-on-fault.
> +        */
> +       ktime_t stall_reenable_time;
> +
> +       /**
> +        * stall_enabled:
> +        *
> +        * Whether stall-on-fault is currently enabled.
> +        */
> +       bool stall_enabled;
> +
> +
>         struct {
>                 /**
>                  * @rgb565_predicator: Unknown, introduced with A650 fami=
ly,
> @@ -629,6 +651,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigne=
d long iova, int flags,
>                          struct adreno_smmu_fault_info *info, const char =
*block,
>                          u32 scratch[4]);
>
> +void adreno_check_and_reenable_stall(struct adreno_gpu *gpu);
> +
>  int adreno_read_speedbin(struct device *dev, u32 *speedbin);
>
>  /*
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_io=
mmu.c
> index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..8d5380e6dcc217c7c209b5152=
7bf15748b3ada71 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -351,6 +351,14 @@ static void msm_iommu_resume_translation(struct msm_=
mmu *mmu)
>                 adreno_smmu->resume_translation(adreno_smmu->cookie, true=
);
>  }
>
> +static void msm_iommu_set_stall(struct msm_mmu *mmu, bool enable)
> +{
> +       struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(mmu->dev=
);
> +
> +       if (adreno_smmu->set_stall)
> +               adreno_smmu->set_stall(adreno_smmu->cookie, enable);
> +}
> +
>  static void msm_iommu_detach(struct msm_mmu *mmu)
>  {
>         struct msm_iommu *iommu =3D to_msm_iommu(mmu);
> @@ -399,6 +407,7 @@ static const struct msm_mmu_funcs funcs =3D {
>                 .unmap =3D msm_iommu_unmap,
>                 .destroy =3D msm_iommu_destroy,
>                 .resume_translation =3D msm_iommu_resume_translation,
> +               .set_stall =3D msm_iommu_set_stall,
>  };
>
>  struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.=
h
> index 88af4f490881f2a6789ae2d03e1c02d10046331a..2694a356a17904e7572b767b1=
6ed0cee806406cf 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -16,6 +16,7 @@ struct msm_mmu_funcs {
>         int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
>         void (*destroy)(struct msm_mmu *mmu);
>         void (*resume_translation)(struct msm_mmu *mmu);
> +       void (*set_stall)(struct msm_mmu *mmu, bool enable);
>  };
>
>  enum msm_mmu_type {
>
> --
> 2.47.1
>
