Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A984B159F9
	for <lists+freedreno@lfdr.de>; Wed, 30 Jul 2025 09:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9483710E41B;
	Wed, 30 Jul 2025 07:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBvqUKWV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681EE10E426
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 07:49:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7V9Z8017410
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 07:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rTm+TZkQT/SGQGK62s6S181SpWgQH5VtRqWeAqKrzZc=; b=DBvqUKWVV6+E3hMq
 WemIAzJm3LT2m6sGOWR+cg/hJWHEaFz31nnOakfi6LAogcIilPrC6WEOO28ovgDf
 lymO0BXfeHSfbweKmBEiP8OEk7M96xynCHloyYXZ9efHUPSal3PhgUqUbFhV4Hw2
 f5nSEkFcD55Hxe4ZmtLNZgHN6IE8cTNqr8S9PLwMxHpGygxxtCOPNKVOMKUlSabi
 vjmyfeNCXocYaeRxiPu7p69i6lZbCceAd3GQ47WmZ9kOpahLV1fFHWv57Mc1W9XO
 hEKpZtR8rdl04mIETVTOFGGFQBW15B5IHvto2riCYE9zLfesedjZ7voALZdp+CAG
 U4IfbA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 486v6y39r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 07:49:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ab5e4f4600so17464661cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 00:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753861768; x=1754466568;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rTm+TZkQT/SGQGK62s6S181SpWgQH5VtRqWeAqKrzZc=;
 b=tU8czTRHG5kH/wNvtbzWMV9VO3/DxAOZ/n75+nxNBqTNk/wg6F09asqq4RXcJqbDp0
 n7CYO7yp3E1GZy4bMlX6/C5ciaSdb7oVMxau/FiMKIW6Ri9xY+FcAXFOzfwIwXKWczwG
 6+psVV7Fvypt50nyLFFP4GcK783lKWOK2YCUPAOq1unS1NIm8QRoR5eatn/hYRxCw2R8
 c8ohoPOhd8uRO1ge1mqCJISfMvI9F6cEwmqiNO9bxU0N7Kyf8YtVv8TAia2WcPY/N3bc
 giao7CFy2DOQy7oj4f601Kho3SHBMmXJ+6YRufKQGQ0RnhEQoeI7tHk3Zbi8UuF82FcH
 9EzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYom5vc92REk79eklK2PXHEEAtmQ2DRNywpRxrW27Ne10ft2WvBO6g7sGJ/3lfi31LQqyY+WhcfiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgTeQAH4fnzqom8VTfp366n0lJoxJWOr+I37fxq+lM8CCaFsxm
 sI85723P/vuAbVo1aPRmWOW3YlwLDjoytTvlNcw+zeAF2wM04e47xwy5y/AnBINZvsTppw7WXkf
 Wh62svWOGvUbjDSANbg2wPhDBACWREwno9Au4nv2YqKu4T1/DrUcAwTZwdxk1SOnvAP/vMXc=
X-Gm-Gg: ASbGnct5R17OMNSSuzWekVPzDTLY+Vbg4pDZOd/iuC3eHcpAZ9YiOxq4HBThtT7Xg0R
 eUTcUqD59hiYuADzTDTevrFK8byUVUObpUGaqTvOExl9Uv36tCKmEiyhhpjVN28OrEcgwGLzLFJ
 1MqhIlYrHfr1q6eyDvtfHu+STGp8EcJBuEOaK0bvt3YtEB7Gp8+q/pROnf3cSl4a0UcjcWgoh5w
 6oiRcL9jOQEP1OZDD9TXhbB9Mxxp8Sz1Myz5wAGMtGNHRkIsPHgvz5CYjazAzR256+LGLUCzGUC
 3n0bWiZoMnQXT2mDfW4SF8EZmHjKK6mu4XZ1U7ln3qtZlzwHqJE8ETu/fI576XvlsLyjfkwg5fX
 AsJl1RtYqF9ubMQeC+w==
X-Received: by 2002:a05:622a:488:b0:4a7:bed9:524c with SMTP id
 d75a77b69052e-4aedbc144cemr18606081cf.11.1753861768340; 
 Wed, 30 Jul 2025 00:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpPhh045uTi/QuFSdP8//pNs61a36JHJHwALkH8CLnoy9U2dacpk/Mha/zFLAQRC76nIkYJw==
X-Received: by 2002:a05:622a:488:b0:4a7:bed9:524c with SMTP id
 d75a77b69052e-4aedbc144cemr18605921cf.11.1753861767853; 
 Wed, 30 Jul 2025 00:49:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9015990c4sm74181966b.128.2025.07.30.00.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 00:49:27 -0700 (PDT)
