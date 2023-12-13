Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CEA80A28C
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 12:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B2910E299;
	Fri,  8 Dec 2023 11:49:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E59510E299
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 11:49:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 221FB1063;
 Fri,  8 Dec 2023 03:50:00 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 294493F762;
 Fri,  8 Dec 2023 03:49:12 -0800 (PST)
Message-ID: <8e4b3c92-f2e4-48f3-848e-776a64fe1d31@arm.com>
Date: Fri, 8 Dec 2023 11:49:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add missing GMU entry to match table
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org
References: <20231207212441.6199-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231207212441.6199-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Richard Acayan <mailingradian@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/12/2023 9:24 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We also want the default domain for the GMU to be an identy domain,
> so it does not get a context bank assigned.  Without this, both
> of_dma_configure() and drm/msm's iommu_domain_attach() will trigger
> allocating and configuring a context bank.  So GMU ends up attached
> to both cbndx 1 and cbndx 2.

I can't help but read this as implying that it gets attached to both *at 
the same time*, which would be indicative of a far more serious problem 
in the main driver and/or IOMMU core code.

However, from what we discussed on IRC last night, it sounds like the 
key point here is more straightforwardly that firmware expects the GMU 
to be using context bank 1, in a vaguely similar fashion to how context 
bank 0 is special for the GPU. Clarifying that would help explain why 
we're just doing this as a trick to influence the allocator (i.e. unlike 
some of the other devices in this list we don't actually need the 
properties of the identity domain itself).

In future it might be nice to reserve this explicitly on platforms which 
need it and extend qcom_adreno_smmu_alloc_context_bank() to handle the 
GMU as well, but I don't object to this patch as an immediate quick fix 
for now, especially as something nice and easy for stable (I'd agree 
with Johan in that regard).

Thanks,
Robin.

>  This arrangement seemingly confounds
> and surprises the firmware if the GPU later triggers a translation
> fault, resulting (on sc8280xp / lenovo x13s, at least) in the SMMU
> getting wedged and the GPU stuck without memory access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 549ae4dba3a6..d326fa230b96 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -243,6 +243,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>   
>   static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>   	{ .compatible = "qcom,adreno" },
> +	{ .compatible = "qcom,adreno-gmu" },
>   	{ .compatible = "qcom,mdp4" },
>   	{ .compatible = "qcom,mdss" },
>   	{ .compatible = "qcom,sc7180-mdss" },
