Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4BBD8F76
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 13:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FF410E213;
	Tue, 14 Oct 2025 11:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9asrrT4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727D10E20B
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 11:17:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87HII005372
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 11:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nTY/sBKgAT5aIZEsNJ7UkmXTNK2/xLiJmfXa3OXwmRY=; b=H9asrrT4bziTSUTF
 V6VBtIcf7EuLi3O1jaqyR11GQleaKwyBfoy9BMBYgZWVlru2W8E5gsaIqKNjCcul
 zzyWUoxK0d8iakUfcA8ynHWAZXLz3gxTvD98F9/ucQXl/Z9ju644Yu5Wm8UyXbUz
 Zhp/ZjLX5M5x+Kj/TF1/KzAgIs6HSdWKn1w4TYVuK0nB9wencMJ3q3Vjfu9Oz7NT
 +HapQzwEfru9IrInZNZ7gFllqSXnU5KRQT06jN8uHzncNSHtnvpvFF5ms0UcwaKM
 ntTKAKHLm6D8Zl8vg5PtTDQ0fqEBASJ8kVBbBsWY6Od+hyhAhi5CEY5XMTcfHIQH
 kS5zuA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj07dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 11:17:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b551016556eso1167017a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 04:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760440664; x=1761045464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nTY/sBKgAT5aIZEsNJ7UkmXTNK2/xLiJmfXa3OXwmRY=;
 b=EgZYnutWsJchagzhhFsYKo6razgRAcqqJVyMRcVufskJ9pQ4yJuasKKBTfES8WcdMV
 +kSpKZJmug3gBBx/diPpS/2N8LyJjocgZU+WnLkC0qHJA5i/fZ9//9SnYpO+DQ9e1b61
 naJHcGbhSZ/gJi2A59kAjAbpSKBOuRPnBhr2EhU0tjGxmEK3YfL+1/DYI/HReRlHA+kM
 EM6ybeK7fAxM3NeCULzoLKOTt+nHN3U40kZ1NtvNG27cLj8eYmvEgj21wl7xRqGeAHNf
 34BMOJuJRTA+YWEGkL0tJT7DjcTcMwc/gb95APlrMrxc2RG8686U2As3HQzJG7xvNYCF
 dt/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+cge2XXDahXZkunMOJ9c7F4mKrLyUHedf0iIwax0B+0tF/xsZKqqknJ0/z4ag58RpofMsnkAK+5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDSpsnEbu/UcEVYaztzXjzuCnnQIe3fzhWS9mX8MfToKwsBNPu
 hozkSPrA4PHYUSX7tXowpcw5VXYUuPU9nRmybSFJCLDIn8ZWUzPmQMu4kgtIWRC+2wx/JLHgcew
 gj2GVwTueZqukWeO43+SzR++adwAwUpO7pgZ4FTtTgo6hhrM8U7x5YU25XYDHWsUDjO9RKhw=
X-Gm-Gg: ASbGncvQd7T+hV0WJYm3WVTfPh+MJvmMX4RPQCw8J6/CdYkeWBbmhpTWzMGRnXoQcpO
 WxTyk1XxUnpVFQTdP4xR1gE2eSkRrLXXD/TJ3097M/5LMHiAYAuXh/c1LymPWjQWurBjP2xJPzg
 +YxIxkT3DEvOz08QLwXnuNSljGWVTNG8qIEBGoL/6VBiNQumQdPbOR6NTqo6UizYUDYz4dpqD4y
 sR4r9temZETOk4iR5Uh9m+5Vpm9dbBkLgT2ON6SQs9gs7SMIaaK/1XHT2EbkPEOAQwsSEBJTral
 PCCC37GTxfIrnxHOUKVYjmLDI9GMmnQ72PAZttXNgSktcVomfnU/l/kiPSn4P18XzsG/yxUwG3F
 SNntAkRjpxW00jE7Ydmz/R8lmFe59tk3WwA8=
X-Received: by 2002:a05:6a00:39aa:b0:781:1f5e:8bc4 with SMTP id
 d2e1a72fcca58-79387a281famr13224008b3a.6.1760440663709; 
 Tue, 14 Oct 2025 04:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNqg1GAF0T4XgAhZMO0oLfa/blFZ3V9pL/XkmLQdf76VR8zUgzVCBYeKkV8ezLitvhxMOtCA==
