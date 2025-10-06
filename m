Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8CBBDA6F
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 12:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E8B10E363;
	Mon,  6 Oct 2025 10:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxSwDEyT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB3910E363
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 10:16:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NPJ47018867
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 10:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J7xKo6sf5t7NdPV3xuhArRC2
 khe1y/xdABGS5JQwT04=; b=YxSwDEyTZlRrodNvH1t6uC5oJH86m2/EVQwMYsfv
 n27o62Vut+x4pjB+Kun2xvYIuy24JNSP9PZC8BfZGJYhtvwQHrQqUO+FJ04dVxxq
 iOrK3gj/lOAgWi8nKMctCa6Ja95boX/yLoLxS1NMVM27nbVhl+LKHbH65PX4w3qL
 72XtUxcCeJh7vXwtTViNOch3oUWIR7SUUnX0d6wkJb+SxfgqE/TY++urd6XxxyeD
 sCxWYUE7LUCkLglzCv9gO2R8bhTuT3brYSiqisqsFVsCCx7XT/OolT3szJstyIxq
 bjSzNRGGm1KH1Q9QY3BFWiTaQkmXNKlo2qV1OGowNheDDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfjpm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 10:16:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d905ce4749so96616361cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 03:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745810; x=1760350610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7xKo6sf5t7NdPV3xuhArRC2khe1y/xdABGS5JQwT04=;
 b=TaYf8PPwbZY5xzmOK0nPp0P74YcTSGLDIUkS4dEMHinkP6UcTtACniCQuVroLVpIKG
 UfrrVN1L6QhKzTj/Ic1szjGL+mftf91V6i7DtFkQ6RoEKAqzoHjVCdoHBirRapf1zjo2
 xRYwkLcpnGKsgM3fHOIgr23m4XfuOIv1cPlYP3HImyjxjSyBPU8mbWB7RF6FcVCpiwB+
 gDjTpp5F5ajVFa7koh7UIBTN2LnxA2qQ/BNN/DzyjSREBt//8c9SXhepVxtVaXFMShL4
 MwdU2/HsHL7HmEEZQ2HN4XygPvicl7cpb16dou+N449Octf05Yg7ewQvnOJT5hD807We
 UkFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUQ4Qwtx78dpzLtyHadvb29PspLNN5SbnQKxUa/ONbWyT7cNjmoHudG2CU2xOitZvzQRD3FX3K2/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzy9z5Pq3h3AScdIaRp6WagOAZ2AnZy2MfwpLPjvsPEgot0Rcl
 sVx9Xg18kixo1rAV4UD/D3A/vzLgLC27wKGpQjEJKjEVKXCQb18gQ27nnykDTID7yZPuVSbYqYZ
 9WP/jN3rk2mYh9/UQmwCQTdDprbMgvzm18z5Gs+QmMqVW2r0SED8ciplAzK6rQ5GRkmnyNvU=
X-Gm-Gg: ASbGnct6QwkmxjGUvqGmHof5Mwyz+KDcqaKCxH7e0bkw660CQyy+08AmQOTijIZ8wIr
 8Tcx6u5JkNQeEw45FFSrhd/rSwu3lPI5YRvTVM+IwQ3Vvn0gOff+o6oupYLZW5Q4q4dL3kZklqJ
 1KuAQlC3KrWE8dVq0eIjyF5sMQDuMV3E5l8j2hncQPdq7wWH313KDswuThCCcrcRdM8M+M4AGpS
 kgc2rLsi29+LzljmZccD7m9aeX+M/PzrITYVAQ+cyODpEDnEj+z/sue8a3HAcTlKzuE1XgcdxoZ
 IYf8L7vpMgNIMIjXg2rM336L/onEV4G5JAghg1I24mLa5k5RvSSFyZcdRb8oQl0J9n71ofsXgjL
 t/ZNkz0mZFGjxLE5M1MU5ovoqfhKGlIZdaQpjJya401JN/Onp3+OkDHAdng==
