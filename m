Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA8BBDA3F
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 12:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0977710E3E3;
	Mon,  6 Oct 2025 10:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxJ6kvb1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377FA10E308
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 10:14:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960G2Bm012993
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 10:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Pkk1RkRlbB41L4lHFoSJJ7UG
 9ReoAbhWG7PYzEdfnMA=; b=DxJ6kvb1IMmD7N973bpB2J7zMx9/sc9NyCaUwE5j
 iLdASxs+Fz+zAlJWpkUUwqq/fM4+2JG1FlQ4ij6hnQwbdeOlcOczRZ5Q6piwHB17
 BU4THkDH+lc6yClZbDOq7sy06II2IhTQi8tByQB/FfCenp3XAxMwt9rZ9wt/QvHr
 NCX1tgfEGzZ0MFfmto+c8LlirzLF+kQ0lbe6VrMIgDlFXpdkLJvhbB7sPJwx+Mxp
 tQFhGv8NfPkZjSn6PjjrexXUDjkG8iprQQnY7y4zGSNmeXCOtfowlsb/KQfQ0Ugv
 d3AVkhS5rjoF6gzT/0tDOFmThQSekyPq7jXEC/qyw9g6zQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9durea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 10:14:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4df60ea7a1bso97457861cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 03:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745663; x=1760350463;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pkk1RkRlbB41L4lHFoSJJ7UG9ReoAbhWG7PYzEdfnMA=;
 b=luoFX6VMoCl8R8fvv5hxs0SW9k9j91olPZSYNnpU3iiX07+4AKjc+ItQBYSQSm6Y7P
 L0wFLvNrllLSQuv+fUpwVHWj+4zs7EDvwYopi1y3Mk03mJtulCTUH9x83NGNQbwUVsel
 TC8Vdghy93Nal52qXGA0c6ImONiJylYi5yiV4t4to+IcT2hpC8KHuUbd6qHTWfNzMR9S
 o6JOAOZ6BRrWl+f7ZywerkdZdyZcr7ZrFwNnWqwAXbLuxhNs1zrjVI9x3nIUWPK4vB60
 7EVwLOliJHaSNMGEhnH8k1dw2N5KRGWuhyyP1j8cKFBAfjEesi+mC2+b1xIOSFXSI+aV
 VKZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE+W6WbBPlG47eqmVcxqnTIZTRDd9mNPrvH10BJMUDoY40g/3IkXMU9w6a/IsjHytSncN2MWKtZZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaksqTsLeahcIx5fhDTosUydMkzx5aJXQBF3vO/JrqOuKV6VeW
 JIzgONt2qCVG2DW90Q+sHVOQtcW3QtVat673W36L0Odqo5lP3TnApcUI9s3fKZBpA11cUINEPfd
 9Jr9EzTEKVDIbsDzikvlrH/SqK3RFxmZCwndXPVLqOA7UzxfsTYgr1fxLJMB341I+U4aSbho=
X-Gm-Gg: ASbGncsGsxCarxzjtOmUrDYAXCau8cCrQKrcyTIy0txOyI4RZYHVJiqGr+6OmWmmqep
 oVwV5BiGSi8jqJTAOvsi6hTEo5jJW0nh0J6sQYs74WspVXOF8r7Xbcl97dSp7/SO7pIpRqHOW7i
 XQb5TsYCqmxdz3GkJtBcsM5tW4tbReXZ2Qf7dXv58/oK9vpSbnNq9jHFbr7DLETceaI3mtoe8KY
 xwArU9TdMnatcAAaKvm+m5t3lK+21p4o313w6uqdawv1hbsl8YyBs7DXMr/D7OIDWK/vSMwTOnw
 3nfcHeI32+J5vUPjQQbUmiHlR9irADNMMCVhsUbOQeoNd1tk/Lc/A0CPflOGv+aEZsFBsxvhIN3
 ArWonH4Cswh7tTImqTN9asHHJ/JrfOE86/o/VuG9IfeTAsaZ43KwaimeYZQ==
X-Received: by 2002:a05:622a:19a5:b0:4db:db96:15d3 with SMTP id
 d75a77b69052e-4e576a7bbd5mr115462321cf.31.1759745662733; 
 Mon, 06 Oct 2025 03:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2mRS+PCS8yqh6XoTz4k2QRrzCDf3fx5rt58x+S+tnSIyPuPPK5UjHLpMhBU2vR1wjv9UXMQ==
X-Received: by 2002:a05:622a:19a5:b0:4db:db96:15d3 with SMTP id
 d75a77b69052e-4e576a7bbd5mr115462101cf.31.1759745662272; 
 Mon, 06 Oct 2025 03:14:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0119e4a5sm4890540e87.93.2025.10.06.03.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:14:21 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:14:19 +0300
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
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Message-ID: <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-7-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e39680 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=OIU6w6j0321fZR4p8lUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xYS6cr-DaYdsVZkYeAchPaF5-nC3_CS-
X-Proofpoint-ORIG-GUID: xYS6cr-DaYdsVZkYeAchPaF5-nC3_CS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX/t/+9S9kpEjk
 zJBmLhk8PyeUkVQrqpFrdtvjaVsRl9RrLuDVc7BLsK9sz6oPOciC5fm8h9fLm6UJ9fK0L8vtbR9
 KsCjfj0Eic8i9fSNFhFBMDE7F/pFIo5najX8pBcVA5XVbZ6hyxcw/FswkK+89D+aIyuu+akoQlZ
 zuVew6y44iZdkPf4xZQtXp1rVFaaNQlLI2ZNa1WQ0Z2k+V1F09nQCYDkIfanultmwPPURh45w7s
 VASt2RQiq0My7DKBKxSR7GC6J71kK/lqVa2wQqBfESFzu8nlcslVuBVMbc2gy1MXz9pgbtHu3cj
 qsD8FJO5kgYgUT0uRi4El4qFDRMdbpPGV/om1+IpNUJlzhUpPLTzvIyCyMEM5DLGT/xYnX4Bavm
 LFstgwynOtC5Df4kSqrnoDczKZih6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
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

On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
> 
> +
> +				mdss_dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};

Does it really support only a single freq?

> +				};
> +			};
> +

-- 
With best wishes
Dmitry