X-Received: by 2002:a05:6a00:39aa:b0:781:1f5e:8bc4 with SMTP id
 d2e1a72fcca58-79387a281famr13223974b3a.6.1760440663219; 
 Tue, 14 Oct 2025 04:17:43 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b060c4esm14901588b3a.14.2025.10.14.04.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 04:17:42 -0700 (PDT)
Message-ID: <8e6720e9-6e9b-4530-b2b8-4e27a74665c5@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:17:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
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
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-2-1209df74d410@oss.qualcomm.com>
 <mij6av23fni6i4yb72xbjv3s2mil4eankjwt5n7jbafslvilem@qsk3644ilgcp>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <mij6av23fni6i4yb72xbjv3s2mil4eankjwt5n7jbafslvilem@qsk3644ilgcp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzM/rStWSlcTQ
 XtOYr42GZR6zWwfBIgzQmi9e89yxGg/1rlppH6kvbq63jXNbya1pd3bd0/eAFX4c3/rZJx2U899
 4bnMvR4L1YEfNmmnkqzpNRZ72He0AzKd+hAUafXBsSqwteoFPYl2ZBZrkwKb6JiQvTqz4xeCAow
 d5T/Mhjiqqt8Hy8wntNFTGPKqgqEoUkJefuyzmby0ChvClXttdF5QJ+z8/Mt9pDNAL7bBaatbpK
 iRD0f3qSpWI1cM31Vl8WVXkXq/dV4LKSIsq+Rkj1dz5UiA6N8rACumwpY4CMWWo1bV6t2hf6DPv
 o6vlJkc3IJxhxwxPAem5jqIFUUkcHtM6mWbpig42txT5pKtjqLKSLDYfZEtsyHErETRYCKqcBhv
 O5EeFH9Wy4MayMmKG82yQF3qDdg0RA==
X-Proofpoint-ORIG-GUID: 1N69Wlk_2TllvR1xm5eUZx0DC-7ex3O3
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee3159 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Y-oTvv0IyMzSHJg1AAYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 1N69Wlk_2TllvR1xm5eUZx0DC-7ex3O3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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


On 10/14/2025 6:18 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 05:42:11PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Update clock and endpoint connections to enable DP
>> integration.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 110 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 108 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..cdf53d74c778c652080b0288278353e20c317379 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> @@ -17,6 +17,7 @@
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>  
>>  / {
>>  	interrupt-parent = <&intc>;
>> @@ -3717,6 +3718,7 @@ port@0 {
>>  						reg = <0>;
>>  
>>  						dpu_intf0_out: endpoint {
>> +							remote-endpoint = <&mdss_dp0_in>;
>>  						};
>>  					};
>>  
>> @@ -3749,6 +3751,84 @@ opp-307200000 {
>>  				};
>>  			};
>>  
>> +			mdss_dp0: displayport-controller@ae90000 {
>> +				compatible = "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp";
>> +
>> +				reg = <0x0 0x0ae90000 0x0 0x200>,
>> +				      <0x0 0x0ae90200 0x0 0x200>,
>> +				      <0x0 0x0ae90400 0x0 0x600>,
>> +				      <0x0 0x0ae90a00 0x0 0x600>,
>> +				      <0x0 0x0ae91000 0x0 0x600>;
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <12>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>> +				clock-names = "core_iface",
>> +					      "core_aux",
>> +					      "ctrl_link",
>> +					      "ctrl_link_iface",
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +				assigned-clock-parents = <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
> Missing PIXEL1_CLK_SRC assignment


Ok, will update in next patch.


>> +
>> +				phys = <&usb_qmpphy_2 QMP_USB43DP_DP_PHY>;
>> +				phy-names = "dp";
>> +
>> +				operating-points-v2 = <&dp_opp_table>;
>> +				power-domains = <&rpmhpd RPMHPD_CX>;
>> +
>> +				#sound-dai-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss_dp0_out: endpoint {
> I thought that we need a data-lanes property somewhere here.


Ok, will update.


>> +						};
>> +					};
>> +				};
>> +
