Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6517C8FE9B
	for <lists+freedreno@lfdr.de>; Thu, 27 Nov 2025 19:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8965110E0A9;
	Thu, 27 Nov 2025 18:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXlJnZee";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="geaVrdzy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E848910E0A9
 for <freedreno@lists.freedesktop.org>; Thu, 27 Nov 2025 18:23:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ARH30Gm1592675
 for <freedreno@lists.freedesktop.org>; Thu, 27 Nov 2025 18:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IUchDNtUE84gJY1BIo7DyrQV1aOljy5HhZHPH/qoZ3s=; b=PXlJnZee5fix1eQK
 pWveOSQUVQ9grdsqlTkS+zIy108BabjuXjxPuOsqyiYBucii8BzrHecpPMnd4NAV
 HA86O6byF+UPp6aOC2fs9lZ645L31XPFcsiVeQd4mq5Jm7XXYF69pbdiRM35LBAK
 68wF9DNvKx/5KTdT6L8KkzYh/f7fZQLRoKVI0qHl4QQ9d2iJ96u6j8mH9Hi76nWO
 LFDmAQOhY5O5AGhbcnqPC3Rjn0aGEWLwIUOtmo4KZ6EjCSL9OaPVhtKysOBT+nYY
 fUkfAQ0aqW2WGgXnO0u/ykh4eXil64dYmtLIC3Rq8m5TlDr1qSONFDrh21GP9hRG
 1hQGMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpu857p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 27 Nov 2025 18:23:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edace8bc76so1803911cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Nov 2025 10:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764267818; x=1764872618;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IUchDNtUE84gJY1BIo7DyrQV1aOljy5HhZHPH/qoZ3s=;
 b=geaVrdzyAPa6Haq20bgnIUa1KBwzwcx5LtebUigMI6zgn+cbr/mkvc5g+73mtZWdIp
 juOGoavXQZPQs0p/hoiIiw/XXD2tLPucleraLzZM6G7BT6w1YVuiVuFrJ3Rej6VIJ8Uz
 G4uYCQ2271JX/INSFowHYBgr2Kp3M0nM+LbDbogfR/lmRZ+oufDbfv11jUfnSEpZzOOq
 WRsCDJjWBuElm26eGeYlcYV/ylXv8L585OfQqw1O07P2KTdLWmiL7c4X8WiYVCkol4XV
 Zc8stSDYlUeakRnMQbV+2FON/RdVsS12ap0uLz2skTPgPKuSgSmYRaocOguu1AtNXN25
 UQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764267818; x=1764872618;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUchDNtUE84gJY1BIo7DyrQV1aOljy5HhZHPH/qoZ3s=;
 b=Sg7EgmrvQ+YVDDluXKPRlfGSVjwGaJt9ykjJDsJaJTmfUotkKVb58PkuU+8tHhJTzd
 w19wpdpAsJaQg+fMuvFctEYGwsvI4eLB2au+nFATs5sewTsid+plxv335Xe89q3L+QQt
 uQdD/sFTjqlzt1UXJ9dW5NUBAtoz6Go+l44+o//Nj2ZAHssPibLzUNIr3tK6/YxUYYDq
 hDjeBvDhrgiigXVZbsL9jXzHeMVDvOeG7raGyB35ej48vSpB61Lf7u7oUiew7wyIz2of
 GP4wA+gUr6/ZCQF1k767xmAm/BWlqd9QH/k4sj3rkxyMn0nlC4j6/hfzWy3F2cxES5RN
 YgTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxd/MiYIQw7zDRuU8J2ifUwod654EDTMqUluQ0H5WfJUvi/W+M1zMQK1bFvMFeKhYwH4x2ZV0Wrug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUsGDvdNG3gim/9dzCaQBsBMJQrcp43u4phBS8wTNm8RKv88RZ
 pZ6f7tzaJFpP5JALWn9nBysXFJPr4tY2W0NwQ+SqKTmKXBi+LMVAMSN+gt9i2aXiBzWedMFWIiI
 daQzUAApBE+iSRa6G071AqDddUgct2KLI1w8Nb2mAVerP8dGN2prq0N0KuCtWXDWsc62bYoo=
