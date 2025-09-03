Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33FCB4258C
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 17:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8413010E8C9;
	Wed,  3 Sep 2025 15:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRKl18PC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5227F10E8C9
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 15:33:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqxS003473
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 15:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 18o1iHxtl5lTw0Ly+5dz1N5tWp+vbDygIfwrS6qTOYE=; b=mRKl18PCkjiiZrjF
 RK5cDhHOTeFBUGNaLF50985gAUPoKy0UxpWGyefJ/sIymAFf9WdrsZAvBGysKlZL
 ogiYrL67EsG/NDKsyv2D/2YyeA8ZAXXglAo1vppSAZ4KMdVWXVzZP0uFT2kC9njE
 QJkiDe9jZk+J7xcYcUwICfIwE0lMk4sXFh/gXB9jrJMF1KyDr/qu4UlqyRQ/STiQ
 rVh6q10wu9HngwX5Ir35vQ8xCcVWY4BM653n4wK14w7SvJOmJcT75oD6f8ey23UK
 SyGxuNtnf3SMY591WQwDVi2Ng2a8+Vieb1aWog1FVGfwl+yldEo8irqlQUxCv8jP
 Sl6RJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8v4py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 15:33:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e87065670fso1153485a.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 08:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756913627; x=1757518427;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18o1iHxtl5lTw0Ly+5dz1N5tWp+vbDygIfwrS6qTOYE=;
 b=p971E4J2kUnLXMo+WztUO9maKEdV9dDWKcShnPb7U9ExwixReKNz+jWOK48RYU81o2
 0gsA08Ak1QGmIJY/33jGOGg45ZP53mB4BaRgAHdhK9HRtSegbepsHym0fV+9DBbDoITp
 6kUPMbQAn0yYfjttsg2r/ZzkKtwu5GyY3h5kwodQDxlCGWLpkyBYksJ3uAVtZF5gGdjK
 vVrGkUsz5fFfPFGWtgP+TBPGPo6sqiq25oigJcXgdB618ZsN8bR0kxamykshJ3dmfDAh
 dABXm+0gkstC+Yn486NTtHf2FieC5jWqH+SYhgcnfaKW0B/wrAC9xob0wdFE87aLKQDm
 tv9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW22mu4s4zawg5GV04zjJ/UhnWxszHrNG8skYzNoPNZDf5aofzimDP0//52Kzo6ANrlP09HLHbvCkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRGieYSoj32hPGPzyj+vPOUzUMTp0ugooYBDXGHmzBWpwp+nhR
 uURaGnrHmtqG6hgWc5OE5HvZcGIzGW1fIVKrVs01RKVtTii7nnCnz1azSUzkkT7JLYNJ8JgmIEt
 rZn5f4Pf3zH5/1OdRG6qQ5YtiGClxlueNRRakhrZjSXRLBvC2Ckw2n+4fmNbfGbkaNEOoRlM=
X-Gm-Gg: ASbGnctCzhq2Hn1XlbgIctxAQoFutp2cTGKab2EamChT0VFKLgvK24HTr8lv0uB9u5w
 1muly8UAEgBSWUnqr+MeZQdeIQB1mlXpKxc8IDFRGfeBQk1BGF60RI4w8WZ99NFdGzkKDP0WsDG
 zCvtr+joJ7hIIHKhSChv1dWQ9nqI1WxH8u0EkPwuOZ/H5mbcAYzxgk8gizoh9kVP+5wWbjMw6iY
 I2fuCDmgtffvT4A8qBjbHVf4dPThtegO7U4QuknXoL1rA37TwnLGvV0ICpt2ZWQXdGNVV/Gvrtk
 CODhHg5W2yE9acmKNGzflOG1cY69HJtjU/m6BkmAcod3/Yzcu76nccemIZQAlIaBlSSECMuwlUE
 YyX79X6piKVrN+KymZenatQ==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id
 d75a77b69052e-4b5a0fb5d27mr3956121cf.2.1756913626439; 
 Wed, 03 Sep 2025 08:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL1vuGWMGXs2GJGdTf4JnsvsnA4SogcFyon1Ve1Y6vNl70a0aW3lgP59SAzB8uqaJmkyQcnA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id
 d75a77b69052e-4b5a0fb5d27mr3955501cf.2.1756913625820; 
 Wed, 03 Sep 2025 08:33:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff138a8c1dsm1235771166b.99.2025.09.03.08.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:33:45 -0700 (PDT)
