Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E94A7D01E
	for <lists+freedreno@lfdr.de>; Sun,  6 Apr 2025 22:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8439789D39;
	Sun,  6 Apr 2025 20:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2c5c0C+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B397A89EF7
 for <freedreno@lists.freedesktop.org>; Sun,  6 Apr 2025 20:13:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536Jebqi028149
 for <freedreno@lists.freedesktop.org>; Sun, 6 Apr 2025 20:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CF/FhaEsCR/+W8yHZpCK1Z4y
 /u8MKd7X9wwGafUA/ZE=; b=e2c5c0C+A1QJkl1S8mBqKwwsXeYpNYXuiqKDhhRp
 YucyENyy7sfSIHbVDqqSSOqMQ3NOs2VZ2QKzrLQchP6LSuSd2aHFSSZqMBaF2wpH
 Ugk3adWn+40XqIoQ5nRb9MDAyk2z/r5T8dOOdGlELdZpJftxVqyj0Dr1+t7YlvTh
 xnM0n25HBfHsxElkhYaDHqcPv1vMupQtsiT47m2pnSuAHdIJ0C06lqrlr1zKzyrn
 3IeIi7ZwkY3mdMZSFgP1x4YPfOn6pHX5bdOQk1+PpLrRQ+JgFuRhA+hYwnCTSyWF
 hyfeJbKFS6KOZ3I0PubyMy/nTqcKq7q8pWDTBKynleZOvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtat8kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Apr 2025 20:12:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c3c5e92d41so616574485a.1
 for <freedreno@lists.freedesktop.org>; Sun, 06 Apr 2025 13:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743970376; x=1744575176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CF/FhaEsCR/+W8yHZpCK1Z4y/u8MKd7X9wwGafUA/ZE=;
 b=HuQAdjS1okbT1QDZJiozE/q39MV74TBDyXcVkU7wdQ0lrAgazzPjBX95ofSVd24AfL
 q/i7e4Bgp0LYUVZNaXVmm9n04zrGAmjvdlLyZ9Ve1VDGYb6bnTSfveNTkmqE+J2eLPC4
 GeIRpjjGUx3iiAsCO9M4SzDt4lwIr6lXopm+dnlZhX5psbvwfJcyk2KsrnlZZSgk/SgN
 vM5pVyTIPTpvus5KH3boL5JNqIueCzB75qkIDqnSu12tvaJPTiksnWtcxv8vjRUgaN7H
 O9cKarL0t4MMoGIqc7/5e5jRmeNgrgTY6PuphQXNY135QuCgTsINBCkbswIzqSAs1sTA
 bl5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQS//DVC0vD3fV2fHDXjAfo5TlEQNXANYjgxQ5DQ7w+60+x/SNIQxO8PmLp1WQaV+gq5kc8qhsfNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv9ntnXYmzNRybNWiwzkyshFJyyR/lSJiPYHVFRlFpD/dxDYuO
 eOkw8HrfOu4uWbsEcBGjU+AXL4lFDhjOf0EzGk+f+mhHjqeJ4QXN0Auq72HWeRdqB9e30Hr78cd
 zxfR4G8a7jRJsxeZYftOkRslqXIWBxck+IuOs/fdpO4jGY64MKcm0A6djeU4i5BhX+KI=
X-Gm-Gg: ASbGncsZqbqhrrspBcH0K7uWlZSuFd7/R9tbV0Uewl6KuAPcWKpnCrdpLw9FRNE1d9b
 j2XTKoqjT+AssKoSex+UMfmfnWlcR6NCGkMS77woTtQgez0OBNftzVKhTuRTYGpcqnvXWl7pCz9
 MvtZq5Po0tmbYF00R9Qf33q6FO1qh0rPcfdeoUJzMAyOIVj4YTW0jkASWCTRBNKv74A2SdQ5TCb
 74XSd7oDGs2hSaxL9lNvG7BSGYY9YzmRxQ2lp+4Hqr4Z/KVXkwK4whgKiAyI4p/CQJJV0XeT8gk
 ydt6mKFmQzJd2KHb27uAeVLRYxW9OudD9+per/V4+ouhLc/iAhwMx0URu4r6pn+wvEns0hBGrVv
 MbTs=
