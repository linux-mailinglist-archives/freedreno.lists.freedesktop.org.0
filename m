Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6750CABAF33
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E1B10E1E5;
	Sun, 18 May 2025 09:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWcQIgYq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBF610E1E5
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:59:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8Pf04016396
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K50CCOhb1oRvXdqTRxazbRT6
 Bc6ZaplqyOTawwp2iHI=; b=OWcQIgYqPHCqvOadeF2z3+wWe5ESOqrErI+jWY/x
 q5UcGZRPDiqUJTyK91vxfVqdoH9Duct/rlliGEGDrjkpiiVSahIHMCs8gCJU9Q3o
 ED87fm3cPVfb2sZLy52qX1D5b0aDz8yuor8Lk+dxJo/AB0ZF9AytO7aWktzd9P3V
 AqjfoFChpBHm3u4xdVWdsI8rKNBDnKjWPPACSNOGsrKR0/Tsre1LpxDAkwuE5gue
 Mcom6RTlP24CEwOyODkwxRYorhOfgm3RRGy53+6LyAdzyWq1cIkluphu4Nu0Hgro
 ra/7awc1wUEKsYGGVTrkFxdQChynVik1h/N94EhLI8ulLg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcsu2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:59:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f2b0a75decso96870006d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747562388; x=1748167188;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K50CCOhb1oRvXdqTRxazbRT6Bc6ZaplqyOTawwp2iHI=;
 b=Xu8yOg3zV2wY+9iCnjdp3QhqqlwiL3ZdMiXMWiJIk2hAaL8BGHU4IEvMAjk3692ZjF
 GDxD/BvlG2QAyH4GoFowPxbSSnN3WlYqFedV81w8/RGG48KQDsI0GUKVHIgCDKE5r0Xe
 1kpP9RE1yC6Utih+GIwJA/wlhnttA/tUmGDR8awt/Pn3M2t40hSyz2+sccPr/ZUY+nmi
 LlIaWOpE0CCWXoJpebFjTeQwZGJeghrYJken/RXHPy1TxeXJ35gu771AwXSH5s3Qg4dP
 w7dJ/YuMPvfIuRQXQVsOgB/aidb/NMe2Jrtx3tdRVF681nETWj+7ogmFN0VlQAQCGcVw
 D9bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVazZNsmoLEMtKPDzB4O8+qtOrvMmXluepGgftEdywgQhaTnzySvP+QEQES4fJvdJQ/WIbA6H1g59M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEtTCVP/AEDPfviz6Ko0810uhsQZqdhRnBIP84u4IupkcTgAzi
 FM/qRxqrkLIMGGvYxtMpKHC/GRqTzIl7Y5p/DxdcG6hdEOCoLb9J9QspnHs+UD6Zuir184Q0kwX
 JpogPOtmoKELBCBOjg1+gCiRZicCAcCEYP5GHsCcn/BR7ORI/n++KHQ6JEXYaK0agIBL2Hpw=
X-Gm-Gg: ASbGncvX8NKOzS1Qg8m2ywLznyf57SXweGnkAOYavOKXTHcyPI1MBVq4dL6tgBQFKyI
 kvURcw8DZ5dN94fJCa7Vehrxw5UMOooi3LkxflYSEXiyhvkVak0dCiZwwnB+I2PJCrN/rr8ecFx
 iIQKK9ctY2k/Hzvl3+DkOW4t5mXQ6I3pdJ0UefjMgM61/aEpThZFchVitcIBRPn7v07ArjU0XXY
 VToI64toUNWrjdOQpoRiwJv2fhgzBftig/OluVO8P8MXi6Z6aXW5xULe5FeoYEeR8RLYlwUeSq8
 K4DtwSGqON9/8+cLMQVR9nosXsa/YIe6kPv8w+gUYawEB1DuxDa2Q7+bA4lzllsnqVj5Y90TgV8
 =
X-Received: by 2002:a05:6214:248a:b0:6f2:c81f:9ef0 with SMTP id
 6a1803df08f44-6f8b2d15058mr139256226d6.28.1747562387938; 
 Sun, 18 May 2025 02:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvht8meUEeI5mfZ3Bwjo3DPt0lB/3QmCreZafC8XgUYj5EDksJoZDDg/reTUlqAbsb+namaQ==
X-Received: by 2002:a05:6214:248a:b0:6f2:c81f:9ef0 with SMTP id
 6a1803df08f44-6f8b2d15058mr139256106d6.28.1747562387580; 
 Sun, 18 May 2025 02:59:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085f5d17sm13804061fa.113.2025.05.18.02.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:59:46 -0700 (PDT)
Date: Sun, 18 May 2025 12:59:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 13/14] soc: qcom: ubwc: Fill in UBWC swizzle cfg
 for platforms that lack one
Message-ID: <k57pmwohvnubbsxjxc7y74nkuayiktcrolbqlm5vorayrifemw@uuou33ffwdlb>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: lKsk7Cs0oHb57qK5q1a10d9No1VIuS1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NCBTYWx0ZWRfXwLwdZLYRwnJn
 eXpjnEJWgSrviN8WPcQV8TAfJgMxuaVsEPB7CD/gIgxXMellWPTUeWCVVzl/w7m6Vfn/yyEy1gB
 jjH3JlHt2dQP6aKERxOBgxHMCtm1/EqbLxwOWuvpT2wKtB7XH4GK0SrWvcjTg0LjmBbQq3bNKc1
 RqzxBYzUOw/v/2Gqb+D5yrBTeSPXcaKKrqnz70RtFGHGGKWMzX/nCUPYQ6maUJYDRO3IQlCo4ZW
 f1iE5Z4a3C8ZcrMDNHs0X/hE8eCcfzoAb4zrzjRn8FF2CrQPbgO9L7LA4vjnorUIEsTGDH3v15j
 Q6wG7N8iOnuudUaj8yf4ylqNZqFUDqFcWuZnz7If6UJkTC1YU/UR1foUN+TxBs+mp7CnFwateNI
 yfcxZcar1Ym8G0e94gXTisUP9a4t9Mwioa3rCvUCpEXrfdMv0ghfdTWddj5/JsKIKPPmogRH
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829af94 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IaUOA4i9ptLxJl9v6jsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: lKsk7Cs0oHb57qK5q1a10d9No1VIuS1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180094
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

On Sat, May 17, 2025 at 07:32:47PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The UBWC 1.0 case is easy - it must be all 3 enabled.
> UBWC2.0 and 3.x require that level1 is removed, follow suit.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Ideally we should test this on relevant platforms, the commit LGTM

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index fe874ccd8df6acb4fac65f7d261afb05861117c2..a4b730dac6c4aaa609d41b2782c9dc522387d8dd 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -15,12 +15,18 @@
>  static const struct qcom_ubwc_cfg_data msm8937_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
> +			UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data msm8998_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
> +			UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> @@ -70,6 +76,8 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
>  static const struct qcom_ubwc_cfg_data sc8180x_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 16,
>  	.macrotile_mode = true,
>  };
> @@ -87,12 +95,16 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
>  static const struct qcom_ubwc_cfg_data sdm670_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data sdm845_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> @@ -118,6 +130,8 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
>  static const struct qcom_ubwc_cfg_data sm6150_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
> @@ -133,12 +147,16 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
>  static const struct qcom_ubwc_cfg_data sm7150_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data sm8150_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
