Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D145EB14DFF
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 15:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6FF10E1F8;
	Tue, 29 Jul 2025 13:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptyRps1r";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4F310E1F8
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:01:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8GL6s018829
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 juelwFjR0xLghnG+f+9iPeOqQI/44lFNaWH/bAdlNAM=; b=ptyRps1rY0xMNoXh
 EOyXS2PpTv3+wYuRo1OUBzUHolaxzWKMLyVOlWyJcSeLFMlw2EtahowaE+jQM4KY
 qmQxb+aq8T4/gR1VKVTXhKAF35ySBOXxrDowLNNUCmdITgbaGECJ8muXnRNbdekJ
 /lzn+fPoL0s5kB5DmJYNCCwJD5sBs4+EZlXWkJIkcBQkioQntrdccK2oUfvcDUVr
 FpfLdQC/ceAZwLaZGnfzGqOnzv2fM1WRQzEgzC6X4oPEycQj0dSs0KqPlDSdtzcC
 BDSyBNqSvKQOt5JtZmC/EO/9yRwSXVgiRm6CCRUsYmwrtD4pQYrx/x48SgpJfEiS
 ohJFQw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q8606nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:01:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-4e7f62a0fecso118679137.1
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 06:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753794108; x=1754398908;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=juelwFjR0xLghnG+f+9iPeOqQI/44lFNaWH/bAdlNAM=;
 b=bBX44ezRYcrtUWSNkAH8rQeZn4M2VZthlESNt0bOmrgnvh/wu6z5rpNorA+PxTBFt4
 +TbcYWLxeE8C8dfAMkHcTT5LsCxKDxzgNh7u4q5FWB7w8jCIs12rUj6BV6bRXU3asiyA
 nuVcn1sQZXrQID7ICBDTmGSvFZ9zC58i+kDfFUvGYU9PEVGfm5YKwRGcpdvrLfewDJRf
 el+k1m1t9FG4eXCBdkNCNCYfKIsnURZzIxWt7QbVZlUtQ1ENNKwGgbCyMB/c35LVRJGK
 +a4L7pclkM9XG1VWy6pHxCUjLfQeeYEVKDPfEjEoJbHV3pPNmjYRi4vRgE/l87rsJT+L
 z7+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+TnUUWdFlZV7/l3crgM1+vMF9bboUhSACESzHCldv53kZUOZOYPt5bEXBXOpyXkejcCq+YkU9wr0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIq1qCvwbhoey7s3gdxy+LSAaLb9eT5bs9XgDTO3bXE7NS1BF1
 sL4N/0iaeQnFsAv+nMpwHS2A9DlZkF99RQzjR8G42tkmMbYyTNg02Yb9lq1wdzrtU4a8HN8Mwq8
 DE/NzoaK4coIXPfFPBLKzLKoFZmHtpn9wnm1Q74fiysmgOa1I2fnU3HFN1JxkxJurKRgnuxI=
X-Gm-Gg: ASbGncvEmQOcYxgsN9jwCGZm877ro9RCrJTTPHNhnr2qF6HsvgasTJTLMb7VEkPW3k5
 1bjNU3h6jwOpIqablHGtMoC8ho/wK+lPK10UkF0+zgsZ+Gy21Hqk0xUBSbNfsH4DLWNC9RxtY8j
 /RJax28fSawRIC0WNCIWeWfanltzP65dljshkxO2zBn+80UiEXITVHtA61As66Dq6sNShyMPRD9
 bCmmPM2kulZ7QgTyO84jEJxwiFQtcdguqAidU2uw7SxTeP/UvhgHQLI+vst99dRrdy5xTE5vMyQ
 NbjDV1OuhZRY+Ccj11QAgSzw2TclNrbU8heslugnGkHg0QDwVFKnsxZJEO136wm4ibMYHSRh+PC
 6cxlizU4e5WtmnVa9Zw==
