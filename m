Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB32B41C5A
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 12:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB5310E12F;
	Wed,  3 Sep 2025 10:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL9JUpZ+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C0A10E12F
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 10:54:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583A4fJ3018535
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 10:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=; b=XL9JUpZ+VtDwPbNG
 R12bsrBYQgiEvFwu7M6IkEk0sHMwzQjPhmsvgvSX/rcv72V3Xad3TjVc4xMZFrrF
 ly+LStev01TlDrXqB3MUO8ipPdmAzrtcuQNmRAAbaeDH/pryFP357V7OITcmz8JU
 3vIpsQjTkFotg5EFcDTtAnwa1k5tvD5FVya2qjvL0oJXNtxA9FBg/eTxEQsTN6Eb
 yOTX7AI448QwROoEYzShuS5QdElPe1Yu7fjJWYMf37V9K8cW4eGYazkhN4NMIrrc
 yREXPskGTy6/7D9GWSAiCkdz57G50OTIGECgZ07VMftIU4bGD/kgJ+I530QXQiiO
 6W6O2w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwd294-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 10:54:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-726ac3f253dso697716d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 03:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896884; x=1757501684;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=;
 b=U2CUSNQPrkKIhVoxT/UY9H9yt3PbLmirpOodqnXR3URDDZvCxMJIK87ZZZnevAMIQ7
 wOY+JQagkrqv5bzGmXnJoiCM4k+ecAeFN1tv9ga2ypXt2MJdd20bTywMT9jKHqubaq/e
 ZO3q+S9JAlZPmLSIE82C8rUQt2+gnymG59Cbzi3NvV1+ojBfXwVCuAP8tw68fdNTUc+N
 Qx1C7UOcsxT9QBrUDv5jfGVK9bq7KuM9mJ+6EyNm4khxxYhYghgwZkgUCqbTovUrvHod
 z042R+iGe0YIyXRC3btGAZwPRrZEIEt6wj0VwToIlfdJjJI6aKudrzBT0JulS7YmjIMm
 dxwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUTLyIAsoqt39kH3JkQimbl76oj7cmNrS0ENvg4KU9dPDgEU2khe4NWU1q0IPGmhNkb3nPSWpfTcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyngtmaAX2Evqeq4/37DYaQkQ7UveDEsENaxHmTXdUKEaexPHrK
 DrOeP0FLDv7vYAjyCewUBM9QYbohvW/C0ZUOmvj2tBX48Wa52JMGoxPBYJIEKExTqEIZ4zD+SsV
 IX0E7kRhSL78DYZ54020mkrVVcewGesdQtWSxRRyDEU/3RNfXHdLTb8smO1y+/64ES39oGYw=
X-Gm-Gg: ASbGncvXzaT2lY1h+gKSbwMSLGq0pvfk+C77mWud6/OWE0K/FceOauWDfRdmq7qe5uZ
 QRxZM3xZa4VX59q5nZOsvm2MHDEW7KvtpzV+y8Pf+FU1TM6IsgS+MdaM6k8uDUbyA9IuwQYh1h4
 vUIzu8+TzUPBZ8dO5txwGw/lllogeTk6B8hfJSm1aS9LiXTDj9DWUVPzP78Rn63L57HyD2Abjev
 qLbI/5KKhHbmUOxjT3ls7WoR/50C8MlX2c6MipOAs7/OLwTivuNoEomaQA8IJbj1q8iuHKiYN0y
 EkZqOxHOHU8L7depLYXlNrsbkwQ3oPvob3aQcql5Eg/7f3TbU6w50bfRbQUNOlkeN5Ey4tyIGjp
 0I6NqJprH9jI4mB7LJXgggg==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id
 6a1803df08f44-70fa1d92d30mr148150566d6.4.1756896884426; 
 Wed, 03 Sep 2025 03:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEetDZkFBnEZJ/kKVop60xaty004rw6FYmAAfEqO0MuEDwRglU3hRd6MaQX/oR3QxdMGUb85g==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id
 6a1803df08f44-70fa1d92d30mr148150266d6.4.1756896883912; 
 Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ded4749aesm7462141a12.32.2025.09.03.03.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Message-ID: <6083a6b2-c5cc-41f0-8026-e022f2f4eb38@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
 <67aa2a1a-3adf-4c97-a7b8-865b5ca3b17e@oss.qualcomm.com>
 <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX4x4L84vrCl4w
 QLeuhZ214GD/srhdc2detVlFPXIttYI8pU6WrNIYicO3yIZEw53HBwdDwnivy0+5Y0LOm3d3NiX
 rgu+tZEYXskx1KwnruiV6frOhuAB//zEDZ8z5zsgtFJuo/yfkEDzCAC4olYXvFSI43TQYEyRz80
 IJHrgZDoqEb5B3H78NvsmJSSz+AZFKz+reab89hvjuMWdaLb4xgtXxOdM+BGcwLlTjvjj1gxV5+
 7EA90MnXzsz2V7NL+JmKJogFlkqeqZJ7EoCkymFHhbDL1xmceMdFU8R2vAPioMwDypqiXF1xxIG
 HXGYpHB/tBRUo4snAck22Qi3quuI6GRvWURSDKfJyeoQLc4HEpqfY7VMxeNA+0y7kxC8s6jQrZW
 OrclrYSM
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b81e76 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bBqXziUQAAAA:8
 a=OuZLqq7tAAAA:8 a=G6GrHqeLqaT2Jh2KzrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 0mP1S8ACiJZroM3qMoSGyVUCK0lSfLzV
X-Proofpoint-ORIG-GUID: 0mP1S8ACiJZroM3qMoSGyVUCK0lSfLzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

On 9/3/25 12:47 PM, Barnabás Czémán wrote:
> 
> 
> On 3 September 2025 12:42:38 CEST, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 8/31/25 2:29 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>> +		qfprom: qfprom@a4000 {
>>> +			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
>>> +			reg = <0x000a4000 0x1000>;
>>
>> here you reserve 0x1000 for the qfprom
>>
>> [...]
>>
>>> +			gpu_speed_bin: gpu-speed-bin@601b {
>>> +				reg = <0x601b 0x1>;
>>
>> and here you make way for OOB accesses
> Ack
>>
>> Make qfprom length 0x3000 with the current base and the gpu
>> speed bin should be at base+0x201b, I *think* (the docs aren't
>> super clear on that)
>>
>> [...]
>>
>>> +		mdss: display-subsystem@1a00000 {
>>> +			compatible = "qcom,mdss";
>>> +			reg = <0x01a00000 0x1000>,
>>> +			      <0x01ab0000 0x1040>;
>>
>> In v5, I pointed out the size of vbif should be 0x3000.. and the random
> Where 0x3000 is come from downstream is using 0x1040 for vbif.

Hardware documentation.

Konrad
