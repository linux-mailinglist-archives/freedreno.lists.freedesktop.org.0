Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB97B111E3
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 21:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D417710E29D;
	Thu, 24 Jul 2025 19:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGEGXUNL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8476B10E29D
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 19:48:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OA0lGp031506
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 19:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +Zk31FwHDyecwqZluw7Q4yVbVUdBUD1ySIUTZM3t/+4=; b=VGEGXUNLCcnzxox7
 cTtrUHI9JgtZSZXmvIuz+hJuDJlt/MuibF3N1cZUuDKd2wssjc3FxqPoKNAIy7n3
 U+9BSHIn44d0dgPlhTQbJ8xDiw688Z1BMjHGOn+2g3dlg80WAQjSX+0EZZJvRtdq
 s5duzZPvWxy/iYcsfCOFB+JqfGFie33PmaL1kj5z23c1oXXM/p7E/4eDrrP0ZowN
 0PgFWUYc4Pr8VY+kbIzEchgl2nGxgYC0L59vQWHrvN7nDAmrC7UQhstCb7jwClrm
 io3aOJGrPcQ9Acatr/LcAGJof82bKB71MV4fEMCjynzWUDPc1XIh59cMZJ6wBZQF
 1VY0aA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vgb3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 19:48:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-313d346dc8dso2251579a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 12:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753386521; x=1753991321;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Zk31FwHDyecwqZluw7Q4yVbVUdBUD1ySIUTZM3t/+4=;
 b=f4tPEC5hesbSBIWmyr7bd/Teg/MexYAq3dBo93U9Xgw4t9ycVJPw1xH+QML06KQJ3p
 vNeYPERosMyz0UKJz6Exz9t5qCU0JxGCpMh2FrmbZhiqDqRkW7kZ7SpBIWkUdMNWp5M3
 rhhz0uL/i2JtrczwlEb5OSzapZPRcN0n1wj3yK5YUnMC4IVXi6X7bsQeunYtjwheq98z
 gmSdaI7dW9zTP3TG6ueqP6v+RUTdwDgLNQIKxlyjCqcPtdU7nC9Z9KnpyuqxRnJVI9up
 70Le8m+YdsAAkbv3dMfwKhI4F4xCDPBac/aWSFYERJUsCo4fEclzRnAZ61+veYsHulUL
 zFYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpJsv2YrpslXjO0WKlSz8+g+Xn9duHrhljis4J9GwjVHLe3IycBOlu9tjNXogXi0JtFsa6kQOpvwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqVIoaM145V9VdiwUg9MAEJLWculC7EQlgmpdeK8nXg7wBuLzF
 nqNWO74uiQYQuA3PHmBDKKt1nfqm1OHr9CqcM3VK+PtTuuVC6iJavqg9WI5FVTLAkVrnZsVne40
 oCyc/Dl92SCURb46x7fnyl0oXXC7H/NRlIGfaZ1KOKLw+nii4+tXOV5godWstpL0lmln+Ino=
X-Gm-Gg: ASbGncsGDCPRZqfmI/FmNrOOih/AXRzpX/JGH1rwuFvXXwjeMSXxsllEjSsywTvZ5vs
 hOw+KvOB7b11NjAGMswz3MtQ6QghVpkZgWDUWUi8UTz2ez+sPv+99KEZiOqkB/9lgxR6v94gBwT
 J5Qqwm/+3FunYqiAPoClF9KoF4C7krBXd2mB8kCd8Dj4a0X3fnUDN4OjFxShSDvQyDi5SuYNfuz
 TUXYZ9hKylo8nPx0xOeZOTosH8VnhksL9TfbV4A5jx/TmL5oHEMifNDx5GN7+cNbWUZZfBtVbIx
 EcDuY0MFJ2MBThVB03Tdp+/O0P6t5tRrE/O6lt9j0TmierF5DbyOJwg8BGyXFA==
