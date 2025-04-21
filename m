Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476BDA94DDD
	for <lists+freedreno@lfdr.de>; Mon, 21 Apr 2025 10:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC52C10E34D;
	Mon, 21 Apr 2025 08:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3Iz+LpB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3810E34E
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 08:16:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNdpcQ006488
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 08:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qARCO4unAM6dJGj6oIu6kaF+8Quq5ZnXo3x6/YySZCc=; b=j3Iz+LpB8LorWG4/
 1CRgb50Hdr7BG4LFJAXQcqfgg1+Uj9+RXqkWfEfMwjm6Apr+D8X6NSY0xWaIuiPb
 /8b4y4IATVJqv5A4W1NFSukAznl4+FtXIAf29CGI6SUP8+15uI+PgyGQ/vJlGzTc
 OJC/P7bHBUgYXsXmTkC2GpGB/vr5ToGLBauB5n6BbdB3Fw2TqPrV7e/ha9ILEL1n
 zai/mocynsO2NurF4QT4Cn0FxuUSuYd3QNDdlXDj+Bkzhx+1gn/wTaoigp8VD9EZ
 bkn2lu58n0V5tc2ASxUlKGGAUnFYjV7lMu5pulZzGR+MYYZPmuNf1VZjQpDQ51By
 NTUDIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bkcvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 08:16:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so335807385a.0
 for <freedreno@lists.freedesktop.org>; Mon, 21 Apr 2025 01:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745223373; x=1745828173;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qARCO4unAM6dJGj6oIu6kaF+8Quq5ZnXo3x6/YySZCc=;
 b=E0HU0fSmHQtLxGqCHDyujpJ1Xy6vW6MVNGtW00yvxhjcAQ22OZSIP9qrqf6ujruREx
 ciLePG0sPG8zl6tFRIRGygf8WQChuulI6WN5maxTDWoAF0Xpf85QaxkojwtVTrm2rqpK
 kGNa1e1HH8QbBqUEc/2mHixU+8pvKpDelqLEdAfDDpT8w07xu/XKRG3htNGExqADCBYz
 DTTZ7nZhmMrCgYhk15McS0HGLAexMImznbY/pfhkNwEXB2BZz9F5gnieJbDyCTakh4F/
 Nu0e+m5XT7myr8u45CBW6mJ3SsD4NGvO3Aq/X8ON4h4UISFdmY6C40EFzcMCSq54eAuh
 GRgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXERJy/doeAkWZLXQnxMKa0pUSqypD7LlfLDpnwXCctt8WsATE3Ciqt5vBSRGi5zaDTaKEUREm06YY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJnQdsk1W8Vn3SM39SguA7T69tfhz4W7QZoprjZrqwavIci1AY
 0gafoNMJDCEgfQHfBaW/TvTziGdlcmV4DBRMNYwr5CMFPQuDU/auByo8qObXaXJzwIesytI4hw/
 z/lfj3HWvuo0AQoL/YviOc/JitqncKZBUuXGv3kYoZU+07tvN/l1ICDiRPdnNsF8+Pls=
X-Gm-Gg: ASbGncsdeuNZcl/pMnpda0zoDbDQ0qsICgtLE+VddE+FSshFzXU1MdaxXTALGa62QKg
 z2RnaJcbTwCxxtCME040sa+bUR25eSNGD3mFXdihDHPxiqx0jlEl+dMY2yFZAxm3fNPGJAiCix4
 V8ZgB+811IU35LkTjCry4Fj8LkD3LFxG8Ye22QENbwpUkPUw4Qlme/AA/JhFVCJRlXsZDGA06Mv
 iV9jbfrLalGaL1Zuvjxyq4qZLW0woK0kS7bOcLNpLbthM7gtrdxClsH3VCJKDI+XWZP0VFI0BU2
 v8QA7LXBYuqk6unOCPd7Dy5/Ff0MY3FfylRZalD5E81ZgDwPlu0GC7A2UEcp4ryTjqZGN7WPzb4
 =
X-Received: by 2002:a05:620a:28c2:b0:7c5:5670:bd77 with SMTP id
 af79cd13be357-7c928049ca2mr1716049285a.55.1745223373010; 
 Mon, 21 Apr 2025 01:16:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjwyE7MQkTDxkTD4bMTdrQVyq0KgcRLomu9pE/oxDMbBAj8GbWGPITnj/B2mJvuVUIGwaJfg==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5670:bd77 with SMTP id
 af79cd13be357-7c928049ca2mr1716045985a.55.1745223372683; 
 Mon, 21 Apr 2025 01:16:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5424b5sm869330e87.95.2025.04.21.01.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:16:10 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:16:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
Message-ID: <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=6805fece cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=StrfYul8zGH_qiMLSD8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: SkRe7qJME1O3BsdVzCY8p6voYXYzEPd6
X-Proofpoint-GUID: SkRe7qJME1O3BsdVzCY8p6voYXYzEPd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=906 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210063
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

On Mon, Apr 21, 2025 at 05:09:22AM +0200, Barnabás Czémán wrote:
> Sort adreno clocks in alphabetical order.

Why? The order of the clocks here matches the order in which they should
be brought up.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 4793a60fa946195d3220b6c44dec170d443f56db..8a7e80c959fad09f950fe202eba76d3aae01d1ea 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1052,18 +1052,18 @@ gpu: gpu@1c00000 {
>  			reg-names = "kgsl_3d0_reg_memory";
>  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>  
> -			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
> +			clocks = <&gcc GCC_BIMC_GPU_CLK>,
> +				 <&gcc GCC_OXILI_AON_CLK>,
> +				 <&gcc GCC_OXILI_GFX3D_CLK>,
>  				 <&gcc GCC_OXILI_AHB_CLK>,
>  				 <&gcc GCC_BIMC_GFX_CLK>,
> -				 <&gcc GCC_BIMC_GPU_CLK>,
> -				 <&gcc GCC_OXILI_TIMER_CLK>,
> -				 <&gcc GCC_OXILI_AON_CLK>;
> -			clock-names = "core",
> +				 <&gcc GCC_OXILI_TIMER_CLK>;
> +			clock-names = "alt_mem_iface",
> +				      "alwayson",
> +				      "core",
>  				      "iface",
>  				      "mem_iface",
> -				      "alt_mem_iface",
> -				      "rbbmtimer",
> -				      "alwayson";
> +				      "rbbmtimer";
>  			power-domains = <&gcc OXILI_GX_GDSC>;
>  
>  			iommus = <&gpu_iommu 0>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
