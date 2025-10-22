Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE50BFCB24
	for <lists+freedreno@lfdr.de>; Wed, 22 Oct 2025 16:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E6C10E7DA;
	Wed, 22 Oct 2025 14:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7m6lo4b";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06D410E7D9
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 14:54:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBam8H027488
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 14:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i1D55EkVM9ROmsSy8YnVa/jnMbgKIG284477dKPaODQ=; b=H7m6lo4bJ9+Nvn6z
 ct5jbWjwmzbAOzaCstoLQBztO6WF6xC5WIt6ihDUfRccP6V/DKONApuU/GEsLr+I
 L77XyOkHno3F5887p+xcGVd5uBBjjW8CPCpQajeMbNlH7WhiG+KVPrMOQC6JJpaG
 0eUEl4QQ7rJKK1esggRU99FZHlXSqjl9Imok3MxVzqle3HdMF6LNaflLPAl9kwdU
 98n0CIA/4TvadIKNkA8uq7obz/SCmk1iZmLfcBhoEXIgNbtFnkg5sJ4CNepyfK+P
 ei05QVnTU6Ko8YsXUU/+NFE+5o6NIre4GfZ6y4q1ftPp+RMF8OaePEWaj+ogxRhK
 yOmeIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j4xuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 14:54:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8aab76050so4470921cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 07:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761144840; x=1761749640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i1D55EkVM9ROmsSy8YnVa/jnMbgKIG284477dKPaODQ=;
 b=jByqzsx+1QCNzBeWOM8DeU9dUFlm2sHBbiCqxfuN/xsY2hBglxF1TOUug5W5x2AV+E
 9McLEWpl44mGAiyrYOocPSWWL+jF9A3N2JdrrKKCx+OYEPKxLIHqIK2gfvDg7OycABkP
 coQ0A7oUgBQ0DrsBb+S7t7EY+DZvVx5dahJWH/09xUT+5q3jzIalFgY+QDupp3fx9vJX
 U8nsevFEiBs1UoPVfWC4qBDug+vWDE7nKsiOzOfaXAAeSZm90hBhayJveubBZUl3SU20
 0qTAn6rcO6lqqN7OpUF8GbolDSxgMxKXNABfuTpFG3p9Rfy2xry2O2EADhWTChNVMrhR
 G0vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1FfyYqft+HAVkkzhi9eMsualclgba9uM/UmMEK8zqchHMAFunJ4OGdOSQNq8ztWfjPzsIaoOuAdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo9bpz4e1XHS3ZZtsjZy3FuzFc1hPCfeLTRlTw1QO4/MMQpxAn
 bjpPpEe0T0GpCcCd9nDO03l8FzPAQ8+XX5pepecH88uAvZlx06xuxlvRGp96IJaLmAWYwX/VG43
 1dpi5hFfZgM5JGLuWRF0Kpg5CmnX10aV9LuJMtOUM8iWHclzE958UHGM3qett2QzAedEZ5PE=
X-Gm-Gg: ASbGncuAW20eiDteO2DqQID7qN3qs/dyYjv363YwAX8cpXlYyEUJ3uJyKheCNWGnLqW
 utuDXmTKIfvMsIqpAzM/7HTWaFHST+wq2zyQeBRLRuDDrkeOXCyhvD3mlR5uFtBRxBred+XQtDa
 m7zXBog5dEcrPsm5F8e+ehNHNFdPg8zh6P04hpCQHppogNB3jH3BJziRwJ0SVpbYWEL0f1yq90+
 XYdCrUFzB6YJsoC5b5v9Ec0CvOXFEyxYcLDezAXIclnqoTzrLcqemZE+ZlXkUkBO0B2D6OM+p1J
 ZbGWKrj7MSJbjTMiLaSaavQeFGMLWLrJN7bf29c1XVCG2P/C4tTIltJOvTbPPlGz0mteNz7Ahqc
 TOmtDYpPswNEiiINO4BK7SztgI1YYePAe3hpzbGeEU7myNxYHao6eUp/A
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4ea116a2337mr58384711cf.1.1761144839857; 
 Wed, 22 Oct 2025 07:53:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYvZrPUqnLoE15E4DKPCHcqL6kLKjuVsKLcLPIxjePxERoJWVvHeMNwix7xgXgKYhV7otIeg==
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4ea116a2337mr58384401cf.1.1761144839366; 
 Wed, 22 Oct 2025 07:53:59 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d3fb6a63csm25808766b.29.2025.10.22.07.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:53:57 -0700 (PDT)
Message-ID: <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX3m+0cyiLGpYv
 1kJu7N4NUMt3Ema8tIul3TAKmYIo8X8nYYndFfI9X2RbbXymDw4s+51WvD5sT8p1/dW/1Rp9a/s
 8XaW+MUdcmpfgE34R1vpz7DCTWw6k7V+2cOFieeATONKf5c5SoAJ8nsp3itN9dRY3nuzpmWJE9K
 uFGPFs9G6TF6v5Q3U4gh7TrsdBiHEpRNKQrfzSxz5BCaYK/z9FKEGcE5KEeLKqQjInVF9poYMaJ
 QHqt3B1s116TfUnyHhZPZbhc3pOAzqpUOq3OhurP9YCTxUm4Ryo4n+mN+lffTQFhPJDJF8Pueaj
 iyDfKmA+ChYGsDqfT0HamvQbM8Ef6LRWRvdmPtjjkU81GPS1DDyHbvQdfpIRhjGStfnMb0wm4cp
 q1H6Q7Lg2vNeFUuW5bsT192myhk6Iw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8f008 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qc9Wp3Nav7UuNmgFpJYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: K8YgBM3oM-HB9E5C04OT5CsUEbcLoZRa
X-Proofpoint-ORIG-GUID: K8YgBM3oM-HB9E5C04OT5CsUEbcLoZRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On 10/21/25 5:18 AM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
> clock assignments for proper DP integration.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dp0_out: endpoint {

Ideally there should be a \n between the last property and
the following subnode

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