X-Received: by 2002:a17:90b:224a:b0:313:1e60:584d with SMTP id
 98e67ed59e1d1-31e507a8515mr13390660a91.11.1753386520533; 
 Thu, 24 Jul 2025 12:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjWGyY20qpt+3zh7h0gbJzfKfTTUx1DtPOxe3O5W+CSBwlXZVQXdRE5miOVJMgWqqdhQrVSQ==
X-Received: by 2002:a17:90b:224a:b0:313:1e60:584d with SMTP id
 98e67ed59e1d1-31e507a8515mr13390630a91.11.1753386520031; 
 Thu, 24 Jul 2025 12:48:40 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e662937c5sm1957547a91.18.2025.07.24.12.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 12:48:39 -0700 (PDT)
Message-ID: <6cca1521-a806-4c43-a003-36a045cf007c@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 01:18:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Wait for MMU devcoredump when waiting for GMU
To: rob.clark@oss.qualcomm.com, Connor Abbott <cwabbott0@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
 <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gIM8WmlASU1jeF8OE1Vnwpro_twxtNg9
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=68828e19 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=9UHMFBqk8C1J7Xn5E5YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE1NCBTYWx0ZWRfX04+fYX9mMqSx
 93B4sWf7nNbZ+BOaBUVo6qUkOq3ciJ84tEseiNVJzQBlnln4kpHvL29GSvCraWAUc7TloqG29xt
 DEuZhsH7oVzqWgBy1eghynKfwF8zquYzDn5Wxu/ZJcVyb+W0tI81MFqP5BRX9lSGXJso4m+fle7
 HKuI0JJ/NuJPpq3Muk3FS9W54YJx+eKdMakXK5cjabWip0rBSKr0Vki536Y26xyBT36VWwHz1td
 N/k9eEmZf10Gm88UqgZUrYup5YxUXJeWun5XrZjmxuN+r1O+dnaubA5Og681Aw0lPzz+cMJcH1e
 sThlXjSPsHdc1U4Mi45B9R1jC8/Qduv8+G++eDo/h3sbjsjRfEnBz/CRyUIAge8Wse/baKn04xz
 Np/9Qpg4+2G50RPvqI4f1d751JlytWTk3ffNaD386MOi5FLr/EUOxw8z12CLKQ/hYgPS5KAZ
X-Proofpoint-ORIG-GUID: gIM8WmlASU1jeF8OE1Vnwpro_twxtNg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240154
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

On 7/21/2025 9:02 PM, Rob Clark wrote:
> On Fri, Jul 18, 2025 at 6:50 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>
>> If there is a flood of faults then the MMU can become saturated while it
>> waits for the kernel to process the first fault and resume it, so that
>> the GMU becomes blocked. This is mainly a problem when the kernel reads
>> the state of the GPU for a devcoredump, because this takes a while. If
>> we timeout waiting for the GMU, check if this has happened and retry
>> after we're finished.
>>
>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 21 ++++++++++++++++++---
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 21 ++++++++++++++++++---
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>>  4 files changed, 49 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 28e6705c6da682c7b41c748e375dda59a6551898..6ec396fab22d194481a76d30b2d36ea5fb662241 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -340,6 +340,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>         int ret;
>>         u32 val;
>>         int request, ack;
>> +       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>
>>         WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>
>> @@ -363,9 +364,23 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>         /* Trigger the equested OOB operation */
>>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
>>
>> -       /* Wait for the acknowledge interrupt */
>> -       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> -               val & (1 << ack), 100, 10000);
>> +       do {
>> +               /* Wait for the acknowledge interrupt */
>> +               ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> +                       val & (1 << ack), 100, 10000);
>> +
>> +               if (!ret)
>> +                       break;
>> +
>> +               if (completion_done(&a6xx_gpu->base.fault_coredump_done))

I didn't get why this is required. Could you please add a comment?

>> +                       break;
>> +
>> +               /* We may timeout because the GMU is temporarily wedged from
>> +                * pending faults from the GPU and we are taking a devcoredump.
>> +                * Wait until the MMU is resumed and try again.
>> +                */
>> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
>> +       } while (true);
> 
> It is a bit sad to duplicate this nearly identical code twice.  And I
> wonder if other gmu_poll_timeout()'s need similar treatment?  Maybe
> Akhil has an opinion about whether we should just build this into
> gmu_poll_timeout() instead?

