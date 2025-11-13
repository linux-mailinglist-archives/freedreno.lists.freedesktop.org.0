Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84FBC5694F
	for <lists+freedreno@lfdr.de>; Thu, 13 Nov 2025 10:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BCA10E7F5;
	Thu, 13 Nov 2025 09:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ2znY/d";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9YbKVVV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093510E7F5
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 09:27:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD93BIN3113350
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 09:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=; b=DZ2znY/dexHHqMHq
 9UkWyfkyA6sxniXfSVzQ3mjIGhqO9rwCQKTW75wPB3nlkpUsS0OtYu8UxJQXenRk
 pcC/7jHqrzkDz1W3+4SVTQy5RvEhR1a1BLews3b1dTMnuu5k0dQ020YVVJy2DVN5
 sZMi3oF9NrfocKv5ItoZdY74rweVMQxLL2DnVYQHV/b9nofgv98w5BqsQjFYHz4L
 iDylQbuQi84kF6BdGMY6P+BalSzQ5+T0zJ6ubsI91moQLfbQiSMla/AmjbyqcdGf
 5NG/PtPFaRkLM+oxZm3TV4c2B5cWISuXHS5uwwv0W++sQfpde37Bk9ymdiBQgomD
 05IFsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4b915-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 09:27:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b25f8d38efso21294385a.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 01:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763026035; x=1763630835;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=;
 b=i9YbKVVVkaOnkg63jUbn6o1lMGJmtGjs0I8TdrJ7ojJxyLRy9xDKUYnR/gMVJLTy+b
 Y319d76WtZXYurQiFf5rYB5y9t4BxalOWbckxonN/8ShSkOhKcmEQoWI3mQ+wiYxb+u/
 53rhXebKuMaGdqdKkpxnzBBaJdK4TZ002oS9lxut6ieBO2Zly7I/nVmWitPVcto0E4QN
 McjynbUbloz9Kb3oOLWqhlIhaq99LjZYUfKOcDTQJLtPdng0chhTedSKSKH4FLqH1XWW
 mOc5nGQMuXWaUM1LRlnGqNuokJbKI5cUTh4MG7JN5lPRsmUsd1zNcizEvI+r5+PkyXS7
 k8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763026035; x=1763630835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=;
 b=ajrKubfLUVUppeUTq9Y5O8+IBvLSa+ztvqbPAu9ku/o4y4CgUEGLcmICFgcbFamJRX
 ajowNswvnbFmiMeWvg/I/YUrBrOpWHPVEcmaWgwEqNPq3ERM70ORft+F5z4hNFzCcqKh
 H1CFonuvgmqlRLU42TESNMsyyLiHgIJ0p+B/IU3N3pMxZJAfdbDJEg+VOnmz+13ltCwU
 UQlHJzIiKBhpJvrwvDYHo5JoLno1/jQoIi8s6Jdj13NgQmf6T4G2etSZotZhgPHSj6aX
 FOiU49igWC7/f+NxyYx/SbFo0sC5hKbLiVs157r68rj2eNloYVLIrFSid/JL/A0BJHDI
 k4JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxs+kWnUqH+x+knWQq/KOLnwQF38d9hU7TmC0eLw9I9qfXLs8LN7MANtPU/jm5MoozOH4DtM+ZaZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC3Gm2Zx4E9up387ETZ/JZvmI9e7lAwCmgHi8m9g7ZuwwxCk0T
 KcQd8A2sftYmx7Ui4pCVj8nGqB6BS6CHB/GllcU/3VCWuFwfGYa9JQF1wqWGyW35fPoIAHWLEjX
 MWn9FrLolMrDZ8j7bb6o9HxfID+14fC9gWI8v4ZzglBt9Z7H4r99JVez4wgx6hyZo0QcjP5k=
X-Gm-Gg: ASbGncvWsKEHlKDixGkWFCxluSC18A+UDMu9zgXAMPakXmqclXyOmcg23f7ClohWjUo
 C4Q2zumu9d5PANtb114KuLFH0jUW/+vqo23RrT2t7kRIK+dve4sHB8R4t+Gl0XIQthx/ITaHyca
 TnIsHoCSQQ3I92A6826q1qkzlQxT529s68a/HyN/Vw2B+6hOAdHwRjq3n0yaEhz6EG08Q3Sq5fG
 tDKVN3D+Qgzl+IdyMHU86v8DFKsueftiGao+Q9ypa76bmEv8H/VW4XCnojrw9yoLxzxclW0W28x
 JFITA/f4/98tpIbqaNX+B1PL0UweGKcqni9F47BVk/DKaizG/cl5/lmtjPpLsc5c/xWJZ/YOzCD
 Ho3LS7WRlMih7pL+LkMEiR/yOQ/Y6Z0hZeuRBkvY6lTI5VUvvc54Ttcm6
X-Received: by 2002:ac8:57d6:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4eddbd957bemr55093311cf.11.1763026034635; 
 Thu, 13 Nov 2025 01:27:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoZxoEy/JmKlmxIOPZpqL8nflJ1JnawU4oD4ovv9bKA6hPgIGxSwD69qSzkbCaaUf89Ywfyg==
X-Received: by 2002:ac8:57d6:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4eddbd957bemr55092921cf.11.1763026034164; 
 Thu, 13 Nov 2025 01:27:14 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4ce83dsm1028106a12.34.2025.11.13.01.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:27:13 -0800 (PST)
Message-ID: <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
 <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4-NnUdA13EPb_xFNdvvJug5YUGm6Hluo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OCBTYWx0ZWRfX58DLghnmUWHb
 epHwSTNX9+okzswA/6SQvN6NeFjJij7ORIsjs8F/cENJ4psu7IDlAQ8bM4Zb6afKLgaudDtgJln
 rS6iagoLquuUlsOndW2VwLk1khKhnD2fA3w5BPjpAzpkrJZqn/kfvNoM3tfv/67gBhGrh2pcuWy
 VgWqMi5d6hECXcGNXVJYROl2ixshC2FHfCtuLLPRdgqiU8daPokNWVhzyLbJbOlR7Ibg3gF/XxG
 FA1xKp+aZgdsmoPRfAXVlD3LG0a76wJYqaSm7Uxl9hxnaLRNOIr/l0HZcHbNJ7pD7lIDjWzVGXk
 P6T8RWi0UslSH6qObT6TXIDzROV6hBPfY1g4ZrWtYkWjF9qSFw0MLCL07AWBUxPl8/aMW1iLurl
 d1wKxsHXrH03z4QxsV8YQoN7sEzL1w==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6915a475 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pBDOg7y053Z06RvWvLkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4-NnUdA13EPb_xFNdvvJug5YUGm6Hluo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130068
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

On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
>> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
>>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>>>> In A6x family (which is a pretty big one), there are separate
>>>> adreno_func definitions for each sub-generations. To streamline the
>>>> identification of the correct struct for a gpu, move it to the
>>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 44df6410bce1..9007a0e82a59 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>>
>>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
>>
>> Could you point me to the holi's devicetree? Currently I see only a610
>> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
> 
> I don't think upstream was ported to SM4350. SM6375 should need the same
> hook, but I don't know why Konrad didn't enable GPU on that platform.

I'll try to fire up -next and confirm it hasn't bitrotten.

Konrad
