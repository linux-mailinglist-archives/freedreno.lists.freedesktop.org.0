Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE263BC4E02
	for <lists+freedreno@lfdr.de>; Wed, 08 Oct 2025 14:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2010E385;
	Wed,  8 Oct 2025 12:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBd04cJg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D910E385
 for <freedreno@lists.freedesktop.org>; Wed,  8 Oct 2025 12:40:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890RN6028917
 for <freedreno@lists.freedesktop.org>; Wed, 8 Oct 2025 12:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=; b=hBd04cJgCs6FMEwT
 SLJv6hQIebpXckG7rSWR5WFqC0HAU3YzOqpBfUqFEbgMvU3Xc06MuQzjHrLsqdwt
 h8Ne8CmeNfpDQcCFgxPdgr9088KLmQcUJ6WknNvlJeMX/WPbctqMXCS4uJPYAI55
 2sta4654l/LibwERamb75M6AUI26ZJgtDStfAFLJF52818MNZxQIpzcnGlK0ye7T
 4UDigkvXMMEymCQfW8bOWuyTcJ0nExA3Vj3Q2l1d74UpiSK5uBihcP/VVfRrfmRD
 gq4Ky1onVbv6UtGwEYtK9uFvTQzRF24dfgGA+07skz++WYq/NeKviK0zVWpgy3Es
 QNDw5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgth32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 12:40:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7f5798303b3so17419026d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 05:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759927241; x=1760532041;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=;
 b=Pg3eyzapUDvF5ufRx5B9SXbDFS+47AHIQGjp+u/+76dO1lAZj9G/wPzOOZuG7650LL
 sRY2Zq2AuQ8uF1ZCj9jxUdufXoPnZDlde7Nxp50qX6uFP60/sLOcIhc6Wy6P6YLVTjX0
 EluYQnAOvr7xUaPRi5/5RMd5gw5vzbutMWGqt6ZuXwkCOLETatYy8nl0/973M6TKtWiK
 XnQ+9hnmsSB69s67/sbVLpScmmXzMwatbNZQGWCi0oX/OdG0Xk3n3EwJLKc1nHxCmUNV
 Gzcd5vPNL2BjXoPZo19cOmSTEffH6DaYpthFNloiXxAOsAwgbByyEnSYEhlQvXKk0OO/
 VbWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd7XJdKzqfNRXf01Y8Y1iV1RO8AqsGtKD4VC4lNHEAy3iS/ar+PUdDxHhj3Uc9/MGaZ3lujcHPab0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2WrYk6gtqlOokTJGIXqNN8GwGO9CvkYcx/q8FEDREUpeWEgZx
 IAKPX/TmowS1DIyMQpemjU/e0qxu+o8th+xGCtV5UZc4A1HzLUmWR1BXuSS4H+7PWOpj7DoB/gt
 an50vjqXWe8T/tHttDWhAxBp5d95hi4WqPwEwVvAoPpJgboCk9alecn2/CiecJy56rDKV5Ng=
X-Gm-Gg: ASbGnct8l0tB0VvQ6POsiRW7tJr26qSbrK7Vb/NOmaDce2G/X6bHM5vO2s1c0Sk6ZTq
 zAQ4Pfz97TjJA1Zk7L93Ef4CLm9Fi42636K7qx+2Xc0KzUaTKsorQZas6xZRV9ay2dxjE57t4Bo
 oYgS+EIAkOBCKtWnyYFxVvbDDad0uasC3wQ2LEODOf2//kbYKlzoEIe/sPUCBQyLekVy72xB5KN
 nyqUxtrVEuml6bzm/GsCyF8VPej69Mn7wRwALZgUDRQm9Py3+0B7RloaLzPhcUr51iB4zu4Bg4v
 wpjRWx4pW/vJiveISfSaePUfVLwRE9TgsrOVu5q5u3z/nwPdrCVd1lSmG/nM70CCUsqUmP1EBx6
 F605iyZiA+oq9T7FpkgZltO3jod0=
