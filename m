Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FF0BD2549
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 11:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1427510E417;
	Mon, 13 Oct 2025 09:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzRKij5x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D73C10E416
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 09:39:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2o2kF001858
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 09:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ki9AQgeDXinhOnoOYGE+AX4oW0J7Rlumps/zQJrNlB4=; b=TzRKij5xeqn+/NlA
 nekBdq1Q7d0MtPY721CSvhlSbUBNCsvRqeVXsYhh2Zfo92aBIyphy0KikGMIrL79
 iyJk8QdkZqsOJaaesucDhuIkqf+gcr23TbZJL9Mz+iWG10IfTMaTcCsFxMHSorqY
 waAOjxpufMQP/fTnZiMYcwbh+EKP7UvcHXi9DjZ/0ldm7EKBMhPywNL7D+ZAmuFz
 JtnC7JGd3NRXcHdFIzJ96e9qcQaxZv4+CZwasPWjSs9g4EtrMjlYX3/zLb3iqOCj
 Cuu6D/uaCRrjMVlRgU//trSm+yvRTctbBABIcDFKOebxryPKt8kElidMzCLiQH+c
 FCG1kg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8v433-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 09:39:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-81d800259e3so121518426d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 02:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760348385; x=1760953185;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ki9AQgeDXinhOnoOYGE+AX4oW0J7Rlumps/zQJrNlB4=;
 b=FNtyqhLglzuhl75iFsnI/RX3CXSzi77Mp3n+jUUe4lY9bWPa0fZpwpfiq5YkXrAQBB
 laVxMy16i32nCP2SeJ5cLn5tnIJ0C/U5YpM0LNfWAA95qI51x7qQOjP106HPs2OTzKa/
 NdSpzSk4NbYSRzrzU+wjkdIeNPXvywMeAKBunhettoB+mY0G0n7ObGZ6ghNEAE2uJWd2
 mFeGlTl7IJicrXmxQ5e90uSxrCmSwfPyxY5zs2MZBfdxwaCjW8n9JJSz7o4iZwWTh94X
 WySRLqr7jl3sGYEJMyTBROF/J8ZsviV4EQjHl6yewS6BoAxnW+KwcEs9HNS4k6wWe7ts
 URyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzuLkm0BGbM69X+8o3U6MdOpj1c4pR0qtGLrCytAJqpHUlgNa6onv+X16b/FIT2xp9+tghrBwbAdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA2/9pCjxDq0Fn/CMfSWA/5FXkehcGkEhT3gat6rsDD8H5Nhol
 gH8V94uPgsZFpI7MNuEHBNv1ji4KrAu4xkaKUQf7RPW6mYMrP9W/PajyV/uP7/RSp3Zkx7lghi9
 FA2JcRG/hOb3xtgYXJKLyV6p1Y/POeTBSgrGOQPqwWbnP1dVsE+wcoMuz1/o6UCxyEhmXF+g=
X-Gm-Gg: ASbGncvCv20JlcU9nSvgRpTKLK2CW7CunRZKel1Q29w5R8hDjm8oPksBQ8FXUC4Slgi
 WlPeV5HBi2EHKakcSd9KOCpI4gMAdovuQyqeEGWVqENhHPJyqU1VQqwxCMg8WLXwAQ6jdlHauaa
 aRUSl6TzChdzSUtVpBAN+uTheiSazuiQEBNeM3PHV+CPXbLqMh1D0+bed0wb3C0loe3/OCTnGuE
 VgYXxDOJanIKTl46SBhebg4E2ImPQ3+w4To9OARysRcf2LCrnlgzonHv471xSeoh4jUY2RqZzkA
 81ufTLXP81oH+ENLdsdeAY2zCwmgPEvLn7J5sMmCxXOXXEXzxWriQ0otgYzbVK63re1JjT3VwZ8
 sXEiVgxxXMDekWoHLAEoa6Hg9ZUir6zloXSFP4iK7pn8HRpSFnVvTI5QRc2MrjWs5ojhQKPTPA7
 TM3nOfKlYps0rmr1EtNA==
