Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420B7B49316
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 17:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909010E53E;
	Mon,  8 Sep 2025 15:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPbNWXMh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB2110E554
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 15:24:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889U6CY030177
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 15:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s9XBnFXGBmeYr88ojm2wcO7hWjCnRSWfP1E0HSc5a+g=; b=mPbNWXMhJIB1bhi+
 SKij4Hcmz4JORbUy7bwGxi3KJY/+t4JGgD6HzXlAAEHPTTssApfucuAqDPJwi2II
 N1rDHu8CzFGOQqHKI6eF4dbDNiQT25jWJEIEwKqWU0TirDKbYSWANZs/2T2BCvI0
 Kg9uRJgYeyk7i13NetjTPIAatSDzc22wyNHmZImgB7Df/YvYbohcidA44G5As0KV
 m91nklRxVxSdeWzUPK0cZYAa+kOMqufPNUqhctvDtrhYnLYc4ZHCro/s7IiSFZ5y
 Vs500sioapGS9OTfo5KdQbqtaa5tBH3KZRx8mnqmKHuipfw9ZdpkZ4Pv8UrerKC8
 IHPvFg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfvw9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 15:24:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-720802c209dso6077546d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757345081; x=1757949881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9XBnFXGBmeYr88ojm2wcO7hWjCnRSWfP1E0HSc5a+g=;
 b=kLE8Dd6u2wrF2EToms7/+wQ0c5wjN2CWAWxpXmPlpRE7bI63iwRk6OWqCUyJL7ek65
 Yy6OumZUkFfDuhk2d0+k4UIpv8cDubKNykA98MFhUEdkRx7DtOY/vs1OHke+qf+6L2u9
 tH69uwwaxO5+ePd4SzQqsu8iLLg5R9WwqlllxvtBdG3TfCMSDXdSmbXYzD6d+JNvmSIq
 7vC8At9VXCmJJKpMrXlRzedEGs5Td8A80OT18I1egmdKDmrcHX2jz3a1da9meyF1ZV8c
 5h+PhwhHnmmHGJt0aOL3s1j1v/hu5AtPmd8DJm3NFYOiUIq5SYNbOEJ1L4r+kqIH3FIr
 QI4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFV4CcFOMKsUi86gZdi+OYo3zGvb1OJl4Xd4dLuLHpVMCt7+o+2q5zFHAl2PKp9aAMgbqh+H/Cwu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU1d24Gl8JOMvExDzsyUh5TeRV4xiDBYIlzn7mFhyiV24ALY0x
 PhwHDfEjkZI/OHAgq5QkZ4+Bw0rbm4XoH9IfPzFzhv1/fVWaiIjjkrdPg4WVBHb2xjc+/17vJAS
 vhuc4L/+srxjbr2NhsGNY0Vy0V1i70tfrCcgTJSW1c+uzxiHdke4nLf/TEzjciHcIbeKMp0s=
X-Gm-Gg: ASbGnctl+Mvf/1GZtrkBQ3gQFg4eg3VC6c/Ykp2lyubPjYp5FjaZsOjehEoqiaA9G6T
 4pUAuWHvBu93qMa2felSeFt83u26ziVQGB8soscR290VzPrnnULoDImK466pAlp0XFfyF6zNwLh
 rYISkAK/zdzuAuYzwa9MqMB2jttnd79ZJr+r4MpR3fROg8kk42qSe3CNXj6CsR059P6ZuCSK6m9
 MZXQ8mdDI9XaeSznuMdNxFAqxAKjs7NFvTYgKfY28CBM/3sm9J6OqRVY5Q4dwxBcn6iplFUS756
 ZcwmjfZBE7PoKDxkck72FNY7zhDiU+iNzWTnm+Z2qzZBGeiqW8oA43IsKkpTg1LJ63xWjgFH5XJ
 sYPBfY+yMcaKhka/8l8Us/Q==
X-Received: by 2002:ad4:5c62:0:b0:72a:df4a:e3 with SMTP id
 6a1803df08f44-73946f70409mr55645206d6.8.1757345080643; 
 Mon, 08 Sep 2025 08:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/dM+YUVzCoKCgc+8cdXvnS5qCmMcy7DhBINwLAE11WFETAeMMaRl0ZDxjjD0D4fmvZpBH8A==
X-Received: by 2002:ad4:5c62:0:b0:72a:df4a:e3 with SMTP id
 6a1803df08f44-73946f70409mr55644876d6.8.1757345080079; 
 Mon, 08 Sep 2025 08:24:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62778a094a0sm3537550a12.31.2025.09.08.08.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:24:39 -0700 (PDT)
Message-ID: <8cf65d78-2790-4467-a9b3-372af53c1374@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zOZamBefRleHAg5kZYb3i0W1mitoqcBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXy19/ZKAl3n9b
 VNEsmGYisW+WglnS5YcS3ScmoXZ/neFSVf3UwHjqnVybq82vyhGVtf/OaI8X3t7GgpN2vhKHY0X
 JOXTQ1Btj2Ph6cHpcj2qLnv++yTvS4tWkwMymyr24IAitAwdINpKBzsBqvb/UadxOFsPxuO75ot
 OsK9I39BpfQ0zJRTSEteSdpgUdcS4iB2Cha3jLQgpHLvnTdgvE5BZfnS4s+uj6dpCmndC992d/8
 b1KsMCwra2B+FLJiJHodklQ17guAzlKCLJuX7pCFiL+5MUL1ysefTxem82WYvYxJrvcRDnzXZbD
 WYQIZKipgBqfsuJuCkp6ix1GJkU1ht/G1bthB7zF0AjkYIdoAhiyrz8gUaWDlUk5BYRucbISs17
 jZqwqzfb
X-Proofpoint-GUID: zOZamBefRleHAg5kZYb3i0W1mitoqcBD
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bef53a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=l1a4ANfPRBzC3aqxuR8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

On 9/8/25 10:27 AM, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>  			  ADRENO_QUIRK_HAS_HW_APRIV |
> -			  ADRENO_QUIRK_PREEMPTION,
> +			  ADRENO_QUIRK_PREEMPTION |
> +			  ADRENO_QUIRK_IFPC,
>  		.init = a6xx_gpu_init,
>  		.a6xx = &(const struct a6xx_info) {
>  			.hwcg = a740_hwcg,
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
>  		},
> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,

The latter one should be part of the last patch

Konrad
