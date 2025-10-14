Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5422BBD8BA9
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 12:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80B310E5AA;
	Tue, 14 Oct 2025 10:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOcEkjAA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3497C10E5AB
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 10:21:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87iNn027268
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iNSQ6LRQ1Cbo1PkY0QhX/x6y
 YGsX22LMPrXlD4eZXtY=; b=VOcEkjAAYW3HxoXQJrAPoPRS1H0DpnKc1Ejl+suy
 45hI7iAXC+r1GPylGOksA/FHWeCB0X6xmINdZ2VDenqZooLgzv52c7zTi5xbWKoG
 cvbTgYI1NbSH4c5HkutAUJObwdEh+t5n/de+j+Xv8YaRjw0MvjDGOBjuHgw92uc9
 e6iDemj0fcTYqQw0lvNJfzoMYZDQELlqJ9Vqj+v95QJhasgsjK9luQjqsNhBBcB1
 9RxYv8WuhGvQ8HF4SllFM9pof2CaviPX+GHRZkPdhG5xtmFkK9hHPBf1sZwVQ2B9
 UrjDBDwLuHIFM9g8wVHZFCtFGCkSxg6ruESGA7LHVb0jTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfyxse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 10:21:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-86df46fa013so3299730485a.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 03:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760437314; x=1761042114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNSQ6LRQ1Cbo1PkY0QhX/x6yYGsX22LMPrXlD4eZXtY=;
 b=t6hdbjarkrTTtVgtbhMM6iP72M+ll828PdMurOs8cPgsmMWkUKCbE8W7/Nc9770uXo
 tz5n4H/kP9V/1pY+Q5AI80cEHpSPExc4E+PthLmts4SJjeDaHL5EBak3QkBwMDM2BqJ7
 FRpRjQfAR3p7F/k4Mn8/89jqFMeMnVrpRhrGF1f9RKBlBAbjgEJ+142oCxodI+mPGjLx
 ZkYBTlYRvgWyxfdKyi8+AAy5ZnVMV26duFCnrmik4C+mrG6rJiN9xkgA7KbSjhx7WB4y
 4XWhfcPdfqKLt/vc3ld9YNvD9XqzzuO79VY5Ty+2nxROI0wnBdehdlvJCHkAlGkWHBLb
 nHYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8RH/sM7CmKbUV6qAVBmnzpZd5Iuv85/qJ5500UuzKqA6gcA/SqkjT/4mcoGuGL9hT8MYjatLGk+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRrtVSQkZ3XSKVI9tEPRoa3ioT9qdcjV2JgUolcPazh4hx9DNT
 2MKh42mIezsmuHuJtPioN1Qy+5NZKOusvj8dVHZlu4YfZ99XE4UB3nq6VEPGGfOrUwBwVcAa0Pm
 k6THX3XKemFDczq6u9HJMVA46nW2cT2uxecwLRUm+/dpZmv+OcB23BLhVwMTOBwQao20E4a0=
X-Gm-Gg: ASbGnct5lJmL0z0qZRmWQn3c5vUhweFBAOG5Z94dkgjHDFEMpLtmjS4FpZ8Wpvg4mE1
 pAoTZnaU7QKnksj1gOYSz+4JRMgzyCxWisYw0sQsv5byk/mvt1ECVG3e7VlDL+tV9Pj4NPjSRqs
 VM6wIRJdT/xwb+9lUeaPMEFQIOcz2nK4YFQAlL/KsSkT4qi/1IfFnB932giHPE1WVuIFem5Yee2
 lIjfYv5lL5pruVPE8ivGlhyamXOCWH7uixg26IxDdV9DxR0FFfDCKNkvW9AdsP2BoLvvvQ1sk5s
 xeuRIppSy/4wzXKi/Hfdq2Tge5yutAB+q93kRfj8X5z3Uetv74N1pSuKAH5dMmffRI37OJjsifN
 xRmPSDeLCoAKGZpb0tmnPuP+RswbPDz+bfjrNWuwc+PBojZOHmWZI
X-Received: by 2002:a05:620a:2981:b0:84a:f7cc:1eaf with SMTP id
 af79cd13be357-88350f575a5mr3980331885a.35.1760437314185; 
 Tue, 14 Oct 2025 03:21:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDMRw6EyVXSGprMYoPwa1DMLzUKICAtaPYbkxU2KjxKpjARAfamItqNhipppks0GQVOsrWYg==
X-Received: by 2002:a05:620a:2981:b0:84a:f7cc:1eaf with SMTP id
 af79cd13be357-88350f575a5mr3980327285a.35.1760437313692; 
 Tue, 14 Oct 2025 03:21:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908856e301sm5095511e87.93.2025.10.14.03.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 03:21:52 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:21:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
Message-ID: <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX6jPML0fa/KGI
 IzmgDtADscQ/eT+QCJLpLmM1g7XmooJzzOEPx8YGIHSnLy1rOr5dPrnaI3gZMiw4lbGz0ZY6FyI
 C+h05BBRUviPz+4K7EEaIzDfXPSoMVIAGCX2unUfKBL2mns7aeoBEbl4cWtDaEOlRxSfq0UzU2o
 IjjbsRHDFZW/PUTxuEENT+rjypKBSU42pqzsuwYuq5BswEo7dpKpzHwYD1zi0PKR0xMHAb/OZDO
 FaybBYr5M1k2tM21uY+SZniS17ai1OBJgfb2vq4DOHH2+MMclx3QCbXPtW2Oqr4b0zMHLJxtnZo
 ShQ1Wdt+DRVMuX7totkfOpYPfzGtm4Gi4VAN9Bh3P9We5R1Cl9thg4mYP27b3NHQ6sSNY7fxQ0L
 RH8+HMtCrpd19C4CaU12TrWXOhYgrQ==
X-Proofpoint-GUID: x-Kcb3sll4fgDx_ZLHmSUXrG0BpweKKV
X-Proofpoint-ORIG-GUID: x-Kcb3sll4fgDx_ZLHmSUXrG0BpweKKV
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee2443 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=552JS0bYzuNWtSTagGgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

On Tue, Oct 14, 2025 at 05:42:12PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings
> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 9ac1dd3483b56f9d1652f8a38f62d759efa92b6a..0b8bcabdd90a0820b1f9c85e43b78e40eb8a9a38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -39,6 +39,20 @@ xo_board_clk: xo-board-clk {
>  		};
>  	};
>  
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "mini";
> +
> +		hpd-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;

Not the gpio102/ 103 / 104? Interesting.

> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
> +
>  	dp-dsi0-connector {
>  		compatible = "dp-connector";
>  		label = "DSI0";
> @@ -423,6 +437,16 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <3 2 0 1>;

It's not a board peculiarity. All QCS615 / SM6150 devices are affected
by this twist. Please move this to the SoC DT file.

> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +	remote-endpoint = <&dp0_connector_in>;
> +};
> +
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l11a>;
>  	status = "okay";
> @@ -623,6 +647,13 @@ &usb_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
>  &usb_1 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
