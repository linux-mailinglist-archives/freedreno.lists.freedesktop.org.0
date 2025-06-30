Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4737AEE3FF
	for <lists+freedreno@lfdr.de>; Mon, 30 Jun 2025 18:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC5710E4A3;
	Mon, 30 Jun 2025 16:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti3Gh2d4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DF310E4A0
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 16:15:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFOEFk018560
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 16:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mQQDvBO6LqPQoIi5HwlG43Vm0/0EOI2Xkn06iwnBM48=; b=Ti3Gh2d4RQmncd9/
 egBI0ZyWLS8PHaIpmdWutgtOIc3QymidjFS4CkKnNfsXy4hPkk7D5s786Rifjs2t
 Hoz5WJYmmnx8soCWqG5GcV9dEDbnVldPM/VKi6vjwEOw2Mv3cV1wyQZrheJDrc9y
 Cc5FTZ68uFHG50z/PMBl0dfV7O1MXrkwGj9supMJX5TG8ZMjVsFSSSl5jULK0Niw
 hlSvwsuaJzQOR4hsOaAyJztlWq/Yy2WJoZCNEMvnTIbl9qDH499SPjk4czakNZxZ
 Qhw0scVLkyGwfKcA0V/sN73aBVXcNwkqemsT238Z4k2enr53zIU91Y5k3x+x8s6J
 Nz++nw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxde2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 16:15:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2356ce55d33so63306405ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 09:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751300132; x=1751904932;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mQQDvBO6LqPQoIi5HwlG43Vm0/0EOI2Xkn06iwnBM48=;
 b=UjDfOTbz5JaAoh9JBJSGUOgggVlp2E1B70VnZTeggP9l311ohHPcjMJbAIbAFZcB/V
 yTDR89on73DvbrRlnqPrSX4rUKd8OL+NwnUTdyjmI7M2LXt4rS/UU4vJXZmGOAe0oJcT
 9zJC7UxrEWhhhyT8gG/6PBCS2rGfdwIVUG5illuVjvJPQlJDpNZ+NYIOMnaO8xk5DeRc
 P8pJHWlLD+oUeNU8OSDqzM8aO6wH/+yKJJz+wgEXogjxdiQt44vmgBkZbK2PobORspY5
 eO4as5+LwUcdlsTbYb/Fyr0rCTXC85VLsuTfyGz0DWx4f3b4oYgH5aHqlLlk+Uoh+mXH
 WGOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0Cizd+PqJ2PnXFn4mMxU2TveKhqGPpL5sovK1+CZiHnqkLTy+FpP3s9vse+9cgP263jBS2rwSBp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDFIrUL6vmeeuJ+3meWmImVPtqnK7qak05NffwPzV8F4NyY1Kt
 IsvCqThg7MiVABp+YD2ievmoFObU2zQiGh4ei2WKv3vvDwwimeiqoXfVwhyYZZdQFq7hAJDT1QO
 JvmUQoteK8rTltqvxavp2o4XhfplorwG6hI+HmSlzlgfeyKfiZ35vm2ESsTRW8Q7ysrDKC3Q=
X-Gm-Gg: ASbGncuhRh+ndhRisFO58uKEjra30FC5khMD1CYZzCye9ymb47pMGP6neJWU3P4mfKZ
 LWe5z5bjpAR+ngcLvazpbYkCpqLuMWK2keES4fB1Qft2Nm4Z6vKhXr8701vH5aHdbGCrR91XW+H
 smabmYfWTaNAYFNEvjy740zSjBrckIkaY2FcqozFkuN9dT7RvBI1VTxY1V9knIQUKYnWGhXzLTi
 P5Q/Cj8qo4KpC4t8w/f6RFaQUnij7aPXZ9vc+uQoF3MoHaiiBBWqh6YGMztxpvaHv+Rke/fWu5V
 RgmKD2hPQm9Lh+W50erWVz0xTV6Vp5Y8BLofUszgs+Y=
X-Received: by 2002:a17:903:98f:b0:234:ba37:87b6 with SMTP id
 d9443c01a7336-23ac40dee6emr209862215ad.17.1751300131852; 
 Mon, 30 Jun 2025 09:15:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIs3i+DGQtrPZJHgDp38If8o1rdqI9yiRt+U4S1ECjmkidu5/g+aW0XIiSH1eCUSC/7H2oZw==
X-Received: by 2002:a17:903:98f:b0:234:ba37:87b6 with SMTP id
 d9443c01a7336-23ac40dee6emr209861455ad.17.1751300131259; 
 Mon, 30 Jun 2025 09:15:31 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.233.253])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f54417f7sm14678037a91.45.2025.06.30.09.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 09:15:30 -0700 (PDT)
Message-ID: <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 21:45:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
 Doug Anderson <dianders@chromium.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEzNCBTYWx0ZWRfX1Z0S/wt3IiPf
 16lO0tb+21Qfm1G4wEwyaKQvdgodvvRSu5SN7zkvSn+7z6xS6eAvaMUjCU6E6J1rDRoyoVHnf/Y
 lkk4jj7DW3NZhuYKcv8W+2v7zm8EmdVsrk6w6KDPj7ztn+bHDzJ7jlTtxmgAr5+lrKdi2iSY5mO
 /hNm8+iIqzw5u+/5pihjXuKqvo+RULtjf+OJ0qQO5YSyv4u267n4rsuVHWcxKffSgdUP/wXJqS/
 RpdWIHePQP15cGgUknRJTeHmutalATO7JnKM4b/EYmnbMKd3ssCK2DZvMW2uxUgVKAeU488IYWx
 wvZ01SZlkVBhW492EJPwqAyKc0tfrUw2q/Qqy6oVvTZj1hnqHvWH+Bnfqx5wNL6HANxvq9QQasj
 2qycGYm0bylEM+gfiwdmi62TGNuaX0jOE/Ia3qJrxzM4JpFVgaODHCfpqg8b5Mep3KMUWpOT
X-Proofpoint-GUID: W5Osz26_qembxhdeqnwMfdNZkhqe3kNW
X-Proofpoint-ORIG-GUID: W5Osz26_qembxhdeqnwMfdNZkhqe3kNW
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6862b825 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=rtNiIixKYgeDUDJv+u67mw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dp0Al3FcNReu_-gFsVQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=765 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300134
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

On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
> 
> 
> On 30-Jun-25 15:46, Rob Clark wrote:
>> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 29-Jun-25 15:58, Rob Clark wrote:
>>>> These runners are no more.  So remove the jobs.
>>>>
>>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>>> ---
>>>
>>> Do we have anyone using cheza at all anymore then?
>>
>> Probably not
> 
> Adding +Doug +Akhil +Jessica, if we don't have any users, we may
> get rid of it upstream, as it never made it to the outside-outside
> world..
> 
> Konrad

I am not aware of anyone using Cheza boards within Qcom. So it is fine
with me if you plan to remove the DT bits.

-Akhil