Yeah. That make sense. A potential issue I see is that we might be
holding both gpu and gmu locks here and the crashstate capture in the pf
handler tries to lock gpu, which can result in a dead lock.

-Akhil.

> 
> BR,
> -R
> 
>>
>>         if (ret)
>>                 DRM_DEV_ERROR(gmu->dev,
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index 8e69b1e8465711837151725c8f70e7b4b16a368e..4e775ca757ce3649ac238d25cebfd7eb693fda61 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -104,10 +104,25 @@ static int a6xx_hfi_wait_for_msg_interrupt(struct a6xx_gmu *gmu, u32 id, u32 seq
>>  {
>>         int ret;
>>         u32 val;
>> +       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> +
>> +       do {
>> +               /* Wait for a response */
>> +               ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> +                       val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
>> +
>> +               if (!ret)
>> +                       break;
>>
>> -       /* Wait for a response */
>> -       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>> -               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
>> +               if (completion_done(&a6xx_gpu->base.fault_coredump_done))
>> +                       break;
>> +
>> +               /* We may timeout because the GMU is temporarily wedged from
>> +                * pending faults from the GPU and we are taking a devcoredump.
>> +                * Wait until the MMU is resumed and try again.
>> +                */
>> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
>> +       } while (true);
>>
>>         if (ret) {
>>                 DRM_DEV_ERROR(gmu->dev,
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index f1230465bf0d0840274a6eb03a10c4df3a7a68d3..19181b6fddfd518e2f60324da1a7087458115e40 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -293,6 +293,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>>                          struct adreno_smmu_fault_info *info, const char *block,
>>                          u32 scratch[4])
>>  {
>> +       struct adreno_gpu *adreno_gpu = container_of(gpu, struct adreno_gpu, base);
>>         struct msm_drm_private *priv = gpu->dev->dev_private;
>>         struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
>>         const char *type = "UNKNOWN";
>> @@ -345,6 +346,11 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>>                 /* Turn off the hangcheck timer to keep it from bothering us */
>>                 timer_delete(&gpu->hangcheck_timer);
>>
>> +               /* Let any concurrent GMU transactions know that the MMU may be
>> +                * blocked for a while and they should wait on us.
>> +                */
>> +               reinit_completion(&adreno_gpu->fault_coredump_done);
>> +
>>                 fault_info.ttbr0 = info->ttbr0;
>>                 fault_info.iova  = iova;
>>                 fault_info.flags = flags;
>> @@ -352,6 +358,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>>                 fault_info.block = block;
>>
>>                 msm_gpu_fault_crashstate_capture(gpu, &fault_info);
>> +
>> +               complete_all(&adreno_gpu->fault_coredump_done);
>>         }
>>
>>         return 0;
>> @@ -1238,6 +1246,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>         if (ret)
>>                 return ret;
>>
>> +       init_completion(&adreno_gpu->fault_coredump_done);
>> +       complete_all(&adreno_gpu->fault_coredump_done);
>> +
>>         pm_runtime_set_autosuspend_delay(dev,
>>                 adreno_gpu->info->inactive_period);
>>         pm_runtime_use_autosuspend(dev);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 9dc93c247196d5b8b3659157f7aeea81809d4056..f16556c6f2921708e740ecd47f5b4668e87700aa 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -179,6 +179,8 @@ struct adreno_gpu {
>>         uint16_t speedbin;
>>         const struct adreno_gpu_funcs *funcs;
>>
>> +       struct completion fault_coredump_done;
>> +
>>         /* interesting register offsets to dump: */
>>         const unsigned int *registers;
>>
>>
>> ---
>> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
>> change-id: 20250718-msm-gmu-fault-wait-465543a718fa
>>
>> Best regards,
>> --
>> Connor Abbott <cwabbott0@gmail.com>
>>

