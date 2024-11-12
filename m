Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA79C62E6
	for <lists+freedreno@lfdr.de>; Tue, 12 Nov 2024 21:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4F910E0BA;
	Tue, 12 Nov 2024 20:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JyZgWgvh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D0310E0BA
 for <freedreno@lists.freedesktop.org>; Tue, 12 Nov 2024 20:51:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACFmlr1011761
 for <freedreno@lists.freedesktop.org>; Tue, 12 Nov 2024 20:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Fgs7XPgYPHG7rVrBqg7sRL8J3bw7Eq8xJ9kMw+6jukk=; b=JyZgWgvhK8lmB1DX
 HVNN84r3TiovUTZVdcKukzL/hDqiUQOlxZ4JIlcWo/NeKBwZkQhb5J418+6Gv/vd
 +BIWn5kBgi77YuYODVlFiuNSNkH5ADIfy4VzoiiNwOVgjihfk1S2h1E5iiOMJrAM
 BhgmmOFv80/PIbeWfLB1OLCOsxwnNSDTZLBaoCCivz97t0NwtrzbO6k15GKDe/Af
 X9Ztj/mjeh8psUjf17x4zpzcT2iePtI5XTHRH6S0Vrs8B/YeVJ75DJ07rtTSz98y
 cJzu9Gh4h6yYApkH0/efXFtlRmliQNXgEkpy382V63gkRaaRTdIaFGwnP1vx/PrY
 HNa4LQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va078vx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 12 Nov 2024 20:51:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACKpW2F025940
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 12 Nov 2024 20:51:32 GMT
Received: from [10.216.22.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 12:51:31 -0800
Message-ID: <fe3339a4-2f04-4580-bfb8-14788944b832@quicinc.com>
Date: Wed, 13 Nov 2024 02:21:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: <freedreno@lists.freedesktop.org>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-1-bdf1d9ce6021@quicinc.com>
 <14a7bfdb-7106-4317-a54a-e0101c41cba1@oss.qualcomm.com>
 <bf997a81-45e9-43f6-ad65-5eff16101891@quicinc.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <bf997a81-45e9-43f6-ad65-5eff16101891@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N_VDbi9PFE-07mjLKdz_98B-frBVhaD9
X-Proofpoint-ORIG-GUID: N_VDbi9PFE-07mjLKdz_98B-frBVhaD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxlogscore=807 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120168
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

On 11/1/2024 8:16 PM, Akhil P Oommen wrote:
> On 11/1/2024 2:00 AM, Konrad Dybcio wrote:
>> On 30.10.2024 8:02 AM, Akhil P Oommen wrote:
>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>
>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>> SKUs have the same GPU fmax, so there is no requirement of
>>> speed bin support.
>>>
>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 94 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 94 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index e8dbc8d820a6..c6cb18193787 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -3072,6 +3072,100 @@ tcsr_mutex: hwlock@1f40000 {
>>>  			#hwlock-cells = <1>;
>>>  		};
>>>  
>>> +		gpu: gpu@3d00000 {
>>> +			compatible = "qcom,adreno-663.0", "qcom,adreno";
>>
>> Is the patchlevel zero for this SKU?
> 
> Yes. There is only a single revision implemented downstream.
> 
> 
>>
>>
>>> +			reg = <0x0 0x03d00000 0x0 0x40000>,
>>> +			      <0x0 0x03d9e000 0x0 0x1000>,
>>> +			      <0x0 0x03d61000 0x0 0x800>;
>>> +			reg-names = "kgsl_3d0_reg_memory",
>>> +				    "cx_mem",
>>> +				    "cx_dbgc";
>>> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>>> +			iommus = <&adreno_smmu 0 0xc00>,
>>> +				 <&adreno_smmu 1 0xc00>;
>>> +			operating-points-v2 = <&gpu_opp_table>;
>>> +			qcom,gmu = <&gmu>;
>>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>> +			interconnect-names = "gfx-mem";
>>> +			#cooling-cells = <2>;
>>
>> You might want to hook this up to a thermal-zone right away
> 
> I am checking with our Thermal team on this. Will get back shortly.

It looks like it is a bit complicated. This chipset is used in
automotive platforms too which has restrictions related to thermal
throttling. Lets handle thermal zones in a separate patch.

-Akhil

> 
> -Akhil.
> 
>>
>> Konrad
> 

