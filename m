Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE00D28B640
	for <lists+freedreno@lfdr.de>; Mon, 12 Oct 2020 15:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69436E456;
	Mon, 12 Oct 2020 13:34:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4A789FA6
 for <freedreno@lists.freedesktop.org>; Mon, 12 Oct 2020 13:33:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602509639; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yJVu2nYtW7tgXAqxi6u1cPfPKhnG3l6c6j29s6R7Esg=;
 b=N/sT4g75BlZ2UM3532bj2r7dEw2bxesPLJG7ronyt5Otc3DV84fWpjO9H8amzstBO+b31sdL
 CGyy1BDiLsMQvUNe5SPb4ss8DWFEYXDhDIzgsCB7uAhUMJClE7fT/9MDjUCMtOZ3wDFD/IBq
 Ry+g62OiFIEARS1DG9ExGfnIomU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f845b4652f4fccef0b2a0e8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Oct 2020 13:33:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 93B69C433F1; Mon, 12 Oct 2020 13:33:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.180.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1344FC43391;
 Mon, 12 Oct 2020 13:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1344FC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
To: mka@chromium.org
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
 <20201009183640.GB1292413@google.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
Date: Mon, 12 Oct 2020 19:03:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009183640.GB1292413@google.com>
Content-Language: en-US
Subject: Re: [Freedreno] [2/2] drm/msm: Add support for GPU cooling
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
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/10/2020 12:06 AM, mka@chromium.org wrote:
> Hi Akhil,
> 
> On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
>> Register GPU as a devfreq cooling device so that it can be passively
>> cooled by the thermal framework.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
>>   drivers/gpu/drm/msm/msm_gpu.h |  2 ++
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index 55d1648..93ffd66 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -14,6 +14,7 @@
>>   #include <generated/utsrelease.h>
>>   #include <linux/string_helpers.h>
>>   #include <linux/devfreq.h>
>> +#include <linux/devfreq_cooling.h>
>>   #include <linux/devcoredump.h>
>>   #include <linux/sched/task.h>
>>   
>> @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
>>   	if (IS_ERR(gpu->devfreq.devfreq)) {
>>   		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
>>   		gpu->devfreq.devfreq = NULL;
>> +		return;
>>   	}
>>   
>>   	devfreq_suspend_device(gpu->devfreq.devfreq);
>> +
>> +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
>> +			gpu->devfreq.devfreq);
>> +	if (IS_ERR(gpu->cooling)) {
>> +		DRM_DEV_ERROR(&gpu->pdev->dev,
>> +				"Couldn't register GPU cooling device\n");
>> +		gpu->cooling = NULL;
>> +	}
>>   }
>>   
>>   static int enable_pwrrail(struct msm_gpu *gpu)
>> @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   
>>   	msm_devfreq_init(gpu);
>>   
>> -
>>   	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
>>   
>>   	if (gpu->aspace == NULL)
>> @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>>   		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
>>   		msm_gem_address_space_put(gpu->aspace);
>>   	}
>> +
>> +	devfreq_cooling_unregister(gpu->cooling);
> 
> Resources should be released in reverse order, otherwise the cooling device
> could use resources that have already been freed.
> Why do you think this is not the correct order? If you are thinking 
about devfreq struct, it is managed device resource.

-Akhil
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
