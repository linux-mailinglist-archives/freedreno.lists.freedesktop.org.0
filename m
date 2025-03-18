Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24CCA6737B
	for <lists+freedreno@lfdr.de>; Tue, 18 Mar 2025 13:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AE710E16A;
	Tue, 18 Mar 2025 12:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxSqCLRp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED0910E16A
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:08:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9Dv5B027608
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FNIuGRzN7oMTa5VQLxij8hespiQpfRUjmkdfhRPhLQ0=; b=fxSqCLRpX+E1GTEf
 niV4b1OQbrqLRqw2esrIpK/iltMMGOhRAIEMoIEYGtJFn4eO+fdZBOdSoeHmAk5H
 p9JWEOHTO34c+R1fsVlpeeHi5CHI/GeN4Dkb/iqZZHxGj9Pq9fCzYpT9WNT4rmMk
 x4YL0G3ri/p+lmfrrcCD894PXmhtZkglThpU6RY46o9LtSFcI2/v6/AMZEB3ZUW5
 gl18Gr7AZvTak/USTHeaPjYuywzvgj4qsQIRGGY5Il81rnOiBABy9dIh3ZaIL+lM
 yy5x652nENIvaiB1wUpBl0F3XFh9Ps8Xl3pTG7LuCLKdrCI5GOBn35nqyWke8Ih2
 jD2Q6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x804u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:08:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-476783cbdb8so10307261cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 05:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742299685; x=1742904485;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FNIuGRzN7oMTa5VQLxij8hespiQpfRUjmkdfhRPhLQ0=;
 b=OZJaHf9LDMh8AfyLGcUbmmF0xySflQu0rNBE75mizCVTsi8GU0rIIKHxjicCbP00Ah
 K46S/PCvzg/KQfhN6SJ0IGImFmH+TD0zCEWHsjAvs37KT1SqSfPdKwR3/RBHtEOLqI2h
 peHthXqg5cWSmZBbLRSZW2E5yak6CFmt7pfyPpatY79e1dx2HWScMk9KTN/0U2j9CX16
 pwpb7oJlYzW0jZzzrnOaY4/mPFPgAUQPNzfKnGn/8IvwCbCdFpKbePf2A+eeyuOtqZJF
 4XIZBmI4gXoGo4r6JushOMwJ3XDWOYEvy3jDVtRiyin0JrIkkbgvav80U3W3oHey0kr9
 tV2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdGeQEEy6o7662I1hCzyc3kVJ6RHEOLbAaCwIcZ9/x2F76lVmZ+QK0wzi3m/LV95Rp9mqH5fFSFzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrEN8lBurNtq/p7KfILIwrspp85Essa62dhpG6l/yky0wLOWdj
 e0Qdr6PBaPfQuCHzD0ZHZrjLvRLYZf0dx8JKDJrgXw8wP7PFxX7xZZzt8MQIhCFMZlc4UhHlGEr
 zyl3pZaurz8kbXpMAoYvd3e5WfzqjH3ZqAebQjOZ2RTibSul7VFzXTe/tnLfPfQPwbzo=
X-Gm-Gg: ASbGnctJPGsmEmtC7K/kn8CiE21gAU5GSqei8ysXeTuG/MxWmWFdwmGfbYshkn1NYFy
 0+wiMyNwFM6xrJTqnfcB6Uv5qpAs7rFeTqSQlaJBOwsrURnsp1aWTguSXKcp0RWgbDI8mc8p0bw
 Kl0OdsZCWaz1QsPjDY0a4k4Wg78ZzbAJ2+SzEEwkrDUNZ2aqYc5CfPylJ+p2JNAlHyHMLpsOWaG
 oDUQE/ufZxW6XreWozSJNWXjUaaBGpmg3wszBu+KPqwMzuzpSQB3xyrSUAIiJb0QG0++6xqWXcA
 1X9DnPrpQ6fEy5OcEMS345xoppwfkcSQECGNxME4lRyTq+YfjZuQoK4/c8x+6+qChCUisA==
X-Received: by 2002:a05:622a:84:b0:474:f6db:967 with SMTP id
 d75a77b69052e-476c8143273mr91228481cf.8.1742299685616; 
 Tue, 18 Mar 2025 05:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsdWgRQeoFvvEZ9ml0+bILr2xQFZy9kdEiblsMarwSKcKomqtK3Q4ssrshicw1usxo192TDQ==
X-Received: by 2002:a05:622a:84:b0:474:f6db:967 with SMTP id
 d75a77b69052e-476c8143273mr91227901cf.8.1742299685124; 
 Tue, 18 Mar 2025 05:08:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816ad27ccsm7850681a12.62.2025.03.18.05.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 05:08:04 -0700 (PDT)
Message-ID: <579cd909-8a0f-4998-88a6-47073ecc0eae@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 13:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
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
 <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P3H920pXBhaxWS37cuEGX8_JJ5oiyn_j
X-Proofpoint-ORIG-GUID: P3H920pXBhaxWS37cuEGX8_JJ5oiyn_j
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d96226 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=N6CB5E4InGOdx4Ah7JoA:9
 a=QEXdDO2ut3YA:10
 a=IFyWz7IVXAM99tgoijJH:22 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=706 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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
> Follow up the expected way of describing the SFPB hwspinlock and merge
> hwspinlock node into corresponding syscon node, fixing several dt-schema
> warnings.
> 
> Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..3728875a5506397b36a4c0d6a5ad12c067bbdd8c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
>  		};
>  	};
>  
> -	sfpb_mutex: hwmutex {
> -		compatible = "qcom,sfpb-mutex";
> -		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
> -		#hwlock-cells = <1>;
> -	};
> -
>  	smem {
>  		compatible = "qcom,smem";
>  		memory-region = <&smem_region>;
> @@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
>  			pinctrl-0 = <&ps_hold_default_state>;
>  		};
>  
> -		sfpb_wrapper_mutex: syscon@1200000 {
> -			compatible = "syscon";
> +		sfpb_mutex: hwmutex@1200000 {
> +			compatible = "qcom,sfpb-mutex";
>  			reg = <0x01200000 0x8000>;

The mutex is at +0x600

Konrad
