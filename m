Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544CEB154C3
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 23:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E6910E2D3;
	Tue, 29 Jul 2025 21:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLhoMbso";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2677610E2B4
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 21:40:32 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56THFg8X031288
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 21:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nQGazUCFnz3W6AC4AtQi0R1LPe8Tk7TrQs4pGUNhc7A=; b=pLhoMbsoPVixRGYP
 8Wa8bAGjawrMAcfh6cS/s2ykrjgZcXj+Pq2hclywNWd+ZEgQ0xHWIiiVsCNVS9Vg
 Q8dZ0FzCrDbrnKuju2BLNMAUP5BQ4nOntq2EgEuePwSGgymJadSCxSXVhNuYhHHo
 04EfL2W7Xf8uAEd/G8D49tLF0Z6t02N46AqlyJWpt3jES+PaZSmFvt+ZFIpuGpMo
 NyseJGlXraM70KobOgp6DpY/5SusLNjK305f26RtlpN47nlFnvQ6ZNG2QnGnj22Z
 zdRu+nSx4Tw8F6vBAtPeUG3j38m8TAm8/+HeY7wQD1ZTUl5bIkB4y76PlzHMtOPY
 CIHp9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xf0e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 21:40:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b31f112c90aso226624a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753825230; x=1754430030;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nQGazUCFnz3W6AC4AtQi0R1LPe8Tk7TrQs4pGUNhc7A=;
 b=SAH8lZFt4gERUO38x2SDwjafdoNyOxCfKunOKuniB3a3o/3sHnzVbfI1N36wdsAQga
 dHzmIjz84jzQsrPNzS7AMWYSC35ArpoRrBbazIYPoxZwP/0qfC1qR581IbVL4cC08uqr
 eICuAPaRcPYQt1M985davmMFhCeSKTuHDRoTqt5JlxL/10KjV8t337aRAeq+9RgXdI5W
 0v6R1qLGZ0JFwv03/lUiFOGBlxX64k0NiLJZl8ldrLhzLXnv7FlCW28SbUDabBX2gpYv
 caqWJGvTuAXP+LhwnXMVH7QLqqohas1QK+d9fTRkHwmxHn2t3tAIcAjXJx7GMVW7iDhm
 UEMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpTlEayV4iksId6T9P4kcYYt7koSM2ic6wcJWLfsGuQi2oLRi90KQYUJGNw9WAijxBRPAj/v2wz+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybkRM52faoliYPM1eeikxWPWZS4eWRehq8fqti0l+l7u0h0isu
 WJpu+SspyUNtljOpQj777lQzFkcBRK7+61atQgZ1A4Plal1NfiqEESl6dBwsRcULiLB2kBBaVbC
 TU4Owh68XAiXGSmWOGy8CfaenOaJ2BIJ62o5pIl7j+Dy2n6gAejYGHDnG/E/JmJqtCOkzBC8=
X-Gm-Gg: ASbGncsmyujnJUhFJZbfVANOhbViT1Llx4Kzdg8DBmVexNxP5RyNM+bCr887/1nNxWN
 OtBVOFwLXrMUQJ8brRqaftLLtxGVI1J4Ku2UQg6bErlhcIg05TSFvouM100l170EQRJQvIILac6
 BhTf6FIzNab/QCg0L+YuWtNa0m54LIK691UL3taI1j2B8cJ1ONKSTxRq/p/aAXn3zXwLg5uf6U+
 e5QehEPUJSnpSIGaeE+STECnJR7cNrHkzDCbgj7F6pHxLbAPhMDlc2KwB+nyf2K1jmr/mFhRcHw
 y2vC8kAFZzO7A9TxpMoIFpsaGtYG4Aos4Ja1Zh9eiezP0HFn/+Wsw+0iA2Q4OZZ2
X-Received: by 2002:a05:6a21:3e04:b0:220:1843:3b7b with SMTP id
 adf61e73a8af0-23dc37f92d3mr324711637.4.1753825230239; 
 Tue, 29 Jul 2025 14:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWVlgY3u4zexg+eEceCSWMsg/EHdyVJS0PVYhJEmiMBniSzidqzlG0GWYEezlewSXjjY5DuQ==
X-Received: by 2002:a05:6a21:3e04:b0:220:1843:3b7b with SMTP id
 adf61e73a8af0-23dc37f92d3mr324667637.4.1753825229723; 
 Tue, 29 Jul 2025 14:40:29 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.231.177])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b420df76dd8sm2262382a12.19.2025.07.29.14.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:40:29 -0700 (PDT)
