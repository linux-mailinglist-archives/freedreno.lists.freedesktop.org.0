Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DAB424AD
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 17:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D6610E17E;
	Wed,  3 Sep 2025 15:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2ny0UHt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC3C10E17E
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 15:14:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dwo4m029545
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 15:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h4UktVIdm2c0x5SK3djoEMrvw4KVq2MmQq9SrdZVv5U=; b=F2ny0UHtZ4m8BKGP
 Xig1qKmRBm55LMfbgSdQU/9ufvvoqSL0dGVnZ+R69YKJsqnXPEr8wIFa17M/jUsT
 JYAcCik2Pqry6a8U7R3E+91GsDM1zuDt+6Z+iYeGVq60+1L8gAddxIrU5nMjMgf1
 KXiLc9MWmawjJFHpSqVdfJdYBEs9Bqzp6DL5Zwcmot388PPS6+6b2TZCG/yacbix
 K0Ke21bWkicUeZwFCzW5KusAfkdrrJUnXe/mjCPBDGB7DgMPGrVQD+LUcMiaU3/Y
 S4jdzdfMIr8MLQrCakVOYxvlSJmP9tafv0sOjPte4oPLP33bzWIzkrH7FQj9UsWx
 2fyPsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpca7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 15:14:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b3d3fc4657so23621cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 08:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756912474; x=1757517274;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h4UktVIdm2c0x5SK3djoEMrvw4KVq2MmQq9SrdZVv5U=;
 b=JJVEehCj749zYZWbJgw13O6pM1MADRX5eC9krTeiAcobQOaL1p6ZDlyplY52mtejaL
 zlJiYQs0p6SldGF3ahJia0lqUNQdPL8yVjiOWf40BvfTWiaNtb0Sk7Q+Gc8zHEpRLfNj
 nod+g5EAdtNfxWQ7KjC2JdvunIBczxLNnV+8oWTVCLQWSMTLz5kwlN7c45DOKUIcdgfj
 rsbVKEJ+4HQFFz9EZG9UAlQdhl4WG3YWuhiawrB7M1Al9sRKz1hTDi67t5TiftuL/W31
 +4t2dlDNNSvfKlDwvw8yqwWaIwxTETsFuMZT20El6HLFe3+mLK2MLMxrYBmygCAw+1b4
 8NCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMZSp83foRiqDXz1TnBag6TzgEKH6Esm9BqvEOd4H7VfwAC7bIsC2z7EIwouvy8CV007+Ng/uWlOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYUQMhBu84u8v7GW6HZOn3PojPYgKBjLfJgPP1lqIRgLg6VMwh
 YYDFPtT1Yr4WjL8A6GdpEZdsRpwpxJhWO8PJ59W0lamJVot/C0uKXJM5f2fb8OppsaKM2zlHOpY
 2sT7itwnY4syxj6z21BS0ApGvbdFVzE/te3GdIgRopNV2aWRWpTO9PUZV7f0KLxtevwNZJA0=
X-Gm-Gg: ASbGncts6PYqZRvbY8PLU9UIQ7h3GBSiLx2eDVl/cJVQM2XB0R8qiCLGBaHjMuV22o3
 AYQ9VCxuQDr5jtBEUiB33e3CpV4IqJunMF4MSuMi8PVn2cwCG+dRABhxpKRvIlhcFY86J5hWgDa
 6WSkafpvTXRv9dsqDeD8ptGMACb2S54+/qaL2v7jp8gTA1LK0Ah9J4MC7cfDrq+5nhDmqaOEACp
 hQ1+HJpqYjo/1RumczSmWDHEQ7kPfsjyWD25CSyAbSjb2WuY5d9MOXe3k6dxjZ6en9qJPvD9qRR
 OiqiS0dkzZluKx9zvF7UgevBMZGzAEbi+9sVCRkXwwwWDSjUeVr5BOwZ4KVHNQZR7400oBUEc46
 sQXRbIcC4ApiNJ4AYhsz0ow==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id
 d75a77b69052e-4b495d11860mr13068811cf.1.1756912473965; 
 Wed, 03 Sep 2025 08:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3ugZbdxH7Mywin5NR6XHzSclz/+UkkqzuW+1UkBm9a3K2qRCxgaknMn8ihcTkzrrBdvAapg==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id
 d75a77b69052e-4b495d11860mr13068051cf.1.1756912473181; 
 Wed, 03 Sep 2025 08:14:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040a410817sm1034669266b.101.2025.09.03.08.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:14:32 -0700 (PDT)
Message-ID: <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
 <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pMY9Rdv2g0_IDJqfha4Fc50GYz5jOUE6
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b85b5a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=dNECfGFYMPGvbPEIsa0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pMY9Rdv2g0_IDJqfha4Fc50GYz5jOUE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX+OhOZpzpU2vS
 oNVdc0VS2Wh1YJilAwz3Y8DclCqAuGB8wurnWW8Qbd5kQnwyuWOwhC9pbi6tCY4qRmcErswP14R
 UlY3xxO4c08PHwez1EKmgQ+RQrkN6fJiscU1yRNEgL/hnQJcVAQFONjw+X/3Xw/Apt25KbnOhjT
 SHdT8V6AiVIIA5FHL+xM0XxOeIgqJbWc8AlDfz5mrB0vM/uvMHs6RlZPEIbGk9pvAduFnvSwv9A
 ZtANpPYanDjg+OU9QTj1JsF3JdnnrXALO3+qhaherhAK2WaFWTGTA4Nw07RJ70cdMq2AaZfHSa3
 2VOLQ4ajV1Hl/ubeh18JNx6SY/VMlb6rxTa33Wt95vr5heNaKyoAnq5MUYi4M9nTi8Fz1Dhe2ij
 0T929TDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>
>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>>>> SKUs have the same GPU fmax, so there is no requirement of
>>>>> speed bin support.
>>>>>
>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 116 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>>>  			#mbox-cells = <2>;
>>>>>  		};
>>>>>  
>>>>> +		qfprom: efuse@784000 {
>>>>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>>>> +			reg = <0x0 0x00784000 0x0 0x2410>;
>>>>
>>>> len = 0x3000
>>>>
>>>> [...]
>>>>
>>>>> +		gmu: gmu@3d6a000 {
>>>>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>
>>>> This bleeds into GPU_CC, len should be 0x26000
>>>
>>> gpucc is in the middle of GMU, see other platforms.
>>
>> This is not the case here
> 
> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
> registers directly from the firmware.

Correct, however this is only a similarly sounding argument - the DT
describes the hardware from the main Arm cluster POV. The GMU Cortex-M
core has its own address map etc.

Konrad
