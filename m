Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD0AA907F
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 12:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8DD10E04E;
	Mon,  5 May 2025 10:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pr5Ovneq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2838C10E04E
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 10:02:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5452J1Qq010355
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 10:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/9fYSq5DweCt0c/mKdUYu4zF
 2w/AfXBHNdWtUjJsnQE=; b=Pr5Ovneqtq/III50Kuv4i44I4PfmNM4qEPTCqgeW
 2MZSh/b5Mjc5oNqAzl10w9BJwm9CzrB/vf6fUEdCtZwD6RDJM1kyoLkcOVg8DdPJ
 O4oftrZklUGUjpBPguK9FBGPc824v543r30vi7PsGTamSJUsFpW04UDxIWO2CXoU
 CdcK8tWfAY8j5DHQsxxSihY10/MHpK8ylhfZcFDcrQ3maKfeIhxS6DUijW7EfmWX
 tAkWpT7Gxs2JzY2DkB6Maz3l92h1VIdbS7m11lMJ3hHXevr6hco7cKPEyT7uGtDh
 6cVgc3qHOSq5KITO2YSPaF5lWc7cZYZZUG1R0fvh1tfwmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55ur6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 10:02:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7cabd21579eso102098485a.3
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 03:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746439352; x=1747044152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9fYSq5DweCt0c/mKdUYu4zF2w/AfXBHNdWtUjJsnQE=;
 b=rLjUO8skryIOUlEHh9/CmS8nSmbvK8Ne4VE1ni7HaAbEdDazg7Bj0Mug01GvtRD2dp
 SmxUwSUr5i0YbdHkAaknbggUl9AsdPMPsuov4GcPoC82K72pD1iGD4+yoh0lVU6tJNhx
 DcSntBpgUP5zDQWedgMF1jv9/5S/kIVascfLUNYezXP/w/PfQ3x3RQqIQadJe/0hSC2f
 qZDtg4udmtRZxNA/CkLGByt/m3nlwPosOe7XZDLyPVMM6FNXh4A/VPT5HKeFqWS7dmhq
 pGs5nAVX+idIjJKIDu0gY6VOxiqqjvaC6dvy1MDXkHYDlPS1MoSxIqhJWniOm6YOnIme
 JybA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUHP8MhUgo1Uov9/OJg9xIDbUCFSQ48arwpzZIrl15D9Q1y1PuMA6Z0i2cEOv7xxEbDivgK4mVJXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhiMG/WFQrF4P7T9LEvuRK8Mfdu+Jj41qO96fb6mtKrAsCT5A1
 K5XVMx9C2+L3SuTjgU8xJ7pFo7QG09zwlURu/kCxSCCmALeHJktK6Zq+Vc5inwhDO+OFTFPxnPW
 dexRKJHgMWoLgCJtuUbb22LUrcCUo8CpIBcQokvhlySLvQ3oBJJoRkkLzU9ZmkvkhSMU=
X-Gm-Gg: ASbGncs66zaljaW6txxmJFbx8RMwayXpIjS7Vzj+yDRkH2X1GgRj6bGj0faOAAvBf2i
 tSSbCQzm0Movfg2p/K3ibDgCud1jQBbmpKeQCbTZGMdGkjZzvyld4UvWbtO7XxKpGfpFP9L/c/c
 fPAZhZmxCbdBKd8Lc7nFUbzXlEgi+2L+yaVdq8tb9RQGzaJUpI232bsjANKqBSucp3CcHIFBJ0s
 0fMzz6q2c2rNERnlouMx2L3+6C0mct86YhlRNAPaw21bUGW9Fw5rakuFSyO+0lTkY11OBNw1YO3
 8X83PvLXwSmlGy0Z95oiRXJmPfcmzSVY7l3s8GUQQGKJ2ea5Lq2pZJlFIAJW3ISKHbIFxcvOwKA
 =
X-Received: by 2002:a05:620a:271a:b0:7c8:e67b:8076 with SMTP id
 af79cd13be357-7cadfed7d3amr1246673785a.50.1746439352348; 
 Mon, 05 May 2025 03:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqWph76clESWo+RRt5n+cffHDapDxsmW2FMxzwgdEB/oc5DR9lfIjFKZY2YWluhdW3xKhUNA==
X-Received: by 2002:a05:620a:271a:b0:7c8:e67b:8076 with SMTP id
 af79cd13be357-7cadfed7d3amr1246669085a.50.1746439351979; 
 Mon, 05 May 2025 03:02:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202b18e4aesm16561471fa.113.2025.05.05.03.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 03:02:31 -0700 (PDT)
Date: Mon, 5 May 2025 13:02:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505094245.2660750-3-quic_amakhija@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5NCBTYWx0ZWRfX232R5HflvEKX
 Vd30Y2hNENdGeoPxZmGimzf0AZ5HUSeMxVZcIiWD1qPclWEOxoGi3PRqerYrTHH15M8AzXnLp+4
 bJDXuyQH43zcoIAVcUT7Ezg5g5ZchWvFtmsQxUfCqunsIBpXRae0wiIoTY0nT7AFmL2k6VcEouu
 MmlU2ahhdZIeycsip6idR2+1b5NRWgyVIHIXD9HyPa46r1kk9WjWN2Z5f6W4hL3oyUDn3s53h8X
 aSrA37ZVHS1nPRIlDrgXX2ShriIkEFyCxatEUsyKEoNTMcq2oU1JKqUigiZLG0kgwywt0RhLGUU
 Kum1Y3ygWBMiwyvpxqSIG6UoMYI/LpHbsnfBnjUGR2gRzA7kE36gRALPlVx11S1Y6P4ON3eAYvk
 86LtK/totFdUa0Ek3jCUehNK26IJwdwo1c+3Or+95WrRB0JGAE1DegKj5IMUBYsOB5ETvRNJ
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68188cb9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NFKUjzz3svuqp3DBVBsA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2arc8FgPvW44SK3gP3HdKjbTYJeoZPtk
X-Proofpoint-ORIG-GUID: 2arc8FgPvW44SK3gP3HdKjbTYJeoZPtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050094
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

On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
>  1 file changed, 183 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..de14f3ea8835 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,15 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;

12 V, if my eyes don't deceive me.

> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +

[...]

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

Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
supply. I wonder how the board doesn't trigger all fire alarms in the
building.

> +

-- 
With best wishes
Dmitry
