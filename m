Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1011C54977
	for <lists+freedreno@lfdr.de>; Wed, 12 Nov 2025 22:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A14F89238;
	Wed, 12 Nov 2025 21:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Keh42dv6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmXvN62/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0511610E7AC
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 21:16:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ACEJ7X71382181
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 21:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=; b=Keh42dv6DiOMyBbz
 5Tbb1I2a55SDATcKLk323qMBe+6ZMJPIQLAMr1FFEzCZuoxZQzPUigsaBfmTl6OC
 LlcCJOFwX5oZ9HGoUA1JbcLVzd939kWrEogRs16f7lciqkrjMxDELr1QebNgRrga
 ctmGxyu0pLDW5RIUhCHdTPbuceAJ+je8pQ68eam4KBjvxOrUrGM+BDBdv82cNtj8
 Juakh5ix88e9JCvbkO0gU3USEDzkWklSVR8UQAxNXLc7tO2H+OzxkI4V5t55llu/
 fIt0cUV8F18JwwIvRHdlkkkT6Kpv5Bb/xaLctPAYXZzhk/yfhdzUQ0AayOS6I/Ga
 oRQLOg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw49auh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 21:16:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297f48e81b8so2635355ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 13:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762982215; x=1763587015;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=;
 b=AmXvN62/OYha5qrCBnAvokHoE944zwyeRTKjIQhLVLtBTZisyC3SoD6mdbCPNhPGaw
 rsAHtJCJYirbsr0r4wqC+FqDnnA6YwmdO7Hx+jUwPsNj+S7SjiCiVoJIl3DXcTBiXuA4
 8puy8afk6y+wPdffGbfdtf6sujFrscH+SSwhXJe1aB1BaN7nQ9BusOtP5FOAdF2Hz5F0
 uKWGx40Wc02EQtAZUfIa/DmfrZj0nwKarin9JBUzg9tdYAPkeZxj+7hvenfi6CwCMgsr
 uVZWTwVfqdwiLceF6c0qLlbfFwly3EwHfpTcMteA58PZD7CtwCESayVtYl5I92PpxZgB
 Krvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762982215; x=1763587015;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=;
 b=RFHsxhRDIIyZmTfNv3Hf3LyPZOD1g1Kr1lPjPd9gB9nyexElVI7NyEcvyX11xYpzvt
 XTg7FOPAHnisQKKAoLUCl93N4WvlGjuWuObT7NlfYLQji93TFtVHbVldrGAnZH7dXOSR
 KEGP4KecruXmEyQCf6ESHaUiUJWsVqfrP4bAeJs5kNXfSgYFw818xSKeXZzwh196sbmN
 wuMCGrZx4Nq+W5PBCZYV6f5ogKwcMD17t6IpSLIc7HTLj7InKb8hw17PkBVYAjaE4VjY
 C8Xb0etiAvxA/i5Spv+gYCtUzWJlgd4U14a0smsZ6DfbrEQVqFQ+3FaWCYNTqtYprgdZ
 nqHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEPoI5cgqKDW9Zmq7Npl4Bu8pIwG8ukAd+A8bpy64DZGKjyjmeGrn7BvR3fC15alC+9g0ruP2yJYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy8SgYf8HcLC37acr+vO152FrGEaJorkn0ZlGAMqiRE4iPcqzv
 ovGPZWoUE01zV0kcCmtO00xpPeGwL9Cu9Nlx0wXGFAy5jPqQrmIujz5jpKSikNXIPvwBeZnoTUW
 DtsrZro+PNui8wXYO68vagAoP+wa5A80OvenfXftQNV2vjZHYDoWqOOZa+IKM1HYgV5gm6lQ=
X-Gm-Gg: ASbGncuRdC3uwv6+EonydUSV2jkJatuLwD4zoNLG4TGiX8Vh0RYp4Hj0VzvFuaij4d+
 ebD1xQt6nm3VkI4U6X+rtiQSj9HTXd6VsvezePu0PqFZdeXmHFUapIFqmITPrTbaGq3D5zeKhbe
 QTwbh7tdQqIabrXGi9qrTuH7rnANEnWkiKLNt49Gmkh6t8e1wVRsH97hPmWW583VN4KL4cdJP3y
 CD34vz5UadJnQkp5qbN1fQJOJ9ZyBi8c1Ipp852kLeHYkmIGWAH6VXkRQR2JP7fHG4I6RUVSYFS
 uMl7OUMgOVko+PK9+PxVxM3n6OqdqOj5qqS/pTsZe+4nwcnsiZUKHnMSp9ZelLtGwyu4/awSp8B
 c3/Uw85tHQlyCTFHJsABhFA==
