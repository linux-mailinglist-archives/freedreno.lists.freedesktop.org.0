Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B6A84DA8
	for <lists+freedreno@lfdr.de>; Thu, 10 Apr 2025 22:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B15710E195;
	Thu, 10 Apr 2025 20:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CekWLmOX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350D010E195
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 20:01:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG1LB6032650
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 20:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cQKF/VxyCC/OpmAoONC18oPV
 cOgA+smPZj7cgddFWhE=; b=CekWLmOXP/799feVGPBXyj1rLU0O205hSip17lRn
 1ZYB/jJTw5GWr9C/+D3Y/7cwpC90R0y32893q7WDyQNgHlzMZj12S3UeIrpNrgSh
 AmyPeytI35uNhNHR38qcioQoKtpU4o77PbSq7KmkdTUUnR5GzST/AxmBQ0kAUW+u
 Wuf9R+Q+0I38BY+GQBgxtnVwwhOO+FyT+dyyn4GqFBedvqdYnAtZQbFHx6pELFWQ
 jy/fqStHIgA1D6p8GZDWF8B9TTt2AxLyJmooiEP769ozMIoUfLbDGye2UmEz/qpt
 mnG3iudCH4i8IMKScfwJ+X5qjE3170a9RGSYFJad9KSwKQ==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkr0k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 20:01:52 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-85b5e46a526so152060939f.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 13:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744315311; x=1744920111;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQKF/VxyCC/OpmAoONC18oPVcOgA+smPZj7cgddFWhE=;
 b=BcvikBYg9EH6+W5yMzdEwjDIbwTZHS/pemarbJ/jygX2gBE5xAcEYqNt4knBpE+pCu
 m23K1SA2QE0rEYJOe16D3WixZu+fk9cuPVeDF4guVc8khwzhuvCr+0ceC3/WK7q+30J9
 HWbLY0aLq3fpxMYbf55aK1WgaXzEx7JXPGrO/DqQ7R2VDO8obftVq0y56tIZcvZ5mdum
 pp7UgQH1ZQNxeBzxvKxGkzlf5PwtJuKbPHShy0DPsvtV3x+Rb/yJ1DX1xwNtURBT/mvA
 SuH0oyECOjU9zw39VHUK8i6WETCC0B3MNFnR9My56YUmqAojyjNsngBYAL3o+AO0h3fi
 dBJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmtQzcwkn3w63whBBSltFuwrcA+6jaU/jpr9AdhSgdVrfP3/ZbbRy8rpK60EWLotvEI6p4NAuXOBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTTzOIN42wgNvJam8TeDyArBAsAY1JoZKAr2cWnXqWgT7odwtm
 +VIYBlHZv2Fy//Pxr3V00i3ZG5P5AnDGF3jiaA94JufsQDH21ebiEX1Rb/D4jtPrpN5w08rdZ3j
 Qvur3HA0lkHc8yQifHazEJYYHql7bgBxhuil5pZf7LjqREa9tGjlBRJWL61T2DCPpjSw=
X-Gm-Gg: ASbGncuamRg5fj3LnpXwITu+FeFoKF1DhpFGkd76hZps6+VctZqE1L34Y9HtCFyZ//a
 XpS8nMaYstDQRB0reKuFn8Cp+6u9q5xgwOp3Sbk5o53vV4m5HHFkUd3MwPXAa6tM1i+EAFBm/+C
 GIFM/gtiuICZfcYQTa0vygkl1KaHIUu4ivp+cPCZ25WTTNN/KmAIv8CMZr1jXqxZOJ9yrL0F0SJ
 sym4v6YFKeV8SotnTdpc5DgMQXE2RGdz/zdNqs3iWd5xTahxiFeCje1SXXBf31BN06YppecucNx
 MxNjFmFkXq/u9rz31n0Sn2qZOgwkvEE3+zhfiOu/nMdApWiAFkJBnKllujzGHti2/1aB6tQogoA
 =
