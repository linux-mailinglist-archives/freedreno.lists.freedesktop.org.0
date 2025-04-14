Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB72A87CEA
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 12:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC7210E53E;
	Mon, 14 Apr 2025 10:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGFWwjQa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CC310E560
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 10:05:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E9A13L029090
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 10:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UMvb8N95/gaSyVsSWCc3DQiAI8CRlEgBC06NE46MZVI=; b=BGFWwjQa2f9cEjFT
 qbBrfWdM+RFdK0K9hdYfPuRteQ8XNaiYwx67b3Ohkbvu55nMDHsq/Vu1HliRSriu
 G8YP0GPLDLIhb/pRr+RCG7ds+150Bmpj6tF0j5w3EfAUhGu1egHaUHu5o6JwgAsW
 EX0UNu99uROjyJlAnmg5ljh5DGJOE374S2ttB89cFaW5GNlrnec2iQX2TZUM9LM2
 vVMbxndBqfFYBx/4KJnmDmmcAqD9aVQ2xC9+aA4aCFwbA/GX40vp8Gn9A7FdKEYD
 Wwz4eulHTX7xCMDig8iDUl0dMS54L7mummSuDy6dnWbx9JFL0RvvwLZSoaxe3BJ9
 BsFp/w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs14678-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 10:05:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6eeb8a269a7so13196466d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 03:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744625134; x=1745229934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UMvb8N95/gaSyVsSWCc3DQiAI8CRlEgBC06NE46MZVI=;
 b=SgpyORLuieP5jWRIPolSpoCwiP+whZuD2Zw0V8V0EJW/0KLWIZXKhDhjHhPwUvJjWR
 DvhyymJJCywup2Af01FKve2Ro6fc5Ij9GzMGF7Usow81q6/vpmBhobZQG4rBZ++7BWA+
 Tm0EUXT6RKdAkCvbK/3bcbNvCnsIS9viO/ztghOI8gERLtp+fcfshFwo63jaFct/+ItE
 2GKqAOfPkBhkd1Q7cyQ3b6Wb6zdiL+F8kvq2D1XVhXB55sRBfeG720SnYw7IGHlyt3wt
 LZVVLah7WqrMVg0rMtg+V//9GO07uQZrTGncz5P2p3x2+8iGSM+om9Dq9/gkwPdN9EdJ
 Z8Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5f7J/Xt8yhDeHvZcfoPan05MeVdTCP+gwsZRTvuk3KwJ4M3a9Id4E4zo75sFYTARD+aMYpjst8UI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9vwSZhdlQxgYH1JYaLI0ILxYIZVfkpD7S3UN26Ju40y3ugGXd
 /TV2oRrlKIKeXmEM9h51+83yCQEx4mTYqFoASGvhJljvBb3bseBxB6gqoVVwW8e/tKNrlgZQSt4
 CsKdlJaICdtGXlSZ++/RNHEdyHn2p8StOrmPo/shsMal9jNHQJldVhvUj9YNRR7J33u0=
X-Gm-Gg: ASbGncvFS1tqXARyhWwQ7iFp+cvf7uyxZTXxB6vSmucEeaIid9/Yl7m4Bhvj2Ogh96G
 ZFyKUiKLX0ZNbTnP2K3F/PyScDS400bh6A72tWo5z9t/GFRGdIzr12/PpVYG/4GuUZzCK4JZCjU
 6jZie0OHhKUrQh0O9p9y4z0gl1OvPfcC3+q4zHEprW2/7Ax/IeqYwX8cCsat43vxT4BXQxagrgw
 bEauVcb1EIKclGqIrnYNp2uKSYpAnqYG0I25Jyih3RxD8MzSl0Vp7N81xOTALXU+nHxBltBk+I/
 kCsIOPk/FWy9PkGHT2Voogj/2vYtXc3dmpXmiwrj5Z6SG8mzW5ha9VOvZCbouNDY1g==
X-Received: by 2002:a05:620a:3197:b0:7c5:8f37:1eb2 with SMTP id
 af79cd13be357-7c7af113d7bmr603260685a.9.1744625134296; 
 Mon, 14 Apr 2025 03:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmBUa5andw4pRRHVYC8/NGtkbW9c5vRVpeMF8s8vhz5E8trZWGxeC/sN+v6rRNhzWhNX/m+Q==