X-Received: by 2002:a17:902:e951:b0:298:88:c006 with SMTP id
 d9443c01a7336-2985a4b366emr11200905ad.4.1762982214697; 
 Wed, 12 Nov 2025 13:16:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfYCKhd6MQEsF06e3F32Ghk4Zj+VCRoijQ1Gh0yc34lnyP12H7UORYvh0CdBd1dlZ6GUpfaA==
X-Received: by 2002:a17:902:e951:b0:298:88:c006 with SMTP id
 d9443c01a7336-2985a4b366emr11200475ad.4.1762982214157; 
 Wed, 12 Nov 2025 13:16:54 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2c16a1sm916005ad.95.2025.11.12.13.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 13:16:53 -0800 (PST)
Message-ID: <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 02:46:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
 <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A3KnjuJFqTmqtbx48idRfDi4drkXtwvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3MiBTYWx0ZWRfX2KlVastxiXUb
 wYlZQ/9GngGQ0Z7GTPnfafaPg1hdelNkbhiCVI4KEx87KcbN5wzycnhKc4VIjW6w6pypHsU5rks
 i4edEf0tCRgpSF/xgchp1wfK/r445P6zlPN6jPGQmE+cQR9XHSXy2tnmpU6xN7ZucQsm7gVnr1F
 QevdRVbJ3oMB963UtbM8O2ZBky/BGkStlAwXFB4OPnrYB9i3yAoEUZemv94gAAj+v5+kzCNelRe
 duH64/WNSCL9uwy3npIKCsbG5pgbHxFa3XQNpFqI9eE8jMNt8JHejTtQ/lA2kZWdKnRiSWTl8Lb
 0XICv0ft9D4OcUV3kaee0TK6u/LS3/SYZkXwyBGYL7FUrSvsP2Rr592hDthXQ4I2+CY0S45W3Jp
 ysE0Z43qbU8AM4PSgYbMnkvBzC7VkA==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6914f947 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1HEVVvjKVHWHBA54g4IA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: A3KnjuJFqTmqtbx48idRfDi4drkXtwvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120172
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

On 11/12/2025 4:37 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>> in Raytracing related workloads. Add support for loading the AQE firmware
>> and initialize the necessary registers.
>>
>> Since AQE engine has dependency on preemption context records, expose
>> Raytracing support to userspace only when preemption is enabled.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Side question: is the AQE fully functional on any gen7 targets?
> A750?

Yes. Only A750 has it in the A7x family.

> 
> [...]
> 
>> -		adreno_gpu->has_ray_tracing =
>> -			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>> +		/*
>> +		 * AQE requires preemption records, so disable raytracing
>> +		 * if preemption is not supported
>> +		 */
>> +		if (gpu->nr_rings == 1)
> 
> "nr_rings > 1"?

Ack.

> 
>> +			adreno_gpu->has_ray_tracing =
>> +				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>>  	} else if (adreno_is_a740(adreno_gpu)) {
>>  		/* Raytracing is always enabled on a740 */
>>  		adreno_gpu->has_ray_tracing = true;
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index b507ff4e1756..7921b4a68937 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>>  
>>  	struct drm_gem_object *sqe_bo;
>>  	uint64_t sqe_iova;
>> +	struct drm_gem_object *aqe_bo;
>> +	uint64_t aqe_iova;
>>  
>>  	struct msm_ringbuffer *cur_ring;
>>  	struct msm_ringbuffer *next_ring;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 78dcb9bc3377..2ef69161f1d0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>>  		goto out;
>>  
>>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>> +	if (a6xx_gpu->aqe_iova)
>> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
> 
> I believe you should also set CP_AQE_APRIV_CNTL per-pipe

We already configure CP_APRIV_CNTL_PIPE for this.

> 
> Should we also enable AQE1 while at it, to reduce potential backwards
> compatibility issues? Would that require solving the iommu woes?
Yeah, AQE1 is strictly for LPAC workloads. So lets wait for LPAC support
first.

-Akhil

> 
> Konrad