X-Received: by 2002:ad4:596a:0:b0:784:4f84:22f9 with SMTP id
 6a1803df08f44-87b2ef94002mr25131376d6.7.1759927240937; 
 Wed, 08 Oct 2025 05:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3QYIdes0zzXDXLbtN1GZArLUcJtOk9G7EMYv269Ezp7bFtd3e0tnh7OnfT4Sdj7S94CaghQ==
X-Received: by 2002:ad4:596a:0:b0:784:4f84:22f9 with SMTP id
 6a1803df08f44-87b2ef94002mr25130856d6.7.1759927240350; 
 Wed, 08 Oct 2025 05:40:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6378810112bsm14570055a12.26.2025.10.08.05.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:40:39 -0700 (PDT)
Message-ID: <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX+x537wVOQ5DM
 lY+TXtv7i1pBL/jS5IbJh7mUKatjAGbv2yx/Glg52THyXNo4vODfVXTf/7V7pCRbnfJea3sitJT
 Us7DKLfdlcOyFZgL/LNNKigZdu4MdWXoIhBOzcrdCi3o56rdQVRMeyfzfjbDsNxLOdqNGnxFaiz
 /y8Cwk6a5bTC+0AvqEQul4HgVNIq5xBxqRBeCyM0zsaXuQ5JUYd5jKz4PP8jrYzPbry3Xz08NmA
 u2mkjLscOb1yH6XfBj/OVY48qAoI0jihSV326MfNrhcysdZCT3TxPkJUxK5ET+gFqPqWY9Vu39p
 4DsXNUc7MPaaDo1Du1ixUfeaMtlRgA0+pWrQvQ0d0QxDGbENfYHpn1xECXGDqZWfi6bdoiLRGwp
 MPqulKoFWwzLiCmR0mSB9XF6oWW7fw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e65bc9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=5YqVK4ek60l4VI_saP8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vkGF8Gq0ZGISi4ucoyd5z4rQclQoLncW
X-Proofpoint-ORIG-GUID: vkGF8Gq0ZGISi4ucoyd5z4rQclQoLncW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
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

On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> with their corresponding PHYs.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp0: displayport-controller@22154000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x22154000 0x0 0x104>,

sz = 0x200

> +				      <0x0 0x22154200 0x0 0x0c0>,

sz = 0x200

> +				      <0x0 0x22155000 0x0 0x770>,

sz = 0xc00> +				      <0x0 0x22156000 0x0 0x09c>,
> +				      <0x0 0x22157000 0x0 0x09c>,
> +				      <0x0 0x22158000 0x0 0x09c>,
> +				      <0x0 0x22159000 0x0 0x09c>,

sz = 0x400 for all 0x9c

> +				      <0x0 0x2215a000 0x0 0x23c>,
> +				      <0x0 0x2215b000 0x0 0x23c>;

0x23c -> 0x600

[...]


> +			mdss1_dp1: displayport-controller@2215c000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x2215c000 0x0 0x104>,
> +				      <0x0 0x2215c200 0x0 0x0c0>,
> +				      <0x0 0x2215d000 0x0 0x770>,
> +				      <0x0 0x2215e000 0x0 0x09c>,
> +				      <0x0 0x2215f000 0x0 0x09c>,
> +				      <0x0 0x22160000 0x0 0x09c>,
> +				      <0x0 0x22161000 0x0 0x09c>,
> +				      <0x0 0x22162000 0x0 0x23c>,
> +				      <0x0 0x22163000 0x0 0x23c>;

0x2216_2000 and _3000 don't exist, there's no MST2/3

sizes should be changed similarly 

[...]

>  		dispcc1: clock-controller@22100000 {
> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>  				 <0>, <0>, <0>, <0>,

You need to remove the same amount of zeroes that you added

Konrad

>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
