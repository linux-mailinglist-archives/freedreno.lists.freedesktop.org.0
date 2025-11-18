Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A20C67FCC
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 08:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3213510E31B;
	Tue, 18 Nov 2025 07:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRkHZLpx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHzbOsDb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F4010E41C
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 07:36:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI2D0SC028363
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 07:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=; b=KRkHZLpxjmHfXXKh
 oQe3FkNW27uWFRVun+8U1fAhoyGctgOahbqKwvjOZrKUGZ7BqT24IjxkUxgQp6Gh
 h2e2fRmW12U8lqq2PDgPN4EUdyXiPEQyhNeV0YU215WhD20gPIcqSq8ckkzeyYBo
 87FwvuBmq9QuzokZIpbPJRMuy0IIivPBazXCqNEz7jXp4bvrAppM7ySMv1zumyhn
 mtuJsPxTdQWL1zc0GZj7SZEmgjMoraCMS5gp4CwSptTTjqEHhKJXKMr1WM5SH3oC
 KylGLSBnHJ0WdzQTr7U4ZL7HLeJxPpzQRzhkDPrZTRWf1l1hlpGfzm8x9D4ZT9+A
 K22YPQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t27s5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 07:36:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7b80de683efso10831751b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 23:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763451391; x=1764056191;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=;
 b=VHzbOsDb7amUbJb0lbYKr3V+Gd46rBu2axsWtAa8yh7xb+zAnMlffv514H4NZGrApJ
 V6cCIzeX721N5WfgY36TYbTG2H6bwJ4hM8kHVlHy6YyDJ9hzneiCQiIDvMPRPYH/1eZz
 Kp4L1zOspqEPOn+r0jto5ZUjkfCDcTyyQExEaBg5z3ZbSJY7a+4oCnlw7I7ZsF3vv4Kl
 fgLPiSMHOkmSpiiVrswSsQ6/3+vpYb8NWK0BpST6ah7ZjnJdaZQNX1ypmTllunAmjyL6
 WYxTDEKcfj6yNo+aDdfaHVqdBFqnxRwmKYfUir2R99J7NNEcLB2oAxSC0i0LAFdPtWCP
 K+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763451391; x=1764056191;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CVinXdjILSV5+JiZoUxO2kalWseMGqwJaCbzkxN41D8=;
 b=gW/dECYvqF0Dj7mSRCaXyfGKkYMYiK/i59g1dTkrEU3+TPVUYGs75SzzAKNBshKYCu
 Odwyw3axtr7THzJxZ/OJw4Jc4iYRDIwv0OSlAu+n7qmmtj4bsIUy9yJJV0MxHXMe03Xa
 /sKD9qnwEosF0n2t88nLPKOi5/7ZrrgbSdaweZFm+KmIVzqcpqhV1fCn6fnRza8zJXdn
 3looLd6O/8RUWPEiFDB+o4EZ/R+EBToa1IAogn66lLWpGvA27rSbMWqc8mV/Q+ayFgJb
 Te3WS8mOjBtoi1Vsww72XtRv64uVs5iuLTSIKxMQi5nnQYuCQnc1LZ2xubn3TaQiPLC6
 OTqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxQFErHzgcBli/1flpkasv0nvQ2EQX9JT8jnaBj1+yvyxK2WkVMVqmlCtoeb+nHFipMiovNhl4uTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBlhxn50uC1d5I/DZiQgPPtqKhyMYQWPnOo9cVtOo7ecBcQV2z
 oJax5DWdUgP4aah+kdggx2ZgGrdfj7sbpC4Aoid/2bP1vIfjOLh32oCxi6S5xS3VCHj7ySZlQCq
 0bzHLd5leMnRvEDO4u1mnQ6B0pVXK4JjjVEwccBY1g67hxu1oDY8EP8Bn+2/FokKj1MhiS8o=
