Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77634DF2E
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 05:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFC689DE1;
	Tue, 30 Mar 2021 03:22:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D640389DE1
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 03:22:50 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso14308079otq.3
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 20:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7t41cKlUPf2SnzIKDlby3FdcAtybZ6gP9vRyzm3tlpw=;
 b=TJNV3MVCQiasUwqdWIivjPmtxOlTOM1JFzmuOpR9nVs/xhurYQoXWzFj6vka6gfYKh
 M5YUGkd78B11wr1AdEIa9Qcc6G/+eyhgbltQO7vqHBoq42lkywNNLVeZBhYv6gS8k9Uy
 zApFG9rXYZ+cdBMyjDherT3Gnk2sZ7J32aONf0JqZFLjRj9X5brQ8V1+O5LGj6UYoa8x
 5BYnrnfuIIScVKQ03JGW/yn6CMtjUCj6IkK/gfMntf+qRiyX3AK98tu/oYIdKw/IQLlo
 N6s3NJciHIcZcql/q6sYzASzKajau88T+2BRMKyuyy4NsZLbxcGECElNmCFy77c4+ndD
 S+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7t41cKlUPf2SnzIKDlby3FdcAtybZ6gP9vRyzm3tlpw=;
 b=TW09oak2tSvzxpSB8NG84an/twnftCDUE37LpKn9okP4GrBxyrbfJn7tcGmlFT5QQG
 P1+Kc7lMR0D0spYqNSGnx+DrB9IatWJ+F3n9QR3LyGSN+j6YjyEsKxgFyOB7VEV6R0Uu
 DMxqB0BXhDdY7c95sFhyyfnS8TFx+9s1xG/rt9t21w+rAoTkuxioOi/kUIESEDRcEQxb
 29rjQAiOgUJPXOV/Hg5pGpwBtAqagkny40ij0WWGlAGowpZgeO0Aljbpwame4WKCBqro
 maN2LhzbRHpa/YwKpcPTDCk0BK5vAbOSU2UhgE6t1OoTpDIzEDV7TyyrlwzBBJQcljvq
 ZE3w==
X-Gm-Message-State: AOAM530xq/9IjKRZersABUajgtG+bAJRSE1mop2Gsv4KBOzHnNmlTbbR
 K/RDvd+iclWzdfVx0FbOsUr14g==
X-Google-Smtp-Source: ABdhPJz07cbagzaVzHToP1yWalnf9L0GdocLLOt77CGY/q0IwhHE08v6oRtmLrtY0x/kftQXiO+LgQ==
X-Received: by 2002:a05:6830:57:: with SMTP id
 d23mr24601867otp.44.1617074570171; 
 Mon, 29 Mar 2021 20:22:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r20sm4954787otd.26.2021.03.29.20.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 20:22:49 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:22:47 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Eric Anholt <eric@anholt.net>
Message-ID: <YGKZh5zHcbC18cZq@builder.lan>
References: <20210326231303.3071950-1-eric@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
Subject: Re: [Freedreno] [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1
 quirk for db820c.
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
Cc: freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 26 Mar 18:13 CDT 2021, Eric Anholt wrote:

> db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> the GPU from wedging and then sometimes wedging the kernel after a
> page fault), but it doesn't have separate pagetables support yet in
> drm/msm so we can't go all the way to the TTBR1 path.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> We've been seeing a flaky test per day or so in Mesa CI where the
> kernel gets wedged after an iommu fault turns into CP errors.  With
> this patch, the CI isn't throwing the string of CP errors on the
> faults in any of the ~10 jobs I've run so far.
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index bcda17012aee..51f22193e456 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -130,6 +130,16 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
>  	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
>  }
>  
> +static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
> +{
> +	const struct device_node *np = smmu->dev->of_node;
> +
> +	if (of_device_is_compatible(np, "qcom,msm8996-smmu-v2"))
> +		return false;
> +
> +	return true;
> +}
> +
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> @@ -144,7 +154,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	 * be AARCH64 stage 1 but double check because the arm-smmu code assumes
>  	 * that is the case when the TTBR1 quirk is enabled
>  	 */
> -	if ((smmu_domain->stage == ARM_SMMU_DOMAIN_S1) &&
> +	if (qcom_adreno_can_do_ttbr1(smmu_domain->smmu) &&
> +	    (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) &&
>  	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
>  		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
>  
> -- 
> 2.31.0
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
