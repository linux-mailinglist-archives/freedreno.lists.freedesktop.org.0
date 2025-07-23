Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F6B0EF7F
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FA710E138;
	Wed, 23 Jul 2025 10:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBbMXJPl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A7F10E138
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:13:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9pnba019659
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A1Fp0VrKpCniXZvPKeA5q3E1PK5THOcusTjUp11AbC8=; b=IBbMXJPlWbhzanWP
 XHSwCHLB+a3ijQ/iwEMi9BNvVwvjFRrt0AYV5+kaD4xenJ8MrjCAj7aL4bhrECfF
 tzkTgkiWNn7/wqt/2E2Ip0oCqZgjRLOZfotcswi8JLB6fXlm5heivGKezvzLxmEx
 msw2ProNf7Yg6hO1eFoeWXTP0TOtClm5ucQ4wJ57SzmjhPWDuKAzhBFFZ0hm38WC
 mzYoUHE0eEZj8j83zO41NBWHDcIKNb4cyMb5KL5n620gafyb9tXN1O/UghBFSUYZ
 0Of7YxeJG3+IG3q4K6bL8/MUg07olclUdKE/oRg4a7aumM+1m4H+vIRZbE5dSTDX
 xAQlvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6pxx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:13:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7de3c682919so95054485a.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753265631; x=1753870431;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A1Fp0VrKpCniXZvPKeA5q3E1PK5THOcusTjUp11AbC8=;
 b=UvM9FjSt4Jh9KyWFZ3ovd3DF/JyvZcYJE/jIl+OcPG86l6aQcmTXZAng7ZqtQ4gf2H
 TZjFw5NWmiOHptc8Ide2j9GDR/WtkMxwkdKcoQyzpnkCBuy91mTFVRyX0DsTBYpe35OT
 TrdC2C5+9nTAa9IBqi51NLLHKEns6ZubItBLm/JbqT56rav9OmrfX6yhc3OsYrYA+dPI
 RCncg43biGvUQexd+rH9YowfjfRAr+t14eO0cdmOPME0GTDZjRnIqv8MJN7XtJXfVV52
 yKPiMeAS4zzgTSXrIVneaBArhIkA5aAo1tbI72KD4kexXp+imOW4Kjf2Ghgm+FeC7S9I
 23dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfLQ4kyHSrNUHCVe6bjMSgL82E5gM6HcV9LZwP5BhViCWeo7b14yMbR9bLvbvdgPL3PgoUMOlm7uY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+Rn5ShunsUAgboD0l71CcUnf2LScc++NdSE7YS2ZREk+sTJcu
 UrYaBLmlrMQbxKEmFSoNBC5NifKcLONbv6eIa+DlwW6odtIFnCMI8kP/iCeBqn18uTlagmIm+Po
 3eCJyXcdNgNKYMSUCR+h/Ola+IEWXhtyolQ5YKQsmltwEjzuKzwUiz1h4UqBWLRyW+PBnwBI208
 5vVmo=
X-Gm-Gg: ASbGncuS83WofAQfrimW4VLhhja/9ah3xE0Q87A1yiEfdAMlMqkBXbfSFaXz5lPdRdn
 RYTirnNPXAzMybyjhxZXqC1xbEDbQCYfaAQs0sI2FAqd1Dn2u/gHeTEEn0iqfi3zhsWl0hi1ngt
 MZga3iqj2cgTobqqfwlz8lLI+wq+/zDFFdqJQ4YTPCl5N+WuIrAIjU+t0n8LMIaD2j83+z1pK1C
 LNWSWcD3eWEPTj/G4lFYQFq3KaWvHadDcM8FjvRI8eF4FktyQxJLJmRD4Hcoxh7onNAiEYBhhYl
 IOkJJM/v1ESyQLZjCMKfmT2CmfsJBvQdFalY3aPUWhgV8GSYwcgJ1Td4r5wdK4Oup5jG14vTLZK
 SV8+3Sb9MyM1fekHraA==
X-Received: by 2002:a05:620a:318a:b0:7df:d668:22ff with SMTP id
 af79cd13be357-7e62a0c1347mr135521585a.4.1753265630568; 
 Wed, 23 Jul 2025 03:13:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj3f1wr8H3E8T0jx6NxR/LC1BEZKnxCKVi6DM0FYNiWA0IcAlD7hCgXo8SM37cDFvPxE/gAg==
X-Received: by 2002:a05:620a:318a:b0:7df:d668:22ff with SMTP id
 af79cd13be357-7e62a0c1347mr135518985a.4.1753265629973; 
 Wed, 23 Jul 2025 03:13:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f543ddsm8186317a12.30.2025.07.23.03.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:13:49 -0700 (PDT)
Message-ID: <02b9de9b-36c8-4db8-a1dd-65a82aee0eaf@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
 <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
 <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6880b5df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=3Acu8AJWO6yBlTze4eEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lJe7-ypK7MmmtXTryC9fcfgBStHxec_3
X-Proofpoint-GUID: lJe7-ypK7MmmtXTryC9fcfgBStHxec_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NSBTYWx0ZWRfX68MVazoIKmp5
 IayiYulxISvh459zWibIaCwEOd+jBBNEYrfwjGCHwe2SZAv+ZrB6OKxvNnJ/QZW4kvcZS584TNa
 Fl8JLgSfOmK7OQIGzdFJ3X2KccoxokvGa6DsPrw0EfIwveF1pFi8wSGT4TZFPPmsxsVM8no/AAF
 6NvMNzNS588Mru6PjJOhyvbpqn0d4AKS6eNH8Jsg4zKxi5/cCQLJkf9Wf3Hg9KTS4/ynVmHsmV8
 8RvILNNkrh9z4iXhkS/8DyafU6+31kRV/nq9cr9CeeVBQ13A4bzfPcNU9NQY7W61Sy0lmAxDdjm
 NBjODH1RFH0KH5M/xL+HcnoEZV4r19Zt4nz678H7Zo2GrEWU+94GHARpjpJ7BTpxa1QGinu3iSv
 rbn1+CS8eyPtuo2C60AzaaNFO2yNfF4Eakz9BLiPldzbc+lf7cYCTe0fo6VWK2VhaRQpCJNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=983 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230085
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

On 7/22/25 9:47 PM, Akhil P Oommen wrote:
> On 7/22/2025 8:00 PM, Konrad Dybcio wrote:
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> A minor refactor to combine the subroutines for legacy a6xx GMUs under
>>> a single check. This helps to avoid an unnecessary check and return
>>> early from the subroutine for majority of a6xx gpus.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>>>  	int ret;
>>>  	u32 val;
>>>  
>>> -	if (!gmu->legacy)
>>> +	WARN_ON(!gmu->legacy);
>>> +
>>> +	/* Nothing to do if GMU does the power management */
>>> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
>>
>> This isn't quite a no-op, but I can't seem to find what the '1' value
>> would map to, even in 845 kernel sources. Do we have to worry about it?
> 
> This is fine. '1' seems to be a low power state that was removed very
> early in the gmu firmware development stage. We can ignore that.

Ok, good - could you also add a define for it, perhaps something like:

#define GMU_IDLE_STATE_RESERVED 1 /* Cancelled feature, never exposed by fw */

Konrad
