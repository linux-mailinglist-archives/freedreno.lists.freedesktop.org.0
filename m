Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E83B0FAD2
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 21:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C823210E191;
	Wed, 23 Jul 2025 19:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="koS+cKhb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404E710E191
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:10:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH3Se6009376
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KgSt802qmdeMVi+yTHJ1x7sZur/iyrLv9PPbtqJ0DcU=; b=koS+cKhb+lq+w662
 kXqbKfL6yTiH0OJ2FtDGxz+azvW/3i8pGhqAoAaEyfTj3y/t7BLszI3SyNZq+g+B
 OTLXxVh+07Issu4T9bMhYkgcC5g7yCp3Oh09b1i0W1W4sSHSchPWCOrA+2ZrHl5Z
 IFj3fOrGB4syUhU+SerDrUSMfG+iFsOsHuiz8VkG5l7OCV0u1L7FQGXDW8b3/Ydi
 QJzdRTA2zTOs9OVl4c/FbCaLRyXCCOhHqea8WlqH7xL3DpVTkFGpN9ceovdj+QZK
 Q5L41bzy/qZmhAGRNzzWZdTVS3ZdhcZeHHANXql9pKz/R/zvMBHoAmZmxPfHaH3K
 4Dvb+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na4rp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:10:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23692793178so1366245ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 12:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297853; x=1753902653;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KgSt802qmdeMVi+yTHJ1x7sZur/iyrLv9PPbtqJ0DcU=;
 b=jwkcJFZmfDUPwaWW5qYXTrQraPxoXGkfK9rh/oy7J5hHulg3hMparVZVYKnc9iDCrr
 4UKGU5pGJ2rWsVgrJJOKZp8eaKraOpLn+llmCEx+5jIsmA+TUkFjrqyeGo94na9uJAC1
 D/gmhbY5opXwaihi+ORvEEtO9lK6+deTrzei4z5fOX6fh20beBYoB9OoSV6KnMhHBdRX
 RFVkd0gR98Dqm9cGEo3tsBHdR7sd9PiR8sPjF1Go6bkGxEQiXQ4O6Ek9OIkIXBP9fFQn
 1c5ltXUTDJSIRsIUWJWOONcpb5uLo6s6x8dArSwcutJdZHu2gRzO2Rz+qfnpnQ/rMXdj
 yQnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3G2lD7seh0JeCrk6hpXibZhKdIPDpU8Dsd6uesTN1FiYIdcr2QNn9IfHFCBES93OcTNL33Nf92dI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdjlSmrUvVFy7P9/F5C+W0GqA7BIQoWdnM8jlj55nah1qsanol
 vk6tdFxjKtKqVwaPby9oYOSyr6EtmWaZqzM/k9e0BLFJJnUk4K1MzK5He6mATvvC5LDIQ4/pUGd
 WN+N2aB9tTRk5Japtlg3Ybkanaxnp8V6/2IFxO6o8DJ9zmwB4T63LO1/8dy9E3iNO71Xb5bE=
X-Gm-Gg: ASbGncvqzttKiLWecojFVNzUV6RxAyK1sLoXEdCD4/7tK34hpyotu+H39XgkRFeKlfz
 JnV2hAsvrA9JjqU1JxA2NwlHIvuzn5Hvax2kgOvuj7nJRqeYDlTo3FmrC9V3sJzhQowzO15ukrw
 /oYc4fGAvrgZSgfPLQxJD/XSuQTUmv/xWnZ7LZKSwZd9/5Mk1jdZwDwc8S7C+DCLEKSdZsqgvKN
 3Z4ZRMxQbsNQnIt7mKr88QSh+LmYDwdrHth42oUt99EsvjFT260jl3/GeXj5Rd0/WZiEsAb7vx/
 XHHv3u3Le7d8U+nEYxXpbmO+wS0/IZbbxxUc/AIM/bFVyyBngH9AVByoH7JoJRrg
X-Received: by 2002:a17:902:e881:b0:234:8f5d:e3c0 with SMTP id
 d9443c01a7336-23f98161a50mr46228365ad.6.1753297852695; 
 Wed, 23 Jul 2025 12:10:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3CHLM1wF9WJWdlUe1Sb3b2TPPZfOnw2+jdpTbeD4nUnNJuQbnaKGQAjcRTI5pJWuujuk/7w==
X-Received: by 2002:a17:902:e881:b0:234:8f5d:e3c0 with SMTP id
 d9443c01a7336-23f98161a50mr46228085ad.6.1753297852153; 
 Wed, 23 Jul 2025 12:10:52 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3c89sm101986125ad.18.2025.07.23.12.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 12:10:51 -0700 (PDT)
Message-ID: <100ca94f-e1c1-4cc3-8282-a14066396f5a@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 00:40:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
 <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
 <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
 <02b9de9b-36c8-4db8-a1dd-65a82aee0eaf@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <02b9de9b-36c8-4db8-a1dd-65a82aee0eaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3XTrJ1J8ZXQN_gruQyThUdSVgQeG3_lE
X-Proofpoint-ORIG-GUID: 3XTrJ1J8ZXQN_gruQyThUdSVgQeG3_lE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX61fi/+IkNHoO
 mLCsIFE59rIwVC3lK/rOYieSZEgmLjaVoBnY14Jp/wlGZN1tC4OQXDmfWFF0Xp3iprvmUAQbD3g
 9SrX89Zaqk6RUWMfroLXnunI92qbrYg2v46JjGXEo5FjzUFjD5iS2t+pMVvzBXlem38TgeIXi9e
 RwoKL48b1zmw6aOSWi9JgzDadFSW9DvO156fH2s9Fe8Gw3t5ZUG2mHPXwPHeojCyf6ZJtSd1AbY
 f4ZraL3E3zjOz5iRnLQYwXAlEdL4ZPExj0S+cg45F4oNO7liK+0dz3c5tGtMWGnf2p4VLfYpWjY
 6sjKmSU83coWbai7EklH8aWMU73zywf0GqP1wVn6Uk0RgKzZzcfO3a/7uc7RATZre0taA1HR9zZ
 7U34enhIVD7XnClhLbDcefIV2WRGZSMBgtVl8Oekijl1aWVZhK/Cfj7QH8eH8HW4K+HA4M45
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=688133bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iAeCgxixrUXn6QA2EFgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=886
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230162
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

On 7/23/2025 3:43 PM, Konrad Dybcio wrote:
> On 7/22/25 9:47 PM, Akhil P Oommen wrote:
>> On 7/22/2025 8:00 PM, Konrad Dybcio wrote:
>>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>>> A minor refactor to combine the subroutines for legacy a6xx GMUs under
>>>> a single check. This helps to avoid an unnecessary check and return
>>>> early from the subroutine for majority of a6xx gpus.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>>>>  	int ret;
>>>>  	u32 val;
>>>>  
>>>> -	if (!gmu->legacy)
>>>> +	WARN_ON(!gmu->legacy);
>>>> +
>>>> +	/* Nothing to do if GMU does the power management */
>>>> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
>>>
>>> This isn't quite a no-op, but I can't seem to find what the '1' value
>>> would map to, even in 845 kernel sources. Do we have to worry about it?
>>
>> This is fine. '1' seems to be a low power state that was removed very
>> early in the gmu firmware development stage. We can ignore that.
> 
> Ok, good - could you also add a define for it, perhaps something like:
> 
> #define GMU_IDLE_STATE_RESERVED 1 /* Cancelled feature, never exposed by fw */

Ack.

-Akhil

> 
> Konrad

