Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A78A3275F
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 14:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B7510E8A5;
	Wed, 12 Feb 2025 13:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGLt8cg1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86C310E286
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 13:44:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CAxNU2030318
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 13:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bcv87hwVFJ59H+rlgvVS9U8o2Zyl8UBZpx3M/46jsWA=; b=eGLt8cg13jFBCs95
 yrPopG7sZNOi1ak3UaZIxzK32Z9zTx0VtHzuFulWKVwnu6fmhU5x0gCh6CR9KBGP
 3HptCiSTfHzFiFDymejlEFZWMMv4XD1pu5mWfZwUVsW4vea0O0oC5/Lau0VOtSbe
 ToGZMztFEXKAxtnSvhHTWyf0HsGIiih9PT+k5NkkQLwK9Dn7WJPuv2fe89iie91C
 jienpfs1fDF22tg981YnrAmkBIvBa1npVfm/8Awhj1DJQAdn9ePdivZWJAhtg2VE
 pmyEV5cr18DV5BiKZxOKcnlMrMKjfzfD2HPbMTmUCcJbyIxvP/GHS+CrV7jI562i
 bNU6KA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9n3af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 13:44:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c07771cd7fso605585a.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 05:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739367897; x=1739972697;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bcv87hwVFJ59H+rlgvVS9U8o2Zyl8UBZpx3M/46jsWA=;
 b=nsM+yQAn12dFZCxlAVeNlFjCrJyOexMzmmXbcIU+Cp2ju19P8gJNO+dcOEZ/13jyhr
 Ns0FvA0XIQy6t0x7fhZRyrF46QopVKc/zH3sikXcShE4CmyvGpe5B9EWJ8kgrLFVIHuv
 4z6PxNMzvac74/K9UFc8OAb3wotoKg5P1ZYyWPo3AymJjrCs8ZDNEnW8lmKMi3lV3iYk
 lTQqb+9ZqNc+5lJiay8y6qoSTS4ztI8yLEHkqtzypF4p0TI1R9pBbOlPNd0h7XP5bIXm
 UY1psHQad1paRAt/JvQFw6GuAK6Bu/ZiVcK2cQ/ivcy4F0PbPv2KxUyvOSMgjLAuFxoE
 SBrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULKsIsXJh+AO5uGEC6xWNAapee0ucfT7AaySnNoInwFkvgick9SJ6Z2dhSNN8oC3MtTrZuu/AKBwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1HmQQfMzNI2m+Bgw1xCH4/8aziIrnb6kJe/gf3idekMTrFVot
 u4tJ3uSGdS8UaKlvt8D+Hn1msMiVgUKB6GIyXjlDWN2GAH9FnvxXA0dDB/qHV/FxKF3L30frNaU
 c4Ye97XpxZpFGGvqH6H49iFM3u6T4ZEM76dWn4fRqVPfd/xy+CMNGqHHfzxOTAD3ZITc=
X-Gm-Gg: ASbGnctKAu98O3KeM3QQCAT7RukklAD+0cHlKxSToHimMsfCBTTelLkMgt71xYD4ljs
 sryf/FhTnssde+sdibLOz9+sabI6heKdDgoCXIALIAB+dbW2gUkaB0qaZxkCbzoHUeb0O8oMgaU
 C0KhwW/kn9gviuUl3CZA7Y/+SlFvK/jJnGnU99X/9tER8OdamnGRpYWGzm5UbCC+QQ9I/nEkrMq
 RgpugOidPsNhH/DClYMMEXktzn9ZcOqC8DQrzA1WBu8Szl8FFM3/vuD3vFGiekPHp259th7sqUC
 P+2hOYyh+QU/esW+04GQgJwoidh/5Bde22Oj643HDcSEeTa4ewpJJN/De0g=
X-Received: by 2002:a05:620a:178f:b0:7c0:7818:8563 with SMTP id
 af79cd13be357-7c0781886f1mr47790185a.8.1739367897007; 
 Wed, 12 Feb 2025 05:44:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOHyU09alCVQwtWMOufSC23nsnbBXmC6L1k3XnA5cPStmX6pOxlCcBfACplNb3zo+zUrAcFA==
X-Received: by 2002:a05:620a:178f:b0:7c0:7818:8563 with SMTP id
 af79cd13be357-7c0781886f1mr47786285a.8.1739367896515; 
 Wed, 12 Feb 2025 05:44:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de51768762sm9483438a12.61.2025.02.12.05.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 05:44:56 -0800 (PST)
Message-ID: <c4850349-e0d7-4976-a6dc-9c690905abf3@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 14:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <531a23fe-940a-4e9a-b023-5f1789ac65a5@kernel.org>
 <10d83c88-9f72-4577-95ba-bb1fd1ef36d1@quicinc.com>
 <5fd75e3d-ee87-439e-b6d4-dd0dd9a0ea2d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5fd75e3d-ee87-439e-b6d4-dd0dd9a0ea2d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 489ul-zc0sUW7xFhqHMWfzUhYHFQyj6i
X-Proofpoint-GUID: 489ul-zc0sUW7xFhqHMWfzUhYHFQyj6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120106
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

On 12.02.2025 12:28 PM, Krzysztof Kozlowski wrote:
> On 12/02/2025 12:13, Yongxing Mou wrote:
>>
>>
>> On 2025/2/12 16:35, Krzysztof Kozlowski wrote:
>>> On 12/02/2025 08:12, Yongxing Mou wrote:
>>>> We need to enable mst for qcs8300, dp0 controller will support 2 streams
>>>> output. So not reuse sm8650 dp controller driver and will add a new driver
>>>> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
>>>> to compatible with the qcs8300-dp.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>> NAK. You just said qcs8300 is compatible with sm8650. I did not ask
>>> about drivers, I asked about hardware.
>>>
>>> This is messy approach. Describe properly the hardware first, instead of
>>> sending two conflicting patchsets.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Hi, Krzysztof, thanks for reviewing, i want to explain why i submitted 
>> this patch. Patch 
>> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com/ 
>> and 
>> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-2-1687e7842125@quicinc.com/ 
>> is the qcs8300 display enablement changes. It base on current linux base 
>> code and it only support SST mode, so in the SST mode, qcs8300 dp 
>> controller driver is quite same with sm8650, struct msm_dp_desc only 
>> have 3 members(io_start, id and wide_bus_supported) and they are same 
>> both in qcs8300 and sm8650, so we reuse it. BTW, for dp phy hardware 
>> version, qcs8300 and sm8650 is different.
> 
> No. In one patchset you claim hardware is like that, in other patchset
> you say hardware is different.
> 
> Sorry, hardware does not change based on your patchsets.
> 
> Sort out this before posting new versions.

In other words, fallback compatibles must be chosen with features that
are present in hardware, but not yet supported upstream in mind.

It's totally fine (and even preferred/expected) to describe hardware resources
(such as MST clocks here) when initially creating bindings for a piece of hw,
even though the drivers don't use them yet at that moment.

dt-bindings are supposed to give the OS a complete representation of the
hardware and ideally be immutable (which is a struggle, but we're getting
better). Driver specifics should not influence your decisions (or at least
do so very minimally) when adding these.

Now you're in a """good""" position as the display bindings haven't been merged
yet, so you can still upload a new patchset where the description is more
accurate. If it was merged, we'd have to break the ABI or add some crazy 
workarounds..

Please coalesce this patchset with the "add 8300 display support" one.

Please also describe all 4 MST clocks and whatever other clocks/resets that
may be necessary down the line.
 
Konrad
