Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326CA88D47
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 22:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DE110E28B;
	Mon, 14 Apr 2025 20:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBxCIJWE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D1210E298
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:45:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKeYqZ011857
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8GpvC2xMf26mIWpkQqHlnNwAhWALEdfs8GLwqb4OfI8=; b=KBxCIJWEzDpTzj4J
 XjyWl8fUJsYhEsbotApe19vWNG1m0Yvs7M1ROZt8nJk3KhDcHY42mF/oxvQ1UPZ9
 YqAZf1nQ3GWl0r26lWtz8/zsBZqO7tSbFiRyV5KHmpdZOXJGzNkGfypP4TA2Hehy
 dND01cfjyEO5NGuwOieSKvNsS1KpqPE/ZuBpZiRTXKquifUmwGsMUheDJ8wyc8g0
 4g9BEWhO4vSGavr7e/V24EUFWGPKyJSGiclYyx1iUY4aIfC0MNUnRjEHm70jFM8L
 EjpHugjS/PPy3aPlKeHuaEW+RLdkCOVYAOvZ+y5KTAMCOwgQ5HFjYQwNJjIKwn2m
 qzQqFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcwnmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:45:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c547ab8273so53787585a.3
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 13:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744663506; x=1745268306;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8GpvC2xMf26mIWpkQqHlnNwAhWALEdfs8GLwqb4OfI8=;
 b=Nmp3QQcwnE5KajHPwMeDUZbvI3jdwDQ6FxFBgL+XOIusSdlxuxitQFarUiqcvnhxUi
 01GsAAhiYHBus8qSWehpejUf/V+GogBJCyq8vOVwhz1tzkWbTBp+Mc5Gd56HvmdhrbFJ
 5cPcoezdiAyBvGwF6M620QKxIQFa5pTeURS/ypX/VjfSBA2oVjTql7W7SuH+iVg3dpv0
 8Lv4aJ2kOLbB4bV2uu4CHA7zZMAKBlTUv2Ae0qKtppq3YukKkpGAXyiZKzAHG8dO+wNU
 o8+KL9u9ZRk/J1syEhsyySVuoEXLh6Nyr1jmFpSxSkTesjZVmPW6C2JTMw6N6nqXOeaT
 ZMqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq/ph/hJpxAB+OimKs9yZsB29wApxcp4Ic7wIxu4+WqDJSxx9ZaF0G3Ue1I3ZQtQDJ6I9oj6udQik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyMlOwxoVR5Cp0GRGZV0DPw0ZQ7gtRjzkHmKevn2tYjLmr0dxT
 wiQVuMgozYKsVuMcjwU6FyZdEcu0z3i8z3Sk2IjZ4B/v6fCFs7fGzBfHxLRbHpfUtiIXqIx598M
 uVIr8nolBlDu6gUpA6AIvmukAMctX+jPCOLqM2W6ABZXeQEKoy2nmjCgc0hdMiJ5G3Cs=
X-Gm-Gg: ASbGncssQ6uk3WYgRlRHhWKCFWixgA0A5nnpz1g7uD85qDtoi/o1VexdVI8Ja537n0y
 WmzGIQYIXGrFjmq/BfXvjgPHopcwCr05fkJJrtvmbfyz7uFhlNDZW7A3SQ2cT9wBQFg+C9hPuEF
 nnfKVz3+ENfQkQBivGjZJvuwhisgDQHdgrbDby1B5MF8NfHgPlXk9TxdLJQFwcBGt0tBoH1IAHu
 pYHqUAo7P7XT0L+r5Cx50btFcdgfIqGBA8RVAGDUIxVAcTW8Zk5GLvF6nOcEk06Vuwa50J3tF2q
 FfX/eL8bIuIPbaporB06IEYtU7TC7zBHLJZT281ceqE2tbHrZNUC6w6DcJCcgn83iA==
X-Received: by 2002:a05:620a:c4e:b0:7c0:bb63:5375 with SMTP id
 af79cd13be357-7c7af0d639amr601361685a.4.1744663505690; 
 Mon, 14 Apr 2025 13:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLBb2WpVtzoAT+y2FmV5MGo40yUFAbGagDmJALFL0LsA+GecCl49y7VoJexczSZFb7o/nmpw==
X-Received: by 2002:a05:620a:c4e:b0:7c0:bb63:5375 with SMTP id
 af79cd13be357-7c7af0d639amr601360185a.4.1744663505264; 
 Mon, 14 Apr 2025 13:45:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ce7fdcsm982525066b.176.2025.04.14.13.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 13:45:04 -0700 (PDT)
Message-ID: <c1672544-eb0f-474d-a975-2a4f6b29d549@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
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
 linux@mainlining.org
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-6-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-6-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fd73d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=OuZLqq7tAAAA:8 a=JKK38O5rW3uoAxCGYa0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: xlsOyZrPlM_gfpRRWAWsqCX8-m9vnNty
X-Proofpoint-ORIG-GUID: xlsOyZrPlM_gfpRRWAWsqCX8-m9vnNty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=859 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140151
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
> Add initial support for Xiaomi Redmi 3S (land).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +	headphones_switch: audio-switch {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&tlmm 129 GPIO_ACTIVE_HIGH>;
> +		sound-name-prefix = "Headphones Switch";
> +		pinctrl-0 = <&headphones_switch_default>;
> +		pinctrl-names = "default";
> +	};

We've had a similar change lately

https://lore.kernel.org/linux-arm-msm/20250327100633.11530-1-srinivas.kandagatla@linaro.org/

I think this could be some sort of a drivers/mux/...

[...]

> +&pm8937_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};

Please also unify the style such that there's a newline before status

Looks good otherwise

Konrad

