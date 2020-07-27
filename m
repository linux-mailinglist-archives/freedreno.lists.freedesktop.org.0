Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDD22E5D7
	for <lists+freedreno@lfdr.de>; Mon, 27 Jul 2020 08:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A6B89CD3;
	Mon, 27 Jul 2020 06:26:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB69089CD3
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jul 2020 06:26:54 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id mt12so1204621pjb.4
 for <freedreno@lists.freedesktop.org>; Sun, 26 Jul 2020 23:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SvwHT3zjyXrrBuntHjIVAEV0M2NnXn0+m3b0NtDYJoE=;
 b=ejdZFEQvh05oUlpaaf9ORS5njhfQig6+GWZ5iAPvih6BwIK+yozIcqu5gDr5y2tL56
 ADgJc78zCBS2EW98C0yjIxuIsjhx09ehgqbbeHbAwoyMpOQVXTQH1nMrTOPbKRHgt8O9
 sEQlDf+2CMo4G6gOuRpnv5VESD2+VrOWa7LgfpsijoI1HeDvVons3C2Y9+dsPMLZ1Oz3
 Bdws0mCecBLhZm6sHQMYNW4/SJu9hk164lbUn1lN17jQ742Assa0ed2lVhx7uFglNVLw
 cZMgphZV/5Ax8e+K6npZ4GuvFErEUH7JIESgfsRAUz25GtLadeKzdGjt153zNVy4+pwE
 fIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SvwHT3zjyXrrBuntHjIVAEV0M2NnXn0+m3b0NtDYJoE=;
 b=RhWejLu6NoNQpoUa0Gle8FsPY949bsJo8cnKKivehjZG6kB7Qk67nDDFh2HQ9yaA2w
 3vzMQq783DU5jIeT/UUq9hPmrcXxQSOENkseZ0rsk9TU9vdxIaPoK2mnR5kseU9Zo3Mu
 nPF9mKsuLIHyz1ynJmRPcL+vqSArPTV8voeiiWv8HcyvwUAYCsLHBg0lN1is/InrM8zj
 vAZX734WXiea4VZFhW3LuyqB1DQnvy7n5raHJoL9+Mu74t+9MZ+C1kP+MY/qEwctNvP5
 mcEMwB4o15LyhOO0hp8o+1Rh9/0HdOlYdyLNHHFydgH+rbE7weYxXAhuKNLHaYre9zoC
 mt2w==
X-Gm-Message-State: AOAM530svxfogaWEVziFrvHjj00mBf4mTiLFAfjifyYW95rOd0RFgG5S
 jT9docBPsYCvWVBEC3dsuSA5Lg==
X-Google-Smtp-Source: ABdhPJxzOwp68yM0wuFfeb8opsYwXxFrJEEJC31OdMJvY+oua+KBvMHJty3QtAaz4JwNX0GSAm9idQ==
X-Received: by 2002:a17:902:aa82:: with SMTP id
 d2mr17236160plr.336.1595831214315; 
 Sun, 26 Jul 2020 23:26:54 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id g23sm3090336pfo.95.2020.07.26.23.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 23:26:53 -0700 (PDT)
Date: Sun, 26 Jul 2020 23:27:03 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200727062703.GB3521288@ripper>
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
 <20200720154047.3611092-5-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720154047.3611092-5-jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v10 04/13] iommu/arm-smmu-qcom: Add
 implementation for the adreno GPU SMMU
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
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon 20 Jul 08:40 PDT 2020, Jordan Crouse wrote:
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
[..]
> +static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> +		struct device *dev, int start, int count)
> +{
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	/*
> +	 * Assign context bank 0 to the GPU device so the GPU hardware can
> +	 * switch pagetables
> +	 */
> +	if (qcom_adreno_smmu_is_gpu_device(dev)) {
> +		if (start > 0 || test_bit(0, smmu->context_map))
> +			return -ENOSPC;
> +
> +		set_bit(0, smmu->context_map);
> +		return 0;
> +	}
> +
> +	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);

If we end up here before the GPU device shows up this is going to
steal the first context bank, causing the subsequent allocation for the
GPU to always fail.

As such I think it would be appropriate for you to adjust "start" to
never be 0 here. And I think it would be appropriate to write this
function as:

	if (gpu) {
		start = 0;
		count = 1;
	} else {
		if (start == 0)
			start = 1;
	}

	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
