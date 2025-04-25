Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6659FA9C477
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 11:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E18E10E094;
	Fri, 25 Apr 2025 09:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo60nUk9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D01410E094
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:58:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TAWQ030869
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=; b=bo60nUk9AriZpXIr
 8ljFtmcUnt1uRxZYBxGkQQlsIai1k8jsLguG+AwgraCpok0IcazIBJZjpNR0oJnG
 KvgS0pzEuAGog/4KSHfuQpdLZcO10pZC9b/uUF/Al2RV0NjruLsFzxsnbmG7Pxeu
 3PcJWrNtdoY+T5Oxq+sgEku3XYUqyme3hcVfzq+y469VFQI52PgGyM61PPtWmBkn
 WbIslN6eW1R5FoyNVOSuB1C5h3wS6fo1bXCfzeIlEE12BfWDz+t4D3cRvFV4mLTg
 1ijoB2emkUJJsQ+MaXJjDtnawqSHOjCg55JBOV420CiR2xDzhZitC5GczT/tgQcm
 5ga5zw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5gk80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:58:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6eeeaf707b0so3497876d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 02:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745575080; x=1746179880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=;
 b=paPkqeGg3x2NVivu9pnwVYBtb07u4mBMrcpHu6clKLfI9ZhAJGPleC1ZT9ovT3PdYJ
 sgksrbR5cHY27XVqbMA+W8ELweeG/2It5S6I78QaBUoTltRkvxmXKAELo+f/3+DTasNb
 V1UCinlv7CpLLupKskA05YLyjRAcpEWTTnS15iZ/IZR4R2izxsEjwnbFBd6ikLKeL1r0
 77QVA5dMu32zaghpDvTyd+6qrBlBTWTkPPJmIOlYGWThsFdCUgaxd0CYDYv3DlDj/ZzH
 hkvEmL9kHGvMyH6XcUZq9RtaDbBadsAXeUls8/0OIAdpgnVaaso8ag0MK4EzVTrYZm6j
 D+Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1DENpQi7UwX1r79FALPtEh2Qxs3zF7eXivHTPC239x+BJttLXuUzwxHVnp6YuPEQ+OB1Kjs2Jbss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLwR5dz/iC35eqUJpkiez4xh9ubnucMGey00pJdVH0XyCJ3has
 uTBMaagXGF5/zfcj1lOyTMQumUcdh9aclwFRnp8SfGNOmtoL9IonNu4lG25WKLI05qFArJUEa9i
 GAvq7mNjQyuzpv1xxI2CamQA0ZpRnYPlrpobnSY+9+qYiclXvnln99bS9ZSJgqFT6eCU=
X-Gm-Gg: ASbGncuZe0IACEhddI7l7s9jmywcC7AlcoLBQ+kObBHY6pKsPaA6LsQbYKwzmaXMfv0
 p0XcWDzWAnOeyXkyPcIsQ+41ymzMqHEHcipzLXY3YWd1V05qYdoA64dEy5Cwt9bpE0GY5njTCdM
 5s02ubTGEfvmUngA4HxVwHqdGVUsnh0vKWcBr6YvaFbeY4SOtEiZOZnX9AcEMcv3Nv7G/qe81FT
 /JQZpO8BPIL5t3hWTJswRkOfAgPyOoSYSGAvyx45hsVIr6nQgvFLuqNJQ8gKMmsOSYn5kEKbBvR
 0UM0a6YAizc/0bGoALnAHwlmj/l2EiSDa9E2xdLmhuRx1FKg5Sp5XhQZyJ6uvr/2
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id
 6a1803df08f44-6f4cba5f634mr10002046d6.9.1745575079772; 
 Fri, 25 Apr 2025 02:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1aDrr9tIrGOVh+lPKRQPvx999AwcL22qiAWtArNF4QQ88HDa7YW9+wreCLFQKaTgC7b9wGQ==
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id
 6a1803df08f44-6f4cba5f634mr10001956d6.9.1745575079389; 
 Fri, 25 Apr 2025 02:57:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7016f5342sm1032645a12.35.2025.04.25.02.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:57:58 -0700 (PDT)
Message-ID: <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MiBTYWx0ZWRfX/TkRVuElbLIM
 nTnqc0EwNlZs905sC8OCYR8LF6XRQ48iTD1GGJMT/64fQ0liJWhT3qHTki1bXvqFBlbLqQMxqkI
 2S1aH3FfYjt+TtcnYuTbPUzfwLpRK/B1fufghZet0EZVnA5jJ6PnpLCv6gkW3gTHshsSX+LE8nn
 v4i2VZoEzuyA3RuDPaLXkUTZ2SVv6Y8Q7xmrc9MfEv+lcrW4M8Ehx4rjDqcN2uLcgYe6HEbYcOY
 /Kx0uzT0FApQMB+hA/IucRY/vCfJH4S8Fj2lT5yb8j5AjY5xONJC478yE4WhbR6NMeDvcbLpU/F
 8E+KtaVnCo/D5FERCrGcZ83XbbCx3Wn41Q0Uv7JGuei7qwQf5KnawHXYXI+6uUpi8QLCnLk/V02
 92H8uYvW8O70xolTadgXkL21E1PnbDPB0azEsYqp7kU3bCbSkqm8ICuf8OQxZ6KyzDJ24LZ2
X-Proofpoint-GUID: T_14nn2f7VSj82-0vC2nX4xzHeBmkoeX
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680b5ca8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8
 a=x_pH4qmy28IV03WXGqsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: T_14nn2f7VSj82-0vC2nX4xzHeBmkoeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=952
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250072
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

On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-23 16:03, Konrad Dybcio wrote:
>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>>> +            gpu_opp_table: opp-table {
>>> +                compatible = "operating-points-v2";
>>> +
>>> +                opp-19200000 {
>>> +                    opp-hz = /bits/ 64 <19200000>;
>>> +                    opp-supported-hw = <0xff>;
>>
>> The comment from the previous revision still stands
> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.

Right, I have a series pending to improve this situation a bit..

In the meantime, you should be able to define the nvmem cell and
fill in meaningful values for this platform

Konrad
