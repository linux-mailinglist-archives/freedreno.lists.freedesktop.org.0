Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF3C51D5C
	for <lists+freedreno@lfdr.de>; Wed, 12 Nov 2025 12:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1492310E6EE;
	Wed, 12 Nov 2025 11:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbFmXmBT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYFqgrFU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080E610E6EF
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 11:07:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9gjSK1109209
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 11:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=; b=AbFmXmBTta7gKjns
 M54/EkecUo+B6cPlccmI4n5Aj9/wqRd2an+bzFJ+ms700a4OajXZeUEs0gXWQRLc
 etsB8+PdB0dKId8+lOeFMHY7TYoDx1ABopbYg7tBtpG6H6xL3S35HNvLdVM/zgAq
 yfYjYPBDelBKRb0j2yq5sVRydVg/9Wase8IyulhN4dEeUlmoH2zYiu39rd5AJymA
 5IfH9hlH087LSQuSPibn+jT/AI985QAaVn+au/GJ6aMhUMY+rDwa++KEfRyjYwxK
 dXGbWqcERW93lnoYSWvH1QxycRclRX0ECjE89dnAtVJyZcIgPp1aXQ1KNS+XJChv
 rcbN5w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum083j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 11:07:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ede0bd2154so757371cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762945666; x=1763550466;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=;
 b=hYFqgrFULH4NfU0TcVpWP0dTH29AglFGEDWOUl2SCDARA7lLQMpVaE8znFL6GFqEXm
 w/4IrD/es68KF8MThA9/TMPSqoRuYBHUMIgJuEnxiRugfYKyUcIlWBKBAuWkh3mfbCXM
 E1WrdgY+39S9GZB2hvPwjRgJwZQgZXta1uYQqLTlXrJPkOgCfiw0aRLp8kdD3aHThWyG
 x/heSpbFAsk9y28Dq6SXUBxb/OKTBY6I/dYvvxzNjmS/hHPEsyoRRiU5J3yRaA2+IBMB
 Na4sl3arBEMOwC6Z8TYkEEsksVB/GftHYH8Y40YVGFyNyiEr/VxjAMADiYm+IspNpn7U
 kE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762945666; x=1763550466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=;
 b=r1s8ncyiendoiAApsVhnhMeO6HLkuWOGs9Puz8Kn7Ac2AkOQwI/GnBRrIs84Xw+Y8k
 vgLcte+d5RyxIJSGpwbkrMBNkig0W35EeToBFQGtyMljRbeEmw0dZC/8hrPzRjiMvQiE
 y4friluQE8ycHQi40+h9KABg0ZEzkV5J4XSNWRAsDnbbYQaFla084ULhMoINiJ+ap7AH
 ltai5xpXFe0/8UdTFs8h/7aXHnqJpBpJCTj7RrJgc94rDOnfWW+PY7TK7aBc6foI0bC7
 AWFlc+giIdizuq4Sz0oP/yAXS63+980wsAENqC3hYXgUFstJz+KU5pCsVmXMVREImqes
 OVlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcPuNiTgrE7J6HZdrjFw1RrfzTqxIVcPQkc13bOIp9vGuSdbjDOWefbmEAI+QcomKi42Zv4fg2y9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNj9P5ij/068xldOBZSzKL4mDMLpvTBjr/sddmk0z2GgdTXIiF
 B2RUayiTMPaSj0tjcl6h8ufWGPTTw3kPexJreIcEW3HRQZnBIwq4MIqSCyqy8jyH+yBHf+ejhXT
 nnjVF0/uV2SKbx8Og/eEsphW0mT/Di/lkOhFqYMAr3eL6pQkOyveTyPCsLvDXUrKcTRshuDg=
