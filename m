Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C454BA34BAD
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 18:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9718710EB56;
	Thu, 13 Feb 2025 17:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCfTb9B8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C2C10EB52
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 17:21:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D9gveN027806
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FbuXiVVzDaeS+xX9GP61rxfDPpXPI4a6eC/HT3/7Z38=; b=HCfTb9B8m92OhwOh
 Ei0ZTfJLaAOyjhyN6pPVNira3u0j926HVdpNTjKhl/yAD1kcwiWzoXjhLgTim1NT
 4AI095az/Iv+rYBN+ZReunWCBCdp0qau/cNWeh+NM41OmuiROarHp+dEhX5Lw2pp
 2iid9candxGUYXg+9Ylfv/8QgCqcRhaR8z8F88UBq8KNsy6Nh7z3YgX8KsbPEMUx
 KkIHx5AjbYHjT8zNJCxAQb3Y/xjcwJa/5Xb+avxKdfcM+/EVB4irAnH1lTtyTwQs
 N27ECfOaMW8JzprSX1+wCUzGdYwKimnbLbzbxqk3iI+4CzMXmAYu/MjMHGFwFEfG
 Fo5uZA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebn97p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 17:21:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e662a02f30so1106566d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 09:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739467308; x=1740072108;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FbuXiVVzDaeS+xX9GP61rxfDPpXPI4a6eC/HT3/7Z38=;
 b=HdOit3Z89dsvJSLMNcB9LJp1m8ExYIGvXu0kQW5KVFY9mp/TTfXMINXTz+ZxuvkLXf
 uNte453Q+fLPie94AkcBibDdk/hemFgF2UZZswenNC05MbGz56JbB01gskFe7mZfEH3Z
 WW20aMqPAVMq1OzwqmwrBCsg31IK0yG9M+oKGbWD+Kq4t23HQrfEwkDPK/5QWkLi6IZg
 KgV4IqsnJAiIgZzFUep4xyE7otkKFcsAcwHvLhhOg5+GHflD0kRJMNZJTvhd9x9xMckB
 NgKaUlzGCdWq517J2iU2F63iBdCAXdfkxOFNla5IKP75S+f1CynCV19JIIKK2WA1KhID
 5IgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy2qEDBFnZvhrdGe8YXkBahW5Ulq+r+hN5Kr5UzxV6F3qkcNlFTjS3amfm6E5ZuC9vgdb0iv8V5ds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw84sUocfel4DKQzDgySpsnAdxQhna2wF3n7D6AvWVL0F6oliTZ
 Egmgtz6hNMKYbI4l3MwA29q8L3kf5793+ETmUPbFS6Gj6QstXBNKw/3YeYK+fXW2eEoPh722jgi
 uZKS2YdP6kM6mD4KSkLwvXchmhtbPXai0sE7x6qJBOCG4Np3hquTKH83Yfa8akec/z/Y=
X-Gm-Gg: ASbGncsGbzrF3neXI7tHkfG59IOt3O2aauy1jJf0HmLwXZh/Hu4Dlv+ZIozrTvwQJyx
 HGF4GuBVn4Lvz5PAVsvqCRHxCwZNFIQij7q6Ow1dBhcO50E6x5W9oj7Sb22hveVuD3Qam/dlPUW
 6JRG1NwbqLXj4UQ5V01kCVvdMvwL9mZ9oDpc83NUueOP9zwtYJ9LUzX0ov9pgZLDRrg58xQxaPW
 9YnAkd/oerpGCyiqE9wjolhXuXuvsAaIdjdYck4i6v7DkLZyCL5+9G0JkQ6JIkXHQxEyhzOw5w7
 4TutxsjjoIW3colMqWvSRqUI2tNLAyRk6rqVsHTYqXtvPbk2BYYZonSnfAg=
X-Received: by 2002:a05:6214:48c:b0:6da:dbf0:9645 with SMTP id
 6a1803df08f44-6e46f886c88mr43339106d6.3.1739467308704; 
 Thu, 13 Feb 2025 09:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFY/XCimTxvjm84xoncA2p+VwjKdnzksODuhc+qDaYGL+fpJgnRW7IaJN9QBFnX0LV+tfedg==
X-Received: by 2002:a05:6214:48c:b0:6da:dbf0:9645 with SMTP id
 6a1803df08f44-6e46f886c88mr43338756d6.3.1739467308127; 
 Thu, 13 Feb 2025 09:21:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c4687sm1498611a12.22.2025.02.13.09.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 09:21:46 -0800 (PST)
Message-ID: <4a3eec8a-4f71-4ac7-a6e6-0e8490c020bc@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 18:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/a6xx: Add support for Adreno 623
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r6yJtozSouD-KWvs0VeO84D5E-_LZWGx
X-Proofpoint-ORIG-GUID: r6yJtozSouD-KWvs0VeO84D5E-_LZWGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130124
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

On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>  4 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index edffb7737a97..ac156c8b5af9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
>  			{ 0, 0 },
>  			{ 137, 1 },
>  		),
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x06020300),
> +		.family = ADRENO_6XX_GEN3,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
> +			[ADRENO_FW_GMU] = "a623_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
> +		.init = a6xx_gpu_init,
> +		.a6xx = &(const struct a6xx_info) {
> +			.hwcg = a620_hwcg,

On downstream a663 hwcg table is used, with the following differences:

< A620
> A663

< {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
> {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},

< {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000777},
> {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000}

Konrad