X-Received: by 2002:ac8:7d43:0:b0:4cc:1ef6:9c07 with SMTP id
 d75a77b69052e-4e6f5119a40mr214016121cf.60.1760348384667; 
 Mon, 13 Oct 2025 02:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4qJbiYUTKZIv9sgbRJV/j0WU8jqQvzg61vG6N3jHMvsEi0Vl1Fk4PGWY1LSWVGJDhtbnwHg==
X-Received: by 2002:ac8:7d43:0:b0:4cc:1ef6:9c07 with SMTP id
 d75a77b69052e-4e6f5119a40mr214015911cf.60.1760348384172; 
 Mon, 13 Oct 2025 02:39:44 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c8:f7c7:f006:1de6:d998:8e01?
 (2001-14bb-c8-f7c7-f006-1de6-d998-8e01.rev.dnainternet.fi.
 [2001:14bb:c8:f7c7:f006:1de6:d998:8e01])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762e7f7f7fsm29981001fa.27.2025.10.13.02.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 02:39:43 -0700 (PDT)
Message-ID: <9cafccd5-35d4-46c5-aa57-1b0b8ec116e8@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 12:39:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
 <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QEGHtXafgju4R4zoRxpDlyHlQiigiOu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9vTlC3NopCVX
 qeVF+1EMdied8yDkUBHURVxhiYismfR7OshSNF12yAq7w+GcYTBLYp6m7RazK50Ym3WXe7AtUyT
 ecW2gaS57v9CfxxDUBLaGlYnMJj++ysj3RLg6585TLhmcnAP8GI3NTMURdQoqIQQeF1YJ2J/S5M
 Y7d6WKIhR3877dGvvr1owWh+h+VowiLY8ubjNVpC2e+UL/ABFBl3LTZGMYGdskhBmQYKWDirRg9
 OnGHD1mxmz+ei/BpSwUtOgBcNREaavWNWORzuLHfT/gHTKfWgFb8DLpCkx/PPe1WV2IWfPcbb5H
 WMVUVjsHhK/Km7ncxQkM1x+9aQQKeUJ+ASlQYbN3flxmGB9vCecfZz+8z5yJSVtFAGTfbaobagx
 WLPPYlNbPfIZ/x+hf/Ygz4qQAA8c0A==
X-Proofpoint-GUID: QEGHtXafgju4R4zoRxpDlyHlQiigiOu2
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ecc8e2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=RAbU-raeAAAA:8
 a=pGLkceISAAAA:8 a=tclqJqCaU1NudMZwD7AA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 13/10/2025 04:52, 曹俊杰 wrote:
>  >Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com 
> <mailto:dmitry.baryshkov@oss.qualcomm.com>> 于2025年10月2日周四 10:04写道：
>  >On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
>  >> From: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
>  >>
>  >> Some panels support multiple slice to be sent in a single DSC 
> packet. And
>  >> this feature is a must for specific panels, such as JDI LPM026M648C. 
> Add a
>  >> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
>  >> feature in msm mdss driver.
>  >>
>  >> Co-developed-by: Jonathan Marek <jonathan@marek.ca 
> <mailto:jonathan@marek.ca>>
>  >> Signed-off-by: Jonathan Marek <jonathan@marek.ca 
> <mailto:jonathan@marek.ca>>
>  >> Signed-off-by: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
>  >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com 
> <mailto:caojunjie650@gmail.com>>
>  >> ---
>  >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  >>  include/drm/drm_mipi_dsi.h         |  2 ++
>  >>  2 files changed, 12 insertions(+), 15 deletions(-)
>  >
>  >Please extract the generic part, so that it can be merged through a
>  >generic tree.
>  >
> 
> Sorry, I don't get it.  The generic part, generic tree? Do you mean
> the drm tree? `slice_per_pkt >= 2` is seen on the panels of these
> tablets that are equipped with qcom chips. I don't know if these
> panels are used on other platforms, and if it is necessary to do it
> in drm.

There are two changes here:
- MIPI DSI header change
- msm DSI driver

I've asked to split it to those two commits so that he change for 
drm_mipi_dsi.h is more obvious for reviewers and so that it can be 
merged through a drm-misc tree (or through drm-msm tree provided it gets 
a necessary ack).


-- 
With best wishes
Dmitry
