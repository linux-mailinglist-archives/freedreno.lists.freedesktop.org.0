Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F69DB0DFAB
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 16:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5392310E2E2;
	Tue, 22 Jul 2025 14:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcfPf5cg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56F010E2E2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:55:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M83bGx010113
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C0hlxJyA1IJ9h6I+V+ie87W0rqn0HSylQG7JgAg/IlM=; b=QcfPf5cgQ5enNMgB
 P5Jir3+SM7xsRHoRsYLCP7SeEg5OUvk46GS/jNhYJaMwxPIbzcmzPYlmdkyUm2FM
 Mq14j5LID/7xsk7g5zwP2V6WkEy4P8EWYDhJMRRL5OZrV1TUrhwbOdR7ZYPOvG6t
 5fw3TVNOGOpQXCgBl9glQoQNcvlQii3bWU7l40PkDXN6HVaQztBM4dtimAryAWwo
 ObNfrd944+6O64maA1Ss8cjyPjXoIXRyfVzEA4cyWVln6L6xElKxBQ7/pOcskAnp
 dZWUa5gBjqDn4sHGavri3Mz5+t6bJb6Pebraf+x1n7P89eOdwIfZ0l0cLGlCZdq2
 IFoluQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t197du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:55:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fac4b5f949so5676956d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753196154; x=1753800954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0hlxJyA1IJ9h6I+V+ie87W0rqn0HSylQG7JgAg/IlM=;
 b=RKImbtGvnRAe3ZTNAJa/+IbDvHeFjeDCwv4QjoDdOogocAlPJoAPqFyIjN4IB24tpJ
 tdi3G2hp3Of0jrkDo1cA530BQELFYP8OgmNEhYkAOKDB7+wwXZR2U7gA3OvMxcaVjQXA
 6xCn17mU+IaQ43q0qkmm3aEkGx7RFyOzpztrZQur7w6eZjrxiqze9Mv6GP8hCyeLcrMR
 W9s8MmQZQcI+/FVAIBD/gSWVHpa8V1Ag7KcMZG7Yh04fqWsG8tGjxLeOtlsqgil6wdJX
 DcJEtoHnYVUXzdXqAxkXoYjX9XsUCBFEHm5WnZe+oisZQCaUDQOfrnRW69Gc2IMpZzHC
 wpqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDEMSjbDk1MSzRrOUqbn74HT7qP3ER8hMeW8Knws1a6EYXdMT2OMfJ2Q597Bge27ceoDJZ8BPyVlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJNA4HpVmmf8RDpnyxA7+kK/cWKYutPnWAu/SxFqSZD7zZ/SAR
 pvYa6K8NvUhFkKHIem7MbCv7wrf/Gn1wFtonHLDGR//4W3IYzLe/XoaBwtkz9DQVyK8KCxO/Oto
 lodo6nqEU6IcOgG2Aw322wQ7rVBC0yVD0k/LpqENbqz2ZMbAVhXj2aZgyB+vgs5ClfdFY67s=
X-Gm-Gg: ASbGncs0Ht01+TY60kg/Pypq2BzwBPMEYiCUWjys/9YA75kr2jUhcS2X1iiL1QqUbDC
 qkDLdfhHVpRLKkWFi7gcPPAxoEJTzDQgLLYxsypgXOveFP62G4CW06ejbd4kC43MTvJXXcHCehG
 Z/e7O2SdVtbbORzJZMyXcyqtam/Y1dp1GfZoRy31vp14h81KfifAAOQsI/nPbiHdBKyseYbW6MM
 T2WvTjKF+pKS3u25YXJdJiE/j5h6UGi4FxQSKcgVf6PPbPacuhhUBDUAyoSbLhdhu8HgXxua/4r
 3nc+rzcZjnHLiIJqH6G8NPjJFtwMbfehnrjn1Mumt3aoiRqs5kcqvZsqvW8Ul4sgpsvcwAlehkG
 NnOYYWM8anh4nJETgsZrf
X-Received: by 2002:a05:620a:4586:b0:7e1:79eb:18a3 with SMTP id
 af79cd13be357-7e342b3fcbemr1355051585a.10.1753196153052; 
 Tue, 22 Jul 2025 07:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnVBwZCXiywWrdb3FDM9RN4tirxT5EabZ2Ai1SNmjP7E/TXKdb3AzhUWjSu0iEK7NCe3JGkg==
X-Received: by 2002:a05:620a:4586:b0:7e1:79eb:18a3 with SMTP id
 af79cd13be357-7e342b3fcbemr1355047085a.10.1753196151593; 
 Tue, 22 Jul 2025 07:55:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af22f6fa6afsm73454166b.120.2025.07.22.07.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:55:51 -0700 (PDT)
Message-ID: <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I1o0NhIRXE8xksgkFbapFsx_hJfSvoDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfX3R1EpIKGATYQ
 PzNa4uPsJaes9h5IFf53qMHEfPAhUDOVLDlEB2X8pTzCGo020u4bIQV9pNVnpnranDz7WGJl3Bh
 VprO/w9mdhZx3Y/tKMW8PMOtU/MCiaNgo4aSP4HAKfafn2s5YfLtdqFJW1/h3Ao/YzMnpaTfLVW
 aqxDJ+8eyBI5eUOImzarbjynGx4hpZCtOJP30IxTQk6nbndZZm+OMu4GZ1L5xt4Q/W3/Bzt9JjE
 wS9vtF7S24o3rUYWf66vLRfLOrl2IPotuwc/WjQuNytpoUW1mr+I+grOTtuXc7boUKb578GJOKp
 RNq1MG02eRAFsFYVZauI2h2CN1XVQQeg82tDfP0C9udvANwyvsO9wfxT+QeroE1Xo6Xn6tWW06X
 zTpIuLRhBfCptMh/r7SMedyPENXvC3Xu8fF0kafq/pePi+54JrFzEtcUQi5+3EMZu0oJmUuf
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687fa67a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eUh3tnNZifY16eYFU8cA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: I1o0NhIRXE8xksgkFbapFsx_hJfSvoDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=671 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220123
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>  
> +/* Applicable for X185, A750 */
> +static const u32 a750_ifpc_reglist_regs[] = {
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +	REG_A6XX_TPL1_NC_MODE_CNTL,
> +	REG_A6XX_SP_NC_MODE_CNTL,
> +	REG_A6XX_CP_DBG_ECO_CNTL,
> +	REG_A6XX_CP_PROTECT_CNTL,
> +	REG_A6XX_CP_PROTECT(0),
> +	REG_A6XX_CP_PROTECT(1),

Is it fair to assume that we'd like to saverestore all CP_PROT
registers on all SKUs, always? We can save some space in .rodata
this way..

Konrad
