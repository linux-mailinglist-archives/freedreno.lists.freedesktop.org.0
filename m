Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF79C03A78
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 00:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB5610E972;
	Thu, 23 Oct 2025 22:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUasmk3g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB8C10E972
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 22:17:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEuJNg027193
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 22:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eXhgsnolQuosOCqmxN7GIdRp3agVwulspfbFQ5KcWGY=; b=UUasmk3gf49mUvbJ
 7h9Zg0DoBYf71jSH/3zOhijwNaCgP2i+48GuW9H5qosi3VLTbxGHYWQUc/tBO0Om
 VoVHYzeK1ud3GNdPzLS2M+mEosafzK204m8C7oFEn8QyoCkp1Tv512dj/Ji10gMQ
 kO3YAjYEnAm6lakLFShMTXtXvLjFUnoHOZ2mb8tOHMi2qPhSuCcv14O22ZuoV04P
 1szQTcDb5kDMKNffEAzCSvHjrYqo+iBEouBsB3ODzDNLPiS0pA2BDlFFIPISg1dq
 4ECTvchqCaE7OFB7bhUlKuaDE5Wiuy7JVReKkZNV8qizgXCfdm107V4ItHwpTjQV
 5ULgJw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8m8ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 22:17:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a27ade1e73so709859b3a.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 15:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761257857; x=1761862657;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eXhgsnolQuosOCqmxN7GIdRp3agVwulspfbFQ5KcWGY=;
 b=SizZSn+CgRJNH8e3kRKsunolFMPz7R5dK7z7knUwNp+B9kVhtY8TD7hvTOB/DM7VAP
 9XCRmaSmZ8plbrh5VEq8kQ1fIQ7ZSgMYUvjBYmSjynkwXRFnafOVR2ScslBWEey9OxVT
 pmwu7D1UEPw9y8wBPT3Mql0rX5xLnT+ZUVkI56YQ5d9VDCxEWzsY6++kLNAmWzyi6xKi
 1e8Q0Zi+Oad4H6eQ7IkURi+wIhHJTjKaGf7oirYYeUg4w2LPr0ofoZgIpC3b0XqgqdyZ
 pv+/2QvUst5F6XCzV29XDsO5eX8zQkPbxBhmY+QeKT7vaH4rmN1vLoob+gW65WK11zS+
 3zqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+X2xDdngmpq5l/Kzu4DQYNoMP57cYqaE9IUWNK8PUnrkCTwnpVuoIDwgchi+cigteFn1aNwv7wtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYdEmDUkP1AN+h6FwfkB7dLp2nHY0RcDMvvJdmVZM9es4U1P6A
 JpgF5LAQ35x1RVIp58NDBR9mQc5lAYbv6DWLt6QceLHMiM4CgAaZEUmqbpHyA8Ye8HiLY6m5mBO
 MEYGq+VLB9xIuXN8ixQtIOs6WgMMWJNBdoZtTCN8EiSaUw5Atk9foASv0l5DujHMOUEfm5VQ=
X-Gm-Gg: ASbGncsjNdwSmFgxxw0N9FPS9tW5nsUQ5ou0ueKJDh5efjPGR2urPnOlcXNYYSUJ9iH
 R+OJkakGUoKCkufJ/jjlKQSYuj0ZQv2WVx81iJTzONgWuDCpn3EGbTFHWdY2P13oh4tSPo9qxM+
 Gcmy+wL2UoKjc4OcJxy+YViRFfN0jAQ8EAidK99DRvfgbTW7jGOp3E1+gx2ZMLqahpo1vklvE+b
 C0GGhYeJiR1ukcMsXXdiKb3UVugc4DDrOWfmeR9Etj/UBy7ls6aPWd+iWKDIS+Zpvjf9+/qkr+V
 q2dXAHx91P8FOsf67wfyt8vmwwgmCoRF8OxhVwiyBOFhb51PVkYLzPm8yxgaz3Y/KBtvfg9HMTX
 CBV30w34EcrQ4uSioG3Noul4=
X-Received: by 2002:a05:6a00:92aa:b0:79a:fd01:dfa9 with SMTP id
 d2e1a72fcca58-7a286765c70mr34287b3a.6.1761257857334; 
 Thu, 23 Oct 2025 15:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXCip3lfFlFFHAfU+3zmg9cMpt0K19PwWmMQCOg96oi40mBOKNaVibdgO92QzHjjA63GTbQA==
X-Received: by 2002:a05:6a00:92aa:b0:79a:fd01:dfa9 with SMTP id
 d2e1a72fcca58-7a286765c70mr34262b3a.6.1761257856827; 
 Thu, 23 Oct 2025 15:17:36 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.102])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274b8b32asm3691332b3a.43.2025.10.23.15.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 15:17:36 -0700 (PDT)
Message-ID: <25ad160b-b618-4ade-a978-e4ae56c79e32@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 03:47:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fVbAhMrXa9M_yAAQvGXepzI-5E5zGOnt
X-Proofpoint-GUID: fVbAhMrXa9M_yAAQvGXepzI-5E5zGOnt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX8csDmp1WFpMc
 +BF+DIOlzzG4TL40tTOln/VNIq/q7v6lI3kb/sp2nxN5mShWBMrLB5MCLXPttP6zhqrb5JaBV31
 wS55p9BeNsGxdhTq+KR1g2pPlKn1UnRvghC3YZFUyuoZkAn/lD1WrnomBJQ1efu5A7XF0mlEFE2
 Q5x3flsCvTU5Tg17yFR8ttw3Db+39SRxl9DSVj2iWKTgIV+O+8ktPAuF8nMEYyzUd5X92GAFGZc
 WwRpmOJQrHOsvt6jLVyMZKf3ESgIZRaLHlZK926IwrxBdpTRN9D8MDIDwckzHwvI8pMwSPpw9Zr
 jblyYcT9eg7qoRIEHazByFkmBHzqNDSrrP/AG6zZ66fTrgcx7ci7SgHiKc6F2kJm06XY6ANFCGm
 jk+AeLHaBKlu1qRo5l4ltoEevbakMg==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68faa982 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=OORdEvYNKPdDRPFHMUl15A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=bgAURMIcSi5BoiUHQI0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
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

On 10/22/2025 8:57 PM, Konrad Dybcio wrote:
> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and rgmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			gpu_zap_shader: zap-shader {
>> +				memory-region = <&pil_gpu_mem>;
>> +			};
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-845000000 {
>> +					opp-hz = /bits/ 64 <845000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>;
>> +					opp-peak-kBps = <7050000>;
> 
> Are there speed bins?

None I am aware of as of now.

> 
> [...]
> 
>> +		rgmu: rgmu@506a000 {
>> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>> +			reg-names = "gmu";
>> +
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
>> +			clock-names = "gmu",
>> +				      "cxo",
>> +				      "axi",
>> +				      "memnoc",
>> +				      "smmu_vote";
>> +
>> +			power-domains = <&gpucc CX_GDSC>,
>> +					<&gpucc GX_GDSC>,
>> +					<&rpmhpd RPMHPD_CX>;
>> +			power-domain-names = "cx", "gx", "vdd_cx";
> 
> I think the gpucc node should reference _CX directly instead,
> then genpd/opp should trickle the requirements up the chain

Do you mean the CX rail scaling here should be handled by gpucc clk driver?


> 
>> +
>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "oob", "gmu";
> 
> 1 a line, please

Ack. Thanks

-Akhil

> 
> lgtm otherwise
> 
> Konrad


