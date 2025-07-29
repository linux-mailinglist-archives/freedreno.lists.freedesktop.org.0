Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A3B154D3
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 23:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9653C10E2DE;
	Tue, 29 Jul 2025 21:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpeZtkJH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2595410E07D
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 21:50:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TGOEPO012855
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 21:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JspbK+7iQlUzvPH2LdAMAjZlVUU4SzJyy/Ozc29zRpc=; b=gpeZtkJHfR4ZWH/F
 KqdBuCv5LwjDgycYqm8La+lrLipEaNpFxuSuBlEmBb6ZlF/bDiz0aAcyWZz+OLy7
 zlyYlLe8cwppdEYOjaooAfbWwYZSLTBepEQ5j/bNnwBVT7GV+J5t173bvduyokb+
 T42fBT2SfXvKQJMV3hyWER35l0wZZP3gp8YVg+tGsxcEH13/V2o0YTigdbbHYYxM
 sRGO06J2Gd5SuYzWkB5BEiwYlgtaKHYGVTnfJIA8MORKcsJjz3A+g0KnBwRqMU5T
 ck8G+uPmSxLxsCUxFU9FosLxUbdMKpov/+Bw3nskC9ysQyNTewc9HCSXRqZeTIS3
 z6ANuQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda1hg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 21:50:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31ecb3a3d0aso2980926a91.3
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753825801; x=1754430601;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JspbK+7iQlUzvPH2LdAMAjZlVUU4SzJyy/Ozc29zRpc=;
 b=U12n+UZcISUX0BouNvS+JB3tVQCJh41LNtrmLLn9P0USWUjr558F8lu4in8TiriIQV
 6nkfq4fHgIfTvgJRdasaI91PC9yifb6Y6Rcnxb90ledwQn7UYoXsvQPA2aA45jj4mtx+
 1hH/mf68QG5yZDUOso50zgr8UT7dz1yPk01i0gvokbpCZDOCbL54BA6BhNxA5UPO2+OB
 0g2HWr0Xqc3N4YAyebMSjR/8BmS7PHz1W3OzR9Qqrb7k8476bj0dsV/Hqf0VJQIHITMQ
 tWgSMYRYpI5lmjnBw4mliQM1uedDrFeM+bUOr8Ur3oa1J/FWwsAHzmGQKFXwKl76tlBE
 tPVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfP5rlpU5wbj7IPGJZnwViDsiQluMVFTURlBVdXKYyvNCN9xqyuZqBb/cYHX5RuzA9/bkckFw8dMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5FQMWQgBhAvLyb2ZbIeIBpMyiNsS9ZGgqrc5jaDTx80W/4XIi
 lp5g79pCKTkaKrL03VV9SBAR7xN+7ckCh/OUvtKeapY3mtXT5vSFWr02AhGI3usPYTgtKjeWcbB
 ZpsMzX+TfnBlaT63zTLX9oEzbk/KgTwV5Aa2lhufto/59xi1s8HkBHhtJk/SVLphRb0U8bLU=
X-Gm-Gg: ASbGncv4giyMlZrRW7AvhkoRLVtJ3m7tLFO0lEgHuIN3KXf9i/tE9dTSvqJjW2JgAlp
 3lgEEHcSa59Jz3jy5FdpcA7lg/YieEg7xlSnkdBzkk0Sup8oeEnP9KkAHM5r3Hw/lJ6EI9z+SSZ
 k+DQEz3GCG7x3FSdk037x8/o8sv4nxGmdGfUKas4TJyxvLalsO8mvfRILr1/euxhP4avda/tgOL
 DoKadPOUnblPeoM9v8F/YKMKor6khaEtf28ubEnPFy7dPTa8H0E6pZG3n/SLneliGkxcQdCoSeD
 EgwrHBfr3Rs5P1bYcZopFVWTXXCcfVbwIVuV8g1bx24DMTwL1aEL26PxmxSuqOES
X-Received: by 2002:a17:90b:3f4f:b0:31a:bc78:7fe1 with SMTP id
 98e67ed59e1d1-31f5e3809efmr1403403a91.18.1753825800268; 
 Tue, 29 Jul 2025 14:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWzTCdtd/O3kQ9la6eaI+9qnWjBUz18tIpGuf+RzXz+1SzG38sYAe/Va1BAoLtjsbO/VMJSg==
X-Received: by 2002:a17:90b:3f4f:b0:31a:bc78:7fe1 with SMTP id
 98e67ed59e1d1-31f5e3809efmr1403372a91.18.1753825799808; 
 Tue, 29 Jul 2025 14:49:59 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.231.177])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63dc5383sm111612a91.15.2025.07.29.14.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:49:59 -0700 (PDT)