X-Received: by 2002:a05:620a:c4d:b0:7c5:4c6d:7f95 with SMTP id
 af79cd13be357-7c77dddd504mr1034345885a.48.1743970375709; 
 Sun, 06 Apr 2025 13:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8HcuVy420ofuMxKjaap5079mCf5g49f9eFhqlYXviEaGsK9bqA0z16b86EzmKh4ysjdA81w==
X-Received: by 2002:a05:620a:c4d:b0:7c5:4c6d:7f95 with SMTP id
 af79cd13be357-7c77dddd504mr1034343085a.48.1743970375372; 
 Sun, 06 Apr 2025 13:12:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f03124530sm13925971fa.9.2025.04.06.13.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 13:12:54 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:12:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-8-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: 1lOtODhTfNg1bb6GoPlPyDw-X9uKHGEX
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f2e049 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=DHtXK5enkGFnJ6Jc3mUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1lOtODhTfNg1bb6GoPlPyDw-X9uKHGEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=931 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060147
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

On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>  1 file changed, 207 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..8e784ccf4138 100644
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
> @@ -517,9 +548,135 @@ &i2c11 {
>  
>  &i2c18 {
>  	clock-frequency = <400000>;
> -	pinctrl-0 = <&qup_i2c18_default>;
> +	pinctrl-0 = <&qup_i2c18_default>,
> +		    <&io_expander_intr_active>,
> +		    <&io_expander_reset_active>;

These pinctrl entries should go to the IO expander itself.

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
> +
> +		gpio2-hog {

This needs a huuge explanation in the commit message. Otherwise I'd say
these pins should likely be used by the corresponding anx bridges.

> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi0_int_pin";
> +		};
> +
> +		gpio3-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_LOW>;
> +			output-high;
> +			line-name = "dsi0_cbl_det_pin";
> +		};
> +
> +		gpio10-hog {
> +			gpio-hog;
> +			gpios = <10 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "dsi1_int_pin";
> +		};
> +
> +		gpio11-hog {
> +			gpio-hog;
> +			gpios = <11 GPIO_ACTIVE_LOW>;
> +			output-high;
> +			line-name = "dsi1_cbl_det_pin";
> +		};
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9543";
> +		#address-cells = <1>;
> +
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> +				vdd10-supply = <&vph_pwr>;
> +				vdd18-supply = <&vph_pwr>;
> +				vdd33-supply = <&vph_pwr>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dsi2dp_bridge0_in: endpoint {
> +							remote-endpoint = <&mdss0_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dsi2dp_bridge0_out: endpoint {
> +							remote-endpoint = <&dp_dsi0_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 10 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&io_expander 9 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;
> +				vdd10-supply = <&vph_pwr>;
> +				vdd18-supply = <&vph_pwr>;
> +				vdd33-supply = <&vph_pwr>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dsi2dp_bridge1_in: endpoint {
> +							remote-endpoint = <&mdss0_dsi1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dsi2dp_bridge1_out: endpoint {
> +							remote-endpoint = <&dp_dsi1_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  };
>  
>  &mdss0 {
> @@ -566,6 +723,40 @@ &mdss0_dp1_phy {
>  	status = "okay";
>  };
>  
> +&mdss0_dsi0 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&dsi2dp_bridge0_in>;
> +};
> +
> +&mdss0_dsi0_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi1 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi1_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&dsi2dp_bridge1_in>;
> +};
> +
> +&mdss0_dsi1_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> +
>  &pmm8654au_0_gpios {
>  	gpio-line-names = "DS_EN",
>  			  "POFF_COMPLETE",
> @@ -714,6 +905,21 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  		};
>  	};
>  
> +	io_expander_intr_active: io-expander-intr-active-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	io_expander_reset_active: io-expander-reset-active-state {
> +		pins = "gpio97";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
>  	qup_uart10_default: qup-uart10-state {
>  		pins = "gpio46", "gpio47";
>  		function = "qup1_se3";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
