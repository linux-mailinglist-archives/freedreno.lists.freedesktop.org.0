Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47D9E6DF4
	for <lists+freedreno@lfdr.de>; Fri,  6 Dec 2024 13:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE37E10E088;
	Fri,  6 Dec 2024 12:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eoHDjxEa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD28010E088
 for <freedreno@lists.freedesktop.org>; Fri,  6 Dec 2024 12:20:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69bsZi026476
 for <freedreno@lists.freedesktop.org>; Fri, 6 Dec 2024 12:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9E3Q5V18pzVm0efIN2Z36r5MoCfL8CYX45xyLjaUZPo=; b=eoHDjxEay15UJjR6
 IwX7o44jEaiQbMhdt5dcw6lLE6+/89AUfsd8ka4uEkuIOkjIOe3BTWVxheOVCCSs
 yIZJc05bJ+Rm7FhKHG3sbiS90CAvrv2TNAlBs/LIuSdffIGx91XFAMZqxEQT5Uz0
 3QegG+MjAZyHHGXX9ys6M5CC+dZU3ct4BabykCfgej9n3b/5b+hIhOuZ0hY/qI/L
 X+p+7rVKrp/HkgTV123zb6rbunTRrn3l6yVbQHXXmTsc4DU9zEwkKf3S0aVO4fKB
 f1ZwqxV+oUPj+ECEsMsY/SLIt87EBwbInIVFu5ZZLJjof9+H78mdzzU4fTq2MRQ1
 v0tulA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxtc8e6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Dec 2024 12:20:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-466c4b8cab2so5438071cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Dec 2024 04:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733487623; x=1734092423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9E3Q5V18pzVm0efIN2Z36r5MoCfL8CYX45xyLjaUZPo=;
 b=frUQH0KdtuZSoLeJPHPST1AiHZb2q0cMAfBHgmqNuNVaMgXdMggGnqmk59lr937F2Q
 26qLXf0tl3Szf9jDrkTmjrC+kmAV0cIylifrFfZNyoOvGLmNikQIUs3DgOnSjQb57OH+
 cb10JTFlEvyH2J5c8Ud+ySQGnysjMiZd+fQL6nV3wR9n8jTolfexh/CqJsHASkK/UPpP
 P/PKDZOQoSNWEXBBbMfTJ6wqFWroCJgJE8h5YMsEuhmdXiIt/k/XoeVOSxvnbDMJ/ly/
 SRWBQv2YxYYiCPiK3iXWsXWLn1gEeBMKddaJm3pXrToyTj3GjdjTmL6axUytCJ0u/46D
 r2Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWN57Lii95lpsXPHRHEbQ3PheXU9xRr1UH7dgDQxttzcSb6BmVB+f4xkVbzmuhnJbPJl6JyZqrp6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNky2xSyqOJCAm5zsTjN7fiNsmqRU4e+mHcybCMjnD9Lq5bFWE
 t2mFHB0UafiH88QmC6jxnAzAp3UW8uCns06dQsn1s17ExhSx/HsY2/EpbwkbA35M/rl4SmV3ENl
 HJ9c5jSC2uy5TSmo/RWgQLS5jlpN6lp5Jm+E4bp4p313tv4yVUeDJPdsCqxguFrOtPaw=
X-Gm-Gg: ASbGncvEAnAwPZlAJF7GQyGCVQ0DWc5oR3SqBkYSmq7Lw5aIUcUCk2lsAPmsgfDFWp+
 q2l7dlWnkwvI8KITJTLBgvsrpEiAPNkhSy83vACKz7pb1cVsl+BMCLvtksZ0fX5HA5P4xtBkY05
 KEWSxOcoufNn/pM90zrq3jHyus0T88B0E4CH0rIaC2cLEyThIvnQcSoWJT2mXI817UQ3co1JqXA
 Ir/buAbDknX/dGqw6SmhkBqPkgVlzrysy42bxKAiBkb0jUZ4S3HQEoR82k/E+T8HM9yKR9TLfKn
 nkun62J6YampJL6kUn4sKJKGBgvT9/c=
X-Received: by 2002:a05:622a:606:b0:464:9faf:664b with SMTP id
 d75a77b69052e-46734c8f531mr18002271cf.2.1733487622882; 
 Fri, 06 Dec 2024 04:20:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaYjuLbGBmcbEVFGiae/eyDl8MSbUHvTvfg7816ggOQFX2Cej3+/3TS1KDf5HZCvflpH7buQ==
X-Received: by 2002:a05:622a:606:b0:464:9faf:664b with SMTP id
 d75a77b69052e-46734c8f531mr18002011cf.2.1733487622527; 
 Fri, 06 Dec 2024 04:20:22 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d149a25924sm2113819a12.17.2024.12.06.04.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 04:20:22 -0800 (PST)
Message-ID: <d83ebaa2-1da8-4f85-9034-670e525b457b@oss.qualcomm.com>
Date: Fri, 6 Dec 2024 13:20:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 44/45] arm64: dts: qcom: add mst support for pixel stream
 clk for DP0
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-44-f8618d42a99a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241205-dp_mst-v1-44-f8618d42a99a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YmdSMiuiP5uRU6INiUKzDVGzojFqhBKr
X-Proofpoint-ORIG-GUID: YmdSMiuiP5uRU6INiUKzDVGzojFqhBKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=896 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060091
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

On 6.12.2024 5:32 AM, Abhinav Kumar wrote:
> From: Yongxing Mou <quic_yongmou@quicinc.com>
> 
> Populate the pixel clock for stream 1 for DP0 for sa8775p DP controller.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 0dbaa17e5e3f06c61b2aa777e45b73a48e50e66b..0150ce27b98e9894fa9ee6cccd020528d716f543 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3944,16 +3944,20 @@ mdss0_dp0: displayport-controller@af54000 {
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;

dispcc also defines PIXEL2/3 clocks.

>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> -				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>, <&mdss0_dp0_phy 1>;

Please turn this into a vertical list

Konrad
