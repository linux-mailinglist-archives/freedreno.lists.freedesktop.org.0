Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE9B0FC47
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 23:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB76510E077;
	Wed, 23 Jul 2025 21:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoZGisDV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418E810E077
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:46:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHrdFR032272
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tvauJF9+c6IKxzBGTcvA8iSaaoeAgCJyCD9Tgwx44f0=; b=IoZGisDVCuegZMFt
 /m/Q4EEsuKHnnCOd7eju/TXpfgxGb5IOhqc27QPCdVKs94ZKD8bIem3LfsZI+E52
 JotkVof08ygoTKIbTWh+vcogoJww7Gkk4LXwJaU6YwIzUYrwQ/aop30OxPWmoAx9
 aza2USyuTvfNUJtwEtTnL+Ofjbq9B5AVVQ3KZi0jMyA+YA0VQW6dbvAUnpggMjmt
 CWFlf+Rimaj5KkGhSKvr3qfGA7JTVW5IpAJmBJt09cos2ADWMDObwoDc3YSRpD2j
 86tkgt3JYPesJ9JrXH4T2Tnmw/xwKVbcOmJoU0BKcRyUcHPVV36lSSSFz/eRuF1E
 F3cqfw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1dxmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:46:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2369dd58602so2511115ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 14:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307204; x=1753912004;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tvauJF9+c6IKxzBGTcvA8iSaaoeAgCJyCD9Tgwx44f0=;
 b=twuWJBLwyc2ugy/z9YTBP3xJhskjrNUSVZ1tn4xVFDkABpA0Zd6c1nqHY7eWQbMoQa
 TS59v9Tpf6QHEuu+KYjVoRoULQiKRaX1vfmN+Etz9iqx9BDa0vCGSi/PVnFO1SPWwDYj
 Jg+7tFexcuJLagtXQG7gp8meQONr1XCydaAcp1w3hEdm20SbZnBLyMChDG+M9+8ws/Ix
 dGwYGoocOb/eaDjmovBKyMoaOkEORtHfQr8wF7Xe+KZEm+apkxf4GGI/9IM4JXLp2IcV
 4k0KTBtoe2gJyQZs/pZa45p1YWNR3BuGtId/NpR6U4WDZxPdlCUula6MWjaDi8gpEcLb
 y2fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv1hrsifhYX+d+Fe5fQ0J9jiCQ8LTqIcDbmWAr/J9w1+VviGsSZjDYYw1gSL+oCCY+xPq9VETorac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO4wL8sUO/X2G2sanAt8mp/4uRgNy6TF6vFW686ku7/VazVJkf
 pJDYJqtCf0JN8m0Kc8IwFZZBuh7X4IJtkvMrSpaPLK+YKZnMlB0ww/0rS0MNLDzOPQhhG11evV6
 4tOpBb5nhty0T3mXcb9ucvxnCy1g/E5EICSuwMZWykNsJXLADsKsPaWiJXMYQ5FClckJ+EV0=
X-Gm-Gg: ASbGncvoIgI0ETMnJIyLVVwPnBtLZrQ2A2blkU4BYGOAZsfdLbo1Sf41Xx4/7zIpZ8c
 AlXqS44Egt3g80DWddOA01Yv5OjBlKh4yS9j7v/F9HrM6h8gvSwC1Lf8/s43PTp1VmemydIe1pE
 NL1EcXDjBYTGOiuIRWLnhRlURw0t+/JCA4wXCQ7BxvtdESemb9XqdzalCdAkzlncNiRACCutniA
 ef+pSIpO6nFNXKVn4fRe2SujswuzOfg7+v3mlvDU/Sb1P2oy8WUj6UWLDCYw5KaiEotw5wyrJN0
 JUBR+k+b3sFauZYZKZsZNicZZTSLDHGd/F/1iqNcNoz5T2Bf+ZhaxMszMpJiTg==
X-Received: by 2002:a17:903:1b48:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-23f981404c6mr59177205ad.3.1753307203821; 
 Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEifem4DTzHzvzmHJWifbcs4RdVeOJnOTJq0luVnu1W3g+TYFyHU5if7/jQbz053j1WkSaKAw==
X-Received: by 2002:a17:903:1b48:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-23f981404c6mr59176895ad.3.1753307203346; 
 Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa48dc18fsm198195ad.133.2025.07.23.14.46.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 14:46:43 -0700 (PDT)
