Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7422FC2B890
	for <lists+freedreno@lfdr.de>; Mon, 03 Nov 2025 12:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549B710E3C1;
	Mon,  3 Nov 2025 11:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPUQZ8sW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONmXQHxO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBCA10E3C1
 for <freedreno@lists.freedesktop.org>; Mon,  3 Nov 2025 11:54:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A368ZR72269746
 for <freedreno@lists.freedesktop.org>; Mon, 3 Nov 2025 11:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=; b=LPUQZ8sWqOiyTluv
 YCLmfyLYcLyPYJ/m8b9jvJF9GvfzefAZYZNx2oN5QxqjNMopkNS4nCsGOFix6KWT
 cG63U01NJ0MEwNLMEi+u/rzf4EYrKTKj8JSXxIskmfkJtw3rdMcH/HTFR/FbvyEw
 GxIqK9se5Y1IM/bBO/OZqsYpsvjkf48kRPlyD4T5AzzHV4rHG1MoIU9evzXqUi84
 8SxCZuyUOXex35AAkuBJFgOdmWDMgXyP1pYZ276BPfakRdGBrVDh56JHEJe/UG2N
 kvrm0+aNLW6R2VdYx6hL2M4W0xC3lFNImNt+gMa1DwbmQob5jTjdjjgE1wvz2ycb
 9FwiXw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pv790v6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 03 Nov 2025 11:54:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8801e2653dfso9388356d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Nov 2025 03:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762170895; x=1762775695;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=;
 b=ONmXQHxO84RpD9gBgL1fRpKp7ZOslkURXK9Inbwfr3CPklJlGB6a9hvsi7PqCmA2zK
 JSAr13KxfvztRzzv61l1gmN9sOsFQY9tIPWd6+rspRj/ZzvePUqTjDuSTuzFCVp+8aQJ
 9Fw0Y+JP2DoLIuUwnbj3zqfUshlnbjGfmBnKKwk55YvRTVbcewwz1jxdkeZ+kd5dVM/3
 MYvjPjQHlDr2ejG7BgPc8QKqzkfPcUpaT3u2KzLk95ixq/rrSgQ1m/kiZzIpmzaBmW5A
 wGVqH2Q3Qa5/QyQ5KmxwRjIFk/0yRMC3z3rn93w1UCh8U+J9zNHCMbwkosab6IvA86FP
 dn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762170895; x=1762775695;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=;
 b=J87LlX+yXPtkeo6EHl5SikSxTT/rCf7Ef/aDOLTI9XhtXYK9Ak1gKY9tRNJCaPd8X2
 b181dbWcjpXbYJ69cxwdXnnW2kFMFjpmuDxi5//fB1WZggb33FlebIuHYxfKYwadwJ56
 /SlRq9u9hQWlx+f79PJUYoZCzeS+WPtd+KQ2lxxHx85UaraGkQOKzaaNYar4XDF1Lhbq
 rgJvtvc4NKOBQSCj5BJI2gZhdnx7DC/NT3FFKRMwVJtPdRjkTMsQi8iKWiRVK63F95qv
 v59N1kk67HeHYT/8q9wDnY7HLN4Xmo5NLPskquXbuWqjpYW1HQoLgbzY7Q4lqUhe/dlQ
 Tuzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkK3UOKRMJM7pRkyw0a/me0xQZR8ozszCLbrHKUO6Mbn/tDEXr33wno1NXNQ4ttPcjFvo3kP/N1Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytiMQ+1FxEaEq8gd+A1V3inbiiOnt9RD4MXCl+6C0aEzhXqeMS
 8vKTcdPLYk4jQIhgOXM9OCvZV1vSKlcv9hCQsZMxBHWOQHDpyD/Qd3D1CVQ7BjgwTUhxQhSZ32H
 U130xQE1PEchQxhWfBag7Y2JwNiQfUzrQ0/E/FT5hC1DfH3/g5ZgQdsuuzKhqISXb+x23HsQ=
X-Gm-Gg: ASbGncvfSrF8vJ6hhYEqR28E1ajbDyODkX1De+48yyN6/3IFqky7fCLswy9HS1sbAIn
 DMh1maDq4mHjCF6q46k1XN31ZwGhuTFpmdgY5k6e1Baiu30UFL1ST+sCZWePgJQlKpDkiBPHOQX
 4fhSYHuPrQDVzwNVVQCdyn1b3kuHuNYcAzgMu45WQIXc05Ttq7Pgsc5z9LBwhRI3uL4rLPOSdun
 DyQn+hZ4EEASDwBpx9W4hdfvECkjiLtx/w4mdr4PVsQ+aqmhZJgU+G8qF3px/IRp23I+9AZr3nt
 LqjdbQB4GOTccWfPSVYjYtCb2XcZu60U3C26Gv97nyqK0PU/cA/86Re5k+8ap//4EDz1SZH7rcl
 a+/lms9nXFIOVS+LmiSMD4iUrT85/s9b7YUhFE1hhgbsiHFhaDMjABAue
X-Received: by 2002:a05:6214:19c9:b0:880:51f0:5b92 with SMTP id
 6a1803df08f44-88051f062e8mr39427536d6.1.1762170895466; 
 Mon, 03 Nov 2025 03:54:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMiDz+lDCli9dZFeqHisvcD0Vrq2kRQUKbIV6KqRS7V1M4g3Nb4MKb8S5qdZwNotx5iYmXow==
X-Received: by 2002:a05:6214:19c9:b0:880:51f0:5b92 with SMTP id
 6a1803df08f44-88051f062e8mr39427096d6.1.1762170894821; 
 Mon, 03 Nov 2025 03:54:54 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70b8191679sm376641866b.39.2025.11.03.03.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 03:54:54 -0800 (PST)
Message-ID: <c58dd9d3-2689-4a73-a854-04cff5b44216@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs615: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bNIionoPlRHg9J-MLWpEZA1vfYmWvmos
X-Authority-Analysis: v=2.4 cv=A7dh/qWG c=1 sm=1 tr=0 ts=69089810 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iFl-POHFLS5oe-sZTncA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bNIionoPlRHg9J-MLWpEZA1vfYmWvmos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwOCBTYWx0ZWRfX8d5FYbYPEfmJ
 UBCt6s0icieZ/DCzrKPmSPecQ/Akk0eUJhSqwWQu0gE0HE+ngQEmLoLOFa4T63tmEbyo8qTnZQp
 66k0ClRzhhr1w4/kTwYc2+sBpqaSMlGj2gVy5nODHKD8FrWIkzv0ePdQVGp9V6NRXLoeqIZzQuS
 RXYGk0GkeSsxwjDO5PnZCxNoLfg3tO0PTfF0fFYi+cB/NmFINdDZINCgi7HkufNsUHm7x8S+QA4
 ja2EUHhQYtxnfW602E8l0hvju58FjvpIrB/L5rMP7xhS4DjoZZXEDh0FRz5qYjcTQBfwNzv7N/U
 ysjEvYS/QbEBQCUCYnYrVHplvSDwoju/pYvT5bXpWkK8K7hkPZ5K3HrhMOsrWS9gKC1xVXWKm38
 F0XFDhgltaK/2YdW9LLyaFgZQ7zPaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030108
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

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..e62b062c543657b6fd8f9aba7ad595855d8134d6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> @@ -1700,6 +1700,33 @@ gpucc: clock-controller@5090000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@50a0000 {
> +			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x50a0000 0x0 0x10000>;

sz = 0x40000> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;

please adjust the property order to match x1e80100/hamoa.dtsi

the values look OK

Konrad
