Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA64A91A24
	for <lists+freedreno@lfdr.de>; Thu, 17 Apr 2025 13:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6AC10E1E4;
	Thu, 17 Apr 2025 11:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAvYzxEN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EFE10E1E4
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 11:11:23 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l5Gj009300
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 11:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=; b=JAvYzxEN2qi+MMUi
 ZC1VD7t5J625JEd9CrPq3AAkROFDv7AVAMbvQkO3obP0OSyN5T9Ucmzz5OGPg+4Z
 UXHDA1S+yX2j6xA/0Eu0PNDPmynTwngd0hpDdNMU/y1vuUHOhtdt6w+VoySpxsnl
 XAsxSHSuhnDGRC3s4lXR1skfZ6T0fHlx1QX3K0k6M7Ruw9tyAdVd9OfmpLs103UM
 IzgwJVxmKDOcVGSEZ14f2DbJljZbVF8vgrrHDkResKonzukGlYlzK55OyhK0eH91
 kfd2h57cfjtPI/KieNACUEQGSw/cy+f9j6VrolxIznyDvBMiBqTVs+H0RwTfEbrv
 /UKxcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvbwvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 11:11:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6ead1d6fd54so761856d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 04:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744888282; x=1745493082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=;
 b=uaQ7UU3fxbpGEtgiFaa3iN1dsUhfVWSiJJ7tuLDe5W9xWsNrk//95s7Vx+JYdJuu3l
 RsuNamZrIC+821e1YIJ+g4m9Hr3Vd9hQ9n8YxLZFu2eVxj2mMOXmzf4x0f2c6iqakrLg
 73zx0t3nOd05/zAzC1c/dpLq5ipSD/txWjiFRyUtH2kN/ceg73VDlkRjyvdDrU/qVS6W
 MFR/hYIJ2xIqZHass6GlxbuVA/B2840pKmoqXmFQ7KpysXPll5gqw0/+DCyTiY3ly5wE
 Sx+FiE5fAXBaKcvr7k6c3U/dlSNa07qgD/CJ3jxdSjMunMIDZ75AUtwuc40jz4zcFX+n
 llSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaDf3nbIyHP17wxmfP2BYp4S9R0199j7svc+L3Bl4LAuTYyBGNJpwzuVg0H1wyjRJiE8qdqXRQMvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkLz1KDDFanTmeA2hhT+tNagVJhB4DpzX74FwgG19Oxd0JopQK
 AxM5C5XK+XYOqU53KcJ7Tn56kur2kEFsq24IfCJ2kPKr29BMPmSp9/vgKiqQDDMcTI0PAXfWwOU
 bIa85n18gCp+4G6JY8mrviGLrolGTavlKMYtLGnt/FRG+1gDrdw1ehyDC//Zh4dhSufA=
X-Gm-Gg: ASbGncvj0p2UUbtiPrGadjXJ8KsxLb3HDRiA2OQZK42tVHbN4jhblg0aOx+jSa6mp3L
 lFK72eQbLR6TyGALMfWJPdjVHGqiDUFQP1mTHc/Y8qtm44QHhnYs+2X4q5rl4xDNktr/slPv29k
 +lxeSM11k5gixbbY0zWDBhSD0UxZA3H+g/2pSDGgaPE4vz5ivCPkC9HwvLDmBODSAzHF7tEoK4M
 OS5zjidhwAsEgPtevQ+sKBxr2e3doR3Syr1tfz0AgRK3DU5ErID6kSSfsgOCwJAd6q197h4Qr77
 eT90RdSXvKHogDrpEo73WkjL/u23/gkU4VGmAX+GII2SuEiZdf6kP3zqYnROOozC4g==
X-Received: by 2002:a05:6214:b11:b0:6f2:c10b:db04 with SMTP id
 6a1803df08f44-6f2c10be8bcmr1283146d6.1.1744888282054; 
 Thu, 17 Apr 2025 04:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5kju+O/dWoPIE9Ybn1kg3pBvJPXA+KWO908qYET4dQsJeQp8XiEZRcojtLSXCqXemg9A1+Q==
X-Received: by 2002:a05:6214:b11:b0:6f2:c10b:db04 with SMTP id
 6a1803df08f44-6f2c10be8bcmr1282886d6.1.1744888281656; 
 Thu, 17 Apr 2025 04:11:21 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3cd6257bsm278243066b.13.2025.04.17.04.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 04:11:21 -0700 (PDT)
Message-ID: <bfc3247e-16e7-4897-bdbd-dc7d82d45fa3@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 13:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
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
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Dang Huynh <danct12@riseup.net>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
 <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
 <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c0w37RIE3UJw6G7DypLVgPwfeHkZTTx-
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6800e1db cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8
 a=L7gxQ87vPTAOeZ-rjWYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-GUID: c0w37RIE3UJw6G7DypLVgPwfeHkZTTx-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=733
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170084
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

On 4/17/25 8:20 AM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-14 22:55, Konrad Dybcio wrote:
>> On 3/15/25 3:57 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>> 0xff is overly broad, please document the existing known speed bins
> There are no speedbins for 8937 gpu. 8940 have but 8940 is not scope of this series.

So it would make sense to either drop them, or fill in the actual
values here

Konrad
