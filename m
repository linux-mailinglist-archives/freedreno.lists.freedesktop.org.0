Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80842C6489A
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 15:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E90B10E39A;
	Mon, 17 Nov 2025 14:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDTM5GSl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KH0r7GUC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8E810E14D
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:03:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB2oCI3671224
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=; b=fDTM5GSlpZlpE+F/
 Yll2WAWkbz5B8FIvh+LLqnK1wha3+V5evOq5StyQ7/yXVwQT99HwrK/QQ4DYrHib
 YtYZPmUrhDwQm775l1eMYeL7T7GtlcSFk7oBYn7+4zKsHI6uYcAVX9OQxSwoefKf
 GjtudtcbJIo83ojArDZNAUoHitTo40vVyCMMoa7qn+VvQ+tsj/XAetXK1E39DJGe
 347eDqJ2DEZjLYzsHIsLIm15nbZSeUeOoQMsLTF8ZU1pYIgtJZXDewAui6xuE33p
 LG63nW6tGf1brkpBHO8HJtDS6ySSN5V9rFmrd2bcDUCkKiSzLN/dM+qUNgsYgVAp
 t+ki2Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g58fja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 14:03:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-55954914f9fso260603e0c.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763388188; x=1763992988;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=;
 b=KH0r7GUCo0PRl1dqWuPvUy3iPCD9U7XBnmTW7ZwYkeTxeL2/QUlBf7FutpUduLDiT1
 lJ7eRJnzr7/eYjA+ss1kpbLmM2qo+BGnq520oJDOYYsUEb0nFXQ2Xe/psVv+Q92l8q4L
 ROH8T3GwGjYOvBhn2r/uXdz3fk78bStCJArFbP4FoM8eOXebdy5KMWFfDGUisismZIZE
 sQ4TWfGzyeYnZ5LyH9vNoWy98pdWBzdGpqf9xBEvOkfM0h82wT2SssrsuCqigXrJbS1j
 /A/SRo6Zp0pQwMtAj0rpqQQIrdYbZq/7mpdR1/EPRSQaGw9SO7E1MOjYY6HVpMbWB1pk
 PIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763388188; x=1763992988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=;
 b=ZvO5Uf+zHdaZqt9DV0Vtwwzu/oyiST6w5T+gA8Wmqnzt69jCNPf8hKt6YauLfRcA2d
 QDVD4O0NwDOOhQUZcUW3r8zRpvZmhc0G6/1Kf1czdIgsM2NgUmXWXlY/oxF5PJKyh5Ge
 Rkhqy/kDY5SZ/mFbPsSyRsbErjjAXJK7ymGNdtAPWPX8AzL2cLSSqb0iaSsjeyFAEsyN
 aizzRCltOO5xxgNjgLKVyxyYJrRHYqymXPsIeBualgrY+W4ppoIivFbpGefLExvqOZ+8
 aTL0mDyezGfOVTlHofkLdSeV7nOCNx4Qm1TYuxFSbDk5rY5yUOZbblhKbUvVVtdHOXkA
 eCBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2finNXFreYICqNhDBfDHH66GSdl4lJAtUCw6c/D6XGBx3IvatcV2dh92Q92mNNJ0YHlto/KEcSUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLDrx98gYITBsoVZcyI0RTaz0XI1369BcFbu2/PlWoR+xTNPnc
 XVg9HYupYo9BvAC2wrDQFeJzakb+1ijiWrgaa905VD8M0KPJhKZzIAcUTZHxkvgNRRUFMa6VraC
 aYIcC8kuZ7sqffnMa9j1X3cQ9kqGgfbJPm+pUqUoWiS8Ll0wVk4tD4WaAeOSOrNmID89MVho=
X-Gm-Gg: ASbGnctDi0ZPUZ39lfTDTAzuTl8muoSYRkfrfs6u8fLxGk4CXyiCUWOG/V3QxuzsgTX
 XWqxKsre5xcB3buCfJfToG6YBDYhIw/uQQMxS02kbSAC1ffv43PrP/O71QcpYOqo+lHKgbwIUmn
 tPtE07JPRqqvsYnSKHCej7Cn42W4xpP21hP3Vv3ECs/MjbptAKnd7q2OKHO7ISeUdBvAEz3Lcu+
 hHQlfwYFxcfnVvRtKAZBcFHYrQKA8M4jXr4QI/aR2/l+2RKgIg0H9OUllcYjdEPW8uS7j7ekslp
 FD1RpnXUi7K2zU8MotJUuxE0eYZlZrZTKg4zV/fcRaQpI1d50OBM2iew6KYW93eHU/8a6O99xXT
 tdn1g9mJ+3SAX03Bzz+KocwbS53/7f7pmDVYzIXCF01gNeSRJqWUa4CsK
X-Received: by 2002:ac5:c5ad:0:b0:55b:1668:8a76 with SMTP id
 71dfb90a1353d-55b1ebefba4mr1296466e0c.2.1763388188138; 
 Mon, 17 Nov 2025 06:03:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZZTHOOdfEqa9ER8hemxiu6HJtbROxsxg4EQg/rySnc9YSfY+WhVEbc35EghFcBXcleB9lbg==
X-Received: by 2002:ac5:c5ad:0:b0:55b:1668:8a76 with SMTP id
 71dfb90a1353d-55b1ebefba4mr1296341e0c.2.1763388186109; 
 Mon, 17 Nov 2025 06:03:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f961bsm10428680a12.14.2025.11.17.06.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:03:04 -0800 (PST)
Message-ID: <922abf06-c75f-45b6-9653-492a00d414bd@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] drm/msm/adreno: Support AQE engine
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
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b2b1d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vi7wF31NLlcTFLqBoF4A:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: HZmg0L-O0OkRc6FREiDRrSKhgTc4KQjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOSBTYWx0ZWRfX2ElJS05F2rEp
 Sm92K9qObr7E6yz5uGcPd7tMU12bV3Ei6hBwOKy9l3JWaemQ1CL9P0K8PnY30VBuSKW6ksGJrDt
 hfrbQS66DsNTbbua1+zvNDAhUISnS9k9nKCbsbKldeeptFsyMYqvV6Vwn6qdlH/tc+MuXky14AM
 JsA0kMrr1cEnkep9/t9rbp3uxaiOfnh8JI/zV6ZYIlrX8RXPwO/KDk7M+2fHmI/6LTUByOSR0/9
 q7uOAAxHaqlK+mJG/UGiSSzAOaD8pOIUv5bK9cbNLzYt1qe/KUdOCGGyabDFVA11XXxzi6C9aEf
 pXbfKo86UwIMrDX8gN2/qtwYGIhWlmfwpSF7+do++6XOw2WiLSzbSPLmWVPD6QDeVASExz6H8gJ
 h1f/gSfQ0P4zy102hcPUVhCubnVZAA==
X-Proofpoint-ORIG-GUID: HZmg0L-O0OkRc6FREiDRrSKhgTc4KQjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170119
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 20dbdad6e2e8..ef79f4cfb80b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1104,6 +1104,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>  		}
>  	}
>  
> +	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
> +			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
> +
> +		if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +			a6xx_gpu->aqe_bo = NULL;
> +			DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Could not allocate AQE ucode: %d\n", ret);
> +
> +			return ret;
> +		}
> +
> +		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");

You need to unpin and _put this in a6xx_destroy()

Konrad
