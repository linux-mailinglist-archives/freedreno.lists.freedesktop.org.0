Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47AAA2F393
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 17:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07A10E38A;
	Mon, 10 Feb 2025 16:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gH+hBbsr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382B210E38A
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A8esre006114
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jCHUXPT5Jmbjgw9rgNlW8gb3OHlH09svIQMyIII50QM=; b=gH+hBbsrMoJ0EZtr
 8i2tmGkDg5i78VFBr5c7s4xS0HArBGmQZ5On0j7eb55KczTFAI0rXFIu1h8jEy7D
 eu61Omh9hv+m2juT994GxYFqaNRblpSa1k1vbWFxm0cH2QbpkHbO19U0e5r67RCW
 a2vp8t1nr3uABuHc9TVwQszgo11vfz/9UcFND7sJAExK8Brv7Yq3dSvH9Fzn0j7N
 +Pe100+3an7fT3omg76JyVROf9UVs15e9vPfMySrF4PZmQDYh/u2qutk50Ylg4SD
 3optfukyB7cOoZKqGasLI5Qm2sy86HDFiigktd16ijFO1KOiS8/XWpJcu4HFlUCn
 wLzEKg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5ms94n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e18596ce32so11571796d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 08:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739205134; x=1739809934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jCHUXPT5Jmbjgw9rgNlW8gb3OHlH09svIQMyIII50QM=;
 b=m+JI+/mZYHJ1ZylJN7Y1jc6zBwRFWFmK1cZ/GC1aQnEZl00yECHz1Uker4/mRNNfoH
 0/HjtilwVMrovme/KorMYJeDSO+MLWAt0P8y+TX6lWPxLIkkYcH2fHO3Q4lVs6avjag5
 c4LPw9JWJiNr3Jo/U8GxhvfmMz8kc284+XnY05MYnidGsndI+VZc31O2tJfFJ4lYLDmX
 O8J3ctkMZCbFI8c0kLuGQkUaujp71FOeuGYBhGlQUGnxeJH/F1QgrYVzhZgAaBD1CRpt
 NK/CZ2gt0oImQrVerl4mjW/vlfWV90s6HvOWDJ/TLiE9WN2cmoZzpTRL1vLHI0UXnc/G
 VN2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHshOzkvvpnpNLXJJvOmuJcehs5ZwCXvZh2kNock+Q9TW8CvgEulRDt0FU3KEiKpWKw8tM8/UNZao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJIg2Mb+keAoOBtnMJVXuLHiKp9k245Y2cwAkUi7i7eRgrHzRe
 Uy1yJ3GGLPkNqrfTonhbktNwv5RAwlLinAvVLbiCA4k2Be/fNg4NQ9JGajGOLd+mDtq2VeQI5qa
 FmeTV4a5hKP6Jpm/QRb/w3fRpwEjhfmVs7bF5XMr1BnC1B9oxcljH1roqaJEhFmsBJS8=
X-Gm-Gg: ASbGncujnhjoHMpBJ4rsDAJePfA8kVIfcTzOmna/+Ip7KeCyWoC3m5+sE8BtTMkpieb
 KdnbPCjKcQ6xUbqsKVBqBbp4m78HHTerAnUv3HyFFw5N0XfujVpmhtIoZpSJ8FSfB36uW8oEx6I
 gH34+GLMp6YYCwcsCfURFMScQIlIiyqtFVL4iCk1HRJxti2UjZSrkbeHrYVHlcS8j0t+iWLMLmP
 PsGgBSj7yyqU2Ij0CLK23FyMr2qFlR2wm8i0Ciq63YOklGMQxVl++bfVWTrKGe5Mwjbyoqerl9X
 S853rcEGY/bJQp0MV00VQuEz+zqnLwEvIjKyLIn17lLXearHQa4hOaTJvpI=
X-Received: by 2002:ac8:5852:0:b0:471:9ad0:9cc2 with SMTP id
 d75a77b69052e-4719ad09d04mr9899531cf.10.1739205134121; 
 Mon, 10 Feb 2025 08:32:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECQbeD0Elon8YIvNJ6FOZ4xgWrOhjbb6XFnJ6XLJ3Ft6s4VlucVZP20dQP1lS3ytB3OAZAtQ==
X-Received: by 2002:ac8:5852:0:b0:471:9ad0:9cc2 with SMTP id
 d75a77b69052e-4719ad09d04mr9899271cf.10.1739205133726; 
 Mon, 10 Feb 2025 08:32:13 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7b5d8d4a0sm353484466b.159.2025.02.10.08.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:32:13 -0800 (PST)
Message-ID: <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mvyj-VEjqviRaDDgXtEIpN0fxwLP6OEa
X-Proofpoint-ORIG-GUID: Mvyj-VEjqviRaDDgXtEIpN0fxwLP6OEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100136
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

On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.
> 
> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
>  
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
> -			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
> -			interconnect-names = "mdp0-mem";
> +			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;

QCOM_ICC_TAG_ACTIVE_ONLY

w that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
