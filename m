Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808549F0D42
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 14:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D20B10EFF9;
	Fri, 13 Dec 2024 13:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RsQxNlb5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791210EFF9
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:27:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAH2vO031133
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9txSCb1IC1Nu0LWc67oEXLeaFExT74mZB2MDrVFA5QY=; b=RsQxNlb5nc5rmEM5
 b01D4BcVfSQQdHPHMKLqXWYhoI/e+Kw3eYiplz8wnLkn9xifMvQ7gjRREQ18Ey3+
 I4DdZpDuuZgC7PqkBzJc3/Sb3IyuVvuq8paOXg4QdjxujHrz1jpxn9dGxMtXKEFq
 KE0CaRovry6JIB0whCix8IVGQ5QLfeNhV5Tq8d9eK0qAGA57yWB6WnPdp78D1Z9W
 erLL0qNB31PRFXDRDfcI/MmKlxaXVGLg2eccqw2JnGfzSZBbikBCEgzw+dayFrpQ
 tHKbFj6L0ZAA1yOv1onvCBhG9pvZfGZ8QvsYuzd0NunmiPxDRO/1Ki6YXtwX2Kb2
 Qt0a6w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgekymf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:27:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDDRSv4015976
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:27:28 GMT
Received: from [10.204.101.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 05:27:27 -0800
Message-ID: <bc35b8b3-9784-47cc-b2f5-03a9d66171e4@quicinc.com>
Date: Fri, 13 Dec 2024 18:57:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu nodes
To: <freedreno@lists.freedesktop.org>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-6606c64f03b5@quicinc.com>
 <a44027ee-40d3-4552-8f61-bcab77476f68@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <a44027ee-40d3-4552-8f61-bcab77476f68@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: H0DJqp1zwWcKxqobg0R5ter62M8uBm60
X-Proofpoint-ORIG-GUID: H0DJqp1zwWcKxqobg0R5ter62M8uBm60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130095
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

On 12/13/2024 4:27 PM, Konrad Dybcio wrote:
> On 13.12.2024 11:35 AM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 88 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 8df26efde3fd..dee5d3be4aa3 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -387,6 +387,11 @@ smem_region: smem@86000000 {
>>  			no-map;
>>  			hwlocks = <&tcsr_mutex 3>;
>>  		};
>> +
>> +		pil_gpu_mem: pil-gpu@97715000 {
>> +			reg = <0x0 0x97715000 0x0 0x2000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc: soc@0 {
>> @@ -508,6 +513,89 @@ qup_uart0_rx: qup-uart0-rx-state {
>>  			};
>>  		};
>>  
>> +		gpu: gpu@5000000 {
>> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
>> +			reg = <0x0 0x05000000 0x0 0x90000>;
>> +			reg-names = "kgsl_3d0_reg_memory";
>> +
>> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>;
>> +			clock-names = "core",
>> +				      "mem_iface",
>> +				      "alt_mem_iface",
>> +				      "gmu",
>> +				      "xo";
>> +
>> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "gfx-mem";
>> +
>> +			iommus = <&adreno_smmu 0x0 0x401>;
> 
> No LPAC context?

Nope. A6XX_GEN1 family here.

> 
> 
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&rpmhpd RPMHPD_CX>;
>> +			qcom,gmu = <&rgmu>;
>> +
>> +			#cooling-cells = <2>;
>> +
>> +			status = "disabled";
>> +
>> +			gpu_zap_shader: zap-shader {
>> +				memory-region = <&pil_gpu_mem>;
>> +			};
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-435000000 {
>> +					opp-hz = /bits/ 64 <435000000>;
>> +					required-opps = <&rpmhpd_opp_svs>;
>> +					opp-peak-kBps = <3000000>;
>> +				};
> 
> I'm also seeing 290 MHz @ LOW_SVS

Likely because the downstream automotive driver didn't use that corner
for some reason. Let me check.

-Akhil

> 
> Konrad

