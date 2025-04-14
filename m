Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50994A88D70
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 22:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA58510E272;
	Mon, 14 Apr 2025 20:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W16IqfEg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BCE10E657
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:55:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKdses001695
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WxqIMMM+bD6pWCvSoOoUNZlHXMPZPcPy2ox/bPjumf4=; b=W16IqfEgr9ANz/Su
 PT/7IXowclo9n8BNUIy5eNsu+iLRfEttOXQ0DOXxZk6EsByU9K4U/xc0AugxXZjZ
 JhRWfIJXdvb8TGk2jtKw6xIkKujSxO1FMREqOei72PGhFq9pKIO2CcjF0lsk3DuD
 CTw5qyK251zw7ETYI5SN4wWnjIs5q/5lozfs97LQHD7X5QglnaYg4j8tnA4GpZxQ
 VACbYNT4b+zY018HIgXlnZvPvseQ2KI/FAhKl1v9tKQUfMXwIS3ZdV2pqFNhAwRd
 qxLPwdCXrj2VB36MJjf2BVUSaKzIovig4Owq2NyhSuBxwNs1ozneWSqfl5wYnq7t
 W9pWfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq6156-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:55:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c552802e9fso124642785a.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 13:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744664129; x=1745268929;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WxqIMMM+bD6pWCvSoOoUNZlHXMPZPcPy2ox/bPjumf4=;
 b=Fzfgd0cSINJOtLsR0NezdOWkh4Ljl55pshsdAFKD7PiatYtYJ/JTMCzxuLOx/rfr2G
 oMc/hUFtLRWNg2OwG0RTyqrBM5Tqx7LHh6L13LHeAzsT6Zeq1BLVQzTJ1z5+ydx8VaPo
 GexvWl74qPYpotUKHvs9OCctQwUe9j/9iqp6m3bcG+h0GezRAKeQMb2C6S8xBQmsz0HR
 Uxfz0W7cJkYmD8VFwW9PsV+D69i9XpgAIXIO61PWfM8Ige6wBYwVfOlBWaP6JIJQb02J
 ODKau85SxjxkhlhAp2x7Rs48iO++T49u/tspAL6lTZkWgRUds5bvxkfLDugrHsbvPX8r
 eHTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY9hp7HtZAA0cDzeaxw0yWaH2B2mpAhCJQupOmKjOy44k9a14Eq2YHHzezEqQK9ysXsg6o8sKKJlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRXZpP72XEsGTEToNYjzsXE+oZ/PXcvQoZqFhQz3LSTIYzQ87c
 86uFhZk6ys2yWOjXshEWc7zBEGAVt8MXyw/pG0T/12zj4YYlipIMcQtnxuonkVgAkaw0dnYR7B+
 UFqTAdvQxqA+RxY6d17Q6q/2JCX0Vqv5ICJiU+i8yVm0VKOySDpMZoxD86+723EQtZYQ=
X-Gm-Gg: ASbGncv9wB4SFvFjFHnJ8K1c6tqMB1f2t3G2PGoJbJUxd7iKeF6wXf0Ee/1ExjCEhsY
 P30eM5flUGqqh9tml1q1BPAghD+HVr0ysiP9dPxuTzY6Z8ygOdvVjzW/tec+WvJ+3Wyk1z9ID6y
 KgutPyfbBdmLu/vr5WkfXKqydrT9Pw9DqGULALHcyc+x1T6n21GXFBWz8Ngth+kP6YkmFgQvlKx
 TzZsCuuoHeSL9wxIu37ue+D4dVyPVmrPUrC+s2sPMnhfu2qEAQ7k46atWLSD6+4an2FOWcE2ANZ
 bGLIpM2OiwVsP4GCKp2YPqoe0nYnaK3nUce+rLWO+vDGb4h6hy50GlcHXKQSuDrQRg==