Message-ID: <7c5df7d1-6757-4cfd-b69d-46854731a119@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 09:49:23 +0200
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
 <9e48ea8e-b59b-4620-9781-211cc1f7cc07@oss.qualcomm.com>
 <bd6076a5-f888-4044-8a5d-ea6e6fea28e8@oss.qualcomm.com>
 <4226ced8-411e-4cc1-be2c-4d1452c09b14@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4226ced8-411e-4cc1-be2c-4d1452c09b14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1MSBTYWx0ZWRfXx7h7A5jf3UZs
 fkpvvVqBZsFz9jAfmF7z/DRwFmhTdptjNDLxs/WCXQl+ilVf3bzqSrLAeHyM7CCJtee9qTs0Pnf
 g3nV/Ho0EKd08EWgoYuNyCkvPlxYRwjqGZoYy8IzrbJiY3hf3iFZ41N8eGmyJdjwDcLvsg8pgQy
 P7O7sVL+LW6ZW3RWLP/EdryYRbkZFqDtZ5dL1ZxYzRPVmrWAzcNZfA8nCcTvIYfZTTPNs8ITS7V
 HjeY64rYep2QP/Jqh4G3l/oPR60GUfG4lXw1YC0xAFjA0U5v+UEYoZT+5dM2aG61NHnd9fB04dd
 3r0J4AoFdbvL/3lQxyfePSasg/uHYmiteuCMHetH8pm1/rwM9KhwBjik9tPN4NPC20BNGq+8eb3
 y8PZke1t97/EPH8LY5bG7Q2xXUY1k/JvtroteOseTfAnozpkqEIiNU2nFZdfbMDikyHuyrJK
X-Proofpoint-GUID: DqZeA85fnNQ6D1FN1zvBLs7aH8iX_bQ9
X-Proofpoint-ORIG-GUID: DqZeA85fnNQ6D1FN1zvBLs7aH8iX_bQ9
X-Authority-Analysis: v=2.4 cv=QYlmvtbv c=1 sm=1 tr=0 ts=6889ce89 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ND-EWpZVFRsHkRg0wacA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300051
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

On 7/29/25 11:49 PM, Akhil P Oommen wrote:
> On 7/30/2025 3:10 AM, Akhil P Oommen wrote:
>> On 7/29/2025 6:31 PM, Konrad Dybcio wrote:
>>> On 7/24/25 6:54 PM, Akhil P Oommen wrote:
>>>> On 7/24/2025 5:16 PM, Konrad Dybcio wrote:
>>>>> On 7/23/25 11:06 PM, Akhil P Oommen wrote:
>>>>>> On 7/22/2025 8:22 PM, Konrad Dybcio wrote:
>>>>>>> On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>>>>>>>>> There are some special registers which are accessible even when GX power
>>>>>>>>> domain is collapsed during an IFPC sleep. Accessing these registers
>>>>>>>>> wakes up GPU from power collapse and allow programming these registers
>>>>>>>>> without additional handshake with GMU. This patch adds support for this
>>>>>>>>> special register write sequence.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>>>>>>>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> @@ -16,6 +16,67 @@
>>>>>>>>>  
>>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>>  
>>>>>>>>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>>>>>>>>> +{
>>>>>>>>> +	/* Success if !writedropped0/1 */
>>>>>>>>> +	if (!(status & mask))
>>>>>>>>> +		return true;
>>>>>>>>> +
>>>>>>>>> +	udelay(10);
>>>>>>>>
>>>>>>>> Why do we need udelay() here? Why can't we use interval setting inside
>>>>>>>> gmu_poll_timeout()?
>>>>>>>
>>>>>>> Similarly here:
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>>>> +		return 0;
>>>>>>>>> +
>>>>>>>>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>>>>>>>>> +			offset);
>>
>> This print should be after the 2nd polling. Otherwise the delay due to
>> this may allow GPU to go back to IFPC.
>>
>>>>>>>>> +
>>>>>>>>> +	/* Try again for another 1ms before failing */
>>>>>>>>> +	gpu_write(gpu, offset, value);
>>>>>>>>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>>>>>>>>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>>>>>>>>> +		return 0;
>>>>>>>>> +
>>>>>>>>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>>>>>>>>> +			offset);
>>>>>>>
>>>>>>> We may want to combine the two, so as not to worry the user too much..
>>>>>>>
>>>>>>> If it's going to fail, I would assume it's going to fail both checks
>>>>>>> (unless e.g. the bus is so congested a single write can't go through
>>>>>>> to a sleepy GPU across 2 miliseconds, but that's another issue)
>>>>>>
>>>>>> In case of success, we cannot be sure if the first write went through.
>>>>>> So we should poll separately.
>>>>>
>>>>> You're writing to it 2 (outside fence_status_check) + 2*1000/10 (inside)
>>>>> == 202 times, it really better go through..
>>>>
>>>> For the following sequence:
>>>> 1. write reg1 <- suppose this is dropped
>>>> 2. write reg2 <- and this went through
>>>> 3. Check fence status <- This will show success
>>>
>>> What I'm saying is that fence_status_check() does the same write you
>>> execute inbetween the polling calls
>>
>> On a second thought I think it is simpler to just use a single polling
>> of 2ms and measure the time taken using ktime to print a warning if it
>> took more that 1ms.
> 
> But then we can't know if the higher latency measured is because this
> thread got scheduled out just before we measure with ktime 2nd time. So
> we should rely on gmu_poll_timeout() for accuracy.
> 
> We need a warn after 1ms because there is a 1ms timeout in VRM. We
> should know if it occurs frequently enough to cause a performance issue.

VRM, as in the RPMh component?

Please provide more context on how it's tied together in the commit
message, it'll be useful for people down the line (I'd assume accessing
these special registers invokes some handler that brings GX back up
momentarily, which is why we're polling in the first place?)

Konrad
