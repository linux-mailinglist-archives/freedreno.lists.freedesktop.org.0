Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1384B14E63
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 15:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F10A10E06A;
	Tue, 29 Jul 2025 13:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0F8kmoc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137510E06A
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:17 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9ESXL017592
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZkVVfMqcS22T194hcW1I5vSe52GnRrmOg+MhaqqVH00=; b=e0F8kmocfkMJoXQq
 +f69DQcn3OviJUPsS1EksTyfmXysLxm4zjTmoRPyUJOSUjhEVYeAZvNlfRNE5jyM
 ZWwizMblp4PWgzlsaXvnCnUPQmJKLHtVq9d0ZFHTpRbVNF3yqSAK6J1IC3MwV8xe
 xMcLsF6gg0BRQozsjKr4L98O1ITXlDp8HdLimdLXqeMAfEj00HeS25FdxIpqNPxo
 o1fcomAbux0r8MA7gagI2yO9P4Z4DS1fO0eDZBY+GBKqB2Ycuq+U+Bzh5KzTR3K5
 NjRp+4T14Pu9NVxHtjSmxnbuzZ/f+8LW31SxfYnVUHThzEtoanDDYmgMjZ0k1sZi
 OzGVDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1ag6eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:30:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7dfd0470485so49447585a.1
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 06:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753795814; x=1754400614;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkVVfMqcS22T194hcW1I5vSe52GnRrmOg+MhaqqVH00=;
 b=LQg3yqoQd7apPmyKCIbifypqrtLBB79J2OdptffQKM5U6ka4UmnwFZrbOYYLKxaGNX
 GC0gckjzbKf9bmrkNvzEycrmewi6Rh/TkfpBydQUarvCV98vSj4ti8iv1w2t+92ZDwWz
 nFkJA77neyY1wkWvcXNGBUk7MmYGac2LR4dmJRtK0Vzh8VIIsD/6kGOch1uinVBGAD/+
 dos8CIc017E2zMKs4OAXh7S/ilvly8jnqYr+eMMvjbii2NBpOB0qcbNCBbAOXi5udPam
 UyEpa6VrFzCspICOfKvxLJgTP20Nft4KuZ80zTucpmCUNdsgMANz0+yeXXVx5UGbu7OJ
 OoTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbuD8+2KRFiQMsz/0edBaK80ixlzk9ST9h1KaS7a7huae/fhMO13KH1hqefEvU9IKFBDBB1Pn1zEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCmUuqCmGggvgHaBWHc2C9tgAVPKzB6CkPn+NGrKuGuU9JPvWr
 f1VsmXRLnebuq8ExyTj/aDclcoa9F3Cl6sHVefjsy5KJvc+rxaYmy6037ALgMD1BmBlMdwhax5p
 JUt2UDPZATVF6Sn+rt6kHu4mKNXwzornfuN680Z+eN/Skh80RXIo1DPHpGS6V5pRmS174M4M=
X-Gm-Gg: ASbGncvpxMpTz8YWDty3N8olARJMwUUSKnF4rRvfOz17G7tPu+Ghin/If3DVjxno84n
 xTNLwlk2hhjcVp8VRmETUZIIDlwxeSkzvw1POlYCZ+XHiyFavTDewNWzwzNtHOrMX0xUko3kjp9
 4KnShkR3LYtWM8huJxUeFIUgk5EaYVFqoxoJ7XCQgE/EPIUivxhFDsqL00hwXR8PbBYvvXMqExR
 KzbmpqDDX39wK3rHZ48w3245iua/yDqpExx2IafOyoVHTGbO3Edhs3U5SfSn/eLJZkfQfmcYqrf
 H1wtmt7OL3Zca1VSU3LU+6dxNpYKW2x6aUMjUbgxj4OOTeazYkPPcPRUmoeMdv0YLVhYrPo/q3b
 DWFI4h/3fJ9eo2ekcyA==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id
 af79cd13be357-7e63bfc3749mr814895685a.10.1753795814158; 
 Tue, 29 Jul 2025 06:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgmtqIpfxLvIlR9V46R14lP22op8xYzy/QAirfAkHBUcpzQdLdsiTffbYJQzdMY2lRH96DEg==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id
 af79cd13be357-7e63bfc3749mr814890485a.10.1753795813536; 
 Tue, 29 Jul 2025 06:30:13 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a62af3sm592795066b.84.2025.07.29.06.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 06:30:12 -0700 (PDT)