Message-ID: <f34c72ee-971b-47e8-8d49-6355b2660925@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:33:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
 <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
 <rfhqfbx4q3kl35ktzaexjjshzosv4a2tkjthtvo24aoisrdvj7@i63a55qx4mnn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rfhqfbx4q3kl35ktzaexjjshzosv4a2tkjthtvo24aoisrdvj7@i63a55qx4mnn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vbghb8QKy-IrDEj-eaEFm2jNit0iSUI2
X-Proofpoint-GUID: vbghb8QKy-IrDEj-eaEFm2jNit0iSUI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX0W6N0Bm1bp6O
 FzlC3rhIDPCKoretm3CBQHHHEwLPuOZU1eUcZqymrjoj0cnZ07OkkS5QNR/8P5+aY93y7udS8uB
 jI8h44h2LtaD8YKjH9Szg9TELIIEYQGmBvyUdZbX+W5OmctNKnu541izB5ZxBpPpnoAk839+8et
 BVO4sWLcgrImfDwfyo8fq1lqxa8/cOYn9JN0jCf6HkZ8a0kBlbreLzECyO9BODRV9cp3tndBbM1
 VcCW1ysykHK7MdSGLhQTr9iOp1cHctbAI7XfQ/bFILw/Ek6q/XCLO0Mw2EKaLZpqIA7zjnRx+7a
 nv3bXcexxP2/HSP1X1hD2EgVLQRqbrK5roBcYNbOoubBquYZG5WjlfTZk9HldxnYUxKSUitQmC4
 Z03AajLn
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b85fdb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xrVuZHS62xsaktVfuFIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

On 9/3/25 3:58 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 03:41:45PM +0200, Konrad Dybcio wrote:
>> On 9/3/25 1:58 PM, Dmitry Baryshkov wrote:
>>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>
>>> Update Qualcomm DT files in order to declare extra stream pixel clocks
>>> and extra register resources used on these platforms to support
>>> DisplayPort MST.
>>>
>>> The driver will continue to work with the old DTS files as even after
>>> adding MST support the driver will have to support old DTS files which
>>> didn't have MST clocks.
>>>
>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>> index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>> @@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>>  				clock-names = "core_iface",
>>>  					      "core_aux",
>>>  					      "ctrl_link",
>>>  					      "ctrl_link_iface",
>>> -					      "stream_pixel";
>>> +					      "stream_pixel",
>>> +					      "stream_1_pixel";
>>>  
>>>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>>  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>>> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>>  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>>  
>>>  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
>>> @@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
>>>  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
>>>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
>>>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
>>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
>>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>>  				clock-names = "core_iface",
>>>  					      "core_aux",
>>>  					      "ctrl_link",
>>>  					      "ctrl_link_iface",
>>> -					      "stream_pixel";
>>> +					      "stream_pixel",
>>> +					      "stream_1_pixel";
>>>  
>>>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
>>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
>>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
>>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>>  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>>> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>>  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>
>> Something's not right here
> 
> No, it's correct as far as I understand. On this platform INTF3 / PIXEL1
> is shared between INTF0 / PIXEL and INTF4 / PIXEL2. So it is
> counterintuitive, but seems to be correct.

Eh, I unfortunately found confirmation for what you said. Hopefully this
doesn't cause too much extra pain on the driver side

Konrad
