Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19213A6DBC
	for <lists+freedreno@lfdr.de>; Mon, 14 Jun 2021 19:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1D06E05C;
	Mon, 14 Jun 2021 17:55:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAF96E05C
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jun 2021 17:55:00 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 67-20020a4a01460000b0290245b81f6261so2856614oor.6
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jun 2021 10:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RZlshWzShRr/1bxvI5qOhZ1dQlVIKovO57VSbDQdZFU=;
 b=Mg3/SfBqtNf7mgH1NsaYekPfohhc46bBdfe4bze5h9yw87oo0g6Tubo8ceS0mU4lbS
 YrOJFVzXaEREnDk6QfLMegA5sA6jXbkra30Y973xYjAvkOLGCa3A3XLBTjbArGSWzcRu
 ZLZHp7MrBMIAw/rtyRje/sdFpR7oFAH9f4PXGR+eNGrUt1rwBipxF+U8qVJy01+Z2ctI
 35RAPRCWroEBmT6zTirlKX3h/6nh5vLfRKkt3FYFZ4W7bnVbJ8wK2sfwV4nH4s9AZN4J
 MUSi42oyIsBS+fWSQTZ13sb55pNj3zjUfChF3o6gwZDXfPr4at+lupCH2JUBCkpb5G3/
 r+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RZlshWzShRr/1bxvI5qOhZ1dQlVIKovO57VSbDQdZFU=;
 b=YtY5CsRPVLL3duNpLKo2Ne1dLSpF5YtMfpJtS3uhKS7OCe8HhgKeij7EEuXgFM/Ory
 BPoHoqK0L73dBNusOvv/k/7B0ldymKcPLrBXpeWia3DnE+J1tS6/vt+WVObH79gazJpo
 ESenSNvi5dgQTLtZ16mIzzO/tLb3DSvxCcJOppgh6/aslTIvDovMnDdTTJSMd5GpISkb
 cXmBgQ79iVctccY9Uo8E+S0QsCPlmtgoQcwU2gizAs32ODJCrBsxh6cosvOd/w4T5nOo
 WV6xYjd+Q3gJCptxYDNN0rx0TVK3zmkIWDrL6p8VXBlUgSJG4X6w3IVTW8V2jL/Vx3xD
 4Ckw==
X-Gm-Message-State: AOAM53253+GeIuoN/1IkvCAfIjKLBZ3T7FYbqf6BWnRjSOGTz6jbqwRI
 nPbTunzYzkKzAn7FqPzX2G0syg==
X-Google-Smtp-Source: ABdhPJz1bHjlWmc11NEr6kmjCyfD8umeBOwZX3ymRU4S8kgueYx+/o5al/nmOVkubv+jft5vHI4vzQ==
X-Received: by 2002:a05:6820:29b:: with SMTP id
 q27mr14003988ood.32.1623693299312; 
 Mon, 14 Jun 2021 10:54:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 2sm3400587ota.58.2021.06.14.10.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 10:54:58 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:54:56 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YMeX8NnVw80b9Qpe@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610214431.539029-5-robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v5 4/5] iommu/arm-smmu-qcom: Add stall
 support
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
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, iommu@lists.linux-foundation.org,
 freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Add, via the adreno-smmu-priv interface, a way for the GPU to request
> the SMMU to stall translation on faults, and then later resume the
> translation, either retrying or terminating the current translation.
> 
> This will be used on the GPU side to "freeze" the GPU while we snapshot
> useful state for devcoredump.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>  include/linux/adreno-smmu-priv.h           |  7 +++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index b2e31ea84128..61fc645c1325 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -13,6 +13,7 @@ struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  	bool bypass_quirk;
>  	u8 bypass_cbndx;
> +	u32 stall_enabled;
>  };
>  
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> @@ -23,12 +24,17 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
>  		u32 reg)
>  {
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +
>  	/*
>  	 * On the GPU device we want to process subsequent transactions after a
>  	 * fault to keep the GPU from hanging
>  	 */
>  	reg |= ARM_SMMU_SCTLR_HUPCF;
>  
> +	if (qsmmu->stall_enabled & BIT(idx))
> +		reg |= ARM_SMMU_SCTLR_CFCFG;
> +
>  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
>  }
>  
> @@ -48,6 +54,31 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
>  	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
>  }
>  
> +static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
> +
> +	if (enabled)
> +		qsmmu->stall_enabled |= BIT(cfg->cbndx);
> +	else
> +		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
> +}
> +
> +static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	u32 reg = 0;
> +
> +	if (terminate)
> +		reg |= ARM_SMMU_RESUME_TERMINATE;
> +
> +	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>  
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -173,6 +204,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>  	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>  	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
> +	priv->set_stall = qcom_adreno_smmu_set_stall;
> +	priv->resume_translation = qcom_adreno_smmu_resume_translation;
>  
>  	return 0;
>  }
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> index 53fe32fb9214..c637e0997f6d 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -45,6 +45,11 @@ struct adreno_smmu_fault_info {
>   *                 TTBR0 translation is enabled with the specified cfg
>   * @get_fault_info: Called by the GPU fault handler to get information about
>   *                  the fault
> + * @set_stall:     Configure whether stall on fault (CFCFG) is enabled.  Call
> + *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
> + *                 the GPU driver must call resume_translation()
> + * @resume_translation: Resume translation after a fault
> + *
>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> @@ -60,6 +65,8 @@ struct adreno_smmu_priv {
>      const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
>      int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
>      void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
> +    void (*set_stall)(const void *cookie, bool enabled);
> +    void (*resume_translation)(const void *cookie, bool terminate);
>  };
>  
>  #endif /* __ADRENO_SMMU_PRIV_H */
> -- 
> 2.31.1
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