Message-ID: <4226ced8-411e-4cc1-be2c-4d1452c09b14@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 03:19:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
 <bd6076a5-f888-4044-8a5d-ea6e6fea28e8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bd6076a5-f888-4044-8a5d-ea6e6fea28e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eBwgiouz8JsydRmoG_b51S9CaOeA9cYE
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=68894209 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9XpMM9ZEX5jLuhR58p3+Fw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5A9ZKBTbSWANmlZxSW4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: eBwgiouz8JsydRmoG_b51S9CaOeA9cYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDE2NCBTYWx0ZWRfXzfuLp6FfqoBR
 AUxycFnbhUHi0XzRXR+yknCPdftpUK7KK2g4yd0iiite200TGIzyO8DfDIvkeggi5j2Ug37IyWU
 9q2173GoAVLjv5rcnb292hPe5HJvoL7rSAXTs8JVJk2ny2moYHjM7eA2m66QldVD3q9nGKw8I6f
 HIca3LiHbInrAJBCUkdNAQniL1KhivzfiGjMCLRrAlUVNYHpSSBaQnK2JhllTZobyVt97fooLAt
 qBpnRDShwEHXNwtTr5CsUlV19/bHQcrNNmz6ypJ0jGhliJny56D7NZbLIFPAx9UoAUMR+XpG03N
 bhrMrpq2yP9vsYIUUKmdpcT9kjAxtmix8xMBw2Wo/dAIFam/MxtSeAClj2/rbBjHyqZDilU/V7N
 tc9O/ZFLGwhoOArvoUklbWBFeRxLxHjWN6Wg9dv8Rv4yN2EFA6+gMyQNaX36kdxUocuzdBg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_04,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290164
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

On 7/30/2025 3:10 AM, Akhil P Oommen wrote:
> On 7/29/2025 6:31 PM, Konrad Dybcio wrote:
>> On 7/24/25 6:54 PM, Akhil P Oommen wrote:
>>> On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
>>>> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>>>>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>>>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>>>>> There are some special registers which are accessible even when GX power
>>>>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>>>>> without additional handshake with GMU. This patch adds support for this
>>>>>>>> special register write sequence.
>>>>>>>>
>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> @@ -16,6 +16,67 @@
>>>>>>>>  
>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>  
>>>>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>>>>> +{
>>>>>>>> +	/* Success if !writedropped0/1 */
>>>>>>>> +	if (!(status & mask))
>>>>>>>> +		return true;
>>>>>>>> +
>>>>>>>> +	udelay(10);
>>>>>>>
>>>>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>>>>> gmu_poll_timeout()?
>>>>>>
>>>>>> Similarly here:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>>> +		return 0;
>>>>>>>> +
>>>>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>>>>> +			offset);
> 
> This print should be after the 2nd polling. Otherwise the delay due to
> this may allow GPU to go back to IFPC.
> 
>>>>>>>> +
>>>>>>>> +	/* Try again for another 1ms before failing */
>>>>>>>> +	gpu_write(gpu, offset, value);
>>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>>> +		return 0;
>>>>>>>> +
>>>>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>>>>> +			offset);
>>>>>>
>>>>>> We may want to combine the two, so as not to worry the user too much..
>>>>>>
>>>>>> If it's going to fail, I would assume it's going to fail both checks
>>>>>> (unless e.g. the bus is so congested a single write can't go through
>>>>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>>>>
>>>>> In case of success, we cannot be sure if the first write went through.
>>>>> So we should poll separately.
>>>>
>>>> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
>>>> == 202 times, it really better go through..
>>>
>>> For the following sequence:
>>> 1. write reg1 <- suppose this is dropped
>>> 2. write reg2 <- and this went through
>>> 3. Check fence status <- This will show success
>>
>> What I'm saying is that fence_status_check() does the same write you
>> execute inbetween the polling calls
> 
> On a second thought I think it is simpler to just use a single polling
> of 2ms and measure the time taken using ktime to print a warning if it
> took more that 1ms.

But then we can't know if the higher latency measured is because this
thread got scheduled out just before we measure with ktime 2nd time. So
we should rely on gmu_poll_timeout() for accuracy.

We need a warn after 1ms because there is a 1ms timeout in VRM. We
should know if it occurs frequently enough to cause a performance issue.

I will move the the prints towards fn exit.

-Akhil.

> 
> -Akhil.
> 
>>
>> Konrad
>>>
>>>>
>>>> If it's just about the write reaching the GPU, you can write it once and
>>>> read back the register you've written to, this way you're sure that the
>>>> GPU can observe the write
>>>
>>> This is a very unique hw behavior. We can't do posted write.
>>>
>>> -Akhil
>>>
>>>>
>>>> Konrad
>>>
> 