X-Received: by 2002:a05:620a:4627:b0:7c0:bb63:536c with SMTP id
 af79cd13be357-7c7af10641cmr597554085a.4.1744664129236; 
 Mon, 14 Apr 2025 13:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoWIvNWBnu8DBGFjtGdagGBK2fyiZED6ibSgijR4nYQRmR9ck5XDihEjcIo4pATTzpB4UWZQ==
X-Received: by 2002:a05:620a:4627:b0:7c0:bb63:536c with SMTP id
 af79cd13be357-7c7af10641cmr597548885a.4.1744664128405; 
 Mon, 14 Apr 2025 13:55:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f5056easm5692216a12.63.2025.04.14.13.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 13:55:27 -0700 (PDT)
Message-ID: <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tbG4ikQMUHDnhdoRk4AMxmQllwfbu1H_
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fd7642 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8
 a=zdbjSHh-4Hdwht_aKTEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=BjKv_IHbNJvPKzgot4uq:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: tbG4ikQMUHDnhdoRk4AMxmQllwfbu1H_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140152
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

On 3/15/25 3:57 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +			power-domains = <&cpu_pd0>;
> +			power-domain-names = "psci";

So CPU4-7 get "nicer" idle, but 0-3 don't?

[...]

> +		cpu-map {
> +			/* The MSM8937 has 2 cluster A53 setup. */

This comment seems superfluous

[...]

> +	timer {

'p' < 't', please sort top-level nodes alphabetically

[...]

> +				wcss-wlan2-pins {
> +					pins = "gpio76";
> +					function = "wcss_wlan2";
> +					drive-strength = <6>;

please unify this order (drive-strength before bias)

> +					bias-pull-up;
> +
> +				};

Extra newline

[...]

> +		gpu: gpu@1c00000 {
> +			compatible = "qcom,adreno-505.0", "qcom,adreno";
> +			reg = <0x1c00000 0x40000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "kgsl_3d0_irq";
> +			#cooling-cells = <2>;
> +			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
> +				<&gcc GCC_OXILI_AHB_CLK>,
> +				<&gcc GCC_BIMC_GFX_CLK>,
> +				<&gcc GCC_BIMC_GPU_CLK>,
> +				<&gcc GCC_OXILI_TIMER_CLK>,
> +				<&gcc GCC_OXILI_AON_CLK>;

Please align the <s

> +			clock-names = "core",
> +				      "iface",
> +				      "mem_iface",
> +				      "alt_mem_iface",
> +				      "rbbmtimer",
> +				      "alwayson";
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&gcc OXILI_GX_GDSC>;
> +
> +			iommus = <&adreno_smmu 0>;
> +
> +			status = "disabled";
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					opp-supported-hw = <0xFF>;

0xff is overly broad, please document the existing known speed bins

[...]

> +		adreno_smmu: iommu@1c40000 {
> +			compatible = "qcom,msm8996-smmu-v2",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-v2";
> +			reg = <0x1c40000 0x10000>;

Does it work as-is, without iommu changes?

[...]

> +	thermal_zones: thermal-zones {
> +		aoss-thermal {
> +			polling-delay-passive = <250>;

There are no passive trip points> +
> +			thermal-sensors = <&tsens 0>;
> +
> +			trips {
> +				aoss_alert0: trip-point0 {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};

Please convert these to 'critical' instead

[...]

> +		cpuss1-thermal {
> +			polling-delay-passive = <250>;

You can drop polling-delay-passive under CPU tzones, as threshold
crossing is interrupt-driven

> +
> +			thermal-sensors = <&tsens 4>;
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpuss1_alert0>;
> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +
> +			trips {
> +				cpuss1_alert0: trip-point0 {
> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpuss1_alert1: trip-point1 {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};

On newer platforms we rely on LMH to shut down the device if it
were to reach the junction temperature, but let's leave them here
as probably no one remembers for sure how reliable that is on these
older platforms and you're most likely not willing to test that

Konrad
