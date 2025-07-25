Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE18DB12699
	for <lists+freedreno@lfdr.de>; Sat, 26 Jul 2025 00:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977A10E23C;
	Fri, 25 Jul 2025 22:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lL6ZzHkf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D424710E23C
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jul 2025 22:12:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PChDdS011175
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jul 2025 22:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4X1DTfh0h5zjGoQqDTegOhGV3+NK0W3zXpJbN3Ug020=; b=lL6ZzHkfdghUkzCj
 +4epTCO/EMm1dleIOvZx5/ZN1w/THYMeOJF/itwdulsmsnMaMnMUgOc51+zk4lLI
 UJePzvn8Dr7Ann5Cmy5jS/ZihRFvTagonVReUHrHwAIVjiyPN1d0ZwnHmC2OqVqA
 LX2qTlolS4vJWbTFubBkxf0tYACpjcLLIdvlEX06E/6ySGXpIBInbIEYkZ4lhVBj
 fGpzvBt48GEtiHv+T/O1lVIR/ar0ntS/0f3pI4sK2VGJPwNcZLzG3Jxz8FY9KJma
 S1DrcigPAAxik2Znv0InKVYzUPveXD4NPQPtomz0UI52r3HZCHA6Z+Kf6u1n2qn8
 RSDG9Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w30uhcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jul 2025 22:12:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b0e0c573531so1811637a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 25 Jul 2025 15:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753481544; x=1754086344;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4X1DTfh0h5zjGoQqDTegOhGV3+NK0W3zXpJbN3Ug020=;
 b=DzdcTDaWfyM1UbM2LUHf/phLz3MpUqaR7ok8jnAGRVENPQ2tzTVQ3DmORNvBkgAVzR
 HZJpa2PYzXPkFUB1OFqcQkl3br9YLBk4MuJxzqW6QD06cl/KCNDZTm8MHmhh5SVsg5/B
 Cj7pg3WnXITVAvs+0xH5OC4a31AEYrOPwWyY6j7kiyDcYOg2FYXeYUdmyahnAwfWVB8M
 2KhnU7XIsY2EphDZeK64Mydd2iTJyOSmW2SqTG1QX5hLzg310Ot+hT7l87M1gTZ8D+Ib
 z6jvhWzgv+lt92jdonz/K4M+hh6HugwOgc6U89lk2EWNpnM2SorMkQlb7wp4lsJ4mJXi
 IwwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuu0ALWmxUKbmYM3jgYATjMgWyV23n/iZmx0VSwG/4hetukr3/4XBPQapphbBTvDfch3dB2Cr/alc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzspzu4ImEQ67DxiJ+dsH2pd4KYy2cErsC0gQ69GMWWuk2LWDdE
 UoAyn/Ii5NmrSX8at4fqGLnVFBA5iGOXZEU5cSvCqO/2YoLWjGwoTwuLlZtoHw/q+w5eVFucET4
 DPoAeQplLOdGEM6bzIun3F6xRlFlNW/5htJrz4pSpoyPmtwePICbA+yUfQ7xXoaL7zftlaqU=
X-Gm-Gg: ASbGnctuU2CQv/aFgllnWIMtxEcOdpm4xZiwZTHlk6GeGgAXv//3Qmx4i+qjm3C/tjJ
 Ogj8RtdM3LkX4YfIilRAvj/5K9psNmn+ShB3An3+vuFCqfXxPVcvkM5eT4wOaCyehWtIANnUQap
 KodwNDCXhlnEKdROMPHDSLk6z229hJmWRXa8j5UC0KbGEny3Hfy6qILP5Fd1mriulXLvF/oKWPH
 AdOEBfYuK5ay5ZLBqh812npXhPAIkEW9ubAyYWqfEdyxtwS8tJH5j5nXkh3T3jRjs4Ntq5cDuXl
 v32+OtEqYLASoKCxAhpeXvL19JMG7zS7V72MfluuzMINEHriTEQLLC9q98zhvw==
X-Received: by 2002:a05:6a20:7291:b0:206:a9bd:a3a3 with SMTP id
 adf61e73a8af0-23d7019bfd6mr5713439637.24.1753481544390; 
 Fri, 25 Jul 2025 15:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX44LpEE6pjx6vDy1KFy13/JWR3bwOHq1/KIsk5FhoYPJGajvnBuxDCj/wdjizthdytBpexg==
X-Received: by 2002:a05:6a20:7291:b0:206:a9bd:a3a3 with SMTP id
 adf61e73a8af0-23d7019bfd6mr5713405637.24.1753481543909; 
 Fri, 25 Jul 2025 15:12:23 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b2ddf63sm436237b3a.102.2025.07.25.15.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 15:12:22 -0700 (PDT)
Message-ID: <8656b48d-2f27-4dd9-b29a-72ee1129d18a@oss.qualcomm.com>
Date: Sat, 26 Jul 2025 03:42:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Wait for MMU devcoredump when waiting for GMU
To: Connor Abbott <cwabbott0@gmail.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
 <CACSVV023+6939fWvObBKg-rcoqP7TvxjQ2a8mY5+69dBh6cakA@mail.gmail.com>
 <6cca1521-a806-4c43-a003-36a045cf007c@oss.qualcomm.com>
 <CACu1E7EApr6Ne3XxFv4cUa2JuwNW2kfo1c5wSsAUN78iWyQ2sg@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACu1E7EApr6Ne3XxFv4cUa2JuwNW2kfo1c5wSsAUN78iWyQ2sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WtArMcfv c=1 sm=1 tr=0 ts=68840149 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=rrUdA_u0f1kXpUkxPP8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: M0u-3suTQTHLtqT5C_rR_0SGF52VVqx4
