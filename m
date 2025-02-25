Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F49BA44035
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 14:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58EB10E145;
	Tue, 25 Feb 2025 13:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y68DGfYD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC9610E145
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:10:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8KMeG015087
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ygYBZ9DB9YSUCjV3ts2cfjtg+adg0ivMA3fujfqgrNg=; b=Y68DGfYDj77qcMi/
 2zsZ9HbdnbaJtJBwogbovVpvx5PL2FfTM6m/9CP6Y3reVov7bO7IGYiXgOcZbMPy
 IHLXWgi3pWlEzDd/tLKl6oprWdUWAC+EpMHSqZyV7D7Q6AwSfCOr/Yt9jiZMyiL5
 Q0D/LwQ+7/aCd8XPOc9HMpMNLhcS02cYhuRQNY2YpmzFb4//9ErBePNtEPWqFmUM
 UfgoeXZrmwSfUpmMv6lIvnOw2PwCUIMdIxyMYvywsZ6295g45Hnzn9vV6EzZv0Zt
 JSVmw0bwm2G68C/kVpTQYQ4NNq6bwF6/ui3/5Q3U403MyySCdLLD+xgU/aFql3SP
 W2mRPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 450kqg54ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:10:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-471f426fe28so8014711cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 05:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740489051; x=1741093851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ygYBZ9DB9YSUCjV3ts2cfjtg+adg0ivMA3fujfqgrNg=;
 b=AhaOWQvH1GZ9NFJ/36TYCfBPapciGFyZadQli2b5H/otMAunQE+lcovHyRhCL+YvfY
 vOoSjRfZBSSZ4aVa+v6Et+QLBgTdgBN5i3QvBK3LptYZy8g1EOjFPJbkIrSsSjHrVuv6
 F7juDfFjGCPg678ixt1XLlc+RhVfZ5ufGfXnhRMeeC67cjk4EX4EivwJjymqfsKzfRfV
 H0FzTtvmrkLox5G3fCoM/F73UcGVHrGunDgCDXjfChXfhqIphzl4ljR8PYJNdLZBCPHV
 fN1fY7boiM/PMWuBeq7Z9XDimgCKVncW6mTQbJ3PQikExFWsYBUGkxEhPGd9SHEh9W6f
 ycWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxeWKzKFbeilTCN9zvZ25KWS41yZ0tHsye0WsBQKr06XLz5qjGYrX4eTSz0m51EInOpZPdsy9JGKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFYBBtg2YWGiKZ6+6FcAUwOj5XhdExZ75cfDmx9O4uE9kjY77+
 qixt51CcIvCdfvc5PK0QN0IJvXYq4b9upAVspxikT+KGmtAJ+t4DTzr3vG/91yirZGAFJLHNnWG
 ljdBb4d80seaqlTyTiGrg3GmPdAvxLNML9ZwRQfVBK/mRDNa7qLNVrkh8MV1chyjWwvU=
X-Gm-Gg: ASbGncsqf9lpOO7FjsbIEA/9kncXg4r69mr/Ah+vUFn4xGGRJ/AlV3PrKgwCXsCXiWR
 oUUsxvaeN2e6aUL1QXF3HHTIt7goJQHuO+fh6PUwR4FLdtib/ADNZWIiCTav5aA7Vh4z7rir7yC
 zXfnctwT2ioyPoeIOvoCnJrC7d8J6Cmi1m3/iCTWj2bSq0p6hxAV21MPzrs6mOPWZBe2t2NI8vM
 MkZk2ukqC1uoPTQFTbUY49ql289n07v3j8CSbofMf5NUq/SaJEAcWzQpsFuXpDJa0lYVnnDMSFk
 /y+Vro0hFghJ3j6iUYSrJnyRJyxGF2Yvu2e4Yq6cBst5Lj5XO9Qn0r5Z20lK1sMGll/q8g==
X-Received: by 2002:a05:622a:494:b0:472:801:3e6f with SMTP id
 d75a77b69052e-472229771b8mr97835191cf.10.1740489050899; 
 Tue, 25 Feb 2025 05:10:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0xw03/W+6JbMalKdB3Xj87E8H+dMaQ9tekePz+MT52R83K55h5CarFRLbuABJFco6rOWFow==
X-Received: by 2002:a05:622a:494:b0:472:801:3e6f with SMTP id
 d75a77b69052e-472229771b8mr97835081cf.10.1740489050525; 
 Tue, 25 Feb 2025 05:10:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed20122b0sm140606566b.107.2025.02.25.05.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 05:10:50 -0800 (PST)
Message-ID: <6600a115-a935-4d21-996f-e2251777fecb@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225121824.3869719-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7OUFB9xbwnPTIBCdss5MHnlORgavlYwj
X-Proofpoint-ORIG-GUID: 7OUFB9xbwnPTIBCdss5MHnlORgavlYwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250091
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

On 25.02.2025 1:18 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 136 ++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..151f66512303 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -517,9 +517,128 @@ &i2c11 {
>  
>  &i2c18 {
>  	clock-frequency = <400000>;
> -	pinctrl-0 = <&qup_i2c18_default>;
> +	pinctrl-0 = <&qup_i2c18_default>,
> +			<&io_expander_intr_active>,
> +			<&io_expander_reset_active>;

Please align the '<'s

>  	pinctrl-names = "default";
> +
>  	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <98 IRQ_TYPE_EDGE_BOTH>;

use interrupts-extended, here and below

Konrad