X-Gm-Gg: ASbGnctAVo0jyF3qenBadI5KqFNg+YI3WwJ0CAREvMP1XQfLw0CE/5ZqwFtyo/PlIFz
 xPlgDSH7Kh0a6Mbkpxs7nBb/MoLVS+WXHUcur3NAuHVnckInOwhajhIpFOMDidLyZJez1g5N24V
 U2nZlkMzL65+fcErepG+bh1F9xjaHu86sIhnwe7FPrWkaeN6vQYpzVlB1yJDz5ZmspOZMqJwtfW
 OXctMJ+XdM+NYZvwFhv0KwuOfg1pT49lCTp3DjhynwRGwx8HzBxiAC/NQltlM8u/khArPxkwESn
 6y7SWWPvmPssBBv5rhuI2XYZmgGAoQc19UEHlrXQby64YZr3PTv3i1P4fS7UFFUenE+jmSWvp9G
 tiES8580DibmKGlGKVhdcOyl/rCz0v23UMewe9c2f0j0PH/RbyPxU6nWE
X-Received: by 2002:a05:622a:1a9a:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4eddbcc8ccbmr21834741cf.7.1762945666366; 
 Wed, 12 Nov 2025 03:07:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsThee/kJ9PQlX1eMjNVcf3pwMggayYjNqOtdauF4RKz6aTdQHNiSCZ2A6kK70/XwvxAErjQ==
X-Received: by 2002:a05:622a:1a9a:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4eddbcc8ccbmr21834301cf.7.1762945665887; 
 Wed, 12 Nov 2025 03:07:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64165b2aa03sm10031978a12.6.2025.11.12.03.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:07:45 -0800 (PST)
Message-ID: <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4OSBTYWx0ZWRfX/GZwWL/E0C63
 TNtc2IalhYsqeqS5VoP4/aun1iqXrZLGWmzOfdlIxg3PKt3ZRtz3s8hJ4lr8CcWNVo+TKbokiG1
 gKI4fh0SiNj8FP2qBfQB0RJ5RfUCXZR2Wwn0A0VDZ0Io03+22nIvYBAxq644TfQYj093Viqryyz
 H4kYaAogdiM7SNCyupVqoS6XTp1vgJaAQOt8Vc/IySv07Cs3o3tWtd5G//253eqNFjOd1wZa6I9
 0CiUQWk+MBL0guFpxrY+AsIn0iBSBPVugzV2/3FVSoegDTgjcOVMKVH5ZusPj4x3DoNi+T3iKE6
 VcVNn5IwojVqKIEuuTwh4zxR8MZ7cV6ybrfv3+svcbtbV7TIGzmON94KoEtZOnj65ITCnT1T3JN
 GGnFRVQuvBksNdIiHF0AK/gHVngJlQ==
X-Proofpoint-GUID: K4H8aHArrqstiDr_ZHOWuz3DVYQXMYsm
X-Proofpoint-ORIG-GUID: K4H8aHArrqstiDr_ZHOWuz3DVYQXMYsm
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=69146a82 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XSWwlsXGtsdNaMXbhvkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120089
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Side question: is the AQE fully functional on any gen7 targets?
A750?

[...]

> -		adreno_gpu->has_ray_tracing =
> -			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> +		/*
> +		 * AQE requires preemption records, so disable raytracing
> +		 * if preemption is not supported
> +		 */
> +		if (gpu->nr_rings == 1)

"nr_rings > 1"?

> +			adreno_gpu->has_ray_tracing =
> +				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>  	} else if (adreno_is_a740(adreno_gpu)) {
>  		/* Raytracing is always enabled on a740 */
>  		adreno_gpu->has_ray_tracing = true;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index b507ff4e1756..7921b4a68937 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>  
>  	struct drm_gem_object *sqe_bo;
>  	uint64_t sqe_iova;
> +	struct drm_gem_object *aqe_bo;
> +	uint64_t aqe_iova;
>  
>  	struct msm_ringbuffer *cur_ring;
>  	struct msm_ringbuffer *next_ring;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 78dcb9bc3377..2ef69161f1d0 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>  		goto out;
>  
>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
> +	if (a6xx_gpu->aqe_iova)
> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);

I believe you should also set CP_AQE_APRIV_CNTL per-pipe

Should we also enable AQE1 while at it, to reduce potential backwards
compatibility issues? Would that require solving the iommu woes?

Konrad