Message-ID: <820f45f1-9494-48eb-b536-7a8124de06f0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:16:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
 <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
 <CACSVV01EhWWohUDQ8n=FQeDuaDcgmYnMBJDMJ8D1Gist1NR4QQ@mail.gmail.com>
 <800f8c9d-5586-46a7-aa83-dfb3b97633e0@oss.qualcomm.com>
 <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV00d4rbNDOLVZJTBNRmUsGyY6Tkwzv0cHRomeYyMXWHZVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: obZrVkyihAvaEgbHLLtfLjLrMmhxvmGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NiBTYWx0ZWRfX0L28TAUJkP4m
 QGVuiuyO09YcnSj1kat5sF2ZdM8gtwKRgR09Wpd57ffRAFS/gtj4QVTcF/OscIXQ0eWVG1qwlM7
 ZTzvoCmTVExRkKE/fjyZ16qCwMeB4qr8eIYKdmdfKgTyIEX1mrZWGTd1/roXrc0lxrboCdy+L1K
 OlL4W0ZUHecWMbmTMda1ES04vmJR5yB9RxIhheFb9XTC0/7nnNvUIlVfEbQ2HV+/qIWzHv7mZ6s
 aMDs1LIyS9aMo8KVc2m79Qxvb01eHvbGXIVR1YZyq2cTSNrsASIBWU0aVx2OWabUkljoODoL3cq
 +Rg5cY9zqNKOsLymcoDo7UMCT6js/m3BXYCJD6K4XWTOQNdlyGOcgE8yvc+4IPOqpV3h+5gvmek
 pF3HvrFC2bGAvq73rEl5fO5Ta9hDyAbq3PXqMTfZJoiNYAMAqNgK2rYvbRdj4MWxDtfROZNE
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68815845 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=XTD9XnCZvQp0TTkZ5uwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: obZrVkyihAvaEgbHLLtfLjLrMmhxvmGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230186
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

On 7/23/2025 1:43 AM, Rob Clark wrote:
> On Tue, Jul 22, 2025 at 12:23 PM Akhil P Oommen
> <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 7/22/2025 9:08 PM, Rob Clark wrote:
>>> On Tue, Jul 22, 2025 at 6:50 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
>>>>> When IFPC is supported, devfreq idling is redundant and adds
>>>>> unnecessary pm suspend/wake latency. So skip it when IFPC is
>>>>> supported.
>>>>
>>>> With this in place we have a dummy devfreq instance which does nothing.
>>>> Wouldn't it be better to skip registering devfreq if IFPC is supported
>>>> on the platform?
>>>
>>> devfreq is still scaling the freq.  What is being bypassed is
>>> essentially a CPU based version of IFPC (because on sc7180 we didn't
>>> have IFPC
>>>
>>> Currently only a618 and 7c3 enable gpu_clamp_to_idle.. if at some
>>> point those grew IFPC support we could remove the trickery to drop GPU
>>> to min freq when it is idle altogether.
>>
>> There are 2 functionalities here:
>> 1. Clamp-to-idle: enabled only on a618/7c3
>> 2. boost-after-idle: Enabled for all GPUs.
>>
>> With this patch, we are skipping both when IFPC is supported. In the
>> absence of latency due to clamp-to-idle, do you think a618 (relatively
>> weaker GPU) would require boost-after-idle to keep with the
>> UI/composition workload for its typical configuration (1080p@60hz)? If
>> yes, I should probably create a quirk to disable boost-after-idle for
>> premium tier GPUs, instead of tying it to IFPC feature.
> 
> Hmm, yeah.. I suppose _this_ patch should only skip clamp-to-idle.  It
> is a different topic, boost-after-idle.

I think we can just drop this patch. Also, Boost-after-idle is not super
bad as it is only doubling the gpu freq. We can try to optimize it
separately.

-Akhil.

> 
> BR,
> -R
> 
>> -Akhil.
>>
>>>
>>> BR,
>>> -R
>>>
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>>>>> @@ -4,6 +4,7 @@
>>>>>   * Author: Rob Clark <robdclark@gmail.com>
>>>>>   */
>>>>>
>>>>> +#include "adreno/adreno_gpu.h"
>>>>>  #include "msm_gpu.h"
>>>>>  #include "msm_gpu_trace.h"
>>>>>
>>>>> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>>>>>       if (!has_devfreq(gpu))
>>>>>               return;
>>>>>
>>>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>>>> +             return;
>>>>>       /*
>>>>>        * Cancel any pending transition to idle frequency:
>>>>>        */
>>>>> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>>>>>       if (!has_devfreq(gpu))
>>>>>               return;
>>>>>
>>>>> +     if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>>>>> +             return;
>>>>> +
>>>>>       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>>>>>                              HRTIMER_MODE_REL);
>>>>>  }
>>>>>
>>>>> --
>>>>> 2.50.1
>>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>