X-Received: by 2002:a05:6122:3642:b0:537:426e:bd0 with SMTP id
 71dfb90a1353d-538db607c97mr1409820e0c.1.1753794108162; 
 Tue, 29 Jul 2025 06:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3XZWl+BOftPeIJVe+mX7EzNQo4NU6m5CJLOb08qSGkjUakLEtnkqZAh4Nc9Ct/8TqmnlT/w==
X-Received: by 2002:a05:6122:3642:b0:537:426e:bd0 with SMTP id
 71dfb90a1353d-538db607c97mr1409759e0c.1.1753794107351; 
 Tue, 29 Jul 2025 06:01:47 -0700 (PDT)
Received: from [192.168.43.17] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af6358a0994sm585862966b.44.2025.07.29.06.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 06:01:45 -0700 (PDT)
Message-ID: <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3f58451a-9b5f-4697-9679-d549104e8312@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwMSBTYWx0ZWRfX+LIFIglQdqvG
 Y8iGamTOqmjRojsXZX+/lW1JfHLA8axNmlzKwTeesTNoV6NuLAvrk5G1df894banDHkTKRhBgJU
 jOqxMK5BrzjexbdoIUdOYTb9qFk9uREgL6v0PhqM4y77QdZiQ1EliZSDCJcsJEtJ1PIgHTz4eAa
 +YOi7dcP9fgjyDizCV0QY/YtZ7U7ef9Xkj/z7JMxjxfaN2Nz95M8fOkq6YZtqzOR1Y8dXUOuKzf
 O3sCeASHcRhsYjE0gLtz2D3lmYSQpwhvafw8awjikOqjSumirZDuy7cWqVfsnwKCq6MAJ1qcdN1
 QCl1UeMCdXmoQlMWS69kKvkaKbsb2RrBZpkskzInJd5lJ6FGfRfKdS4RkTUYbo324I/qeu7vG1/
 QiQ7IiSHFy54ow2fgSJqlHmK3iNav1IwO72snB8gdDCymaLUVxcegrT/6AJqxc8wbqvj/Xj4
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6888c63d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9hkt72pFxozsIUrbaQoA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: SJJ8nz4QcsMnynsIBbF_p9rukEkswnBn
X-Proofpoint-GUID: SJJ8nz4QcsMnynsIBbF_p9rukEkswnBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290101
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

On 7/24/25 6:54 PM, Akhil P Oommen wrote:
> On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
>> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>>> There are some special registers which are accessible even when GX power
>>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>>> without additional handshake with GMU. This patch adds support for this
>>>>>> special register write sequence.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -16,6 +16,67 @@
>>>>>>  
>>>>>>  #define GPU_PAS_ID 13
>>>>>>  
>>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>>> +{
>>>>>> +	/* Success if !writedropped0/1 */
>>>>>> +	if (!(status & mask))
>>>>>> +		return true;
>>>>>> +
>>>>>> +	udelay(10);
>>>>>
>>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>>> gmu_poll_timeout()?
>>>>
>>>> Similarly here:
>>>>
>>>> [...]
>>>>
>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>>> +			offset);
>>>>>> +
>>>>>> +	/* Try again for another 1ms before failing */
>>>>>> +	gpu_write(gpu, offset, value);
>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>>> +			offset);
>>>>
>>>> We may want to combine the two, so as not to worry the user too much..
>>>>
>>>> If it's going to fail, I would assume it's going to fail both checks
>>>> (unless e.g. the bus is so congested a single write can't go through
>>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>>
>>> In case of success, we cannot be sure if the first write went through.
>>> So we should poll separately.
>>
>> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
>> == 202 times, it really better go through..
> 
> For the following sequence:
> 1. write reg1 <- suppose this is dropped
> 2. write reg2 <- and this went through
> 3. Check fence status <- This will show success

What I'm saying is that fence_status_check() does the same write you
execute inbetween the polling calls

Konrad
> 
>>
>> If it's just about the write reaching the GPU, you can write it once and
>> read back the register you've written to, this way you're sure that the
>> GPU can observe the write
> 
> This is a very unique hw behavior. We can't do posted write.
> 
> -Akhil
> 
>>
>> Konrad
> 
