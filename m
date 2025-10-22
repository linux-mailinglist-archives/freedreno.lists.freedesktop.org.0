Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6EDBFCDEA
	for <lists+freedreno@lfdr.de>; Wed, 22 Oct 2025 17:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19C410E7ED;
	Wed, 22 Oct 2025 15:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkEZnLBu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E28310E7ED
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 15:27:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MB5Kok025166
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 15:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8k/FmEKkL858bw0NvFllXkz9skuIxCCBY/vWAZsgTMY=; b=bkEZnLBucAJH7pXS
 V2M0/a2S9dpvkoIdlZ/FDdD7fjQzTwoGURX1SaU9aggJIieHyBgV9+dZeeMsbxd2
 PTTlxlkAKVkyRlb0uP9czwXuhBqDdwK8gEs/5OCNtKGrMIakilydsLHxHGNaH20Z
 mCQcqAa7QgkEk5ydwnyLrYz93Hnd56JXjCUh8WMrHWtqmqk5TwESltvcUafv1vhp
 AK9X3pnGwNksDAbLQ8AtOEYrqbhgULbB+kmtSxUmLykYaEYE1NzID3E4ee/MleFF
 2lxZwWPqBxWRGDEall2/N2agY4Eti/189H5rifc9C39DU88mQ5cX1XermOgq5nUT
 7zOo8Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w856re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 15:27:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87bd2dececeso23992146d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761146845; x=1761751645;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8k/FmEKkL858bw0NvFllXkz9skuIxCCBY/vWAZsgTMY=;
 b=i7nIeXPZFQ/7+lz3WC9CalYchRw2TBBoF5l8yzNBNxh3+4OozxdjgCS6tB0XQdzeQl
 m42+s+A9caXFF2eLriqHGxeXa4imV+f2oOT7L+MnQEYk1bnxaAWTFwe2I2v23iUWGaNI
 RicRMzXX6fr9v+BKzLXJ7KqZXPkmA3G0NJ9BmW4kYFcNYVsaoVsgNRASAD7nld5UTUIN
 iPyod/Spg3xPZVTjtGksV+BSzXqwxtH/vkIogJ2c9eS5EHoRFV1c3Zopq681Vi1Obux0
 QuMwc+e3yMsZl8XDBaiCHP4snStIAYj34IKZGVNKtEYlP1aNU9d3p9EXcfbruN8hOf8R
 hcOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrWNuxgwoYdZPkyWT+4tyyEBqrmKF4rhOTPIrlKiYCJ3pfIynBeRptRyNigFLeGADiJp8q3a4Lx9M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdE/kLXxsKH/cykJLy5l3+M7gbWSGrT/r7X3S4WfKvd7ToLsWt
 NzOeX+4OVI3OWbyRV4H2tjrWt/pS93W/HyRwHL4vXiuDwlUoZch36JAZI+cLgc3L5bhZoopSfzr
 sQh5xHQkNxFsmye293vx5EZ3DgB6XbenA8tud4Y9iXu81jRHq3T6lb2oOAez09o+pi3auvKM=
X-Gm-Gg: ASbGnctlrX0ejGB95D4LkMVTuRm1zG0YT9Ce5CBRLWUJGFUr/Ms1dmjDgDfW9J/xD7t
 Kd7UZtPw7GPv5iwUPQ2BArbw9pxmlaA2LyaR0OYGfnPebMhUHyCYVnGqE61gOS6rYJEKdhgtmQY
 VGlaO3WIJi60B8uURxyuTTEcxCg4xyYp7KOLrLPrFx7YP/WTgo32WGM7MHsHxbcAlBCAKZUNe9q
 +ULPAVju9QJqMIR+8XFDZwsQwNGdMhQlAR1a43Zz4fwaN96YM/7u5N9BXls06nGGjYwb5npYa5f
 dWGzdwNnGFENN/FHMP/jDBuTv+ugvgGZO95qI1jp9rJGWPfwcxl/tgUjbSbKppFNNx/meouRI+C
 fyO6p3ARFvPKGRlGLhKw45g0iPq9PKn2zNuCFXAEJXeCrtlgczq5FDx7a
X-Received: by 2002:a05:6214:248d:b0:70d:e7e1:840f with SMTP id
 6a1803df08f44-87de714c1c7mr65707276d6.3.1761146844601; 
 Wed, 22 Oct 2025 08:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8/xeYz1XYBcdg4T4l6woigaSUVTSHt5t3v8BurU4yppUfVX2LR3sMLl0zpGaHU1+8ugjz3g==
X-Received: by 2002:a05:6214:248d:b0:70d:e7e1:840f with SMTP id
 6a1803df08f44-87de714c1c7mr65706846d6.3.1761146843645; 
 Wed, 22 Oct 2025 08:27:23 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949beedsm11980254a12.40.2025.10.22.08.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 08:27:23 -0700 (PDT)
Message-ID: <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
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
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX+gobe9jlAhZG
 +DyvUX9HrFGe9/ZVNDlGVWEPtNQZNHgmatbFlKQQ2my/raBX8JHfoTAep9cxoGCbEaCbll8chvW
 zndz2Jlyjg0Epe0zLcs3H38hPZUd2o4u+u6yQX/6B8Re5BNFU/9CpC+F2Gq+uS5cnSg6FbiMomT
 6goB9C0gQ+UrWDu8CHaKNDHMMNjoTG9LHOWx+dV5zQcH4XF49Hs/jrMA0Bk+HmPspTrJL8WFpdc
 1M7YbMbPACSVKe/5ZfhGHaxZm6oy41gFXjcf/pFOQz1WAF7uvdKoVVYg9SEb9gH7Tfnr0TiiOoC
 gED5ots1F5JSatHRPlGloaf0d5Lq9bN60+rWnz1UvXmFOpjQpHXbXG75rr4x9z5v8SIuwGVbum2
 aPpc/FTXnGAxkMmhAycqwJ4hlxuOHw==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f8f7dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=e4uKRaRUJts94r9YfvAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OYTIPRA2ZIfLcwvkS_F52NabBNWHX3Tb
X-Proofpoint-ORIG-GUID: OYTIPRA2ZIfLcwvkS_F52NabBNWHX3Tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;

Are there speed bins?

[...]

> +		rgmu: rgmu@506a000 {
> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
> +			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg-names = "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +			clock-names = "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "smmu_vote";
> +
> +			power-domains = <&gpucc CX_GDSC>,
> +					<&gpucc GX_GDSC>,
> +					<&rpmhpd RPMHPD_CX>;
> +			power-domain-names = "cx", "gx", "vdd_cx";

I think the gpucc node should reference _CX directly instead,
then genpd/opp should trickle the requirements up the chain

> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "oob", "gmu";

1 a line, please

lgtm otherwise

Konrad
