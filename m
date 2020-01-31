Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B117214E94A
	for <lists+freedreno@lfdr.de>; Fri, 31 Jan 2020 09:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA5E6FAB1;
	Fri, 31 Jan 2020 08:00:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE326FAB9
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 08:00:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580457606; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=vDYKPZDva0OYUuiv6T+bASw/nbPttMElOslv2zckmr0=;
 b=tBZNVRRpY9IjtnRUW4gJS0vvKzN/XfU41k6SRa/KbH5ZlppZxAT7HlWrKa40mH4PCQoyQGTj
 iNiAPzXkiuJsP8m98zji13VUgPqPppnKApvrmACppJbQqV0PsLJ98HJTebPuGggVuvxlq61L
 q2agLyAj4nvzhkc69lHSWYPmDgs=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e33de7f.7f255a2dbb90-smtp-out-n02;
 Fri, 31 Jan 2020 07:59:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5CA6DC433CB; Fri, 31 Jan 2020 07:59:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.67.239]
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 291A5C43383;
 Fri, 31 Jan 2020 07:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 291A5C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
To: freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 smasetty@codeaurora.org
References: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
 <20200124182654.GA17149@jcrouse1-lnx.qualcomm.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <9a9ec81d-f963-8d71-d6aa-d32956788d94@codeaurora.org>
Date: Fri, 31 Jan 2020 13:29:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200124182654.GA17149@jcrouse1-lnx.qualcomm.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Correct the highestbank
 configuration
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 1/24/2020 11:56 PM, Jordan Crouse wrote:
> On Fri, Jan 24, 2020 at 05:50:11PM +0530, Akhil P Oommen wrote:
>> Highest bank bit configuration is different for a618 gpu. Update
>> it with the correct configuration which is the reset value incidentally.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index daf0780..536d196 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -470,10 +470,12 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>>   	/* Select CP0 to always count cycles */
>>   	gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
>>   
>> -	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
>> -	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
>> -	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
>> -	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
>> +	if (adreno_is_a630(adreno_gpu)) {
>> +		gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
>> +		gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
>> +		gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
>> +		gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
>> +	}
> it shouldn't come as a surprise that everything in the a6xx family is going to
> have a highest bank bit setting. Even though the a618 uses the reset value, I
> think it would be less confusing to future folks if we explicitly program it:
>
> if (adreno_is_a630(adreno_dev))
>    hbb = 2;
> else
>    hbb = 0;

I think it would be better if we keep this in the adreno_info. Yes, this 
would waste a tiny bit of space for other gpu
entries in the gpulist. It is also possible to move this to a separate 
struct and keep a pointer to it in the adreno_info.
But that is something we should try when there are more a6xx specific 
configurations in future.

I have a new patch, but testing it is taking longer that I expected. I 
will share it as soon as possible.

> ....
>
> Jordan
>
Akhil

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