X-Received: by 2002:a05:6e02:989:b0:3d6:d162:be12 with SMTP id
 e9e14a558f8ab-3d7ec277267mr1619345ab.21.1744315311165; 
 Thu, 10 Apr 2025 13:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOcgglq72/KtLWeA8A2vkExuJ9YEmeKKzeIWF0tQFF4TsI9WFOgD8ectS26sdoezA0dGVAXQ==
X-Received: by 2002:a05:6e02:989:b0:3d6:d162:be12 with SMTP id
 e9e14a558f8ab-3d7ec277267mr1618855ab.21.1744315310705; 
 Thu, 10 Apr 2025 13:01:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d51006bsm234397e87.170.2025.04.10.13.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 13:01:48 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:01:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <wzqct2y67h6bkazxv3se77slsheaw5rspgcrcfjm7ngr5t4alw@nktpqrt5woky>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
 <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
 <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
X-Proofpoint-GUID: odS4NyXBq-CnhptvdzBrn1kG7jcUjZml
X-Proofpoint-ORIG-GUID: odS4NyXBq-CnhptvdzBrn1kG7jcUjZml
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f823b0 cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=u-yodfwXetj8OPw8cswA:9 a=CjuIK1q_8ugA:10
 a=61Ooq9ZcVZHF1UnRMGoz:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100145
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

On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
> Hi Dmirity/Konard
> 
> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
> >> Add anx7625 DSI to DP bridge device nodes.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
> >>  1 file changed, 207 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> index 175f8b1e3b2d..8e784ccf4138 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> @@ -28,6 +28,13 @@ chosen {
> >>  		stdout-path = "serial0:115200n8";
> >>  	};
> >>  
> >> +	vph_pwr: vph-pwr-regulator {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vph_pwr";
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +	};
> >> +
> >>  	vreg_conn_1p8: vreg_conn_1p8 {
> >>  		compatible = "regulator-fixed";
> >>  		regulator-name = "vreg_conn_1p8";
> >> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
> >>  			};
> >>  		};
> >>  	};
> >> +
> >> +	dp-dsi0-connector {
> >> +		compatible = "dp-connector";
> >> +		label = "DSI0";
> >> +		type = "full-size";
> >> +
> >> +		port {
> >> +			dp_dsi0_connector_in: endpoint {
> >> +				remote-endpoint = <&dsi2dp_bridge0_out>;
> >> +			};
> >> +		};
> >> +	};
> >> +
> >> +	dp-dsi1-connector {
> >> +		compatible = "dp-connector";
> >> +		label = "DSI1";
> >> +		type = "full-size";
> >> +
> >> +		port {
> >> +			dp_dsi1_connector_in: endpoint {
> >> +				remote-endpoint = <&dsi2dp_bridge1_out>;
> >> +			};
> >> +		};
> >> +	};
> >>  };
> >>  
> >>  &apps_rsc {
> >> @@ -517,9 +548,135 @@ &i2c11 {
> >>  
> >>  &i2c18 {
> >>  	clock-frequency = <400000>;
> >> -	pinctrl-0 = <&qup_i2c18_default>;
> >> +	pinctrl-0 = <&qup_i2c18_default>,
> >> +		    <&io_expander_intr_active>,
> >> +		    <&io_expander_reset_active>;
> > 
> > These pinctrl entries should go to the IO expander itself.
> > 
> >>  	pinctrl-names = "default";
> >> +
> >>  	status = "okay";
> >> +
> >> +	io_expander: gpio@74 {
> >> +		compatible = "ti,tca9539";
> >> +		reg = <0x74>;
> >> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
> >> +		gpio-controller;
> >> +		#gpio-cells = <2>;
> >> +		interrupt-controller;
> >> +		#interrupt-cells = <2>;
> >> +
> >> +		gpio2-hog {
> > 
> > This needs a huuge explanation in the commit message. Otherwise I'd say
> > these pins should likely be used by the corresponding anx bridges.
> 
> Thanks, for the review.
> 
> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.

Please make sure that there are pinctrl entries for all pins.

-- 
With best wishes
Dmitry
