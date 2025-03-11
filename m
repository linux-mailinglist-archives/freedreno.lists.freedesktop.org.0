Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9EDA5CD61
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 19:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6912B10E657;
	Tue, 11 Mar 2025 18:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J9rsaALq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF2010E65D
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 18:11:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A1245C4BC5;
 Tue, 11 Mar 2025 18:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C269C4CEE9;
 Tue, 11 Mar 2025 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741716717;
 bh=lU7fvyEx/byBpU2OPa/0abt93RzPvbli7uszSlFeqB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J9rsaALqeGfRdT/7Tbh3HFOYal+hAmgqpz9e90GwHYCCC5d1YgpLSiLF6T7jrAfcP
 2CRWzL+4AR+G50o+tj87tDolr4WqPvl4JRNfSFDbLXx2HMiczGkrDU6RznzKezFpcW
 7Od5Owt/QCnquBVFV8cDm2/zAPqNz8j+mp6NX3q07BpTuBkwvIcU32uEaLg62WUTsW
 W7BiiFetPLOupwmR8fEuJUBXnUZ4SFzDk3PH9a6ScRFw38XfnurQh1QEbizcmn5Vhe
 eXA6bIHut2Y3Vugdr8iy5GKpdwGzCUm9+s/cxujaojGTIbGr1Or0rWDYsBC2NB+bEZ
 TyuHIAK0twNIg==
Date: Tue, 11 Mar 2025 18:11:52 +0000
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
Message-ID: <20250311181151.GD5216@willie-the-truck>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
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

On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> Up until now we have only called the set_stall callback during
> initialization when the device is off. But we will soon start calling it
> to temporarily disable stall-on-fault when the device is on, so handle
> that by checking if the device is on and writing SCTLR.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce72f48e3b38474da2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
>  {
>  	struct arm_smmu_domain *smmu_domain = (void *)cookie;
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> -	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +	u32 mask = BIT(cfg->cbndx);
> +	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
> +	unsigned long flags;
>  
>  	if (enabled)
> -		qsmmu->stall_enabled |= BIT(cfg->cbndx);
> +		qsmmu->stall_enabled |= mask;
>  	else
> -		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
> +		qsmmu->stall_enabled &= ~mask;
> +
> +	/*
> +	 * If the device is on and we changed the setting, update the register.
> +	 */
> +	if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> +		spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
> +		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +
> +		if (enabled)
> +			reg |= ARM_SMMU_SCTLR_CFCFG;
> +		else
> +			reg &= ~ARM_SMMU_SCTLR_CFCFG;
> +
> +		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);

Are you sure you don't need TLB invalidation for this to take effect? I
think some fields in the SCTLR can be cached in the TLB but you'll need
to check whether or not that applies to CFCFG.

Will
