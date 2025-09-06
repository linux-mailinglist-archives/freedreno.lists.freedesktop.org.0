Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCEB4772D
	for <lists+freedreno@lfdr.de>; Sat,  6 Sep 2025 22:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC0F10E155;
	Sat,  6 Sep 2025 20:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pouNVh+O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4339710E155
 for <freedreno@lists.freedesktop.org>; Sat,  6 Sep 2025 20:56:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586KdT6e002028
 for <freedreno@lists.freedesktop.org>; Sat, 6 Sep 2025 20:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KWeNW4vApSp5Fjhfu882/TynnsrQdubrSOZdGp7Z6M4=; b=pouNVh+OGEzOITO/
 C2+htmLJcDpkMljryRhFF3jCT11A6chBEAfC9wZfCWBMpTotzZxpxo8cPQS4Mutg
 ua9xM/VsgUoHsKmmgjFtDNvdzSagwf4CStdvmYUj2rKHh3yYfBiA5ks1QCwhoo8A
 /XXGcbqspmUAxyS/wfi/NDfc8ubPhbaZMRmjUWc2C/YCA57mq4DPpHGMlVeLg4Vy
 pNbOeoPM7lyzIEqMXrpwc3E/uhVo2yV7LC82Iyn3ZyTbG8+rVNUhwiKoqZaHE/QF
 9vPAod/us/XXjjhgjpfKhKixXDPD/PFBA8j7rJcWEp+j3M5QBO90shOY2fff909D
 qWI7gA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db895sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 06 Sep 2025 20:56:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471737c5efso2286574a12.1
 for <freedreno@lists.freedesktop.org>; Sat, 06 Sep 2025 13:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757192179; x=1757796979;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KWeNW4vApSp5Fjhfu882/TynnsrQdubrSOZdGp7Z6M4=;
 b=O4HIDmzux+K3JO+CnQE+dukXZra2JEp2YW4XoVjdcjY8M5Pt09MqKf+Dj2bC+sG87c
 gUQ50opKss//bTDJkkiriC/1+IJODaHcfVd3okeiebmDzn/4weRTV5aE1y+xk0/4zGSy
 r2mg5fs534AWBiyl1ElQ+G5ZA9y2OmFNQ4II851HLqpp7MMwWQPmVt5kdJ6zAdeVHpLx
 EPoUWzjNq7jW+QW2B7JJ95Qo1C14dtGpaqdmTXOJRz0oHPiNC/I878ECSmMFkqokh70w
 GPnuwYyYls9AO2SazzEguRkGGZ9yqVFdft9HGb+zUtVmfsIOISQZTpjAnA04CLCT61/J
 oUrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0+ZOJDGhX3/C317zCiTXZoF40rYAJSDpIXjlZwN2x5sCor3FHjIc40l/1pH2do3t635eviq+trNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNA6ubrBHlJ1CRGdaIJDb4ny4rXg598rektyBebB+w+FVr3PRz
 aloXTz4MdhDQpQS+hCgpuKj7fK0SPxhFJn9AdUlAxCyjCRexvo5+X+b9wNTIO4NBI8L1FIJFEJ3
 0ZB/DOiqemVNsHcyDjTaD+XoT9DyAssdK40qAwyRGp/vJKDc3UGIoZIJ9GuvrScF0tvBTDgM=
X-Gm-Gg: ASbGncsKDY63DF0hW2jcpenQNAlLdrb/nh0IP/fj9KrnDwz5Oqd5HFYj29lWjXXJB1X
 4N+yIJX/EMZDdlafxjyRQkssFrsolip5ZK9VQH9GkAWu0NavuFrV/g1t60OXPGxzimQ/u8ObDVx
 gDipe7JuKdRp3QugvQyF553DfcEHiO02bFRGvTxRubHqr7vQGQIg15LCBSEWpXZWDpZrrDLckAQ
 pVXK2dTlMAoR9OyWZYuT0Fa32IjXZa66BbNlPSGdyasjqz8s65fG9DiLR0fxT2V0iA5xevHh3BF
 RfDqETu9PTkCXsio9g1Z38tvUea3b1xMXQYbMvnc2v2DPtofEoxk16WdGlKsM99c
X-Received: by 2002:a05:6a20:734c:b0:24a:69c5:e9d9 with SMTP id
 adf61e73a8af0-2534557a858mr4403388637.39.1757192179034; 
 Sat, 06 Sep 2025 13:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSFjvOo/qTGxHXp3wiVQKj7HoGwmGtWzfJpDenuCSbN2DKNJDPXY8f/qc5OOKz5fQQXodCEg==
X-Received: by 2002:a05:6a20:734c:b0:24a:69c5:e9d9 with SMTP id
 adf61e73a8af0-2534557a858mr4403357637.39.1757192178483; 
 Sat, 06 Sep 2025 13:56:18 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.231.120])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7727822817asm12558174b3a.98.2025.09.06.13.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Sep 2025 13:56:18 -0700 (PDT)
Message-ID: <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 02:26:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
 <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX2ZlQxr4IunZV
 cM22D7tDXMR5VcN8J9mXmhhBzQr+ZYjtRhclEsa+VBLb3A/CN4xPEoecr0xVCfXg9hCz/hnQ+Ur
 Al/KUnrkhAkiu+tvJM1IRsxWTf/WmZeAiqhBxwOmdQ00QITvzy4ii+DflHw0+iu9mc2fqbgAsGT
 cWFKtF7aPSlmJWTWNl3C4K42BBW0wD0fUQezo5CugFmnr9OM1Y68egonhQJtlEhoLzfj/4WiX2b
 xrTAlDy5wRCrfMeBRrDbkGd7qe2HhoYZBomaZYU2fT10dxZuQmPxlJOY0TjRDOnuYNlEe/Zvnk9
 wt4yeMWovdPelx606g94m00LYku5pRSZtBUfAbrevjYaUK4wQNf4HX+m8u378wHVc/1ZnML4bD8
 3vnhGNa7
X-Proofpoint-ORIG-GUID: CNxq09ForGhK0DnO04h_2fGZRE8wZudd
X-Proofpoint-GUID: CNxq09ForGhK0DnO04h_2fGZRE8wZudd
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bc9ff4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=LaKoERy2ZarllCCVqnwusw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=fXDYdZQTyQKxOPRIeewA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
> On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
>> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
>>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>
>>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>>>>> SKUs have the same GPU fmax, so there is no requirement of
>>>>>> speed bin support.
>>>>>>
>>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 116 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>>>>  			#mbox-cells = <2>;
>>>>>>  		};
>>>>>>  
>>>>>> +		qfprom: efuse@784000 {
>>>>>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>>>>> +			reg = <0x0 0x00784000 0x0 0x2410>;
>>>>>
>>>>> len = 0x3000
>>>>>
>>>>> [...]
>>>>>
>>>>>> +		gmu: gmu@3d6a000 {
>>>>>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>>>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>>
>>>>> This bleeds into GPU_CC, len should be 0x26000
>>>>
>>>> gpucc is in the middle of GMU, see other platforms.
>>>
>>> This is not the case here
>>
>> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
>> registers directly from the firmware.
> 
> Correct, however this is only a similarly sounding argument - the DT
> describes the hardware from the main Arm cluster POV. The GMU Cortex-M
> core has its own address map etc.

We have been keeping GPUCC region in the GMU's reg range in all chipsets
for the purpose of coredump.

Can we leave this as is until we have a mechanism to dump these into gpu
coredump (via gpucc driver??)? I recall you proposed something similar
sometime back.

-Akhil

> 
> Konrad