X-Received: by 2002:a05:620a:3197:b0:7c5:8f37:1eb2 with SMTP id
 af79cd13be357-7c7af113d7bmr603256585a.9.1744625133674; 
 Mon, 14 Apr 2025 03:05:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb3120sm868414666b.1.2025.04.14.03.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 03:05:33 -0700 (PDT)
Message-ID: <691a2358-bf5d-4f03-ae2d-97fb2e40952a@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 12:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
 <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
 <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
 <wzqct2y67h6bkazxv3se77slsheaw5rspgcrcfjm7ngr5t4alw@nktpqrt5woky>
 <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcddfb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=ovN_W45TYzZQxDyi82gA:9
 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 797b1RYKQv03DRNUlKoQgXgXFiM60O4R
X-Proofpoint-ORIG-GUID: 797b1RYKQv03DRNUlKoQgXgXFiM60O4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140073
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

On 4/14/25 11:56 AM, Ayushi Makhija wrote:
> Hi Dmitry,
> 
> On 4/11/2025 1:31 AM, Dmitry Baryshkov wrote:
>> On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
>>> Hi Dmirity/Konard
>>>
>>> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
>>>> On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
>>>>> Add anx7625 DSI to DP bridge device nodes.

[...]

>>>>> @@ -517,9 +548,135 @@ &i2c11 {
>>>>>  
>>>>>  &i2c18 {
>>>>>  	clock-frequency = <400000>;
>>>>> -	pinctrl-0 = <&qup_i2c18_default>;
>>>>> +	pinctrl-0 = <&qup_i2c18_default>,
>>>>> +		    <&io_expander_intr_active>,
>>>>> +		    <&io_expander_reset_active>;
>>>>
>>>> These pinctrl entries should go to the IO expander itself.
>>>>
>>>>>  	pinctrl-names = "default";
>>>>> +
>>>>>  	status = "okay";
>>>>> +
>>>>> +	io_expander: gpio@74 {
>>>>> +		compatible = "ti,tca9539";
>>>>> +		reg = <0x74>;
>>>>> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>>> +		gpio-controller;
>>>>> +		#gpio-cells = <2>;
>>>>> +		interrupt-controller;
>>>>> +		#interrupt-cells = <2>;
>>>>> +
>>>>> +		gpio2-hog {
>>>>
>>>> This needs a huuge explanation in the commit message. Otherwise I'd say
>>>> these pins should likely be used by the corresponding anx bridges.
>>>
>>> Thanks, for the review.
>>>
>>> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
>>> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
>>> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
>>> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.
>>
>> Please make sure that there are pinctrl entries for all pins.
>>
> 
> Thanks, for the review.
> 
> While declaring the pinctrl entries inside the io_expander node, I am getting below error while checking the DTBS check against DT-binding.
> 
> Error : /local/mnt/workspace/amakhija/linux_next_11042025/linux/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: gpio@74: 'dsi0-int-pin-state', 'dsi1-int-pin-state' do not match any of the regexes:
>         '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+' from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
> 
>         io_expander: gpio@74 {
>                 compatible = "ti,tca9539";
>                 reg = <0x74>;
>                 interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
> 
>                 pinctrl-0 = <&io_expander_intr_active>,
>                             <&io_expander_reset_active>;
>                 pinctrl-names = "default";
> 
>                 dsi0_int_pin: dsi0-int-pin-state {
>                         pins = "gpio2";
>                         input-enable;
>                         bias-disable;
>                 };
> 
>                 dsi1_int_pin: dsi1-int-pin-state {
>                         pins = "gpio10";
>                         input-enable;
>                         bias-disable;
>                 };
> 
>         };
> 
> I couldn't find any devicetree example of tca9539 which is using pinctrl. The gpio-pca95xx.yaml DT binding does not match with any regex of the patterns properties.

It looks like patternProperties should be extended, perhaps with
something that includes pincfg-node.yaml? Krzysztof?

Konrad
