Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB4CB2692
	for <lists+freedreno@lfdr.de>; Wed, 10 Dec 2025 09:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C8410E250;
	Wed, 10 Dec 2025 08:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEsdP+jE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoXGwfKn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F4510E250
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 08:30:44 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BA6Ebin1599941
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BaVrsxaWW/xE3ijm84e8O1hc
 kueX7M+RVS9RTEowbKE=; b=OEsdP+jEmVLOtgYQJdWiV0cdwhOLghB6WILlPtow
 iz9n9w35272+wXQpuGJ3cTvvnf+04iCTYno6/qbGTynUKrc5AAAOcWbDe8w08Qmb
 Xak+veMGTdahnIprG7Nsa2E7paaOw/SzkbTrykCbWQGBImrXFXiGHbtlBylT4aNK
 AbKg7auT7DV0tEigcaABid1or0GK82GYwcn+ZJwW5zkbeJoU1hox8r2P6tQSiK3u
 JMju5s8IWO7fWZIPBO2ON0lzwEh1q/8FfSyWWAIg9acjTrBS+vady3NjVlKcrB9U
 MG1MN/rsxDKgymkJwQHJbPgRQwZlw8VukXHUm9USYcTdmg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp0mvh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 08:30:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8823f4666abso147759256d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 00:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765355442; x=1765960242;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=;
 b=BoXGwfKnAX5EEzev2woinGFBy/uS4dztfT91Fk3whM76xnuoo59CaEmdCJbGfIOike
 hqXArEV+jMy6u/452fyRIrN6ijZzC8zG3YR1FV2NC4f4tfhYg+26V30ptY/DiOBCHj1B
 SdIatMplooUEph/mLQTBIPsYMj0QBFmoUFF0rTxNdhNcjzyShh2YrVcTRGVtDhMpzzED
 b+PaFUtkfB8LrYXUWb5HEbgposEKbyubTUt0Qfn82gueef/U2aNm7v3K5ZUEc7XjMhsq
 mBx+tm+bq5Y0um3wm34QyyPKlkObpiEU+a92p00vWXXgmhjii3cMVq7FyL43khXQBoel
 Ig/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765355442; x=1765960242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=;
 b=oZAcU84VXY3Zv+s/4JYZ/Gt4Bdh7fdxLRlcz5x4UuXgJOlPegG2m+ymvkwzEGfToRs
 apXDzWe5iVTcRfMhRtxWZXERJCx3yi38DTTaJXGnByHNCEcf/6AQmgPxe3RyfA+9L2DN
 v9BanA0C1aoDSW63WC9mxLLYIE48+F/5z1Z4kViprBVVKHc7gfNSvFn5DLGbnl4VPR6n
 /MUWu39LUaWPYTxCGOICbCcX7Dp89KuH+yp8GdILRv+uYawzF54ZvZH8aNgGqkXj786o
 ysDNBG9dLz2CFNI7QVM5AYMxoIgSl/GYlZpXoDvIfSJ2cqpXM0kXmADSpydVJHNJ4OHN
 ozjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWQfXD+bV5hQ5rT9qhEXQF1G2pNFTK6yaDNaHh87wl3mJyAWQMLJGtNb2qzUfl1D9HLg2Z4XFJms8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHOenx8+YCVEZkDGwSXTHtbZ1QLTZU1+a+lyEidp0fiYbkuxH6
 VCgPzInGee3zL5x0nPyIc8cLFlaVepH/kF+2EpwHno6bZoyUYNGapwMFyPc3Q8olPg1iJmcbrX1
 nFNpGdiO3g1cNIPyNCA4TCu/JDmJ9OJcdWdIL+omWpSWZn4fhQ8j7Mn1DaMxEEWE31oqtURk=
X-Gm-Gg: ASbGnctj0/QLsZj3UJQQl+QXTukgbt1zVTThZJzmDKHA6C07Nj6sseKYGlNrxmXvKFi
 sZurAM4Q+42dVq4mMgNQT5fh9p5radAkzUImRhELGNqaW4CxUHCgfA45EsrsgbTP8awcUN29UkY
 3luNNUPdihOjfpY9ijeb7nLnrMsHEAN7qAB2/wXmRR3yaACe3icYOpDBfhYtz7H3fNd/84pZvpl
 teK5QWbaOMb8GpObrhJX/Vme538dyCS2zZ6pyuvjzva5Rt3yIST8N4R5cPvlPAP3FUyBjCsVEBJ
 7CSd7E+Ooao6gwUqHpwJTuKDV3aGt4/jwyM9webfvHXEwmzG2Z4a6yf/+vL7emgUoFY0+ZDI0SK
 C4DcwlWdq9gNH0Fhwg2evcSLAJdtm4zdxf/cdwAw/FZqrutxMaOS91QAmlL+UekXIx4F2EA9a0Q
 /1wmTU+k1bSFuEX7gfEb29FrU=
X-Received: by 2002:a05:622a:a30a:b0:4ee:1806:97f7 with SMTP id
 d75a77b69052e-4f1b1a7db1dmr15168711cf.47.1765355442542; 
 Wed, 10 Dec 2025 00:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtqikgbD78OR/TCirFrEnhCsQjS6VLCnfWR6a+KQxIbEmUhDluyiIUFEvvL7QnBCmP9kh7zQ==
X-Received: by 2002:a05:622a:a30a:b0:4ee:1806:97f7 with SMTP id
 d75a77b69052e-4f1b1a7db1dmr15168321cf.47.1765355441988; 
 Wed, 10 Dec 2025 00:30:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e2acsm6186915e87.61.2025.12.10.00.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 00:30:41 -0800 (PST)
Date: Wed, 10 Dec 2025 10:30:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <cndguco6ijb666ugbqpbffyhbbgs2nyno3qujuevz5dnpegir3@ygkh7vctnzuj>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MyBTYWx0ZWRfX/Y/hyhWPuKrW
 mOddrbJKixkXQ/FhgzaGEbUMaB2iJcxeXP1NhiG7g8FpVOb+ScVGc68kIenRpuXpFvPY4qCIqGj
 tBitOmAb9hfrdqQFNZ6yNL2OpPO9Kr+KXJ7Jg7F6aqiITsjEmiWukxL5ThIIQG3Y/iVSP8SxeF/
 /oSodJbBjzeH6gteXRPIUeG9fW/xcEucDyWiprq/eL3dFcVp2FbVdxfZHoZIs+/mDt9PsWaJ/Z9
 7znnwx+0/NJiGmpL8fmnj6Q2PJMur/yDY2i+M4lVjtfJnUZClE9wOmD5UoK77q3SEtWmNrkBjWa
 kaqyvurSYQVmI9rAJmQKGWOxS6Atbt5KyaJbY4f7QA44iv2MqqoRNiAqoAhEkZ7HSRypYA9fcD6
 J72lb7RSX8pMPSq/bavTXPOkgbLI9w==
X-Proofpoint-ORIG-GUID: YmPRAB7HEs1bOzqovC1uBXMtJQtlpOFj
X-Proofpoint-GUID: YmPRAB7HEs1bOzqovC1uBXMtJQtlpOFj
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=69392fb3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Dm6QUQfMve3NhQMXUkAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100073
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

On Tue, Nov 25, 2025 at 04:26:21PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 338 ++++++++++++++++++++++++++-
>  1 file changed, 336 insertions(+), 2 deletions(-)
> 
> +
> +				mdss1_dp_opp_table: opp-table {

Why do we need two instances of the table?

> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +				mdss1_dp1_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +		};
> +

-- 
With best wishes
Dmitry