X-Gm-Gg: ASbGncuTYWGlm4gep4wxNg992o/73VfjG/ytTvQJbgWIMeKTJ8JFiOkpj63tOPXBhI7
 ZZFDPKa88FyZBOkdCA3nHMGFjeYQ9t4DnB51r9Il0Y1fXZ5WSEFe+8kuXjMO0z2HQwENYXM34YZ
 qxb8buTXOf7k8DI0qjAPftsDc0Hj2iD2TR8cuFprYPA2GykeTicvuKj6bs0jo6fd3XupVk8JPw/
 k2m3SEP0Rp3hBYNS5zQADPgSypXBrrYsjcIHIH2WUypRninOOs3e2CbUepubij994q0CDmRgzjH
 zREYTBGMssW/tMscH/W9eans7sqSxuGwPXzEFa1NJOtr2CZD1jrhjjepVCZs3X9cnXCBpYDkQZL
 aTdkuuNtvufF2s5W3gzS8ZGYa97KTyEvuU1GHmGaMFSYFz0q2lVTUXAtZRnidpYrMnww=
X-Received: by 2002:a05:622a:48c:b0:4ec:f9c2:c1ec with SMTP id
 d75a77b69052e-4ee5b786a91mr241585941cf.9.1764267818306; 
 Thu, 27 Nov 2025 10:23:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFeMQ9EMbLd3D677mJIIOmwB+k9eDLur9GvtzjsK1+MSFnfAPwRig3yaBnk8ECV9phL4g1Bg==
X-Received: by 2002:a05:622a:48c:b0:4ec:f9c2:c1ec with SMTP id
 d75a77b69052e-4ee5b786a91mr241585631cf.9.1764267817872; 
 Thu, 27 Nov 2025 10:23:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751035c3bsm2094550a12.19.2025.11.27.10.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 10:23:37 -0800 (PST)
Message-ID: <7f723f9c-93f4-43b2-8421-7af5f697c752@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 19:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
 <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
 <951138f1-d325-4764-a689-e1c3db12bb90@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <951138f1-d325-4764-a689-e1c3db12bb90@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VvYor3YZ3FD0_1mmEakeHa1iF29k6sYe
X-Proofpoint-ORIG-GUID: VvYor3YZ3FD0_1mmEakeHa1iF29k6sYe
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=6928972b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=6nOnMbRXApaOt5cKipAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzOCBTYWx0ZWRfX2MbtZQ3lWj9z
 H3aCIIc51d8hYNckX7NK7FKALUOoWS0tQ4Snill31Um7q0+YqKI5BHlhZZuVxStM8lx/e20s20B
 phDF34l4oQbUEKFTOamjlcsHkpbogOtwZ8NvGPiE0cyFLFYlADdmgc2uJ5B5tYpi753bwG0Hpon
 9jW8AmXCHGh/FIBg+YRuY+RfmwidFH3eEVlOJe6LupJF/y7glD/a1GK9Arx2MzOa3phEBSr1Yx3
 uIcBpdOzfD3RHjYZi2/+YrvOxJJ3Hw+Wgt3W7yXUfu68jcpXcIUAADC8RVjkCRN4zpOHd39mbwK
 3FFG1cdsdfOuHHm6fkoigy7lYvCm14ATni0y69Hrt8sc82/5cxhiDySUQFQvM+7+kuVcyZQ3GKy
 nlFru+RjO0+gse/NeZH5g6NauoIDhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270138
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

On 11/27/25 7:14 PM, Anna Maniscalco wrote:
> On 11/27/25 3:25 PM, Konrad Dybcio wrote:
>> On 11/27/25 12:46 AM, Anna Maniscalco wrote:
>>> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
>>> but it needs to be programmed for both.
>>>
>>> Program both pipes in hw_init and introducea separate reglist for it in
>>> order to add this register to the dynamic reglist which supports
>>> restoring registers per pipe.
>>>
>>> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>>>   4 files changed, 109 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 29107b362346..c8d0b1d59b68 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>>       REG_A6XX_UCHE_MODE_CNTL,
>>>       REG_A6XX_RB_NC_MODE_CNTL,
>>>       REG_A6XX_RB_CMP_DBG_ECO_CNTL,
>>> -    REG_A7XX_GRAS_NC_MODE_CNTL,
>>>       REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>>>       REG_A6XX_UCHE_GBIF_GX_CONFIG,
>>>       REG_A6XX_UCHE_CLIENT_PF,
>>> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>>>     DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>>>   +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
>>> +    { REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
>> At a glance at kgsl, all gen7 GPUs that support concurrent binning (i.e.
>> not gen7_3_0/a710? and gen7_14_0/whatever that translates to) need this
> 
> Right.
> 
> I wonder if gen7_14_0 could be a702?

No, a702 is a702 in kgsl

Konrad

> 
> If we do support one of those a7xx GPUs that don't have concurrent binning then I need to have a condition in hw_init for it when initializing REG_A7XX_GRAS_NC_MODE_CNTL
> 
>>
>> Konrad
> 
> 
> Best regards,
