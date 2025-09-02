Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE55B4065B
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 16:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D15510E744;
	Tue,  2 Sep 2025 14:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="idsb4DJV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8638E10E744
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 14:15:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B7NpB012437
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=; b=idsb4DJVLCwHX/wd
 dLBEgRWQ5XfjnjoPCs7vnuCRGJDdRCLaAbT5T9svXWbSJnjAlyb3/SWGWuOXj3nU
 Qf062q356QCUP7EggKRkCFJpFN80p5bOLKePqvMQ+knYwQUYRK4AOeYvjlNkcp0B
 Mc0bbXRe13v93zHGHvugMaUGyLlbRd+iWqVdOTLObCSNW4oStfcXJFow81/iP6hy
 oTt7Qq42AOjVxo4tLmcNly88otHG5A1q5+jjW/t6ic29337YqqsxkJ8cJ8NkDG21
 ReeAlq5PVBOhG5ubWXO+i1jNO66SVUvqRx9IF/hi/OGahlLGwyFigblyPUyCj8B9
 XN0p8A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ffyg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 14:15:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-52ad145c42aso384239137.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756822537; x=1757427337;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=;
 b=QNH9DzhfK1ZzRrHpf0yKiZNLr2x0C3EBNNirhvhONqRhnb6ViwAhcU6X0+fVMrep4B
 DscqghGgunvCn4Fq5MgVucavtzUVYWHT0fW3C+up6Zze3Z3mjg/loVWcN5rZVJ1nEhQj
 Q1d7KaTLrk/kLZVf+21EKZYyChtWJN9/zUgmFwg4U4c05kf12tmdl5fP7XAJ7IoT71XN
 KuEX5T6nSLE1UX9XcTaWAadNxL6ajmNCjvh773hwezr53dcATLTnD6AiQToAGT1uRYvM
 Cdiask3dLGLrjm3R7u1GWhkBy+SToaHjer/YlRJx8fc6PHVEhDEMXyWFOO4YuCNFjEnD
 kVbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/tvWMdP7EAvRpAwTi+OPIcyyYbn/BTiYZ97RIoPcgVwCpqzHopNaca47F55jbuo8qcfxSZfuWYx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLdkMz6yZNcC95lKJ5z/nn/1LYTkBkBj/vJpAyqaT8DmF6GrJz
 T5rhEIL2zh7wVfxKdSYWdk8UVHg+oj0m4VOMMHmfi/3rVMCHEZ8J0fhuqiHLzQ6pr7uxJ3whN2R
 5KOSVNxM1RQsUAzihm6Jcnqzdf/7fQBZ7KSd3WjhvC1Huoj5j3uC93zSortyPI9WJkY72qxk=
X-Gm-Gg: ASbGncuzbHXMN3TfeigT3BrWqBM9KnWS3IHVbbOY2n6P8kGWZQuolDpW9PrUjfSsSqD
 ab0po6qftniktcUW4t7AGGFwgtkFYL/TTfJmvjGRiIYfSYsha/co+J4FppEuGxodIpIOdvXN4BX
 dXHcUGo04t+cXa1vdTZ+CnVin8huLda2LUh3hfcWGuCEdoRfgX8aNL5bp7OGYxNFcR3H2lBFAGZ
 VGgBRrPDAdlr04BRrAsxorq2pPOM8ZdjDCOhNNZiJaKICY7APWR32qcXJv/b57rdfY+sYodGCdm
 aPxHZpcW0F7MbB5ZfIDgCyhX9yB7hXPZh3d2Et83j+tjYGMQ9FofDX0248Lv02JYz2xf2gN799g
 DWJXQLG0IhAYDXKbae9VEQTbVW65LI9yTZbP8BCEJjDUVsahTv6Il
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id
 ada2fe7eead31-530f666561bmr570516137.20.1756822537069; 
 Tue, 02 Sep 2025 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNjsqepLP76zUIqTQQBX9Us4UoXPo5VPCLW3VzTnrFgAj+u/0dS6AteoLKyMgNUBFdMU3pqQ==
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id
 ada2fe7eead31-530f666561bmr570468137.20.1756822536291; 
 Tue, 02 Sep 2025 07:15:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827b1df6sm730194e87.143.2025.09.02.07.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 07:15:35 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:15:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
Message-ID: <gkkxxd45xclwjs6cp2loj4male7wobeacbshvjasolr4accz64@vux2ou4wa2wa>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX8DJ1V9wNtyPy
 w6V4zJPkM4b2LZEJmLNImskwFc2iq1FaDftTSMLtPekV9SnlNKxcZzDvghUbvDoLNHtviujHsTr
 foOLM0+diLkW0fFLUCxzlJB+f6T4582CI/4JkTS+QyVuuRlW9za1BQNYsKO8hWkNCtfx+B/H+nK
 tGJ+RW+JSCrN39fGATNXRsXYgGp1dI4qjjqmZp5rcYJPn7PY+z+rOm3pIgxMQ4f1VdVcZFzFIni
 8ZXMwFo1hl9QLMINUiKRYeuSCjpuPq8tTiOR4j6hNTwDGbeFHjaA/DPs0E+baQyDPiAQhWsXEWB
 K82TQka9prG+psX7kBZYjRXG+w4Wyn9qQN+UuNZfeQYOQnIrNoZaET0jCQ3G9pjqMxYWIQrV5E5
 ClFiBZtG
X-Proofpoint-ORIG-GUID: JiywTN92-1RT-khnV_gJnoYDQFs9P4tj
X-Proofpoint-GUID: JiywTN92-1RT-khnV_gJnoYDQFs9P4tj
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b6fc0a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=9HHfay7fNgEZ8udxRwkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On Sun, Aug 31, 2025 at 02:29:28PM +0200, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2134 +++++++++++++++++++++++++++++++++
>  1 file changed, 2134 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
