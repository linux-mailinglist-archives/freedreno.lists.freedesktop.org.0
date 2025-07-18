Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE76B0A883
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 18:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C807710EA0A;
	Fri, 18 Jul 2025 16:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhoaoNzK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A221710EA0A
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 16:35:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IE52cn030393
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 16:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q+FCv7HkwD6+qrFx4kTNaSBcLmg/tHCCS9wRamsy6PM=; b=NhoaoNzKSJU1Akcb
 QtiQNFpJMZD21756mfUBQAbmHsGDuJOOVt5QHyZwjUC1BVpsEJdMjy9gCaZNN+6R
 /RQhNTSZWpz1tBhS2GW7aEcCG/EFLqVm1q1XrWCrFvB0wj1MI8ZRr4ZHFwpuGIZi
 XNyFana8doVObDCYZSaP+1OyaTWIVDzLgiY2Fy8JsCnLMLB/svOktAjjG09rRVBw
 /bbCTw4QDZ63qCJZxDLIXSswxIZeJCFnnWqEIcyhB+8q2xacx4tNcKAA/w9zdWsF
 cCriHqV9W+nq8S8IPBx1tpYY2pHe/VwiuTQTmseCQJeirccRhxquvwMa07yb1ERl
 ZG3y/g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7s4a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 16:35:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74d12fa4619so2119478b3a.0
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752856527; x=1753461327;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q+FCv7HkwD6+qrFx4kTNaSBcLmg/tHCCS9wRamsy6PM=;
 b=LB1L1wt3XrF3dJ/VLLJXk01q/TSiNsjt3vVK+ipiVHopKegFQn3Qb3Wvipt8y7+ToU
 0BacBICbC4gQSW5NZcX+iCtWYS60NPDnc7FeAkK7LPD5c6MYgexaZM3YEG6CtNnyEyV1
 V9GCQc3BtJOudt14glSup+7KKY+3vsJUFidkggT/k31pzou3c6zBiOqglZBR6j6VZCpU
 JsvKM4r9T9i7jlPB+AqhFK1BoxZe00MNPfhXDcgM3KPAT79gMBJ9Y8y3Xg2GBB1Dw9US
 s/y1lidy4L13NPcAl9svwUfdjZsmTwA0rN39YvS5w4SE7PepGUxf7LFMVabpPBEf706i
 O0tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5U3Z20UtTj7dWj6wABtBDh27GqVJZKH7exz8f7EExMbGPZmJTdd31A8VE8TyjU8byJN7nDJydmwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNIKREOj1JzbePyo6dfe+g7xJCx3l0O5X2gqR3M5z0YCwir2Jw
 Mymnhqju4YwIlKnJJT0wEioGmGr5XiWKRkD0PucnA1gIIB2XBamosHpr0XoqBRQe/xYQ/0r/dhy
 WVusqr3xSMD+CGDh1bVhpws+MhC4jAGDhb58LprM1+nTFmKiNx9KTQ0BTNex9nf9J5Y5cJHo=
X-Gm-Gg: ASbGnctxK+krxFZ476mS/WRD0gPxiiREv0gMvM/oEwMCAkFjLR2Y0ru65zUYrGPuZb3
 53WikTOCwiVZpNP5gkzQYUuUc69hWQ8RLCoRFC2b5GAAuhy7XKyWP90lOHdka4DaR0Skpz1tpE8
 CLd6crdziHwWlCk8GYbBygonk87QfDStnB84UzQLpgcbe0JKN5bWS3f8P470CMLq4kXb9l3dWSS
 vPYmApk6/oAIRFTtpuZBhTDZ7TVXqNwXIc+i3iT/Dq5ItCrNnigzB0Ck3rbvw6gGBi6enwkbL60
 PI4qTeRDISMs5Og+Di2+jZFvZ99D4Q3L7Mtlh/dv7Ty/MRjAfcLd6f7HHMOWHVszmJM9kV7wLXH
 X9w47iKhJZMnF5y4mwX+3jA==
X-Received: by 2002:a05:6a00:928d:b0:746:2591:e531 with SMTP id
 d2e1a72fcca58-759ad3fd6c7mr4875788b3a.12.1752856526709; 
 Fri, 18 Jul 2025 09:35:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpJdGGb04b1zgB3LYTPMKEjCApZSDmJlhHnLK3elKs2bYz3CTwcGlcNi4RQNCJ8k70hGHcZA==
X-Received: by 2002:a05:6a00:928d:b0:746:2591:e531 with SMTP id
 d2e1a72fcca58-759ad3fd6c7mr4875709b3a.12.1752856526010; 
 Fri, 18 Jul 2025 09:35:26 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb157b49sm1516420b3a.96.2025.07.18.09.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:35:25 -0700 (PDT)