X-Received: by 2002:a05:622a:2cf:b0:4db:e7be:b40b with SMTP id
 d75a77b69052e-4e576a7bb1emr149923591cf.23.1759745809583; 
 Mon, 06 Oct 2025 03:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdVkkz0Bvskg+SlQ4eiYj13Kfc4CHPGeJdiuBJRRdTSxJrU6Luy1zywIhFRnGiP29t5s4x8g==
X-Received: by 2002:a05:622a:2cf:b0:4db:e7be:b40b with SMTP id
 d75a77b69052e-4e576a7bb1emr149923121cf.23.1759745809020; 
 Mon, 06 Oct 2025 03:16:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d863sm4893943e87.70.2025.10.06.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:16:48 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:16:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI
 to DP bridge node
Message-ID: <vj3pwikzgbflzwqwkbvdfac44llinsmrhrqnvu6gx756xz4h3e@2lspa6zx5xgr>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-8-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-8-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: 5bS_rzHkM1oOKHkwtuhHR2gqXfQZkM2S
X-Proofpoint-ORIG-GUID: 5bS_rzHkM1oOKHkwtuhHR2gqXfQZkM2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX6Hepk8Jgl+n4
 phUnXTL8Hajc6Pt4jW97vAmDCPkIlek+OSwTxgPlz84uf9yrpi0PRTZeWx71866QxdrSWgw3EJU
 hR4p/fcu1DXuj5uw/sEo7F+9wXHWhe8zlvsZutg8I3a6xdDaR335uEDk4Pxii8/qFtu0aayww4A
 3BkbcQt5ZcbD+5zDZzAkeUpBzopBJLM4cTa44fXy46Fe25yX1JnDCC3mLdhn/ivgXywkJyPJOoe
 FYVJ20Kqfxv87FnluSWdJzglqGmixADEvB+LozdOT95Tu7fpV4uhXAI+7YJlwsVvexx/AR38qse
 v/+JqWf9vzDr8rIJOmdtBfPzafqLQANJj5Cchov74iz5UsFWrmDfTGaOv1kRuOz6mc+p3MRGMaS
 6VVErTPa/Lh//hgNEx9Qp826G0XyEA==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e39713 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0vFitCv-P-mLjvDJNjQA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135
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

On Mon, Oct 06, 2025 at 07:09:24AM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 891e49602c97..5d4040376857 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -24,6 +24,64 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vreg_12p0: vreg-12p0-regulator {

Why are these nodes not in a correct place? Also, why are they named
differently from all other regulators in this board file?

> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_12P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
> +	vreg_5p0: vreg-5p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_5P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		vin-supply = <&vreg_12p0>;
> +	};
> +
> +	vreg_1p8: vreg-1p8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P8";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		vin-supply = <&vreg_5p0>;
> +	};
> +
> +	vreg_1p0: vreg-1p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1000000>;
> +		regulator-max-microvolt = <1000000>;
> +
> +		vin-supply = <&vreg_1p8>;
> +	};
> +
> +	vreg_3p0: vreg-3p0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_3P0";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +
> +		vin-supply = <&vreg_12p0>;
> +	};
> +
>  	dp0-connector {
>  		compatible = "dp-connector";
>  		label = "DP0";
> @@ -36,6 +94,18 @@ dp0_connector_in: endpoint {
>  		};
>  	};
>  
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "full-size";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge_out>;
> +			};
> +		};
> +	};
> +
>  	regulator-usb2-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "USB2_VBUS";
> @@ -316,6 +386,70 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcs8300/a623_zap.mbn";
>  };
>  
> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupts-extended = <&tlmm 93 IRQ_TYPE_EDGE_BOTH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		reset-gpios = <&tlmm 66 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&io_expander_intr_active>,
> +			    <&io_expander_reset_active>;
> +		pinctrl-names = "default";
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9543";
> +		#address-cells = <1>;
> +
> +		#size-cells = <0>;
> +		reg = <0x70>;

compatible
reg

#address-cells
#size-cells


> +

-- 
With best wishes
Dmitry
