Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA022F328
	for <lists+freedreno@lfdr.de>; Mon, 27 Jul 2020 16:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FFC89BEC;
	Mon, 27 Jul 2020 14:57:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FF589BEC
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jul 2020 14:57:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595861873; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=7443zfi2pZMKrWNjK4v1Ad32a0BS0R3bKBhFoOV5yxQ=;
 b=nlXQ2fVervs265ocv9caQvSHcxeWOx7PO6I8XR6Gon7PEc8PLxdRgaKHv21AaIpLYyzpi2Qw
 wLVQuts+OVmSIGNPM1R0y9w1d5ymbebuvGXU0uRwn+6hx/UYjnkhMNer1LdWcAyvr7kq2jtg
 t3Yl/g9DfvwpeVffYdlIIAaFBxs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f1eeb6aa61bb9e3f5539cec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 14:57:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B003FC433A0; Mon, 27 Jul 2020 14:57:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C638C433C9;
 Mon, 27 Jul 2020 14:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C638C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 27 Jul 2020 08:57:41 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Message-ID: <20200727145740.GA32521@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
 iommu@lists.linux-foundation.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
 <20200720154047.3611092-5-jcrouse@codeaurora.org>
 <20200727062703.GB3521288@ripper>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727062703.GB3521288@ripper>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Sun, Jul 26, 2020 at 11:27:03PM -0700, Bjorn Andersson wrote:
> On Mon 20 Jul 08:40 PDT 2020, Jordan Crouse wrote:
> > diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> [..]
> > +static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> > +		struct device *dev, int start, int count)
> > +{
> > +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> > +
> > +	/*
> > +	 * Assign context bank 0 to the GPU device so the GPU hardware can
> > +	 * switch pagetables
> > +	 */
> > +	if (qcom_adreno_smmu_is_gpu_device(dev)) {
> > +		if (start > 0 || test_bit(0, smmu->context_map))
> > +			return -ENOSPC;
> > +
> > +		set_bit(0, smmu->context_map);
> > +		return 0;
> > +	}
> > +
> > +	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
> 
> If we end up here before the GPU device shows up this is going to
> steal the first context bank, causing the subsequent allocation for the
> GPU to always fail.
> 
> As such I think it would be appropriate for you to adjust "start" to
> never be 0 here. And I think it would be appropriate to write this
> function as:
> 
> 	if (gpu) {
> 		start = 0;
> 		count = 1;
> 	} else {
> 		if (start == 0)
> 			start = 1;
> 	}
> 
> 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);

Excellent suggestions.  Thanks.

Jordan

> Regards,
> Bjorn

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
