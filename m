Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50DABDC0D
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 16:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3C010E04E;
	Tue, 20 May 2025 14:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PY7Kpq/D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A7F10E04E
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 14:19:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 42A9044CBF;
 Tue, 20 May 2025 14:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D321BC4CEE9;
 Tue, 20 May 2025 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747750780;
 bh=IhI7l0xll5O16+UQEAHx7/Spa+EO1wPRI2Jo0GWGLO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PY7Kpq/DkMUxa0RJK1glOHkLQ0yju+gu+78/ONN5U2/iZPdJAkr7v2gQtDQI3Vy0P
 C85Xph9xpGhxuZ4G11BAJsEckSnQNki90dbSESkQe9owE0DWADkb0/saqhGg1bA87V
 ir1rUJTBccUVYCAuABeX3MMt9oAkmjz+EHbHhOn4EFsIJBEuQoMjunVKuxPW9IB3K9
 gptP2JYxxjjFVpf6370gNVBibQnXxw+tAf8p6goxp4RXNr8upbBGd0HbvYJU/dcphg
 FnfELYEzZl9tqKs0i93aOB0qO5iVsaxdAf7o+99Y7ERWHXkTu/dqPXr38c9SSopNrv
 LGrQTNW8HJfhQ==
Date: Tue, 20 May 2025 15:19:34 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 2/7] iommu/arm-smmu: Move handing of RESUME to the
 context fault handler
Message-ID: <20250520141933.GD18711@willie-the-truck>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
 <20250515-msm-gpu-fault-fixes-next-v6-2-4fe2a583a878@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-2-4fe2a583a878@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, May 15, 2025 at 03:58:44PM -0400, Connor Abbott wrote:
> The upper layer fault handler is now expected to handle everything
> required to retry the transaction or dump state related to it, since we
> enable threaded IRQs. This means that we can take charge of writing
> RESUME, making sure that we always write it after writing FSR as
> recommended by the specification.
> 
> The iommu handler should write -EAGAIN if a transaction needs to be
> retried. This avoids tricky cross-tree changes in drm/msm, since it
> never wants to retry the transaction and it already returns 0 from its
> fault handler. Therefore it will continue to correctly terminate the
> transaction without any changes required.
> 
> devcoredumps from drm/msm will temporarily be broken until it is fixed
> to collect devcoredumps inside its fault handler, but fixing that first
> would actually be worse because MMU-500 ignores writes to RESUME unless
> all fields of FSR (except SS of course) are clear and raises an
> interrupt when only SS is asserted. Right now, things happen to work
> most of the time if we collect a devcoredump, because RESUME is written
> asynchronously in the fault worker after the fault handler clears FSR
> and finishes, although there will be some spurious faults, but if this
> is changed before this commit fixes the FSR/RESUME write order then SS
> will never be cleared, the interrupt will never be cleared, and the
> whole system will hang every time a fault happens. It will therefore
> help bisectability if this commit goes first.
> 
> I've changed the TBU path to also accept -EAGAIN and do the same thing,
> while keeping the old -EBUSY behavior. Although the old path was broken
> because you'd get a storm of interrupts due to returning IRQ_NONE that
> would eventually result in the interrupt being disabled, and I think it
> was dead code anyway, so it should eventually be deleted. Note that
> drm/msm never uses TBU so this is untested.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 +++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 14 --------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 ++++++
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e89fd978367afa65c473002f66e2e7..3e0c2c7c639b0c09243578ebb95129398c630ef2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -406,6 +406,12 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>  			arm_smmu_print_context_fault_info(smmu, idx, &cfi);
>  
>  		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> +
> +		if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> +			arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
> +					  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
> +		}
> +
>  		return IRQ_HANDLED;
>  	}
>  
> @@ -416,6 +422,9 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>  	if (!tmp || tmp == -EBUSY) {
>  		ret = IRQ_HANDLED;
>  		resume = ARM_SMMU_RESUME_TERMINATE;
> +	} else if (tmp == -EAGAIN) {
> +		ret = IRQ_HANDLED;
> +		resume = 0;
>  	} else {
>  		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, cfi.iova, cfi.fsr);

Hrm, this debug stuff looks like it could use some clean-up. Not for
this series, but I may have a quick look on top...

Will
