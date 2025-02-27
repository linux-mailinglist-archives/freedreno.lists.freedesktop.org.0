Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4381FA48ABD
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 22:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BC810EB99;
	Thu, 27 Feb 2025 21:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="byUc7cDF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE5C10EB99
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 21:45:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RK1Ebs017247
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 21:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pPBKVO+2HKSAMc7Se1bC13bCptlwACdJvuRTzPMifj8=; b=byUc7cDFabjRDYma
 2ED9iqovTOEpSD2UVewCDm+HOWFJnTYLUgnX2puyPhPfHY3pXrB/nyl2fz3kz8Jk
 oGkDDrB0O80taq43Raf6XsMdF1ySqJthhAaHgWi0n6PchthQ/wPg+JFCvpO3aJ5+
 bhmdr2uX/lIzzgN8W4R68H10xaGt0JglEaTZm0ABT5f7AjOpLSlVY0oTHy2pCgXR
 Zbq+A4O/gcV2ha22CYHxZJkKCifo5gxez6cot/GNaavDw8gdnrakGn3o5eZyk1vS
 DWKcKpvNZbVhDL80H/XhhUDl4PjsKuXmcRNE1SU2TP8CGdqxkpkURIW7LiXjjaAe
 WpV01A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452nqkj139-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 21:45:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e88b3d5d8bso2511496d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 13:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740692710; x=1741297510;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pPBKVO+2HKSAMc7Se1bC13bCptlwACdJvuRTzPMifj8=;
 b=RkQTSxdTuy7OD1BCjna8WmxtR3TjiVkslSJJXGKEOxxTANw+YxzpiatYHQFVaZmXCg
 AuGpNkHBO5+xAtEd+hVjlaRrALlOEwv9Cwx39T62KGX7udoCroj42nGHzMptsT6nig/o
 pYDbvckbhPlg9pjW4Ke8zfs4mhaYBf3kt3vlpqPrg9X/b8TG+7PiSdwqEQFNwtQWyGOJ
 VpIwUW8/mCgGYxJxf8EtG1y3Em+ltTYUcnI/4416Q5+mZi6sc9jKS3VlVo9KnW+tXuh7
 tHdARXbSdDG6+SaFaUiPlWldhu4Mo3TPF0DUmHQ9y1e0k8EGob8KMeSKtG0hlK1pXjMU
 7ERw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC5PhklFEP9rh4xunxE/qzVHcYSCHHUruBd9bjay79GouZICrWrwo4Se8nLrmhImYzsak/ZJxZkYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxctI7Ae5rhaHJrqGQz4pem46TrWFqF1tNgPTZRuXGDSuPetCeH
 yHvU3okJ6im7/9j+kGC2pBg/sdiC2uGrlItFcU1x45QufvltxY8KCk1BKbf4loKVx+hEw5csTyQ
 vWfuPW8YnWwkqXQ6Xj9KsOix2PG48yHQmzFen902msemXQZfNlzXVXFolVzKzMniJMS4=
X-Gm-Gg: ASbGncsYG72KXQCvo5fVk4KXM78aPmE9wzEbAcEg5bvReaad7Uq4OKvdl+0E66HSWlo
 TrZX24Z1axkbsgv5QV8A2RcLiAyMdZSQPcy+8CVPhE72GfnFEP9+U9wENDIYUTnr+DkbfRwLbO6
 AFl7upnPFl8/oSlOo2Pdhp6QIQN6+txdxGRtgkM0UV1hLg4YM9DTjIlMOkdGYJmeETiP9OVA9C5
 5OyFAOD8XPsRw9hVY+vQB6HKCNoxVypgcMUdX+b/2oVFpbmtMl3dklxNthCabR4IX3HmOUlGRc9
 6zWZqd8Aw2HddNV60f6kaVUYIDHB2DN5kVviADkwKocwz9uAqtPa/cMbbtp39iBZCH/kUw==
X-Received: by 2002:a05:6214:2aad:b0:6e4:2e03:c54c with SMTP id
 6a1803df08f44-6e8a0d9dac7mr6021096d6.10.1740692710392; 
 Thu, 27 Feb 2025 13:45:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHL2H3h1fXY/M+zGEyzBHinGXz7e+qU8JKuFYeji+RiUMLgw7RNmuLoI3TzZXEd8LNSaq4xjg==
X-Received: by 2002:a05:6214:2aad:b0:6e4:2e03:c54c with SMTP id
 6a1803df08f44-6e8a0d9dac7mr6020696d6.10.1740692709869; 
 Thu, 27 Feb 2025 13:45:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0dcb07sm182253466b.47.2025.02.27.13.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 13:45:09 -0800 (PST)
Message-ID: <234cfd96-04f9-416a-84ee-fe127f81f49d@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 22:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Add support for Adreno 623
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
 <7ffcc2fc-c783-49de-b01f-9ffb442d2a72@oss.qualcomm.com>
 <70c7f4fc-137c-442a-b65e-3743d7b1b736@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70c7f4fc-137c-442a-b65e-3743d7b1b736@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KaBrdldLYIBMyeVbk_m0t2wymAjLpR4j
X-Proofpoint-GUID: KaBrdldLYIBMyeVbk_m0t2wymAjLpR4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270161
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

On 27.02.2025 10:06 PM, Akhil P Oommen wrote:
> On 2/28/2025 1:59 AM, Konrad Dybcio wrote:
>> On 27.02.2025 9:07 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add support for Adreno 623 GPU found in QCS8300 chipsets.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>>>  4 files changed, 43 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index edffb7737a97b268bb2986d557969e651988a344..53e2ff4406d8f0afe474aaafbf0e459ef8f4577d 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
>>>  			{ 0, 0 },
>>>  			{ 137, 1 },
>>>  		),
>>> +	}, {
>>> +		.chip_ids = ADRENO_CHIP_IDS(0x06020300),
>>> +		.family = ADRENO_6XX_GEN3,
>>> +		.fw = {
>>> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
>>> +			[ADRENO_FW_GMU] = "a623_gmu.bin",
>>> +		},
>>> +		.gmem = SZ_512K,
>>> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>> +			ADRENO_QUIRK_HAS_HW_APRIV,
>>> +		.init = a6xx_gpu_init,
>>> +		.a6xx = &(const struct a6xx_info) {
>>> +			.hwcg = a690_hwcg,
>>
>> You used the a620 table before, I'm assuming a690 is correct after all?
> 
> Correct. a690_hwcg array has the recommended values for a623.

Thanks for double checking

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
