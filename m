Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BE39EFD4E
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 21:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3924A10E090;
	Thu, 12 Dec 2024 20:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2Ql4mnL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE62B10E090
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 20:21:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHaixo026866
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 20:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7hwbIErcsoN4GpMsinEbq0OUuK0bXMQyc2AxZ7xTRrs=; b=f2Ql4mnL23gJH5Xm
 5xHz9ddBNOpxZsugr71q1dytDxqimObkkd/bfU2jhukHQKRIQ/guR2XWui4Wex0Q
 uVFMkDK2PZ5p9q10ym50Ms4cF3+tiGX/Re9kzcdhsKoEyDOtHlIKHLTiwL8V3fSX
 wRtPI7SSGilvQ+qn4dTKFyCBFN6c01QkHz3/hm+I8PuMrPuYy8fQHgpObZdxIONS
 Fh6UiKXMeIb/1zeqoxOumrYOhFT3qTmp/VrjGFm0bTyAZwnbc7QeQiSRDcnQOwyN
 GHUaA2vzr5sgk274oICmHiiwwANFtjw0v4tYtst/NrpEUj2bjudF8RdhuHcgxcqG
 s68GXw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40m611-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 20:21:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6d8a3cb9dbfso2328706d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 12:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734034883; x=1734639683;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7hwbIErcsoN4GpMsinEbq0OUuK0bXMQyc2AxZ7xTRrs=;
 b=DjS/i+OktdlwPqi6acLDvCwvsR33QTc4/IiiVZ3NBIpH2MHfBzTz70laB59NSKDjCo
 PLy+nRB8W0zXUGM7hKbXdYE3pOUbM3iCRTe4vtBwXs4axnX/iSFZAqZKCmPqnEfU/VLr
 p4bFZU6Vt9+bxtiaf6igphSw9is/QhvfYGgW+cOuHRmXdA/mDeStGEVUNiwtlbGOfqTP
 RGHKFfSqn7MG3lVxS9mKPm4EYcCTR2bVsMowF8iAaEfjwwkL/kp6iAGQoyywDlniBvAv
 CDKWN1HwtMlxw0luEQ1HjKsi9rOrM1q4d4VtGOyBHS0xHiM178MSP5EJEXSHbXMUNnuX
 qfdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbK+c1OYy8kRyRjzt7Sm1Yl6jtepziy7mC9F8TWbt7F5X5XRyU6vAGJYHBNgNAMa7MF5MF42lCeUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXrGmqSiW4VfkbGwZ7cKkOmmZJF+XOAs+VxPGKwPGMWDV0r9dp
 exNEWs+0hvny8Ps5EOKADKN7EzaRbaLPYjHip93p0D5uByUH/EoHnVpAw9lHuWELXZrhr8vgje/
 ManE+ksII5fPUSmU0senCnRgqwDokObCfsfowGw/0qt4/IigpIYyaFoBrwfDZztiD1mY=
X-Gm-Gg: ASbGncsJpaP/ICOOauU4k6Z2iVWLcg1/kYR600CM9uy5qMac3hM0bmSdrPzaUnAyy9S
 KiF7w3AMbgRa9c+nK8Uw3FcM1kRpiACyXMQc02DaUI9CAsBXafgSJpKSJPKCZ/cOFJTAjO01HKL
 uXOj0rEJeoatQpDKvdC5ESgZgvxBgMKR6Ba+L34tiW0MHKTXx+hKi9YHwDKGIP9IW9JD6amTY0A
 +n7ABDuOGqHmcC45JL72K1GQPKxS5xlxXsRlDQ2RQ7/u7gDYSKSXcy0PZWixW8L+ufKIWLf+3/R
 51RlZvw2gFVUQ2wzSnhhAvfOdoJBdSGX1iuE5A==
X-Received: by 2002:a05:6214:528d:b0:6d4:2db5:e585 with SMTP id
 6a1803df08f44-6db0f704123mr9378076d6.1.1734034883402; 
 Thu, 12 Dec 2024 12:21:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy3so1lvDr+vr11bSRGt9FQBphmUj+4Zo6HiK7Y4JuHMAjDDbDQrFuFQWWlQEjDLaG1rQy9A==
X-Received: by 2002:a05:6214:528d:b0:6d4:2db5:e585 with SMTP id
 6a1803df08f44-6db0f704123mr9377886d6.1.1734034883034; 
 Thu, 12 Dec 2024 12:21:23 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474e27sm742971366b.102.2024.12.12.12.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 12:21:21 -0800 (PST)
Message-ID: <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 21:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x8yFoLoVFKmp4LSHCjWNAzM4zayje8UZ
X-Proofpoint-ORIG-GUID: x8yFoLoVFKmp4LSHCjWNAzM4zayje8UZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120148
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

On 11.12.2024 9:29 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, until now we left the OPP
> core scale the OPP bandwidth via the interconnect path.
> 
> In order to enable bandwidth voting via the GPU Management
> Unit (GMU), when an opp is set by devfreq we also look for
> the corresponding bandwidth index in the previously generated
> bw_table and pass this value along the frequency index to the GMU.
> 
> The GMU also takes another vote called AB which is a 16bit quantized
> value of the floor bandwidth against the maximum supported bandwidth.
> 
> The AB is calculated with a default 25% of the bandwidth like the
> downstream implementation too inform the GMU firmware the minimal
> quantity of bandwidth we require for this OPP.
> 
> Since we now vote for all resources via the GMU, setting the OPP
> is no more needed, so we can completely skip calling
> dev_pm_opp_set_opp() in this situation.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 +++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>  4 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		       bool suspended)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	u32 perf_index;
> +	u32 bw_index = 0;
>  	unsigned long gpu_freq;
>  	int ret = 0;
>  
> @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		if (gpu_freq == gmu->gpu_freqs[perf_index])
>  			break;
>  
> +	/* If enabled, find the corresponding DDR bandwidth index */
> +	if (info->bcms && gmu->nr_gpu_bws > 1) {

if (gmu->nr_gpu_bws)

> +		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
> +
> +		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
> +			if (bw == gmu->gpu_bw_table[bw_index])
> +				break;
> +		}
> +
> +		/* Vote AB as a fraction of the max bandwidth */
> +		if (bw) {

This seems to only be introduced with certain a7xx too.. you should
ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported

> +			u64 tmp;
> +
> +			/* For now, vote for 25% of the bandwidth */
> +			tmp = bw * 25;
> +			do_div(tmp, 100);
> +
> +			/*
> +			 * The AB vote consists of a 16 bit wide quantized level
> +			 * against the maximum supported bandwidth.
> +			 * Quantization can be calculated as below:
> +			 * vote = (bandwidth * 2^16) / max bandwidth
> +			 */
> +			tmp *= MAX_AB_VOTE;
> +			do_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
> +
> +			bw_index |= AB_VOTE(clamp(tmp, 1, MAX_AB_VOTE));
> +			bw_index |= AB_VOTE_ENABLE;
> +		}
> +	}

BTW, did you dump the values we send to the GMU here and in the RPMh
builder part & validate against downstream?

Konrad