Message-ID: <4a1c3cf1-9688-4275-87ac-8fffd4469889@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
 <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
 <CACSVV02x1s9oBSV8khgPhqPJdT1igOzRSOp5wYUZowKvXsb-Dw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV02x1s9oBSV8khgPhqPJdT1igOzRSOp5wYUZowKvXsb-Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LlppfwCz5NufGHn7kIqVM3GKuERJ0XhH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwMyBTYWx0ZWRfX9ybruz2ShhCx
 GVsDodEB6kXhi22VwwPq/DkFFNP+A7R2U7Rr5Q3K6p4bG0eZ32VYUIEYyzq2dwsRwZ/kCq2TE02
 XWnsUFHLH6GWzwyFAOxMdCJrnaO0IuhP20jeuqHQi97N1v0YzncDYkt9JoYKCA44YsA69UxBKVM
 IualB/Y5foVN5f2oQN3TeRdvqDb2QG7rVozmx8Wf3fU5M9swLlSzckkIglqmzwS5txdQgRpnbz3
 RNTI4Nxmd9r4TB6XmndfhBxWeeMaYctjU44TSRyBEZE2a7ERSPOm1QA4XdvuKwOCLotFKXYU+K+
 9aCrfj76EDfqjDs1S0z2h45UmCWXvH1yh+fTlLnrl+APyDgMbWGIOs+vsJloKTWaf6eF09T0kO+
 Iau5USavrHG0eMzvmEWKccSsNObeMM/kG/yP/RE7N6C27wjJ6PIJWwtfRD37gSUnysbdFPfD
X-Proofpoint-GUID: LlppfwCz5NufGHn7kIqVM3GKuERJ0XhH
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6888cce7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ERHQbKNnysnh4IVj_LEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290103
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

On 7/23/25 2:15 PM, Rob Clark wrote:
> On Wed, Jul 23, 2025 at 3:19 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> CP_ALWAYS_ON counter falls under GX domain which is collapsed during
>>> IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
>>> not impacted by IFPC. Both counters are clocked by same xo clock source.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
>>>  1 file changed, 16 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -16,6 +16,19 @@
>>>
>>>  #define GPU_PAS_ID 13
>>>
>>> +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
>>> +{
>>> +     u64 count_hi, count_lo, temp;
>>> +
>>> +     do {
>>> +             count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>> +             count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
>>> +             temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
>>> +     } while (count_hi != temp);
>>
>> The original logic is as follows:
>>
>> static u64 gen7_read_alwayson(struct adreno_device *adreno_dev)
>> {
>>         struct kgsl_device *device = KGSL_DEVICE(adreno_dev);
>>         u32 lo = 0, hi = 0, tmp = 0;
>>
>>         /* Always use the GMU AO counter when doing a AHB read */
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &hi);
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L, &lo);
>>
>>         /* Check for overflow */
>>         gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &tmp);
>>
>>         if (hi != tmp) {
>>                 gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L,
>>                                 &lo);
>>                 hi = tmp;
>>         }
>>
>>         return (((u64) hi) << 32) | lo;
>> }
>>
>> Doing this in a while-loop almost looks like you want a lot of time to
>> pass - REG_WIDTH(u32?)/19.2 MHz
> 
> would:
> 
>    } while (unlikely(count_hi != temp));
> 
> make it more clear?

I guess so

Konrad