X-Gm-Gg: ASbGnctmt4ipw+juvSrA/SGTyxrON7SLliIj15CoX8B0yI080OU6zasupDf/J/lG2hy
 YXk/xNyH8ZF3ZniVNG0bxAIRdy6VMMkrvEZ082DkXqrdUWrKQuup92WzhjX+iP/bQUMPDpu1opY
 znTl5tLOocM/NW8bXCoPMEEeJO/aS8I9izOISna2v5v+qxe/bQtiaUXwn1bsucXJaugcUs+4VA1
 tIUaj7FdqzqqpjiAv6it3miBS7yjRM89ELhEepz4ENZEWQfuakKXkIKwpFmKAWl9/3sxcatMqKX
 X59ba6aI0urd/Yv1L9DpQIRRw5ah1aS9f/mvLp1+ttQKaH6nmEnyrFzHvYaJoVPKonDfpjyVS8S
 CG6lyj6Ykh/llHiYLMNiT0MP/Qpn+AdyXmI4jV8Grzh2SKYoawPWy6EA6i5Ig
X-Received: by 2002:a05:6a00:3d42:b0:7ab:3454:6f2b with SMTP id
 d2e1a72fcca58-7ba3bb94a6fmr17351042b3a.19.1763451391386; 
 Mon, 17 Nov 2025 23:36:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHukQGXJp1dGw+SE5YsWPfaB2imyUIP4jehWGiPYigS52alyMJZbGUghC4jAi+ug2iDnAHAA==
X-Received: by 2002:a05:6a00:3d42:b0:7ab:3454:6f2b with SMTP id
 d2e1a72fcca58-7ba3bb94a6fmr17351014b3a.19.1763451390941; 
 Mon, 17 Nov 2025 23:36:30 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb4:7658:a83f:a091:98a7:4ddd?
 ([2401:4900:1cb4:7658:a83f:a091:98a7:4ddd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b924be37fbsm15673576b3a.1.2025.11.17.23.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 23:36:30 -0800 (PST)
Message-ID: <0ba8dda1-96a7-497f-b0a3-7d6581bfb184@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:06:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
 <8d94324f-80e0-4952-b344-23740d1dbf54@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8d94324f-80e0-4952-b344-23740d1dbf54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1OSBTYWx0ZWRfX7WuC9tXrYtTF
 LJtEyB2RS0QQ3IYnTqw4ReczW3sI0F+NHAM2zy0moobsASzcGQToN7lur84OpTA72nN9VpzD+sU
 4GX/w4UDSAMLODONz2OBTTDY02R5JRhCY6Z0Y8ZxwBaNiNXp/bMoLh1Z5dFqJfXJD3UruhydXdq
 CdFJFB8T78KDxDeci8R14njqENnT5S2rcQnpzQF6C52m0/6R1l0iS2RGZXo0htArDRhkHbxW+fF
 7vAi55JrvpK327p7lVfgVyaLacvEXkr+Dx3sDDemWADYFF/YMtuUvvbl3C2fUT1G5EJhndnGrP/
 1u8V41U3UzVxhxFj/Fqh/Mq8hz/7LZEkAk6zrFQGgWRxt8KFgURq7c06F6uZn5VIB9z89NowZGM
 r5m4ouzUtpbL8bfHPOK7lvxYG3qJXw==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c2200 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IXbB0Ub-vNnPxA_Vui4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YkYk1aYS_nvGCl9VkSd4YrIXUUq3o0Qi
X-Proofpoint-GUID: YkYk1aYS_nvGCl9VkSd4YrIXUUq3o0Qi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180059
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

On 11/18/2025 1:05 PM, Akhil P Oommen wrote:
> On 11/17/2025 8:21 PM, Neil Armstrong wrote:
>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>> a kernel crash:
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
>> ...
>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>> ...
>> Call trace:
>>   a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>   msm_gpu_hw_init+0x58/0x88 [msm]
>>   adreno_load_gpu+0x94/0x1fc [msm]
>>   msm_open+0xe4/0xf4 [msm]
>>   drm_file_alloc+0x1a0/0x2e4 [drm]
>>   drm_client_init+0x7c/0x104 [drm]
>>   drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>   drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>   msm_drm_kms_post_init+0x2c/0x3c [msm]
>>   msm_drm_init+0x1a4/0x228 [msm]
>>   msm_drm_bind+0x30/0x3c [msm]
>> ...
>>
>> Check the validity of ifpc_reglist before deferencing the table
>> to setup the register values.
>>
>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> Thanks for fixing this. Chia reported this issue a couple of weeks back.
> Probably, we can add his S-b tag.

Sorry, I meant R-b tag.

> https://lore.kernel.org/lkml/CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com/
> 
> -Akhil
> 

