Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2985CA67388
	for <lists+freedreno@lfdr.de>; Tue, 18 Mar 2025 13:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50EE10E46F;
	Tue, 18 Mar 2025 12:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdDB8vrm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23910E46D
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:13:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IB3Dck022723
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GWA4RMuv5Jsg9tLzqnTr2CAziRMMoQJlkPXD8EK+58g=; b=NdDB8vrmmtVUVhtE
 CXCHwNTuANP3skL9wayZf6jWMFfodBw+Uhh9F+yEtiV5j08T/3uF0Hve5WQogOq6
 HFwn9wsPrCKK4Q/mI8NZEvkKepfeZLDLLV+im9dy9YotURnCZlF/v/rc/Jt7O5RK
 //EXxqPquaXuKHZJuFMPio80/f1TzGmDBCdtkeepElOoWUpwCu//mlQkYr1vNo4F
 ZPTTyqJ8gZcZaAnwRQ+yXGEKlCA48p+3q43/Yq81MtYCfFjHV6+S4rV4uhE+gSd4
 CaEgS1i+y1sMjb0thxdv4zBmnHKduBEyO7q2iDClLKXjPL7Mh3smpibQ/foTywz4
 UAtWgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx1pyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:13:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so40054185a.2
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 05:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300009; x=1742904809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GWA4RMuv5Jsg9tLzqnTr2CAziRMMoQJlkPXD8EK+58g=;
 b=PmXgrdQNxDvvZLr1/yX+G5wlUOlxHmq7DS3XME++3julcaCYgSfeFyQfpgtv8QlbFj
 GQJGP/6cpDVQRnl6ufaJyQzmeAVBbtgOV/pnag3tiFrwTHV+V3e8yKjk0H3VR6JsQT7Q
 /hTZ5gWejEjyz5apfbcSAoEsbhWrzcsK112k2tGBcM+SiN2oENeN+ikyguOl0kZCxA5z
 WoAZZANu64Hdale80Rv3gytaKP5bt0WuxSuwH8qggwMxODjELOKpaun+/xbxNs96Bej1
 lMlDZ5NbOOk7r5dqJAHiRpvH55PORfA0SpMk02l2HbD+l9e9QeyQZl2WiN8UN1ELxruS
 phLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu4nsdE+ID8LUeJpBM9sgkHL85aKATyPe+Ir42zsiSDKBzvi/Zr08kzDlGABKW2nWCrS1fTiUxcF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB2mtz/KBDeYZemdGxRbRzmbHMaYh3K4DwrBnzHYnJ0NLTrMzh
 gmx/55Z/k5iQJW3HSlTs3JjTncVgGfI4yUdVlgZcVQ36vRMu9MEptwsalxhKUsKkzgJ/rmK5ezN
 zuIBKzMrz2WpYCAdXwLXIOt439P8xALook/6YDcZvkejgJ0aFo4VxiVRN8EhLHxCPVyo=
X-Gm-Gg: ASbGncuCb3iDzpfHd/WgP1pl8jWkauXgdDz/YHKFOaQknA+1eQPro4vVvX9DuswsJME
 OaOP0YmLONhcLiGcla+s18HCB+EPAtaqp0HkHwMDHqc0ygQWFDuTZBQX1Kki1Ty7VJXV9FBVEkg
 E427Ene0OC46L2Y1CHcglAT0QTKHwhBA7ssamVK+caZLaSlo+cdB4MFNxHx+ft9o2s2aIhypSaD
 6KbbuQZmEFX2qunYIKis5ZqASBkQdUfCGvC5/i95ZhZQTCwnFOC0/AIU7JXLKhikqzcIhfyFMpw
 gJucbkrd63DQZOTG2TZJXQIcTtQarznCIdQqDdu/DyURYDyWp+U8MB0NrfYhGBF0EfzRBg==
X-Received: by 2002:ac8:7d44:0:b0:472:1812:23da with SMTP id
 d75a77b69052e-476c8190534mr96005041cf.11.1742300008832; 
 Tue, 18 Mar 2025 05:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe06kgM8AmHXFM5Gw3aBJVby/YG/haZcqc6BvqbAFtXAm2nFUQvuHUdNVMcDGWgpVpF/fRZg==
X-Received: by 2002:ac8:7d44:0:b0:472:1812:23da with SMTP id
 d75a77b69052e-476c8190534mr96004821cf.11.1742300008446; 
 Tue, 18 Mar 2025 05:13:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a48b51sm849452066b.149.2025.03.18.05.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 05:13:27 -0700 (PDT)
Message-ID: <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 13:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Andy Gross
 <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K5v76qfpQP-QKZ_3GqLZCcidB83Sk26Z
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67d9636a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=GlwZi-m6aQ2r2PzHKf4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: K5v76qfpQP-QKZ_3GqLZCcidB83Sk26Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=528 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180090
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

On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> Use new SoC-specific compatible to the SPS SIC in addition to the
> "syscon" compatible and rename the node to follow the purpose of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -402,8 +402,8 @@ saw3_vreg: regulator {
>  			};
>  		};
>  
> -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> -			compatible = "syscon";
> +		sps_sic_non_secure: interrupt-controller@12100000 {

The register that the consumer of this points to doesn't seem to exist..

Konrad
