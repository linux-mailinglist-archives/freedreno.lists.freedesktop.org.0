Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E3A87E4F
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 13:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E17110E56B;
	Mon, 14 Apr 2025 11:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRH4OrXj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A95E10E56B
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 11:01:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qmu011413
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 11:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AwhFYLcRsvN/5O2x/zPOJHH24568TbvM4q5YBcWwvdQ=; b=IRH4OrXjrF8UutOY
 GBf1PKgjFlk10wkDRsCWGHf9o6AaEXZhofCdVkovBaFdkTkf7yV8zu+ogEquGVb6
 ST7VZXRKJ/IA4eES2q73rqAq3+i2gHGM4HpPNpSr2wwOgPUFgZFlTR8/AL9UqiR0
 zsCWllHJyNULVJ5/Zby3sTqU1jvSX/r1Dgj16HI+b3iUr9zU48rZUitl2vWDJxOH
 aEKoQisubDdRmMvlmN/Yz9ijgsHUG+hN/qg4g4imu4XQB2VXYFCFF3zDV+/xpaCz
 3DpnO0zoJsnjLltC+ttKUCEd9BgAr1FoAluRpCJM++nTHGyE2RjGmjivlcW3RHtv
 lv2txg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wc8n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 11:01:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c76062c513so110842285a.3
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 04:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744628503; x=1745233303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwhFYLcRsvN/5O2x/zPOJHH24568TbvM4q5YBcWwvdQ=;
 b=ND+h/cvnFrLJIF/EZQ9hZMbAEtV7+lPPeiZ36zD4oFHoaOa5MLgPnYxD5kcaVLaJyB
 rHewVw7UCL0q+wkHi0PdbwfyMExxRG/R1DUb00ncaTIpbOpR+oggxc/pbIhgx9x2MATf
 c+C/REh0xRbg6pdCvfvlH2HpwDUpDnjx8FuAXSPNRagyLuKxkQZATkrSagl9ukExDbXR
 rTrv8/YhvyF80jSJV47a85Kg6cxBkKcz6DL5HtB3K83hxyxwU6My8Dfihk55FwO18TR1
 biDHGPnlo1fbWqx2vHh/TESFpvbUGppPzYgFYg9BkcrIlJAR4eC+QHAugSjIcqdVx3qS
 SypA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7NlVDAPZ7G0mqD/ZSIj+Ubmx4AOPXcPpVWHuBo718N7lu1ftPngvX50X5Su975j/b5ELiQvnAMsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywdd2KiRz2Z6VRtXsSNZo0TEOzR1FDkoSjo+79+lz1TDLgy1+iK
 J1rb33rQ2dDJEj6lvcYt3AHeJKxEr3wxyg0wxJ9Pz8R+HvPyouy44yQbHvaSorZTfaUKp8+tzi/
 2FZfnejuCLI9LIWM6QW6bxmpCgVi08zY5kVN5peryB87TApwe8QYweITM3PlAHSWZTi4=
X-Gm-Gg: ASbGncsCTq8Isku7vHg/5qFqlLt4cFgW7YeQosqqiDqj84GcHJHaj+ZlJOd/zMdeJa9
 VinI08z6kaQN0ISWqkobqfzH7PkV0L0yu6EAwZ6QFctUr1Jh6X07SJFwkXsCahpvwafQSZn4PgV
 Z5pyhbaF6CWHRF2c6y5JMPwmktTVeOu5eg8gL99UF+RbDYtyneeAFx8EiK0sI/F+4tQLy1MXN2h
 mgbImI/xgyu0T9h0p24YgQFSRoYEyk1phSY6Vs8HYnZ4T8rxaWDWLphviNUoeuQ2EHrFsExKefA
 xIUBvZUvUEZaldb8r/ijSakUaSmExg8IKvGWuCtmdsz460u5WXJYBNvxShVo6El5yw==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id
 af79cd13be357-7c7af04c112mr642841585a.0.1744628502715; 
 Mon, 14 Apr 2025 04:01:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK97vOdYIq2mdoALIGz5F0Dh2fRVfBH0Km89YvV3CijLmngOzHMeK37HY+4moc2F10MzIcDw==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id
 af79cd13be357-7c7af04c112mr642838785a.0.1744628501979; 
 Mon, 14 Apr 2025 04:01:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb42casm874884866b.88.2025.04.14.04.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 04:01:41 -0700 (PDT)
Message-ID: <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
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
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fceb17 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=515PL6qApFHJgk_UoXMA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ImGCpMEx9nxEWtqn-WqXtsCTCmvQ5q_9
X-Proofpoint-GUID: ImGCpMEx9nxEWtqn-WqXtsCTCmvQ5q_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=646 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140080
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

On 2/27/25 9:07 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

[...]

> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d6a000 0x0 0x34000>,

size = 0x26000 so that it doesn't leak into GPU_CC

> +			      <0x0 0x03de0000 0x0 0x10000>,
> +			      <0x0 0x0b290000 0x0 0x10000>;
> +			reg-names = "gmu", "rscc", "gmu_pdc";
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

This should only be bound to the SMMU

> +			clock-names = "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "ahb",
> +				      "hub",
> +				      "smmu_vote";
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +					<&gpucc GPU_CC_GX_GDSC>;
> +			power-domain-names = "cx",
> +					     "gx";
> +			iommus = <&adreno_smmu 5 0xc00>;
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;

It looks like this clock only has a 500 Mhz rate 

Konrad