Message-ID: <12b8b26c-f0fe-4b83-916a-7ab3c466c269@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:35:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
 <5647urec3xivzw6jbkrcomizkutryte6l4uskiex7ji4tqnmxy@prjrintmtyyk>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <5647urec3xivzw6jbkrcomizkutryte6l4uskiex7ji4tqnmxy@prjrintmtyyk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyOSBTYWx0ZWRfX4nC/r9wq4n2Z
 p/CIby+zfwexZ+t56hz272pfvMbUVohW8l+HjpkDv0XBnvndYP8E/zjvPyh4jxtbtJ8/vJI1W+o
 ZmFwXS8OPZUQKeTFwU4eQyyYOkoPQohRhTI4BeiGvQz4/tSDlIzGHWKrZw5RyGA1Wo4E8ws88Hc
 6QkfP6PPsXVmR7GuTXFgj0ZqvnS16k2Pkp24hr4PuT557Q5mMw3jD65xQCiKLvznkMr72H8f8L3
 cVIcP8L+/3GBSrZjUgXtnCnCdh9nKUO657cC5Yg+OQMtDqhMs3ib0xEKrlHreCQ6Yq7k40lGcGW
 6iO3Ed/SxeQLOo9imNA61pQkqJIjtIVAgCmWg9oPFrf8+M+lRZfSkYYyQkheISrEXp629ZFmHt2
 m9LSh3mMwq2cA94f6kpQmUIA5q5h+zIFhfNYuQqdPFKCtO72Ro3AO1L2/YoIcNqSKy6bxifI
X-Proofpoint-GUID: ZtaiVO9QiioJg3AVTNeTmGWDs1ATW_kD
X-Proofpoint-ORIG-GUID: ZtaiVO9QiioJg3AVTNeTmGWDs1ATW_kD
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a77d0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vsadNqCes-IXc-NRwyIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=786 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180129
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



On 7/18/2025 2:20 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 04:28:47PM -0700, Jessica Zhang wrote:
>> The following chipsets support 2 total pixel streams:
>>    - sa8775p (on mdss_dp1)
> 
> Uppercase chipset names.

Hi Dmitry,

Ack.

> 
>>    - sc8180x
>>    - sc8280xp (mdss_dp0-2 only)
>>    - sm8150
>>    - sm8350
> 
> It's very strange that SM8150 and SM8350 support MST, but SM8250
> doesn't. Are you sure? Your patch contradicts this.

Ah yes, I added the DT changes but forgot to put it in the commit msg.

> 
>>    - sm8450
>>    - sm8650
>>    - x1e80100
>>
>> The following chipset also supports 4 total pixel streams:
>>    - sa8775p (mdss_dp0 only)
>>
>> Add the appropriate amount of pixel stream clocks for their respective
> 
> s/amount/number/, it's countable.

Ack.

Thanks,

Jessica Zhang

