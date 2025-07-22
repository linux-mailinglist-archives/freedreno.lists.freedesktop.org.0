Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E5B0DADD
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 15:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFB910E30C;
	Tue, 22 Jul 2025 13:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRZG5+pM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4843710E2A4
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:31:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9wmZv016283
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/WYV/IpwzlIixikGjcsvi3zZ
 74GtvTpP8nq9H/FHkKg=; b=ZRZG5+pMMQG/exv5HIGHcksPfdI/QuZuiTPG+cMR
 J3hUMfyzApODyi3KcmexgOhbubANojyyjkN/710U2+G8jNJMfa8AW3iZ1p/Sobnn
 ew1D1iNMwdnlCDFEBJXUewe9wg0xci7RkWO2S97OacM/4q2SGF6BA5ixcDhtH0ES
 y1nctE46QRqHDTMLeHyKjkZr1NT5RwGIE3vaY0yzevjwOh3AHCf7gSCx5zSn4EVM
 eazoA+n/AoM+Zw0iMKj5ATVq02Q32o/xvtz5Y3tOcKsW3abkqpvjQqKezNlX0G6F
 DRWSwRMYr8IJV3y9OTdJdZTRv7MRVrLt54VKKuG/JLApjQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s1mn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:31:52 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-4241f355a41so1126782b6e.0
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 06:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753191111; x=1753795911;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WYV/IpwzlIixikGjcsvi3zZ74GtvTpP8nq9H/FHkKg=;
 b=SGkCAwDSAtDdqBIUI2Mdpz7fyjEU5HyUMue1jvi79qNbBMCyXd/5QvwwXAJH4UarYi
 RgZYYazayT6jEU87WX+ZukKn5gSJKWCuK0FHJ21CfGgz8cpexvYu2xdWROxpV98DqDVn
 HRvi8uXiF854pvsidjHBQyQrRCh657rfUhnSDON2VYBr+TlZ1nw/5phRWPpAe9PTxIuW
 5PrsjILW1fw6nUdP1t/ie3OAEJs3c/968qDjllzFAg6/MGzw5PkrIINfl2nOHNQ2eJ7P
 qH+2NbQYFC+0t1YIeYnNQhYpfP9Pf+2Q7FAefPUJpjuVoao7EnZnVGZ5GCmMOt5ZUOqd
 +F5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxTImtelpbRmUFfV849fOaf2RJ9ouLEmRnorXyvEadtUhZZvgd4YvN1iKSipS0EOXiiBMKXnTdrQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk+F4cLaZmkSUGh13EvQf8pi5rEA/72Jqtdx5q6+eqw9p4ob2S
 ka8Nwuawg9nMdPgYURVLiwQMkYy5H9GVG9ePenozNHCdnFo/QovzMCOvaHYZiBSumQQTBXa1qGz
 1EgGJ63Fi0sLVlQNIKDgg9XD022aqN1pczaWa/lwIrmOg4v5e7aHVSzRWQ2dmCkBpuRYflYM=
X-Gm-Gg: ASbGncvDSHD0IN/lJY19hI8aRgR6scbUSEzRjEBBOiogNIBatZvTk1sOcOSdXCmSwrB
 jp1fV3MfC6dZKBSEEuVFLtjUve/EdmGLov92CvjG93uGTu4H6mxuO9uatB25WO1oT99EezKpVcP
 T2mnUShFf51HqFk7PZSxhiIDSLD+rZxRi5RhmAE9GAqO4CjwE6VHR1rthTsXBmYD82hgzBxu75x
 BW04XkT65f2zrazSmVTk2A4xgJHTRUDu52BzrdMy3TDFjJ16EpFbZsPzgBmlpFRIxwm9sSoTEAA
 80h4Kd4a3P4Cs/TcntM6iZm+xDgfo1W52eNNP2hyyHoHnvZUHYzxV5+phhc8OGwyhn3+mkTBiis
 CJhel0KmGUw1qCTeymfZjWMjzF7xfDzx+e0fdcU0MlMRmDEx5E90t
X-Received: by 2002:a05:6808:2f06:b0:40b:6531:a43d with SMTP id
 5614622812f47-424a564a74emr2971619b6e.2.1753191111469; 
 Tue, 22 Jul 2025 06:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXXNKpQVAK8wSW1rOSvcuIJ90cBPFt5dTO9JhQF8U4J1q+bkg1PNkAQobLqYbFNvBZLVqrjQ==
X-Received: by 2002:a05:6808:2f06:b0:40b:6531:a43d with SMTP id
 5614622812f47-424a564a74emr2971571b6e.2.1753191111029; 
 Tue, 22 Jul 2025 06:31:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31da2b3dsm1952626e87.183.2025.07.22.06.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:31:50 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
Message-ID: <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMCBTYWx0ZWRfX79ppIjL+oMlu
 4RiNkCtLI/G1o4JBaS8T/ta1oI4C3TQPPXepni+A8HVbtJGic1iPdHB9lGjEiB80cqxu8e0ugwt
 18EigyeSK3gTK0LRuG0JBpSQg6I6r2U9ajrbhVcZUF68WnAGAsanXx8+fybpU9lALbFBYwXEwJi
 V9kvfdCFuAtwpP/SoS++iL76ruHnKeq3q56pant08wcmmMFdkCwJJBInfht1+QVo+iZ/nmvlmMZ
 HBe4CSO99SMVOAM+IWcyHLMwygE2RwYwKdbfbCyF9C/8AaUcL+n7FJ5xQiu414tOuMRwNicv75K
 MsTdJ7Nmf0pe/RrnKdgEhQP5gxktgPrj9I+odq2Cx3IfsFfin75L6xVgf9k2ybw8jQZfXrWWcMC
 UJAG9sp7qwgDNC6Or03NONDkJWKAjZJmOSyfNACqPj6rlL+Qu1qlEwc9GtyuRnB9fy8y36SA
X-Proofpoint-ORIG-GUID: _HTgTjQ1_t_TTZpEHm8SWvTXzIEDorlW
X-Proofpoint-GUID: _HTgTjQ1_t_TTZpEHm8SWvTXzIEDorlW
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f92c8 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=c4-AqNUvOhhRGI8Ju6QA:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=991 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220110
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

On Sun, Jul 20, 2025 at 05:46:05PM +0530, Akhil P Oommen wrote:
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 

Fixes?

> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		val, (val & 1), 100, 10000);
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
> +
> +	if (!adreno_is_a740_family(adreno_gpu))
> +		return;
> +
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
>  }
>  
>  /* Force the GMU off in case it isn't responsive */
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
