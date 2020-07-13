Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DE21D9CC
	for <lists+freedreno@lfdr.de>; Mon, 13 Jul 2020 17:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11396E258;
	Mon, 13 Jul 2020 15:09:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6548A6E258
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 15:09:08 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8A14205CB;
 Mon, 13 Jul 2020 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594652947;
 bh=vngHFPy6JLQna7o2+Dx1IPDqHMOEQth8MnxQOxW04yA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E040T9qhClnKRLJxdVpFYW9R6VpwPxG9f7y42Fa2tHvqsGskw4NuW6j0cd3ObUudq
 C88NkzK3mA+1rIsiiflU4VV5PwpEa7I2V/YQEyD1t8Tu42WQKdA1ZFog36C6ESpbNV
 57ZOU5atVZ7mjGB1ufC8p0H5F1tiOPa8sFPjAVqs=
Date: Mon, 13 Jul 2020 16:09:02 +0100
From: Will Deacon <will@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200713150901.GA3072@willie-the-truck>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
 <20200626200042.13713-5-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626200042.13713-5-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH v9 4/7] iommu/arm-smmu: Add a pointer to the
 attached device to smmu_domain
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, John Stultz <john.stultz@linaro.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 02:00:38PM -0600, Jordan Crouse wrote:
> Add a link to the pointer to the struct device that is attached to a
> domain. This makes it easy to get the pointer if it is needed in the
> implementation specific code.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm-smmu.c | 6 ++++--
>  drivers/iommu/arm-smmu.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 048de2681670..060139452c54 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -668,7 +668,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>  }
>  
>  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> -					struct arm_smmu_device *smmu)
> +					struct arm_smmu_device *smmu,
> +					struct device *dev)
>  {
>  	int irq, start, ret = 0;
>  	unsigned long ias, oas;
> @@ -801,6 +802,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		cfg->asid = cfg->cbndx;
>  
>  	smmu_domain->smmu = smmu;
> +	smmu_domain->dev = dev;
>  
>  	pgtbl_cfg = (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	= smmu->pgsize_bitmap,
> @@ -1190,7 +1192,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		return ret;
>  
>  	/* Ensure that the domain is finalised */
> -	ret = arm_smmu_init_domain_context(domain, smmu);
> +	ret = arm_smmu_init_domain_context(domain, smmu, dev);
>  	if (ret < 0)
>  		goto rpm_put;
>  
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index 5f2de20e883b..d33cfe26b2f5 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -345,6 +345,7 @@ struct arm_smmu_domain {
>  	struct mutex			init_mutex; /* Protects smmu pointer */
>  	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
>  	struct iommu_domain		domain;
> +	struct device			*dev;	/* Device attached to this domain */

This really doesn't feel right to me -- you can generally have multiple
devices attached to a domain and they can come and go without the domain
being destroyed. Perhaps you could instead identify the GPU during
cfg_probe() and squirrel that information away somewhere?

The rest of the series looks ok to me.

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
