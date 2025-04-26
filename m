Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ECBA9DA03
	for <lists+freedreno@lfdr.de>; Sat, 26 Apr 2025 12:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018A310E347;
	Sat, 26 Apr 2025 10:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZmpxzfc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAFB10E243
 for <freedreno@lists.freedesktop.org>; Sat, 26 Apr 2025 10:12:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4BsXi001010
 for <freedreno@lists.freedesktop.org>; Sat, 26 Apr 2025 10:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z+Qcn5tAPyhWCpf8v43q7uoVPaklSa31BM363czGaA8=; b=oZmpxzfcIwuDHd6x
 YFTkk4Bbz78gW2TDDdYmnCLQAXNjQluvpVi88EGFOaZJtKbauWpCBv4lVsGJQeBb
 /2AVCFWkEdU2z3NICrE0PRYq29GgqcJEORtQ+DwSwU0iLAknMFoh+Vmw0oyGNmVe
 DokPCAmSJIqruHu40xRrwDUF6jTDUlHu2oBhgXG1MFG+8lc2g538vAx1TT8BjDH5
 5bXYZGJ/TdWVJsC+di3D6tHkgRFXNc+nBTfMJpCgtxWnOI2IbIccMdQ3txiN2Gkm
 zNAL0CVYo7XomXG59rwbiuz+X5uMRL0OB9kvfgwqx3bZGkgmxfoZbxWPcTKUSgV2
 /R1+ZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hgrgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 26 Apr 2025 10:12:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47aeab7b918so7360721cf.0
 for <freedreno@lists.freedesktop.org>; Sat, 26 Apr 2025 03:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745662369; x=1746267169;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+Qcn5tAPyhWCpf8v43q7uoVPaklSa31BM363czGaA8=;
 b=bU6ZyTZaMGzxpzvX5b84Ia1xl7VTakr1CQ9fncs0zayyNdrQDMhQsfBhL+hdSvS3Zd
 CjZg0iVxpoX8mhlYMSq2Lt1I/jqzbw9vTeUFRHcF7FN6yGfHzx9Y7dd7rNK9aUZAvb67
 GO2vKFSZCynKmdVgXj8HsXjhG24M8L82Af4rGsiLQIiPdY/v///++Vv56LMqcaJRKy9h
 am59GVbzEcjcyr5aI9tWDeqYStJXEyWZkUlVRSwpwsHfruQHC6L6WMyvxyoIvw4R61zQ
 y+RSsOPBH1EOcmYfxnk1xCwTch6euCkGv2EgEQQrCc38yYtgsxynILsGil3HbHdf+0Zg
 71xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyaR9B+Pvg35F/Zc3cFdMO1mPqk1yHaZi4mMvhxndkPlM6H5ROOMBK9qwltWafiSSwUEPFIEMFt+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT3m3NnQCVnlFAwsUmvj9OMOnli1jQA6vR89zVDLQ4/nfCLcC3
 CAeihjlCOZ4bTGxSs+RvOYenOekmcXg4Atrxe29IYpnWHr5NUxoP0YDt0bcGdt/rsmxuUaCTGrk
 6l2QDlT3QhFa2wrmh1P/TCIkDnF94SNUEpH4HpcJbNJjKNIeMqlTYLZs8VX39a9hBmNU=
X-Gm-Gg: ASbGnctKh4/QuVk6Dcugay9FeTmHJGhEaYjUVLJGkoh7xgbfh3LetLlYoS+s8MB1NU2
 mJz1VAeP72J8RDHZ2t3dUoIENFjYbtLlPi9Gtv16g4gKPFAaCgLYBtJltlM/Lf/CWdM8NRTNaRT
 bjgaYVj0dTwXGCFbIIGHWG48fOBUR6O7Qij5C0i60w5zXMjU0w57m9FLPPtLpaUvFI/k2qjIPLL
 +plhDxE+t8xPDj+fUVsSxcW1hQI5BqYoWhWi5IZTApieV62ZRXJUtE0ds92jf9MVm/VcAbRXhqr
 +CQ4GGLFoXu8yvReo6mcGsMzlH95DOAFWPP4KmA5lEsB3rg1HbqMrXQVOurpnVqGCZY=
X-Received: by 2002:a05:622a:1b90:b0:476:add4:d2b5 with SMTP id
 d75a77b69052e-4801c2c33bfmr32875321cf.2.1745662369416; 
 Sat, 26 Apr 2025 03:12:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8y2/2zXerVowv3WgwNFdVM4P6Z1IVdhvxEp0YRKkj25bC74sKgwxuOCG/XTskyzaDy0UV2g==
X-Received: by 2002:a05:622a:1b90:b0:476:add4:d2b5 with SMTP id
 d75a77b69052e-4801c2c33bfmr32875051cf.2.1745662369029; 
 Sat, 26 Apr 2025 03:12:49 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edafbf0sm264090566b.168.2025.04.26.03.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 03:12:48 -0700 (PDT)
Message-ID: <11e76323-db6b-428b-816f-e96fc9523fe5@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
 <20250424062431.2040692-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424062431.2040692-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jw9fgDMhC29FobrGo0sWaXfGyWr6LoZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2OCBTYWx0ZWRfX3sT8ywDbh5IZ
 qMK1oPEHMzNsG7P7iiVnmvgBlczKo/CGOV8wT3VbXbFNuI4w0zfyqp15fqTF+l/KXYiNMKSUf8k
 qohQb0d6BL3Uu/789BknHw8tezf/PmgA+yliCNZZN9OlWa6pV+VUdafrxYEPH/9Fb8E4WwfxyTP
 UH2sLxQUx6SXpdkJI81kE1EZx5prfwOkDOQcipzG8S2hgKWsZPbYW9enlYARInYRrJ8FzvfYC1c
 /nxXwVig4BH9kaxpOuIgHKO19JK0osgOFHUe8A2tnaTTW/8Vn3dvV+qsqKWnsmLOtH9772HzINa
 gnabi9IRVmPdKtOVb9oO+pVrZVYDx/9BHMNHheArExsnZcMtsHnKC0Q13AzykrkkwgRFCTanuO7
 y9BkWh+7oIjQjU/LLUfKdVWBDw7wJJIKu4qa/FyqUj9/PSfhGz47I+zHgBZTboSGmGnQlJH1
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680cb1a2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GLHRRWOWZVtnXAxWSSAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jw9fgDMhC29FobrGo0sWaXfGyWr6LoZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260068
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

On 4/24/25 8:24 AM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 181 +++++++++++++++++++++
>  1 file changed, 181 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..b8851faec271 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,13 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";

Please provide a reference voltage for this one

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
