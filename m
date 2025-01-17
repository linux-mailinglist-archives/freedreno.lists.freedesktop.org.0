Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519EFA1582D
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 20:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4CF10EB74;
	Fri, 17 Jan 2025 19:34:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61FEE10EB73
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 19:34:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D32A01476;
 Fri, 17 Jan 2025 11:34:53 -0800 (PST)
Received: from [10.57.7.182] (unknown [10.57.7.182])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 485B63F73F;
 Fri, 17 Jan 2025 11:34:23 -0800 (PST)
Message-ID: <64ab28fc-adba-4193-beac-4af482b12699@arm.com>
Date: Fri, 17 Jan 2025 19:34:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org
References: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
 <20250117-msm-gpu-fault-fixes-next-v1-1-bc9b332b5d0b@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250117-msm-gpu-fault-fixes-next-v1-1-bc9b332b5d0b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2025-01-17 6:47 pm, Connor Abbott wrote:
> On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
> asserts an interrupt. The only way to clear that bit is to resume the
> transaction by writing SMMU_CBn_RESUME, but typically resuming the
> transaction requires complex operations (copying in pages, etc.) that
> can't be done in IRQ context. drm/msm already has a problem, because
> its fault handler sometimes schedules a job to dump the GPU state and
> doesn't resume translation until this is complete.
> 
> Work around this by disabling context fault interrupts until after the
> transaction is resumed. Because other context banks can share an IRQ
> line, we may still get an interrupt intended for another context bank,
> but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
> it assuming that interrupts are disabled which is accomplished by
> removing the bit from ARM_SMMU_CB_FSR_FAULT.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 +++++++++++++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 32 ++++++++++++++++++++++++++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +-
>   3 files changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ee2fdf7e79a6d04bc2700e454253c96b573c5569 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>   	struct arm_smmu_domain *smmu_domain = (void *)cookie;
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	u32 reg = 0;
> +	u32 reg = 0, sctlr;
> +	unsigned long flags;
>   
>   	if (terminate)
>   		reg |= ARM_SMMU_RESUME_TERMINATE;
>   
> +	spin_lock_irqsave(&smmu_domain->stall_lock, flags);
> +
>   	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +
> +	/*
> +	 * Re-enable interrupts after they were disabled by
> +	 * arm_smmu_context_fault().
> +	 */
> +	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +	sctlr |= ARM_SMMU_SCTLR_CFIE;
> +	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> +
> +	spin_unlock_irqrestore(&smmu_domain->stall_lock, flags);
>   }
>   
>   static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..c92de760940ee2872f22dbe1b2519e02766aa143 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -457,12 +457,43 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   				      DEFAULT_RATELIMIT_BURST);
>   	int idx = smmu_domain->cfg.cbndx;
>   	int ret;
> +	unsigned long flags;
>   
>   	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>   
>   	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
>   		return IRQ_NONE;
>   
> +	/*
> +	 * On some implementations FSR.SS asserts a context fault
> +	 * interrupt. We do not want this behavior, because resolving the
> +	 * original context fault typically requires operations that cannot be
> +	 * performed in IRQ context but leaving the stall unacknowledged will
> +	 * immediately lead to another spurious interrupt as FSR.SS is still
> +	 * set. Work around this by disabling interrupts for this context bank.
> +	 * It's expected that interrupts are re-enabled after resuming the
> +	 * translation.
> +	 *
> +	 * We have to do this before report_iommu_fault() so that we don't
> +	 * leave interrupts disabled in case the downstream user decides the
> +	 * fault can be resolved inside its fault handler.
> +	 *
> +	 * There is a possible race if there are multiple context banks sharing
> +	 * the same interrupt and both signal an interrupt in between writing
> +	 * RESUME and SCTLR. We could disable interrupts here before we
> +	 * re-enable them in the resume handler, leaving interrupts enabled.
> +	 * Lock the write to serialize it with the resume handler.
> +	 */
> +	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> +		u32 val;
> +
> +		spin_lock_irqsave(&smmu_domain->stall_lock, flags);

No need for _irqsave - if this IRQ handler could preempt itself, locking 
would be the least of our worries ;)

Also I'd be inclined to just use cb_lock for this rather than add a new 
one. I guess there's an argument for granularity, but there's also an 
argument that CFIE manipulation is just another context bank operation 
which needs serialising against itself, and significantly rarer than the 
others we have already.

Cheers,
Robin.

> +		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
> +		val &= ~ARM_SMMU_SCTLR_CFIE;
> +		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> +		spin_unlock_irqrestore(&smmu_domain->stall_lock, flags);
> +	}
> +
>   	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>   		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>   
> @@ -921,6 +952,7 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
>   
>   	mutex_init(&smmu_domain->init_mutex);
>   	spin_lock_init(&smmu_domain->cb_lock);
> +	spin_lock_init(&smmu_domain->stall_lock);
>   
>   	return &smmu_domain->domain;
>   }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 2dbf3243b5ad2db01e17fb26c26c838942a491be..153fac131b2484d468fd482ffbf130efc8cfb8f6 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
>   					 ARM_SMMU_CB_FSR_TLBLKF)
>   
>   #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
> -					 ARM_SMMU_CB_FSR_SS |		\
>   					 ARM_SMMU_CB_FSR_UUT |		\
>   					 ARM_SMMU_CB_FSR_EF |		\
>   					 ARM_SMMU_CB_FSR_PF |		\
> @@ -384,6 +383,7 @@ struct arm_smmu_domain {
>   	enum arm_smmu_domain_stage	stage;
>   	struct mutex			init_mutex; /* Protects smmu pointer */
>   	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> +	spinlock_t                      stall_lock;
>   	struct iommu_domain		domain;
>   };
>   
> 

