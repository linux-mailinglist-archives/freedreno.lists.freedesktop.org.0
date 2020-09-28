Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5200E27ADBF
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 14:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117DA89A4A;
	Mon, 28 Sep 2020 12:28:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BC96E117
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 12:28:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601296137; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xdne3b42R19CBmmD1o/ATM9Y99s0hNLFfkiTn9N47ps=;
 b=e9imC3OXTI0vMl2fIhYoSQeyObi4faFdHzqtaNoia3/HZYJ+wdEymuse3LXtRGgnw6hrIai+
 R3b0tnCH0ewIe6vqRo6vx8cul1bgGRKbAjaqJB8KU/fQFMn4DwiiOK9sjH5xRkUjdMyA5uef
 BRhIAw27K5ECiznOJMgK+nXBf6Q=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f71d708bebf546dbbd6afc8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 12:28:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CE512C4339C; Mon, 28 Sep 2020 12:28:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C9D21C433C8;
 Mon, 28 Sep 2020 12:28:55 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 28 Sep 2020 17:58:55 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <d9b46e48-afa5-ceff-aee8-a75a95a3e459@arm.com>
References: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <f2d079d46cee22f09f6eb7e6f874a9eaa786ec2a.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <d9b46e48-afa5-ceff-aee8-a75a95a3e459@arm.com>
Message-ID: <ca9d546d27b358a03a8108c98a37e17b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCHv5 5/6] iommu: arm-smmu-impl: Use table to
 list QCOM implementations
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-09-23 20:54, Robin Murphy wrote:
> On 2020-09-22 07:18, Sai Prakash Ranjan wrote:
>> Use table and of_match_node() to match qcom implementation
>> instead of multiple of_device_compatible() calls for each
>> QCOM SMMU implementation.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
>> index d199b4bff15d..ce78295cfa78 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
>> @@ -9,6 +9,13 @@
>>     #include "arm-smmu.h"
>>   +static const struct of_device_id __maybe_unused 
>> qcom_smmu_impl_of_match[] = {
>> +	{ .compatible = "qcom,sc7180-smmu-500" },
>> +	{ .compatible = "qcom,sdm845-smmu-500" },
>> +	{ .compatible = "qcom,sm8150-smmu-500" },
>> +	{ .compatible = "qcom,sm8250-smmu-500" },
>> +	{ }
>> +};
> 
> Can you push the table itself into arm-smmu-qcom? That way you'll be
> free to add new SoCs willy-nilly without any possibility of
> conflicting with anything else.
> 
> Bonus points if you can fold in the Adreno variant and keep everything
> together ;)
> 

Sure I can get bonus points :)

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
