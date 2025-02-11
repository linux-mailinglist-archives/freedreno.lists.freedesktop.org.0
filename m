Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081CA30CE7
	for <lists+freedreno@lfdr.de>; Tue, 11 Feb 2025 14:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB2E10E2A4;
	Tue, 11 Feb 2025 13:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti7IvCwY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF1110E2A4
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 13:31:20 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B99UxU005019
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 13:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V8gfsxl5wjBXJWzy9IZRbAg+/QZ7NlWDPkHV4SG/aR4=; b=Ti7IvCwYBE7joAfU
 J6wsCP1oRWJ77hUTaDlvc6KN+efAAh324fftecNig1lGEE1Uxx59ZNw6/WGILaJD
 Kc4mwBZpC44ijC5bpiUd0okiLfOMOBTwQZbzZ4hWMRri/jOtqLCtOaBiortGMzmW
 fYWA9wuLUqi7WKomIvyDHmsi+NBDwcKgEA3yNS/MIVrxfMHFDdB9xy4JVpL3i748
 ZQ1pLVpVb8J+JcSvXkGsUUGOAH8mT9FbA74O34+JxhsykezZBZw5RnuFxcZY0k6E
 WpSliveD4lJB/8vC4MOXynL4BrSe4jTrNVxtyGu5IejbjRmQoINk4pwkS3vPtojM
 2ocGiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyqw2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 13:31:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e4521c35c6so9857056d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 05:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739280678; x=1739885478;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V8gfsxl5wjBXJWzy9IZRbAg+/QZ7NlWDPkHV4SG/aR4=;
 b=A2LuQSaUxeSSB09HB8b2BdbVhfynxmXbcMyOkOyjnSs3+fHcNgRdbV8pLb+SmA5e3Q
 DR9Ro/ZItfQRNan1Wm7OgYF7me12ewxLRyEq1NBSEju8cf/fdLUjahgtYmq1ZF6fEgdR
 F0oDvuvQUiuQ0lDAXDgi0TtjyUWR7rMoWhhuiZ/J7cnMnmIhGLumOrajTKYUQmO44Lwa
 CbQ7AfsDL9OPql+hnWijRZrUfG0ztZpGK4+5XoY+LI9DBlApvw/B2w5D2yvwhBuOS5Tq
 8/TZmZWE6cjkRcMIc0GCwPwWtWiUNtooiF2DPctZMOFJGY+TUNXHwqb0gSSr8ef8R40l
 buMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHUlx3O7zaNsgLPxgoKc4T+ux+dSnUNI3U2GpdDmZwNmRGvYgAy1qudCZxXQGpVlli/Lro1uogUV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAdgKQIE7EQDvr2KKEZXT2QIQ4U0bNpICpOX8SJj4CetvNXvLm
 x1HKEnwhrLv2WQjPQHt6JIaDVdKyUO4RpHIgUuvek4D3+17sJ4cMteNUuPgIdmwFPvYJVwLkB2F
 OvDw4znSVDsoVBn5v3opEpvy7mVPOtSyZ/PmJSDO1mMYnY0yGMhv/3zLF21LPGo5MUZ0=
X-Gm-Gg: ASbGncvinDWTjRxm8vAjfvWm5oKwMwEjwXTu7Ri98TpUYP0xaU0+aGCjyBTsT88dcvq
 D3etsoZeXap/FdVWljUNGe7saUswE6NJRnEOGY7xWozxsFatQerXiETSig1UtSjUUP59v8eNQ4l
 FaPfi13GOzZzAnV/QCMp3H7Ntnk5LGWqhWxHQINOnonKyLncyVBUv46y5qh3y9R9986vQctwxoW
 kHOaWEjHEx3X/9zJ2WhiTHa48RI5MsxwC5Mwsnu//+Gmheo7ZW3ALbBGS2Akp0To2A4lA1q8MOw
 1zAgbyQj060xh/sZJ3qlsd//xdoBeCZ+OJhLJMrEZpHU4QV5afF6nxn23zM=
X-Received: by 2002:a05:6214:c65:b0:6d8:b562:efcd with SMTP id
 6a1803df08f44-6e468dacecamr11867186d6.7.1739280678115; 
 Tue, 11 Feb 2025 05:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZpgOADXexGty6sVFgmRdsYA39yzSbEDl4lVKreV5wAGJ5UPSGTJjaEwsdYbIYB6FhRH6giA==
X-Received: by 2002:a05:6214:c65:b0:6d8:b562:efcd with SMTP id
 6a1803df08f44-6e468dacecamr11866796d6.7.1739280677621; 
 Tue, 11 Feb 2025 05:31:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7dae77599sm159225066b.30.2025.02.11.05.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 05:31:17 -0800 (PST)
Message-ID: <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable
 panel and GPU
To: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-5-danila@jiaxyga.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250203181436.87785-5-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YKC06MhudLh0eh0cC_oLm9kEkGjAQCIn
X-Proofpoint-GUID: YKC06MhudLh0eh0cC_oLm9kEkGjAQCIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=992
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110089
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

On 3.02.2025 7:14 PM, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> Enable the Adreno GPU and configure the Visionox RM692E5 panel.
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
> Note:
> Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
> ---
>  .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 53 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> index a5cda478bd78..cda317b49d5c 100644
> --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> @@ -52,6 +52,8 @@ framebuffer0: framebuffer@e1000000 {
>  			stride = <(1080 * 4)>;
>  			format = "a8r8g8b8";
>  
> +			display = <&panel0>;

This is allowed by bindings but doesn't seem to do anything

> +
>  			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>  				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> @@ -757,6 +759,10 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
>  &gpu_zap_shader {
>  	firmware-name = "qcom/sm7325/nothing/spacewar/a660_zap.mbn";
>  };
> @@ -823,15 +829,44 @@ &ipa {
>  	status = "okay";
>  };
>  
> -/* MDSS remains disabled until the panel driver is present. */
> +&mdss {
> +	status = "okay";
> +};
> +
>  &mdss_dsi {
>  	vdda-supply = <&vdd_a_dsi_0_1p2>;
> +	status = "okay";
>  
> -	/* Visionox RM692E5 panel */
> +	panel0: panel@0 {

Is there going to be a panel1, too? ;)

Please drop the 0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
