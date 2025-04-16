Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB72A90D37
	for <lists+freedreno@lfdr.de>; Wed, 16 Apr 2025 22:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE5210E9BA;
	Wed, 16 Apr 2025 20:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpwLEau3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E9D10E9BA
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 20:40:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mEOF020644
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 20:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDu+tIWiiv3RG9q2EWbYK6uCMzCFUTTLqRKVLC0mQKo=; b=DpwLEau3Y+2DkDDL
 ps32G63sJlVwJ+6ZIG1FsHA4/Lf9gvmuju9s2ftVVke9aTTJgbxdMGcEqNlRdyrm
 JuCidCMnz+IxQbVu0b8ol00Bcg+vXY4HBmC5rpBoUtSJmd9eRETmMJsfPug5UTRl
 DDo5pzRE4mVhbHhfuJLtL5SWfzgi/T0Zy9GLlVSBS9EgFZm1iaceMOTwlY37RjGc
 RtsBJNsOLdFaF9xhCGMP7a2hv+OtYDB67xR8aSejmYLhnom4kyKRbTsk/OIDy9yx
 1vuYV8eyNzjmAEW/d+CeDkWn+8DlUF3z+jEZsliRiy69HgGzz2F1ndr6wfqXv5Uk
 ZDudgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wmrss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 20:40:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so395085a.2
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 13:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744835999; x=1745440799;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kDu+tIWiiv3RG9q2EWbYK6uCMzCFUTTLqRKVLC0mQKo=;
 b=nNuQOPvtXCVBOE1LR2Vw6EZciUFfliCdJQ1ZzUbWYNfOc4511cgL1LViGemXcS5p/I
 7p8Jcp7rff9CVWmBvrUVqHYJFv/JjsqdgcPOjEcU6BP4VMWdWKDQWwXGZ2JspSFTYzpi
 hRZNZFD8pRujv71qYObU6oub86xQftLT18qCT8l79hn3d6bvwPeoO6DERlp7qf0k7gCt
 Q6sL9JneX0hP2lvSi0NasSIils6bqhbsJVRsfoe9cHmj6nR5EygEaHwLEQC5fMzq+cat
 feiMAUm3K5nZMiKbcgdcBSgDwFEu7AUJ4PGdReY3paCFVpzjmaTN0zPpko7cIIGMKNrX
 /LGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHgsH2RROtCCcS6UMKO3FKXw4iY12akfxF/9GsAIfyqX6aKvf/ztG+vKssz6H0oO8+cVMTaIBUPjs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu31nFiuBD56FDwXt3iAIgL9ymBvZ4e3dPDvMcKz7e/fRLdI8R
 Xm9sYRnRwnrE3/7UarRbPkUgNgWcyADCT4hA6cmKHEO6L6iKcbuhaBSLVJj+7RbBZd3m13Di8wq
 tH9Ru9T9sCW7E7sX7qxsPbWWBVdvmTnv2f8bqJwPzUzF1Dam9Dxc/inTM+EHsfqErNXQ=
X-Gm-Gg: ASbGncsOsopwlB/G6P3AI19beaDAlpZshfdv74iMbUB+NayX4A0gBn7rw6I5BKXwPZ8
 85t8ITaoCg4oVu8Ht9I0d5qvjDloLmPWkYYIq5oQ5VVAQk8ldF0hQe0w8VyJjsADR1yxOCquCYl
 N8FI4jpVO38K0Wq71nJ+/0DqN/qQoIKc0a9lq9W9KmvhJimDkWvdRuSKHinkdoPJsz9kLKRUfUF
 oVFX+AT/f9VHhKBDGIe+EaMPj9uw1Yr923XUhJaWCJbmSHzu4cbpRT/H9YTbhfXCLvffJgPfv2L
 42AWzGtMTSwTVZz4rQpvMQFIrDXYN8YTxJ2O7q9aclRtbaQHFL/TUW4Hfa/rQ8tomcE=
X-Received: by 2002:a05:620a:288d:b0:7c3:dd6d:54e4 with SMTP id
 af79cd13be357-7c91d0602ebmr62128485a.10.1744835999430; 
 Wed, 16 Apr 2025 13:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzgDHx0UMfpo23gp5XKth2J0840BeS/rB+zsXeevtnGVzubmJ5n0ka+mRD1Wk7yKLA+/G4gQ==
X-Received: by 2002:a05:620a:288d:b0:7c3:dd6d:54e4 with SMTP id
 af79cd13be357-7c91d0602ebmr62122985a.10.1744835998836; 
 Wed, 16 Apr 2025 13:39:58 -0700 (PDT)
Received: from [192.168.65.126] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3cd618ebsm186163466b.16.2025.04.16.13.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 13:39:58 -0700 (PDT)
Message-ID: <b9fd463b-5a34-4c3b-a6e8-7432e1a0f2c6@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 22:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <ddf29d5743e25f311cd86711f39f7ad0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddf29d5743e25f311cd86711f39f7ad0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=680015a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8
 a=KIKYxIlc2-mGyxiTgOQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: SHG4_15RZHhoGE6SnM0h8vZ9-7BQRMT0
X-Proofpoint-GUID: SHG4_15RZHhoGE6SnM0h8vZ9-7BQRMT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=869 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160168
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

On 4/16/25 10:33 PM, barnabas.czeman@mainlining.org wrote:
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

>>> +    thermal_zones: thermal-zones {
>>> +        aoss-thermal {
>>> +            polling-delay-passive = <250>;
>>
>> There are no passive trip points> +
> Should i remove polling-delay-passive?

yes, please do

>>> +            thermal-sensors = <&tsens 0>;
>>> +
>>> +            trips {
>>> +                aoss_alert0: trip-point0 {
>>> +                    temperature = <85000>;
>>> +                    hysteresis = <2000>;
>>> +                    type = "hot";
>>> +                };
>>
>> Please convert these to 'critical' instead
>>
>> [...]
>>
>>> +        cpuss1-thermal {
>>> +            polling-delay-passive = <250>;
>>
>> You can drop polling-delay-passive under CPU tzones, as threshold
>> crossing is interrupt-driven
> Should I remove polling-delay-passive then?

yeah

Konrad