Message-ID: <bd6076a5-f888-4044-8a5d-ea6e6fea28e8@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 03:10:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
 <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
 <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
 <d696e7df-7f11-4491-89ff-ba71274ae101@oss.qualcomm.com>
 <1d320aac-e928-4fd0-812c-268a3a943575@oss.qualcomm.com>
 <3f58451a-9b5f-4697-9679-d549104e8312@oss.qualcomm.com>
 <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDE2NyBTYWx0ZWRfXxzKr0pGCvLpu
 +C2C6eFeGpYQY+ldn03C+jbI8o+scz2ZmRqODRZb1/sCNbGkLfniUpI9vbWfGJywJqkWWgkIkB0
 XgxWYpe3nJ2p53DN+/eBWZZY8FdFMKslKcpLXB51xZaA0BbkMRk9RdKh4tbl1Eb0Q5dUaQkr1MY
 tL4Xd+VhUQPF+19IHEQRaY+UvleUljUZmXw2mNhfP3GhLwv4UoE6YHkco21IXpBXkCCQA6RYkVN
 d7lz7ebIjKgYG8gZAknK8q3aKcOFBiqwihL3xsRmvIbZYRP+HrVUp9JJDJwpcuj96t/RdeXVg+W
 4miRajsKUUuCvxSMMymY1G/o8SfXD8nPKdiLR/gHAkdyWflE6cbqxlda+2yLYHgOZpTf0uasVPQ
 PYobEjbLq+NRe4HakedyIp0rd2usss5MmyaEqNMyJdYtxqxwTt4TSfZgvNaQjW1Mu16VwH58
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=68893fcf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=9XpMM9ZEX5jLuhR58p3+Fw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UL6EBj8_IJHJ2Owmy10A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: OKkbLL1x4ZyYsNmk-KqhAbqrq96MH7dJ
X-Proofpoint-GUID: OKkbLL1x4ZyYsNmk-KqhAbqrq96MH7dJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_04,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290167
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

On 7/29/2025 6:31 PM, Konrad Dybcio wrote:
> On 7/24/25 6:54 PM, Akhil P Oommen wrote:
>> On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
>>> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>>>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>>>> There are some special registers which are accessible even when GX power
>>>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>>>> without additional handshake with GMU. This patch adds support for this
>>>>>>> special register write sequence.
>>>>>>>
>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> @@ -16,6 +16,67 @@
>>>>>>>  
>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>  
>>>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>>>> +{
>>>>>>> +	/* Success if !writedropped0/1 */
>>>>>>> +	if (!(status & mask))
>>>>>>> +		return true;
>>>>>>> +
>>>>>>> +	udelay(10);
>>>>>>
>>>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>>>> gmu_poll_timeout()?
>>>>>
>>>>> Similarly here:
>>>>>
>>>>> [...]
>>>>>
>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>> +		return 0;
>>>>>>> +
>>>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>>>> +			offset);

This print should be after the 2nd polling. Otherwise the delay due to
this may allow GPU to go back to IFPC.

>>>>>>> +
>>>>>>> +	/* Try again for another 1ms before failing */
>>>>>>> +	gpu_write(gpu, offset, value);
>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>> +		return 0;
>>>>>>> +
>>>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>>>> +			offset);
>>>>>
>>>>> We may want to combine the two, so as not to worry the user too much..
>>>>>
>>>>> If it's going to fail, I would assume it's going to fail both checks
>>>>> (unless e.g. the bus is so congested a single write can't go through
>>>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>>>
>>>> In case of success, we cannot be sure if the first write went through.
>>>> So we should poll separately.
>>>
>>> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
>>> == 202 times, it really better go through..
>>
>> For the following sequence:
>> 1. write reg1 <- suppose this is dropped
>> 2. write reg2 <- and this went through
>> 3. Check fence status <- This will show success
> 
> What I'm saying is that fence_status_check() does the same write you
> execute inbetween the polling calls

On a second thought I think it is simpler to just use a single polling
of 2ms and measure the time taken using ktime to print a warning if it
took more that 1ms.

-Akhil.

> 
> Konrad
>>
>>>
>>> If it's just about the write reaching the GPU, you can write it once and
>>> read back the register you've written to, this way you're sure that the
>>> GPU can observe the write
>>
>> This is a very unique hw behavior. We can't do posted write.
>>
>> -Akhil
>>
>>>
>>> Konrad
>>

