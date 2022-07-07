Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BFF56AC07
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 21:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ED0113127;
	Thu,  7 Jul 2022 19:45:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62243113127
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 19:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657223123; x=1688759123;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3xJHQe+yQFIodx2gzmY5WoW+Ea9dC76RIoKyjg+sno8=;
 b=GP3W5MGQhAhOb1cwrqNgIlMC+Gt7qi0rcKy40vBURvAoiTxThIn66PY9
 b0OQAXEgFQ5rHXtBKvzGArfwAlq34M01CzolEjXI14JbMevrpWu4e4W7+
 yVPqc0iXemq1uo804BcbXF4rgwAj/7yned9hK3wUme9EFjznCIbISN2kP A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Jul 2022 12:45:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 12:45:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 12:45:22 -0700
Received: from [10.216.9.164] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 7 Jul 2022
 12:45:21 -0700
Message-ID: <1a7bbd5e-a234-bacf-09aa-31124678dbed@quicinc.com>
Date: Fri, 8 Jul 2022 01:15:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <1657210262-17166-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220707213950.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
 <CAF6AEGudkkUvYjy_7engFGrQy2scdskmc1SRpKN3x0MOxOr1ug@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGudkkUvYjy_7engFGrQy2scdskmc1SRpKN3x0MOxOr1ug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH 3/7] drm/msm: Fix cx collapse issue during
 recovery
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

On 7/7/2022 10:40 PM, Rob Clark wrote:
> On Thu, Jul 7, 2022 at 9:11 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> There are some hardware logic under CX domain. For a successful
>> recovery, we should ensure cx headswitch collapses to ensure all the
>> stale states are cleard out. This is especially true to for a6xx family
>> where we can GMU co-processor.
>>
>> Currently, cx doesn't collapse due to a devlink between gpu and its
>> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
>> that the iommu driver removes its vote on cx gdsc.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
>>   drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>>   2 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 42ed9a3..57a7ad5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1210,8 +1210,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
>>           */
>>          gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>>
>> -       gpu->funcs->pm_suspend(gpu);
>> -       gpu->funcs->pm_resume(gpu);
>> +       /*
>> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
>> +        * First drop the usage count from all active submits
>> +        */
>> +       for (i = gpu->active_submits; i > 0; i--)
>> +               pm_runtime_put(&gpu->pdev->dev);
> 
> Would pm_runtime_force_suspend/resume() work instead?

I believe it is supposed to be used only during system sleep state 
transitions. Btw, we don't want pm_runtime_get() calls from elsewhere to 
fail by disabling RPM here.

-Akhil
> 
> BR,
> -R
> 
>> +
>> +       /* And the final one from recover worker */
>> +       pm_runtime_put_sync(&gpu->pdev->dev);
>> +
>> +       for (i = gpu->active_submits; i > 0; i--)
>> +               pm_runtime_get(&gpu->pdev->dev);
>> +
>> +       pm_runtime_get_sync(&gpu->pdev->dev);
>>
>>          msm_gpu_hw_init(gpu);
>>   }
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index f75ff4b..48171b6 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -444,9 +444,7 @@ static void recover_worker(struct kthread_work *work)
>>                  /* retire completed submits, plus the one that hung: */
>>                  retire_submits(gpu);
>>
>> -               pm_runtime_get_sync(&gpu->pdev->dev);
>>                  gpu->funcs->recover(gpu);
>> -               pm_runtime_put_sync(&gpu->pdev->dev);
>>
>>                  /*
>>                   * Replay all remaining submits starting with highest priority
>> --
>> 2.7.4
>>