X-Proofpoint-ORIG-GUID: M0u-3suTQTHLtqT5C_rR_0SGF52VVqx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE5MiBTYWx0ZWRfXyABm4u9s344v
 Hf84xnsGRhEmXdOTcZBJy2elcnbpZ5KRMHRfyzhbtDCzESCR+0xvmgop2S9DrCbXEVhLCm/jVLX
 Ebk0RsoZy3ylkN9LmBv+mycdoIBv3TQda6D5ayxzdRzHGidPX4vQFSEnskQpXxxGT7QwUGniUvY
 lBzkA4E3CidL7wZMiwISSQgZEgB4aVxbtlEz+puyBiw5ATvvWK3zbbHUlFt9aSXPh7ve/BgsEuw
 rmZYDoDFZISMbYoI4BOy4XzLs++DtaFta4j732ru30oa6YCvJG/nYbWMqkvDbUmjiHPBymjv6xg
 RLwnr3UeFa4j3biWJiF/j9KJuEYcm7fpnpaEMmF8M3n6hYxCLGflZJVGpucXo8mgS9xvnHrKQLc
 c1LsR4Spb8AzzQyYzOI1Mj6+2B/Pnp9eEAkFBCEx7HOCVBae0p+s5Zf03Y+ZOB+SNY9+o9+Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=793 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250192
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

On 7/25/2025 1:31 AM, Connor Abbott wrote:
> On Thu, Jul 24, 2025 at 3:48 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 7/21/2025 9:02 PM, Rob Clark wrote:
>>> On Fri, Jul 18, 2025 at 6:50 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>>
>>>> If there is a flood of faults then the MMU can become saturated while it
>>>> waits for the kernel to process the first fault and resume it, so that
>>>> the GMU becomes blocked. This is mainly a problem when the kernel reads
>>>> the state of the GPU for a devcoredump, because this takes a while. If
>>>> we timeout waiting for the GMU, check if this has happened and retry
>>>> after we're finished.
>>>>
>>>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 21 ++++++++++++++++++---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 21 ++++++++++++++++++---
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>>>>  4 files changed, 49 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index 28e6705c6da682c7b41c748e375dda59a6551898..6ec396fab22d194481a76d30b2d36ea5fb662241 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -340,6 +340,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>         int ret;
>>>>         u32 val;
>>>>         int request, ack;
>>>> +       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>
>>>>         WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>>
>>>> @@ -363,9 +364,23 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>         /* Trigger the equested OOB operation */
>>>>         gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
>>>>
>>>> -       /* Wait for the acknowledge interrupt */
>>>> -       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>>>> -               val & (1 << ack), 100, 10000);
>>>> +       do {
>>>> +               /* Wait for the acknowledge interrupt */
>>>> +               ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
>>>> +                       val & (1 << ack), 100, 10000);
>>>> +
>>>> +               if (!ret)
>>>> +                       break;
>>>> +
>>>> +               if (completion_done(&a6xx_gpu->base.fault_coredump_done))
>>
>> I didn't get why this is required. Could you please add a comment?
> 
> Without this, if the GMU timed out for some other reason not related
> to SMMU then we'd loop infinitely. This gives up if there isn't
> currently a crashstate pending.

Ah! That api doc somehow confused me.

> 
>>
>>>> +                       break;
>>>> +
>>>> +               /* We may timeout because the GMU is temporarily wedged from
>>>> +                * pending faults from the GPU and we are taking a devcoredump.
>>>> +                * Wait until the MMU is resumed and try again.
>>>> +                */
>>>> +               wait_for_completion(&a6xx_gpu->base.fault_coredump_done);

use the interruptible version? we may reach here from a process context.

>>>> +       } while (true);
>>>
>>> It is a bit sad to duplicate this nearly identical code twice.  And I
>>> wonder if other gmu_poll_timeout()'s need similar treatment?  Maybe
>>> Akhil has an opinion about whether we should just build this into
>>> gmu_poll_timeout() instead?
>>
>> Yeah. That make sense. A potential issue I see is that we might be
>> holding both gpu and gmu locks here and the crashstate capture in the pf
>> handler tries to lock gpu, which can result in a dead lock.
> 
> I think there would already be a deadlock, or at least timeout in that
> situation now. Any task waiting for the GMU to complete while holding
> the GPU lock would block the crashstate capture from completing and
> allowing the GMU to continue.

Timeout is fine as there is progress eventually. But deadlock is not
acceptable. Also, userspace can easily trigger this deadlock which makes
it a security issue.

I agree, we need to improve the gmu error handling situation overall. I
thought about this a few years ago actually. At that time, I thought it
would be simpler if we always did coredump/recovery from a single
thread. Not sure if that idea still makes sense.

On a related topic, stall-on-fault cannot be used in production. GMU is
very critical as it interacts directly with SoC power management
subsystems and also every year, there is an additional responsibility on
GMU to do a very time critical mitigation like CLX, thermal, BCL etc.
And these mitigations should be handled within a few microseconds. So
GMU should never be blocked, even for microseconds. Apart from that,
even GPU's internal bus can get locked up in rare cases which can lead
to a fatal system bus/NoC error when KMD access a register in the GPU space.

But stall-on-fault is useful while debugging. So any improvements in
this area is useful.

-Akhil.

