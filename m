Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1042CB493BC
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 17:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF31310E17E;
	Mon,  8 Sep 2025 15:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kr2tOBst";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B263810E17E
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 15:39:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889PRvp005837
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 15:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9ix8Lxn9DP2aA0chOL91fW2+iXcks/DUCOCWwGLcOgI=; b=Kr2tOBstZ6FlTNhO
 h+ImuNoASmfh+AhJM9R4LNr1x87C5DPsXFQIwrrXGYlGj9O9/ECKXyEg0g84gRev
 7L8F/8LVRbJuOUv591x2ewQLznBtxspvcp7r2Edaq9Z3xNBLvwhxkc0nupfHMCFW
 NZiLN+Zj2nhn+cqfK1/1+OFhXHokjCmM3a522MndM8IqbRJ2RZcSXwiOlFQmkPva
 VnV05oxNXhw157PBFwTgUbys/c7ixabSE8pE0GzmFLDlAxGyRByhgBvNFY+otpbW
 uuZGfw/DqxL6PyYQ4sSDtCybmI4OxX3CFcfyxZCixulNEAGa3stSv1+HAsRWJRuj
 hFsnpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kvxe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 15:39:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b613a54072so1789351cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757345950; x=1757950750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ix8Lxn9DP2aA0chOL91fW2+iXcks/DUCOCWwGLcOgI=;
 b=Dc1eoUr2Iu6QYvD1wwd0UULPU8pkpI4ljFPrdZnuAD7FLXhxE4c/FztaKes40Y0zo9
 uowy2Bk9Qdbrw5sg8wC8uweTXh90bfpUIVPMj3+ZN00kCQtrkNrEjQX5h/nVAqG12iiT
 pCC+um9yuUYw+KqAj7acr+QTG8HhRZyMbg1wRoUAr1vWN82sJq16P2xPvufgwLN7P3ZV
 4/tga05OVrdLALJt8v7b0I2i5fTM7uqCeCdPsvo86HAlzrjQhSzPi9gDF1E1UALAjLYY
 waLThBlioxfm335LKyRmyAfv/vLEN7mpcUW6HYIOUM03hx825h222MJwz0NHH3+jkIK9
 i+Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk5y9BODj4D5jyFArx3/aGE6tuxbjVGwMiLfFmZHUjccI7lp8ruLXbHbk96qkF0ngizT7QvnKGET8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye4A8CCjHPZehcGro9S0WEfZbTR+arhVAqTog8ESci+EQD7ZQh
 +eFMXF1VX00oPLD1UBh6D7ec2YsGvmh7MaQHyI9pM7fWDbNsDfQGFTp7C7EyNwp/vvCkyLspIXX
 hwJorrLz43pTfdW+eOrdkyRcaijt63qvs2eucz1o4NXC0w5MNiHHDIXSjNXILUHD3g97Hxmg=
X-Gm-Gg: ASbGncsgKC+gyHoq4sPjWtg8BHAoLzkZ/wUnCqYVdVrvTjQJwYsH4YIP4FduhV6j4jO
 V7NGLgSZWldHb2bWqO6u/PE+k84n5Ccri5wC8cPXxxBU97uV7o+U9eKCnZgL7oDUETGzJeEppz5
 NS3nhAyOS4tTYgArOYkXlFb7cVM1iXdLbwMGH/WnoRBR8hBl6jZ75LswIQoxCHsLi5iWnfjqcRs
 uBjT+MPjyyEzloHEHQn0qkJwCFmUOkKyZ0rcxyGW8zzBkm/QeP5b5uchV5rodpGP3G2AlqoS89H
 kCycoVTGQqGVv92H+BaTceZRKllS/eqBn7CUCtq5NjWBux49yB1pqnS+ai4vjiLhO/P4bx9AK7X
 +Y3VsTA0/2gIfeuKcKKs8gQ==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id
 d75a77b69052e-4b5f826059cmr55448981cf.0.1757345949563; 
 Mon, 08 Sep 2025 08:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSjAuw3MqqByPMWEwcaVGXJrt8t0L5vdGx6BjurjDCr+ZzKHljYEOvuS1tfcYm8a1jnOKGwQ==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id
 d75a77b69052e-4b5f826059cmr55448481cf.0.1757345948792; 
 Mon, 08 Sep 2025 08:39:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0423ed35e4sm1961096966b.25.2025.09.08.08.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:39:08 -0700 (PDT)
