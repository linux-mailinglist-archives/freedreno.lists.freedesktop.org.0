Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265B0B10960
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 13:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4C10E935;
	Thu, 24 Jul 2025 11:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="btqezY8p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5008F10E1F5
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 11:39:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9aoON012727
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 11:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oqSerAH08mV+bu18I/AJbmlNy8XOCWAaqntFX3ows/0=; b=btqezY8pJgbADaRU
 scEYcRojeNpyXK+P8q8dFPu5gGoh7D/jOaR/MtgR4VpicfK4BCZ85M2rrImgK7kJ
 Ec0Q+znmi4C1uN7BzyrhTSFx6VauxEkKxHhRSRnm+fHeM90yyQ4Ve2rho90VofRK
 xly/1DSOsAqhafmpoRD67mxKDypFGkhs0pHWwlnU/WzLPtErI6oBYNJnQ0YT71SB
 tb9lYpdHBgEXRBoD8nCAI3gHQKZwzqXcDNGzlMAC2j1OfzXBym1EmEA3Fyy0f+yC
 omV67354n7tPn5p3Uf7SgMxm/NE8hF+SVx6Lgaj3fo2FEzROiTNZkLJLVYmMzqnS
 XigT7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hxjq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 11:39:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab60b83e11so572111cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jul 2025 04:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753357169; x=1753961969;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqSerAH08mV+bu18I/AJbmlNy8XOCWAaqntFX3ows/0=;
 b=wPa88Fw0ZgGkh/QZDRE+tBOhQx7HT7MOkdLRCK49gqGlHTUDPOop7vilZLuYV6MvOP
 bD8GcrvcELUiW1FITI3Ty11DENf0gFuobMkkWVVxQnveh+7nKNaxPHPKylsx/Zx2PCWC
 90GtM8bRRSBp+At7cpG2zp2jMKvMaPRDz4P5s8aNxnQXmHhN8dp2WfngWWCFl2yG4dDP
 XtYZh0t3iw0ze1d3qpsPzMFnCXOi5vem3iajrKHG/6qpqeyfXbunorWYPKBdNtFhFnEn
 SCzr9B7Mhwnm1xI8W4ZIW5vm0fuvQAJIxxXHLEPcraLzkViFx07kD/qldqVQaXEJOqJr
 mRhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXCuW8FhVHl+sBtIdbMEGgiwCV0BKOAlczKZBygzTdmi0yOQT+dg08S6v0rjaHEmgjb3+U/TrekXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwogTr1FoZQXQtQZOIRTOOJpOaGHNLl+iqKzGt5MGlaSigoGZga
 Z/jRA5SP5RjL+AcuDPmmA8qQg52EDIwSG8nUn1gJeOkPaisVWJbnGZGPYNyc0vYaBQW85msgtU1
 d4tNEl5thhe5LN6Oe4AIgCrxUKAbumOZLUG8XdOK6L6GL90/PsmAf8EC9I2+VfYBqwnTHWZ4=
X-Gm-Gg: ASbGncsViIRcORHVuA6++8Ddzg8Oddp7hn0w+DBgLKc1Q5sd6TeNZfjQDOKa6UQ19l5
 nTtto1vf5toVY7VZapHuC63ml9Vwv5b3qHzcGdGlHDnrdrC7CqV0ttR46fWU5IVFYSEtCaEwojV
 2tr4C9lDUVrSMsRwHHeyFLqPHxkN+9QdzuKz1X+kCkQP0+c1P08cQbl597c2fRlu1aYzxnU7vzM
 ZSn+KhnSq76mN8CEROIhxqyJEyZTN1l/s+rArBjS1FMQesaVLxHcHlYpJkflWMS6R9P87Ykn2Wf
 EbYUqMqyz0yXhCsbc+4p4R9A4xKhkeqorwGDFpkj6ri9V9nR1YOZ8CdcmDAitoat2GSacm5geTI
 fsrvOVXzds1UHwlbkaQ==
X-Received: by 2002:a05:620a:1010:b0:7e2:ee89:2059 with SMTP id
 af79cd13be357-7e62a161c98mr301781085a.4.1753357169380; 
 Thu, 24 Jul 2025 04:39:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrXXj7nS41J4tzvt5vYVWROB7LrrdrXAgkyDwKGD/CaWyzImC+WopFcS+OfvIBt6ZwiO1KzA==
X-Received: by 2002:a05:620a:1010:b0:7e2:ee89:2059 with SMTP id
 af79cd13be357-7e62a161c98mr301778885a.4.1753357168938; 
 Thu, 24 Jul 2025 04:39:28 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd31ac41sm703041a12.54.2025.07.24.04.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 04:39:28 -0700 (PDT)
Message-ID: <ae143353-b979-452a-be29-0c64fd90dfd0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 13:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
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
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
 <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
 <002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68821b72 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0a86huQbBvxycGr4qhYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4NyBTYWx0ZWRfX0m8XddR+uO4v
 pCUcrpswZ02Keaac9IoRuNdC6sbrRfDCxsq5l6xJU30grPDxLUhLnumnRhj+T6E16u8YzdYWdwg
 uEwCuP1kRaKsNcs/F8jpsxrqJhwr1m2qqeAvfYCBGlNaruUozq7H3ozH/4ldQa9ByacHZm70f2H
 qpwTrhV9xJ+GQq8gCunwkJ8+3+fF610g8nJ/GiorctynCi2PfWr+lt2cnf6/KjBoclfy4Px3Da/
 PBqE6zIQT8U8RG17dTevtZexaWUVOESC3zuC4z5i29f+9qMv2MpGEM3TXO1UUwJyFhAQmKYG9i8
 3ECA0//vCgqWlwfyABTJKSwHQ7XrLme1vqeB5LdX2ScZ8c4c+styfNyt+3WUoHzD0DwvL8zzyiM
 PF0W5UumPUInkMkpt5gDpmujOzxJ4R4c9w3YQodOkechj1o8EP8WuIoY5FeyZ055q12NMLbg
X-Proofpoint-GUID: q1pRqQJdckGp12_YGZKjIoYjG6AU_3lI
X-Proofpoint-ORIG-GUID: q1pRqQJdckGp12_YGZKjIoYjG6AU_3lI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240087
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

On 7/23/25 9:28 PM, Akhil P Oommen wrote:
> On 7/23/2025 3:31 PM, Konrad Dybcio wrote:
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>>> DRV status registers before pm suspend.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>>  		val, (val & 1), 100, 10000);
>>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>>  		val, (val & 1), 100, 1000);
> 
> 1000us here is a typo and I copied the same mistake below. I will update
> all of these timeout values to a common 10000us in the next revision.
> 
>>> +
>>> +	if (!adreno_is_a740_family(adreno_gpu))
>>> +		return;
>>> +
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 10000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 10000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 10000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 1000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 10000);
>>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
>>> +		val, (val & 1), 100, 1000);
>>
>> FWIW there are places downstream where it polls for 1 ms
>> (gen7_gmu_pwrctrl_suspend) / 2 ms (gen7_gmu_power_off) ms (as opposed
>> to 1 or 10 ms here), but the timeouts are all the same across registers
>> (unlike TCS3 and TCS9 above)
>>
>> Ultimately it's a timeout, so a value too big shouldn't matter, but
>> let's make sure the other threshold is ok
> 
> They are fine. We can try to reduce the timeout 2ms in a separate patch
> outside of this series.

Great, thanks for confirming!

Konrad
