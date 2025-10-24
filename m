Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A177C04C5C
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 09:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A31110E9F3;
	Fri, 24 Oct 2025 07:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQDEc/i7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7E910E9F6
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 07:40:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3Fxw9004791
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 07:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vPzIitDiH9otQXvVOFZwedMLZY4zXReFnc2YeCNbvik=; b=OQDEc/i7LR3QGwD+
 WXKCp8pGkLRwp/pN8ZnTAjtJxNw2KX2FMeLkaW8yH4nMTD7Z7i383DaLJIWI1ov5
 g8bO4ojQHm3WQc5ts7ZioegpPkUaesYEMrlmlc3ni+Zu2HsidjiH5BqjoxdoXkjT
 had6/f+oMvaOKOE94eHzGHEJEx6ss8Xg/VXWXLa931Pm4uqlp6jj+K7ywoNvFCMf
 E6jlY5bM5+gBpVEqhsklzpBfb8NN1bVKdV+PX8Abus+HLQ7798ZsEQ8o4nuPLf7y
 +a9Nl3Z3OrWnDtETKIf8mTVIcVt1+tCw5ejZUSp0bI8JP+WVm3Anh8W3nbgC1JkK
 zsMwdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2geb79p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 07:40:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-886eaf88e01so68592985a.1
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 00:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761291647; x=1761896447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vPzIitDiH9otQXvVOFZwedMLZY4zXReFnc2YeCNbvik=;
 b=FXdn9BmRboj5cYZSPs4lR8NDT5ggquDRogkLxyGV1rMs62m/SsIGN/iw6zu2OA2ntr
 JUjGplFm1LuMma430ReP5L/QYB36FBL4BZXuhTUdUC88Lkcr46IAA/IDQaovPNJSHF0J
 CwLW26/ty8uCR3CPQbXFF4+iLZJbMulE1ySs3LfRKgCeZZdg2Dy3Kldgp1sQsEtTdp0/
 pkdMpTsZ40lmJIlmSVOqrq5N3Ha54Mmq8vGltnUmifQatJ4EB/5rQGCKdSkhiAooE0jD
 aKyCcFX8zvsr6kbIHcRdiKJbAZRGSAcQqLF3dWxJ20U+Fdxi/kI8mwz9GGZA1BZaUaz+
 WXTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDoa3rnS+STaB21/krSEkUIu5sW7r2rwnUdDnLyOaotRKS/rQUrHGuDjdenASV/4DSlr+FifraucE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySMduxamzeGKyz2tf1fXTt7JQGxU/P5m5i96bXP2bccR6EM9xX
 IevJKB+A8YXwTaDc99AG8rRkel68o9O9yV5TAJxeW3PBmadC5B+Cwnx/08v3E0c4/awTixocta9
 18D55LMUG7gskop1V6it8OEJRY3UaRvyNh3Bon2c0rm3JJ4OEAOj+4QIfxRwP8JaZicGtStM=
X-Gm-Gg: ASbGnctHI9q0Rm2pRoD969oWbrNr3v+7Sv00GwvT2auhW4awx0fohcb2KzSWAu5IrfO
 G9bVmDR3JLPBmNae59Lav4TjUXySKUwvHWK27dHCzNwSYPt42ieihdi76EwV1cuEKgEU0AfCYuC
 0HLncT/TMAjpKas5NFRb9Uwu1oQKWRvWkzUomjRCVMhs3KtmqxwGSslHecT8Z42aZv7uc67g5gt
 rkhq2qXr45yhYCohZpqLNYq/uRPvX6rxro56tuMkqK/g2i9E44bMbUB2PvsTPXdMd6LJIJJ9Wl2
 Q9BYtwz6f+TIPQvjD3ITSrx2V2MGssVkYw0Kgg8JRalZhxFPVFcuySW3DpFvgxW+kYDmpWdqj/e
 hzUj6M+DlK8ULizAKZpLLQrgFXCsx1LwSHx+CKYLbi8wOgduUeeFhH1L3
X-Received: by 2002:a05:622a:450:b0:4db:1bd:c21c with SMTP id
 d75a77b69052e-4ea117b0e6dmr115459981cf.12.1761291647233; 
 Fri, 24 Oct 2025 00:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGDhrS58k/AxKuFVBR7BBI8Y+VWeS0MiqdM4N/c4mARISKSYsDHdoSUEHIWyNAZ4CQaEeDpw==
X-Received: by 2002:a05:622a:450:b0:4db:1bd:c21c with SMTP id
 d75a77b69052e-4ea117b0e6dmr115459641cf.12.1761291646690; 
 Fri, 24 Oct 2025 00:40:46 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5144d565sm459794566b.58.2025.10.24.00.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 00:40:46 -0700 (PDT)
Message-ID: <853e7cb9-2a7d-445d-aacc-49e3a2f07a66@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:40:44 +0200
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
 <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
 <25ad160b-b618-4ade-a978-e4ae56c79e32@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25ad160b-b618-4ade-a978-e4ae56c79e32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX3uRk5VP819Jw
 mYwzXXaOsd2odfBs9Bvlv1kt+GT+nVf1fXObc/e8qgTuz8f2e9ru6cDue2OB5WtolhwBQCg9PCn
 OeBCKO5GhYz8iHVmLM8H05eQXW/hWMYPxY1E2e022i86P90HC7cneopCmYXVFqW1PhQw3MezDPK
 UMZNsGvE4fj/Xjx5OGL0xTD/wL9lykjX1JPNs4lkIrqg3yS/LkpkIbayCMJGvSyOfYiB05J7TV/
 p979OA89n+tqOAH9TKzsotM4bL0L5ktFITTkOt7C/ccU24nfYqCOlgtj6gairSgmfCK8HysVkGM
 Hsj4meETyXHRyBDUaEoTFKi0SVt8994BdKJqrk7WFqL6X0948tv+q7zlx3mHK9968aj3KYjvVX7
 SlOQs2vC1mRmtuu6R261CjQc8YaziA==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fb2d80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GWL_uKs5TFOXZ07RABcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SDLpKTyHT1lRkVAy1TrY64MnABJdLA8m
X-Proofpoint-ORIG-GUID: SDLpKTyHT1lRkVAy1TrY64MnABJdLA8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

On 10/24/25 12:17 AM, Akhil P Oommen wrote:
> On 10/22/2025 8:57 PM, Konrad Dybcio wrote:
>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> +		rgmu: rgmu@506a000 {
>>> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
>>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>>> +			reg-names = "gmu";
>>> +
>>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>>> +				 <&gpucc GPU_CC_CXO_CLK>,
>>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
>>> +			clock-names = "gmu",
>>> +				      "cxo",
>>> +				      "axi",
>>> +				      "memnoc",
>>> +				      "smmu_vote";
>>> +
>>> +			power-domains = <&gpucc CX_GDSC>,
>>> +					<&gpucc GX_GDSC>,
>>> +					<&rpmhpd RPMHPD_CX>;
>>> +			power-domain-names = "cx", "gx", "vdd_cx";
>>
>> I think the gpucc node should reference _CX directly instead,
>> then genpd/opp should trickle the requirements up the chain
> 
> Do you mean the CX rail scaling here should be handled by gpucc clk driver?

Yes, you can simply add .use_rpm = true to qcom_cc_desc in there and
add power-domains = <&rpmhpd RPMHPD_CX> to the node

Konrad