> 
>> displayport-controllers.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi  | 34 ++++++++++++----
>>   arch/arm64/boot/dts/qcom/sar2130p.dtsi | 10 +++--
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 20 +++++++---
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 +++++++++++++++++++++++-----------
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8350.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi   | 10 +++--
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 +++++++++-----
>>   12 files changed, 167 insertions(+), 69 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 45f536633f64..2c85eb2fc79a 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -4237,15 +4237,28 @@ mdss0_dp0: displayport-controller@af54000 {
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel",
>> +					      "stream_2_pixel",
>> +					      "stream_3_pixel";
>>   				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_dp0_phy 0>,
>> +							 <&mdss0_dp0_phy 1>,
>> +							 <&mdss0_dp0_phy 1>,
>> +							 <&mdss0_dp0_phy 1>,
>> +							 <&mdss0_dp0_phy 1>;
>>   				phys = <&mdss0_dp0_phy>;
>>   				phy-names = "dp";
>>   
>> @@ -4316,15 +4329,20 @@ mdss0_dp1: displayport-controller@af5c000 {
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
>>   					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
>> -					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
>> -						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>;
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_dp1_phy 0>,
>> +							 <&mdss0_dp1_phy 1>,
>> +							 <&mdss0_dp1_phy 1>;
>>   				phys = <&mdss0_dp1_phy>;
>>   				phy-names = "dp";
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>> index b0e342810ae7..96090a948ade 100644
>> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>> @@ -2139,16 +2139,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index b1cc3bc1aec8..48b6a17dcea0 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -5012,15 +5012,19 @@ mdss_dp: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   						"core_aux",
>>   						"ctrl_link",
>>   						"ctrl_link_iface",
>> -						"stream_pixel";
>> +						"stream_pixel",
>> +						"stream_1_pixel";
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>>   				phy-names = "dp";
>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> index b84e47a461a0..ca188c7f1f26 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>> @@ -3233,16 +3233,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
>> @@ -3311,16 +3315,20 @@ mdss_dp1: displayport-controller@ae98000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_sec_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index 87555a119d94..11ea2fa0b853 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -4338,15 +4338,19 @@ mdss0_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_0_qmpphy QMP_USB43DP_DP_PHY>;
>> @@ -4417,14 +4421,18 @@ mdss0_dp1: displayport-controller@ae98000 {
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX1_AUX_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
>> -					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
>> -						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> @@ -4494,10 +4502,12 @@ mdss0_dp2: displayport-controller@ae9a000 {
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK>,
>>   					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
>> -					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
>> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   				interrupt-parent = <&mdss0>;
>>   				interrupts = <14>;
>>   				phys = <&mdss0_dp2_phy>;
>> @@ -4505,8 +4515,11 @@ mdss0_dp2: displayport-controller@ae9a000 {
>>   				power-domains = <&rpmhpd SC8280XP_MMCX>;
>>   
>>   				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
>> -						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss0_dp2_phy 0>, <&mdss0_dp2_phy 1>;
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
>> +						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_dp2_phy 0>,
>> +							 <&mdss0_dp2_phy 1>,
>> +							 <&mdss0_dp2_phy 1>;
>>   				operating-points-v2 = <&mdss0_dp2_opp_table>;
>>   
>>   				#sound-dai-cells = <0>;
>> @@ -5669,10 +5682,12 @@ mdss1_dp0: displayport-controller@22090000 {
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   				interrupt-parent = <&mdss1>;
>>   				interrupts = <12>;
>>   				phys = <&mdss1_dp0_phy>;
>> @@ -5680,8 +5695,11 @@ mdss1_dp0: displayport-controller@22090000 {
>>   				power-domains = <&rpmhpd SC8280XP_MMCX>;
>>   
>>   				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>;
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss1_dp0_phy 0>,
>> +							 <&mdss1_dp0_phy 1>,
>> +							 <&mdss1_dp0_phy 1>;
>>   				operating-points-v2 = <&mdss1_dp0_opp_table>;
>>   
>>   				#sound-dai-cells = <0>;
>> @@ -5741,10 +5759,12 @@ mdss1_dp1: displayport-controller@22098000 {
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
>> -					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   				interrupt-parent = <&mdss1>;
>>   				interrupts = <13>;
>>   				phys = <&mdss1_dp1_phy>;
>> @@ -5752,8 +5772,11 @@ mdss1_dp1: displayport-controller@22098000 {
>>   				power-domains = <&rpmhpd SC8280XP_MMCX>;
>>   
>>   				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
>> -						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>;
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss1_dp1_phy 0>,
>> +							 <&mdss1_dp1_phy 1>,
>> +							 <&mdss1_dp1_phy 1>;
>>   				operating-points-v2 = <&mdss1_dp1_opp_table>;
>>   
>>   				#sound-dai-cells = <0>;
>> @@ -5813,10 +5836,12 @@ mdss1_dp2: displayport-controller@2209a000 {
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK>,
>>   					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
>> -					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
>> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>>   				clock-names = "core_iface", "core_aux",
>>   					      "ctrl_link",
>> -					      "ctrl_link_iface", "stream_pixel";
>> +					      "ctrl_link_iface", "stream_pixel",
>> +					      "stream_1_pixel";
>>   				interrupt-parent = <&mdss1>;
>>   				interrupts = <14>;
>>   				phys = <&mdss1_dp2_phy>;
>> @@ -5824,8 +5849,11 @@ mdss1_dp2: displayport-controller@2209a000 {
>>   				power-domains = <&rpmhpd SC8280XP_MMCX>;
>>   
>>   				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
>> -						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
>> -				assigned-clock-parents = <&mdss1_dp2_phy 0>, <&mdss1_dp2_phy 1>;
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
>> +						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss1_dp2_phy 0>,
>> +							 <&mdss1_dp2_phy 1>,
>> +							 <&mdss1_dp2_phy 1>;
>>   				operating-points-v2 = <&mdss1_dp2_opp_table>;
>>   
>>   				#sound-dai-cells = <0>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index cdb47359c4c8..3a21a2e2c04d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -3894,16 +3894,20 @@ mdss_dp: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index f0d18fd37aaf..fc7c610c15d2 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4774,16 +4774,20 @@ mdss_dp: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> index 971c828a7555..6a930292edd3 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> @@ -2872,16 +2872,20 @@ mdss_dp: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 54c6d0fdb2af..b0680ef30c1f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -3431,16 +3431,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 71a7e3b57ece..226c457338d9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3545,16 +3545,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 495ea9bfd008..72c63afe9029 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5388,16 +5388,20 @@ mdss_dp0: displayport-controller@af54000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				operating-points-v2 = <&dp_opp_table>;
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index a8eb4c5fe99f..e86b6cb20096 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -5306,16 +5306,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				operating-points-v2 = <&mdss_dp0_opp_table>;
>> @@ -5389,16 +5393,20 @@ mdss_dp1: displayport-controller@ae98000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				operating-points-v2 = <&mdss_dp1_opp_table>;
>> @@ -5472,16 +5480,20 @@ mdss_dp2: displayport-controller@ae9a000 {
>>   					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
>>   					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
>> -					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
>> +					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
>>   				clock-names = "core_iface",
>>   					      "core_aux",
>>   					      "ctrl_link",
>>   					      "ctrl_link_iface",
>> -					      "stream_pixel";
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>>   
>>   				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
>> -						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
>> +						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
>>   				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>   							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>   
>>   				operating-points-v2 = <&mdss_dp2_opp_table>;
>>
>> -- 
>> 2.50.1
>>
> 

