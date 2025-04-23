Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDF0A98C3D
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 16:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01CF10E6B5;
	Wed, 23 Apr 2025 14:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqLJFhRC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821B910E6B5
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:04:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAp6Oo022006
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HK4v2UxJbR5fXrAk1G29VWPj/UWIHaIHZOcZYqRxF9s=; b=gqLJFhRCUndtiYt7
 7nVFud9l/0MH6QpvE/kIW4J63tMdeelEMdTC1IAEuFA5K8jVzh0/d2qRdrDKK0pn
 GZ33/RXPMfhZ4ODI8LwwhwIjrHfe0CCVJ9oGBukOxpkpnVOdAvlmpDk6pQ9Yr6Sd
 sGmrczDi829QgGOBpgyZcaaTXhafCwhyZ5ukT4NVV2sYiNrr/zgOGkk/+us2b4qe
 PQ0B8HH0A/1PTId4jL0cQbCi2yPTJVav6wv3gPj9Mryc4kD+5qj9DW91th1v8CHe
 sqcBZzwfinKADXufKObWXY4eajJl+7rEEMVrYwYjd4EyLomAZtuIXhSz+/e8iXwP
 1ecJ8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh12ahg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:04:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5841ae28eso122370385a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 07:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745417043; x=1746021843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HK4v2UxJbR5fXrAk1G29VWPj/UWIHaIHZOcZYqRxF9s=;
 b=R9v6f9iVVMlB9mg/WX5bRGspabhaPOrbhppIp9ZLY/U1kRikPvT7SFegrxjCs2FuhO
 zdcV7O7NNjxogJ7dHbVIGKEbVLvVq4COPdGkQrWjFpYwGKMHuFidQ3/g3jcJDG7q/Prb
 EzzQBIiXi/0EVy1uPA8h8SP00wQ0bYKqYmT+ocdg8Ey8XhLQHiXyqkQq+J3cURoAm7+n
 W66SxbF6BEb0s/77GQwPBflWyDhyYqpUr3faM+BXGlR/0Wdnkd/pTG7w6hebzvZRJfN6
 apPycIb29nfZZt1i2oNhyzri4dAPf+DZ0jpbKfR0354oitUQqJFQq8SGZn52cFmgbZs1
 HPhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPWIcZr0lMOHlCMYidsxvnOpviorCZkhCKR8rICB9zP3Qps+9FXOs9WYmRYGKBtht8nNtF4RtWwrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaMkRpAF4/OpbHcetib1fHUa2C2tPgWSkdXbsMFUwoiWQv85LZ
 UaPVgz2aPOlu5+EQ2C87zlWL0QVCiv8fcy2qMvEpTR+PNYQTCV8eLIO1+Wyih3bc7tGfwJ6ceX3
 YX9YlLahPKWy/G10Sc704u8C1e3nI4RRBLgwxxR5AkOJyTrMUQKwU3YoRYah8ZWdEHKU=
X-Gm-Gg: ASbGnctrCRWK4EJ7TsPg51Spx2wFkKi+S2W8/hzzg8mIf/ceX9Nw511WSwF2iIiZ0Lg
 PyGshFI0cFAEhoY/aD4GJAjnBrUOxE98i+58efGs1XCo2Jzgia7IeXkVDzfr+fpB3AHC+2tVab9
 QazdbpNZfOjcs0xblLpj0N0vhP/EHIM/cyy3q0je5zKNEQ2gbOGVIAIJ1snRlHPsuVqQI5JaTRi
 2uhIgzUwy4mV0O8vEdK2/p0MWoTgcHS0HcPvF3313O0KcXNlO+6Zxw1sDwXM2OBrEYO2ejlb697
 agxYCAUGlt1gNfd34lqESQtefpSCZQGCdiwZBcnroR35Yk6RqmNJc0Uaw0r67GH8wn0=
X-Received: by 2002:a05:620a:40c4:b0:7c3:bae4:2339 with SMTP id
 af79cd13be357-7c928038e5emr1063391785a.11.1745417043385; 
 Wed, 23 Apr 2025 07:04:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Nmp61dxe3+g8XquReGtc6SZo2EBLqOi9MgrQLq0RCvHH8eZt76lUCj3q3b5DnYlZ2FEF3g==
X-Received: by 2002:a05:620a:40c4:b0:7c3:bae4:2339 with SMTP id
 af79cd13be357-7c928038e5emr1063386885a.11.1745417042771; 
 Wed, 23 Apr 2025 07:04:02 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec4d397sm808450266b.59.2025.04.23.07.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 07:04:02 -0700 (PDT)
Message-ID: <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
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
 Dmitry Baryshkov <lumag@kernel.org>, Adam Skladowski
 <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uc9bdpI0vRljPRZ4GymN638Fsbj_qq7L
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808f354 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8
 a=GsLbDo3STCR25-WXoqoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=BjKv_IHbNJvPKzgot4uq:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: uc9bdpI0vRljPRZ4GymN638Fsbj_qq7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5OCBTYWx0ZWRfX8eRHsO3uUN1Z
 UWYk02tufRvFhQ7MSVFxHiJgKAm2UTQtcFtSicJ6FdVyiUSeTFTs9u7GMhGghVacZLnrASmKQ/3
 x1bElA9pfG8eo4hKO8OTmeh6uTbfr6wQWs4bNHQhbMqCM7B8mQ3xRTUNDKI6pVY4RzTBKGeQAvo
 g62n8s33Vsf8QupgVsz9PbAM19p36577wr4I7WU6HwmR3gGV+RDwQ9OtJPUL7nF5Ewt6VYOK3yT
 1cboBGv5wU+R2bwdLfIbpN4LYz2nWeyLAyot6yk2YbnMCoeiZ+sHZdBedObbvKpeHsBpMJIzp9v
 v+1UR+xMoHnIgqbiK1a0bibbiDCs2UiAu6ZM7wOvSjJiVbO8uFl4E1IsAAfpti5Y5RgkZxMOeuD
 qC9azKsmmlbm37NRgYP3kVecw2sGf3byVonGAP38BKM7EjuOhsw4Y4WgXSFsS+J+LqFDmMO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230098
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

On 4/21/25 10:18 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +			tsens_base1: base1@1d8 {
> +				reg = <0x1d8 1>;

The size part should be hex too

[...]

> +				wcss-wlan2-pins {
> +					pins = "gpio76";
> +					function = "wcss_wlan2";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +
> +				};
> +
> +			};

random newline /\

[...]

> +		mdss: display-subsystem@1a00000 {
> +			compatible = "qcom,mdss";
> +			reg = <0x01a00000 0x1000>,
> +			      <0x01ab0000 0x1040>;

The latter region is 0x3000-long

> +			reg-names = "mdss_phys", "vbif_phys";

Please make reg-names a vertical list too

[...]


> +		gpu: gpu@1c00000 {
> +			compatible = "qcom,adreno-505.0", "qcom,adreno";
> +			reg = <0x1c00000 0x40000>;

Please pad the address part to 8 hex digits

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					opp-supported-hw = <0xff>;

The comment from the previous revision still stands

Konrad
