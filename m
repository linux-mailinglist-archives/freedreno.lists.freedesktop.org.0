Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EAFB42228
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 15:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F6A10E221;
	Wed,  3 Sep 2025 13:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLYIyPT4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E84B10E892
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 13:41:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEwjx022954
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 13:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1fYfnbja81zbttAC6psme4l73O+c9YkR4VUUb+N1Yzo=; b=JLYIyPT4p0HbU8Sr
 qiWeTOx9Ai4HHR440PdYhdI7ki4MiUXrPY+cf1jdKRlSnNsKT/3lkadOP2krWbSp
 Ne0xpBANyzwKwuvz4ZBDh/6c6BIPBNFIwxT7oK1F3U6u4pBSnc5dQFTYivMKbqI7
 BidKi0qcx7XDFvNH149Sax2Oral+KBDLt8HBBQvozW98X3H1yx+ChZMw9Xctr41o
 QvRqKlGrEF0Dlb9Z652RcoLqa0Bl+0H6V9ZCdn7L5ia9I88M/fF9y1O8OMsaUKgU
 uBttRTbEvWoHQ5cxZHsCoApc/6FmC6O7ZYiF7NZ1S65+jSxwdhwQ8CzGAik5erWK
 +XVPqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0em08k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 13:41:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b307e1bef2so17715051cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 06:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756906911; x=1757511711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1fYfnbja81zbttAC6psme4l73O+c9YkR4VUUb+N1Yzo=;
 b=O47Yc9d6tbSSB9oZLvq8MJczgDcaC6ZymjyuOcpg1IXQLe2T4S2Zvo74i6v9R2k+Rn
 tc0/UePvlmJqHd84vxqK9v6Vc4GlmhVsou5tvGH72pUaX27zwPSE5T2hwkkkKZ/duNAK
 Kd59sn8dN2f9BajsY8IUTwskXWfjfVf6dyCnwAE5WTW5XznfsTB1V+laLb68+qnX9vwK
 Cj8kboIqNYK737eDHQ/SqLneGBAuX5yHIbg7Iz403buoVVIohlfSZC083mdHUuBbHaRL
 savUCe2KLyLq+rbYL72wSDwPGW8kJ/MuyenN4Qk7GiYVQwRRV0hYL3/zyEuImpeUoJJo
 moFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKkSRs8l5ACsP59urhs8idmre79P8ObhN67Lx7C8jmisCk/Yfee3s5KShEjw+F7A9CcaW0djBhslE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxou/k9WnfmqTupBHRcyVQUK2P65RBKAZ8p3k0pUB4vO2ZYl52U
 MMJhNzA7kEpFsqgYU26+XVIwSZP7DhZICMF9meUY7tPxL6ySMq/U+b0XAXBNQEPxagXyowoo4Ro
 u/ALmB2wY5Kb+8ilESJMexaj003pmbf0SznNFaqmeo0UhQPLURM/69svhkbSY2gGkxYeo+ds=
X-Gm-Gg: ASbGncsaDoM5Dvd044JWxF7fjWeNPM8QyXisYvc+4CyChwuUvEw4M/ymdvf+hKsrDbS
 QfTjdQYcrhq7QhPkGcU69L++Z2cd8oStE30FDl3qacDMddDjlGX+Lvu5rDisiInVz2yPvhFqv5i
 eeIahb8Esvz09iL/6lrK5jg95WwiStLyvYmC4CaMmunYk3DNttB5nuEswQVqWTX6f47M+fABhqs
 J4SnJBIDDiITjQ7rinRcQOTTUzInKMX6nnDZJr+oApW1Jlim5WlUHjJF8Xvtvmyau2l2bPL0VQ7
 JFk8Lqa4/0qkxIYyUntjZfli6d2cwFfgEKBGwniOg3pXSkXX1DH4bj5k+TXCJwSqqhyuw/9uY5i
 gk2Li8TMh1nvj8sSsXvMITg==
X-Received: by 2002:ac8:5d12:0:b0:4b2:d0eb:1e7 with SMTP id
 d75a77b69052e-4b313f90e37mr141155091cf.11.1756906910390; 
 Wed, 03 Sep 2025 06:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJPdTWyFNZv0wrE6s7lYHY+t1NrlyBkHlYgUSBucbQO6LODUUme+aa57ScVuOXFRfZKPEXFg==
X-Received: by 2002:ac8:5d12:0:b0:4b2:d0eb:1e7 with SMTP id
 d75a77b69052e-4b313f90e37mr141154451cf.11.1756906909528; 
 Wed, 03 Sep 2025 06:41:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04110b94cbsm968406466b.93.2025.09.03.06.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 06:41:48 -0700 (PDT)
Message-ID: <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TFVJaBjhdwSuAqiPF7gzVOVsBNwofyx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX/E5voaT7iU0f
 S5R9JthASB1QHd2/IL666OOxwioI/4dDcEcVpDnLB9CoyX041qgLSn81Kz9+N+RwQpqOsh1fdYG
 1aWwhzoi3hSSFThPHGpwPzchn3l8WKJY/HeMZFTFR6ms1qxbwD5Xy7qGmi4PmWHfXx8IjgIhflD
 EnPW+9bjODWv5xLAbOk4DvL3EjMy72PjJYnaqYb9d57hMi4bAagBMzfkpnD6cxdydeBEqebEl3t
 U7MRU+wtnyslIkS6Wy32I2nt/tIKGAejvzCLLNDsygjboa8aFyBNIi2V0SliKuvq9yL9FycwdAr
 sWEIVqnn1j6AhTNNOpA0GDtnoWblCaNiV4Z5sx9aRdHHF5R6vmcqqFcYxvaIN6rheTnX5DtJ39A
 of1+CiUX
X-Proofpoint-ORIG-GUID: TFVJaBjhdwSuAqiPF7gzVOVsBNwofyx4
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b845a0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OhcfVZcqRUJJiLbfGB8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On 9/3/25 1:58 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Update Qualcomm DT files in order to declare extra stream pixel clocks
> and extra register resources used on these platforms to support
> DisplayPort MST.
> 
> The driver will continue to work with the old DTS files as even after
> adding MST support the driver will have to support old DTS files which
> didn't have MST clocks.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
> @@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;

Something's not right here

Konrad
