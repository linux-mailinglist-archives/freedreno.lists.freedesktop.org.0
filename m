Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6155391B
	for <lists+freedreno@lfdr.de>; Tue, 21 Jun 2022 19:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BD810E204;
	Tue, 21 Jun 2022 17:44:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6597E10E204
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 17:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655833460; x=1687369460;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=gONKT1UPriQCs/i3OvZ6WzWauKCzmlMlPLxa3MCvwkQ=;
 b=Evx/DSML6HFSu5Ut1TNDoYfjf1jquYzE7Aq/5PIgoi4dlBPS8MiuIfiw
 JMICzAcm2EFxSgmYK/n1WjKIDtmooXsdy4TKvU8VXxG6CjANHj04YBK0o
 6fdURb6BkjTH3aceJ8a2IQ03S2iGcN1i734BDmxATLcqqxJa3IKeY34ZN Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Jun 2022 10:44:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 10:44:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 21 Jun 2022 10:44:19 -0700
Received: from [10.38.247.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 21 Jun
 2022 10:44:17 -0700
Message-ID: <955f881c-7731-a337-3ff9-e58863c41976@quicinc.com>
Date: Tue, 21 Jun 2022 10:44:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: sunliming <sunliming@kylinos.cn>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>
References: <20220621110634.368913-1-sunliming@kylinos.cn>
 <d4b882ba-b773-5271-6050-416c8f3cad4b@quicinc.com>
In-Reply-To: <d4b882ba-b773-5271-6050-416c8f3cad4b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix variable dereferenced
 before check
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
Cc: kelulanainsley@gmail.com, freedreno <freedreno@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel test robot <lkp@intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Copying freedreno

On 6/21/2022 10:42 AM, Abhinav Kumar wrote:
> 
> 
> On 6/21/2022 4:06 AM, sunliming wrote:
>> Fixes the following smatch warning:
>>
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:261
>> dpu_encoder_phys_wb_atomic_check() warn: variable dereferenced before 
>> check 'conn_state'
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: sunliming <sunliming@kylinos.cn>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index 59da348ff339..0ec809ab06e7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -252,11 +252,6 @@ static int dpu_encoder_phys_wb_atomic_check(
>>       DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>>               phys_enc->wb_idx, mode->name, mode->hdisplay, 
>> mode->vdisplay);
>> -    if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
>> -        return 0;
>> -
>> -    fb = conn_state->writeback_job->fb;
>> -
>>       if (!conn_state || !conn_state->connector) {
>>           DPU_ERROR("invalid connector state\n");
>>           return -EINVAL;
>> @@ -267,6 +262,11 @@ static int dpu_encoder_phys_wb_atomic_check(
>>           return -EINVAL;
>>       }
>> +    if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
>> +        return 0;
>> +
>> +    fb = conn_state->writeback_job->fb;
>> +
>>       DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
>>               fb->width, fb->height);