Message-ID: <5bbe77f0-185f-4905-8097-8769f0d5f518@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: rob.clark@oss.qualcomm.com, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
 Dmitry Baryshkov <lumag@kernel.org>,
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
 <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
 <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXxvmeTSz38bYp
 Vipi4UwKxKq0AckShcnpxsUOmV7L7SBJ4Um4Gf1Xs2juibvHw3f003LvCbUgioLJl8OhkYDvz+R
 v0alPBWXKb/ItOF5RBB+Cy0YIRBfVgZhCY9jceX1Mhy/SWGyRUFM8pOrzRFdXXPIM+NKqJGyEj5
 W+dtEOFBLLTjZjTo5KIzUkGNuaMTV3MOz+0XN+6l1Lytj4aa5tnnFNirBahRUQXlPD74y6nD5f8
 Lv+2DgvtTqEyUEPpIjWcwBJ1n4yJVNrgYQGRVi6uqjWvz94bUi/F4MNYD6dIDPT7yK6crs/Zp96
 nF4KVCxqYnFyB8IbCA7RPvzGm+bmUXLNqVGeYl9VX5PQg7w/hDYC7PusInra5vvXtEhCFhgzcOw
 sy8oTAXU
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bef89f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=am1a1fgwjgo6KoPeU6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bhyz_Jx96MHWeRf4icJmYfsbOTp1T5CV
X-Proofpoint-ORIG-GUID: bhyz_Jx96MHWeRf4icJmYfsbOTp1T5CV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On 9/7/25 1:02 AM, Rob Clark wrote:
> On Sat, Sep 6, 2025 at 1:56 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
>>> On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
>>>>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>>>>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>>>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>>>
>>>>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>>>>>>> SKUs have the same GPU fmax, so there is no requirement of
>>>>>>>> speed bin support.
>>>>>>>>
>>>>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>>>>>>  1 file changed, 116 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>>>>>>                          #mbox-cells = <2>;
>>>>>>>>                  };
>>>>>>>>
>>>>>>>> +                qfprom: efuse@784000 {
>>>>>>>> +                        compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>>>>>>> +                        reg = <0x0 0x00784000 0x0 0x2410>;
>>>>>>>
>>>>>>> len = 0x3000
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +                gmu: gmu@3d6a000 {
>>>>>>>> +                        compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>>>>>>> +                        reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>>>>
>>>>>>> This bleeds into GPU_CC, len should be 0x26000
>>>>>>
>>>>>> gpucc is in the middle of GMU, see other platforms.
>>>>>
>>>>> This is not the case here
>>>>
>>>> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
>>>> registers directly from the firmware.
>>>
>>> Correct, however this is only a similarly sounding argument - the DT
>>> describes the hardware from the main Arm cluster POV. The GMU Cortex-M
>>> core has its own address map etc.
> 
> but the firmware is part of how the hardware appears to the main arm cluster
> 
>> We have been keeping GPUCC region in the GMU's reg range in all chipsets
>> for the purpose of coredump.
>>
>> Can we leave this as is until we have a mechanism to dump these into gpu
>> coredump (via gpucc driver??)? I recall you proposed something similar
>> sometime back.
> 
> IMO we should keep this in the GMU range.. if in the future we have
> some other mechanism to dump gpucc state, then for future platforms we
> can start using that (ie. new dt but old kernel should be a thing we
> at least pretend to try to keep working), but for current/past
> platforms we should stick with keeping this in the GMU's range

Eh, right, sorry, we discussed this with I think x1e, let's keep it
as-is until more infra is in place

Konrad
