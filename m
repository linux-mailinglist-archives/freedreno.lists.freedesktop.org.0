Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0B5A9198A
	for <lists+freedreno@lfdr.de>; Thu, 17 Apr 2025 12:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9A410E1DD;
	Thu, 17 Apr 2025 10:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbak8cI5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C8C10E1DD
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 10:40:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l72p010534
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 10:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BjuAWeJK5hlBcayQ9LKvqOos
 Uc8OqTctTywMTRf5ORQ=; b=nbak8cI5wjIQO6uUIznf424kTrDzTn/9K6GVP0tC
 DQSa3ZpmDdvwWVI64JsD7GtF9lDiVsVOp1ac9cFWIEzd0kOQwLMS5AD7DKqj57hf
 kv2QhUSltme7lzAkD4N+LMcNbChzk3ztBl7prlt6Olub6H1wVTqfGAFmeUDItA61
 NGgpEcImagTbnFygZCFeO/DUafoTRyHR+5mfcnokURzZaYruh2OuLGSOS7Iw6pmP
 7NeGCKDmCIOHO5I6NYIv+vEzIPM3lb7CDzTEmrq59h3AuOQMfqRIc4pu+Eeml6z/
 tqyMkwzXZy8HutaRIPs6kv8JMKOg10oNsboprHUkcgppjA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjpg5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 10:40:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f4367446so7812206d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 03:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744886427; x=1745491227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjuAWeJK5hlBcayQ9LKvqOosUc8OqTctTywMTRf5ORQ=;
 b=G7Cd0yjt75vQHZLCOfSKUS5doJUv0MerP1NkNDpa7RXqUfx+G7PktBTiwxkisRqXzH
 WYA+RZ+MQ4lb12aAigg1cRSCpsILA7r5Ql3I9lZ0k0OpdA9V6q9pCvj7qCiV7ENDeVOB
 0dxqPZ601LFEFjmgWUGvxDyXnctxlmfXovBAa6KGCtesWGrFCW6e9g+yli/ctMU1c0Qc
 +QULZUI53ouBLAKgGV9nhhEsMIHZqJdzz4qdENt6gsVPg7kvcuUsnHbQTTfnBmyJg73f
 RUbHIgvtBmq1/EQmqkpqDlGWITc6dbcEIgElRAxfwhTTarkRXd8A+Ts5JXaiesed2qTB
 kJWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGd1zz7AxNK6gQKNLkaPXs321ysB/FP5cpr0Do58cvwd3e6g7QzBIA+z7AUtLsvdTYLmp9mwfTwBs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyaa3c5uIsB3p2+DwhOptTaIb5+v/0HoeA5nQHqSwTW9mr5CbIL
 Ga2OvWOYcPjiTyUdAs+sXh2tNAMMX/XjloxH/okMxTDpA0T9SdsF1zA8WJ0xbFK5FG7JfgnIiHl
 sW5pqGif/gElC1X8RiAaodTbD9NNLOX9AEDg4t61paz2LzDmvAUY2FEJ7S2qJPaRy05c=
X-Gm-Gg: ASbGnctcasZ2fWzZe8RbcuFTIOpZ9Mg3bgagggJIzZ8iVAJplVqn4/jFt2gPi2zj5Am
 PyN5EmATWXvL+kUNmGhMFVR10h7fSEABuBgi8bP9fVfN8E48Eoc1c+YWjqeZqi+MTJyMHlxynT9
 NvJ4GGRSS4F5yPOLANF+YL4A9K3/fmBQ9vhOg7D+8N0QWErqpUQYIpj2ue5LESvAnhhGxRXpMAH
 W+wXHveC4Vz5AlEBNjbcsyd6m7oXJN8i4f6Q6d2PRA5eDe4Rwad49+9CNrKHPq1tDQeIgTH2Rhe
 ilo9DH5gsiVk7fP0VI25Wyo5r/tgmeH/hjy6P0W7qwuouALeO/OCDBYSnfHZstjkwZQ0oxPfe6Y
 =
X-Received: by 2002:a05:6214:4001:b0:6e8:9e9c:d212 with SMTP id
 6a1803df08f44-6f2b2dc00e7mr77993436d6.0.1744886427422; 
 Thu, 17 Apr 2025 03:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWp4eovQ0JlsFx/TXAsBf4ivXXpH+ynJJ2l0sinoyay/KdVJnwv8l7W0CfA/7FfRZ5I9Fg8A==
X-Received: by 2002:a05:6214:4001:b0:6e8:9e9c:d212 with SMTP id
 6a1803df08f44-6f2b2dc00e7mr77992926d6.0.1744886427069; 
 Thu, 17 Apr 2025 03:40:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d50253csm1981832e87.129.2025.04.17.03.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:40:26 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:40:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <qnhfnxvdsgnw5jh4xxaqz3p2x67qcrr7kn3vwdnyz5huchdtzy@aagflznjrvly>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-8-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417053909.1051416-8-amakhija@qti.qualcomm.com>
X-Proofpoint-GUID: o6ZyQHFPXL5gM5FHVPt9l6B9UZeFnzlG
X-Proofpoint-ORIG-GUID: o6ZyQHFPXL5gM5FHVPt9l6B9UZeFnzlG
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=6800da9c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=49572xSsTLiTCUh2GlUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=963 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170079
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

On Thu, Apr 17, 2025 at 11:09:05AM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 180 +++++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..d5b2dabe927d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,13 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	vreg_conn_1p8: vreg_conn_1p8 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_conn_1p8";
> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge0_out>;
> +			};
> +		};
> +	};
> +
> +	dp-dsi1-connector {
> +		compatible = "dp-connector";
> +		label = "DSI1";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi1_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge1_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -519,7 +550,107 @@ &i2c18 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&qup_i2c18_default>;
>  	pinctrl-names = "default";
> +
>  	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;

No reset-gpios? Is the expander being used by something else so that we
don't want it to be reset during the bootup?

> +
> +		pinctrl-0 = <&io_expander_intr_active>,
> +			    <&io_expander_reset_active>;
> +		pinctrl-names = "default";
> +	};
> +

The rest LGTM

-- 
With best wishes
Dmitry
