Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF079DF07D
	for <lists+freedreno@lfdr.de>; Sat, 30 Nov 2024 14:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7309010E124;
	Sat, 30 Nov 2024 13:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCV5A7up";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BB510E124
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 13:31:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AUCGOim027655
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 13:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gxJ2wIRNvSM3N6UVUGLPO/sM5c1M6IW8tewhLB69p6s=; b=NCV5A7uphBpvtj1k
 VcAf3jplIuealtib1G1mS7TTTegB+u0yNAj/mHtjvIULIHp0jqtle1iDRav4yAk2
 PaERcYmylCxE9fX7O5nq8kVJ8dt6Rphbnw9yulOOtJmHpTAGVjgUtE1oVfvDh7A7
 udAkT9S6PT47fZ+Z/aY8qe/6juJDUrmyx3D8bzgCpV4MyloYvavAs5ihWPPl9sUR
 4edn9Tz5B4HCox/p0j1Q26dFhPu9afVFG1ZLgoq2NhJD4AWvZNP7/BXka6oHs3LS
 tFviutw9bZZZRJb5HqcUuCZ3+nRkkuBgJsqpvecsJH27iER0tK/75itpn+QFGDmn
 JIlSgg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1g8ue6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 13:31:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-466d3ec228bso2209271cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 05:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732973469; x=1733578269;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxJ2wIRNvSM3N6UVUGLPO/sM5c1M6IW8tewhLB69p6s=;
 b=kf3DoEySSKAbbisRDIxQcWK8EfvYX7jLAYWFhOh6DNsQ61TPPYi6ckInOZPOa4pNnr
 5Cp9cKeXBZHJQeza/XWsbYtyayz2QsANEhyitoxb45pjyWNTbi1kICTjE+CCBNNFPKQE
 mRlaF/MjCFG79AfQmfFgjLouW8t9m0OUXVQZs5mc7dyRqCl1zjGmnmMTV0am/8SJtnxJ
 dwjt8SAHhfTcKJlH5PbUsRz8/lRHzyxXOZhbQhXswYnNWc8MVAi2hCDa9ND33VaMAe+d
 PUMxnexR7lpTgx7wJwEQmhBMqMtutfOmWGjtlAKMyAPppXqUbNwJpezHTFXaLo0qcNIb
 +cvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCqfCsT/G2mIa0ZdSDcq6OjZ9p4/1SKqnIBZcyHoM3KeQOW/ImfymcjVNAeIk1SoHYfCbQcRzNhtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKHcA7JVgGnm8DGv38QhXVNu1W3I2vQT045r8pjlrmz6Yg16Wa
 sWtd5QXkV2hArdFqlBtiG1K/wADzq3qDW9wCFZzZ1yzpmlpNeXfHq7CgzlYZy+/t/fgLiLF8FCT
 HnYSFAA9hDRIKkXnwsVp+ysUszgV1a1xSjkaWUdpA1j+NgCCYx4Va+6o6bLrfkwHQ60o=
X-Gm-Gg: ASbGncuuagpwuJ8Xw8WGHuEb0v9s2AKPdrKT7X6D06f7k50b4R6TvCLMM3JQDqQ/yG4
 auPu5w7BowkaUgMM8tcyGIvEwQoIJ3Zgky+hBW0yEx7Dnfn7SKWCSUiS34Ck4cw+ZtahqFMTXBV
 InZGsLse3ikFH1GwLe9LwDOI+40XgEnrxAOeDGsDdPHvu14RjEiJ3kat56rNGNlhx7ZcrPqDA6S
 eyIqN7adpg1tX81q5ywKqUS6bCFOjwxIxqWg7W2WIwL1J0T0s9bRBVhDvhLO/MLZ0l+MfZjNPU9
 LNzipuEWQGFx/WgJ6ri/0wVT5Xrnylo=
X-Received: by 2002:ac8:7c52:0:b0:458:2619:457e with SMTP id
 d75a77b69052e-466b3611145mr92207571cf.10.1732973469520; 
 Sat, 30 Nov 2024 05:31:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA3A1BRN4RMAIbP6npbCwI+ZoMyXm/5LUNoiC87xG0beQy19ime/EPwkDRNZ07vfeLL4l0Sg==
X-Received: by 2002:ac8:7c52:0:b0:458:2619:457e with SMTP id
 d75a77b69052e-466b3611145mr92207321cf.10.1732973469125; 
 Sat, 30 Nov 2024 05:31:09 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8da8fsm2828475a12.58.2024.11.30.05.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Nov 2024 05:31:07 -0800 (PST)
Message-ID: <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 14:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CZtyK5HL4JlTN5LV5mYMRhjvZSTOIEKc
X-Proofpoint-ORIG-GUID: CZtyK5HL4JlTN5LV5mYMRhjvZSTOIEKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300111
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

On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
> There are a few chipsets which don't have system cache a.k.a LLC.
> Currently, the assumption in the driver is that the system cache
> availability correlates with the presence of GMU or RPMH, which
> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> with a full blown GMU, but doesnot have a system cache. So,
> introduce an Adreno Quirk flag to check support for system cache
> instead of using gmu_wrapper flag.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a..5e389f6b8b8a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = (SZ_128K + SZ_4K),
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_NO_SYSCACHE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a610_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a702_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {

+a619_holi

> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 019610341df1..a8b928d0f320 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  
>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>  {
> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> -		return;
> -
>  	llcc_slice_putd(a6xx_gpu->llc_slice);
>  	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
>  }
> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  {
>  	struct device_node *phandle;
>  
> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> +	if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
>  		return;

I think A612 is the "quirky" one here.. it has some sort of a GMU,
but we're choosing not to implement it. maybe a check for

if (adreno_has_gmu_wrapper && !adreno_is_a612)

would be clearer here, with a comment that RGMU support is not
implemented



But going further, I'm a bit concerned about dt-bindings.. If we
implement RGMU on the driver side in the future, that will require
DT changes which will make the currently proposed description invalid.

I think a better angle would be to add a adreno_has_rgmu() func with
a qcom,adreno-rgmu compatible and plumb it correctly from the get-go.

This way, we can avoid this syscache quirk as well.

Konrad
