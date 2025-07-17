Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C01B0964B
	for <lists+freedreno@lfdr.de>; Thu, 17 Jul 2025 23:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3D110E8A0;
	Thu, 17 Jul 2025 21:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXOrs4di";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E43A10E8AB
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 21:10:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCOkUw015738
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 21:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8ldNEIALVCE8XNEzWAt9SINrTSS3as+SspmXHlLaDBs=; b=TXOrs4dib/Gxqxkx
 KltjMvnvAVbEzK1LeiSKna4NJfoxFwewPxkfsOw1/niszEfEPhuZJxVnBBs2HXvJ
 E49mESdGWjkTiXOcorXnvxk2el9AfNww+WpJMgcWPKQ9ffhT0Bh99V0Egq51yIQo
 q7pqQ3JgJ/vGMZYxw2oAy7M+Jggu5AMCTikdCRrLjwWOIIZTHFkWj/6Pb50I/zbb
 B0r12Tlcds3driRrMN3cF/K5pN0HDZQAqeTiahN/VG4UjR61wlQ3R4AjoXv/G40O
 A01TBqmtkdM+q1OgjeanVYXjdq0fD+4C71vPIAZFfa9xFY+xKoRR8fL74zszkD3l
 F9n9tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyv600-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 21:10:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e344f333beso16560385a.2
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 14:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752786622; x=1753391422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ldNEIALVCE8XNEzWAt9SINrTSS3as+SspmXHlLaDBs=;
 b=b/n3DTT9foNPwY+xEE7/8wh0PG3ciNHLkhQ6NpJsRwuyirWjsUrER8EdPg1rYEmjxe
 rLshoVxk/Sh5K3NLWMUj+GohNn1aspL50ff1A4HZnfoK6U00cp9f529eojEC5KraBN5/
 H1oPEabm2OxN2jz8IJG05vtkJf4rizHUu5kaSlsXEmRsiZ+X5tfM3oHgkChGNu7TyrMm
 wPKqQmdspE4/GFrhtgmrxeKvKUznWKDn23uxSpu3pJC4HyKJTuCA4uEUsgq69YhxH7+F
 iLlV3NhIbOOeAi61islkpiHnwxV8AmUAsUhDaHxLMTMCJWR0+63OcuHUaZaWAjZdlzWv
 0cQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ5q0ycCtiSWLbFDqSVDd/F2OpTuUgjTj5NgHSoquAX+5JvCA4bnvNq9ZbokzXAQw5Z55ScH2rBDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0ZnJge5RRPYrZcSyCq9JPhve4L7uFkOWDjGSPZD2iz5faYNRA
 3GQqzA1Agp0/E7E7RbDz4ufqgn0SLnbPVsJoyNpzt6Hj+cKVnaapsasqOcTeCOyY7vm2022TIk/
 9diVZj6ctT7B98D0xgZsdD6KNc3NozS0/l/HczVXGWkRU6fPLi633f5N0GZgq61cJSGMWMBI=
X-Gm-Gg: ASbGnctxCCo+MKg00UVCJKei4ZhgQa8k46Li6m8nGp8Qn/jPEeY7MnaNUb2u9R+Lwsj
 lWwZXtcoyKMUvQh6jsz5tLgm/DFuacmRBhsyEaV87lXzcrs0yBS3HHgDziEsiiHU8nLB39vFLlW
 4O09zX/UsV9o0RlTeXKGMd7kjWL/hcyDURyWQGbd596v7D/e2d8zobEThse4lT7B4tFvIqf0Q0K
 bHfjbB73aVh65MH0hnENk1rX/lwl99HjhZXyGEuad6UZvVGKU9aGS25qy50guvHifiUK9FPzedJ
 pEQ7ikhfxh8+m7e0WFuNW4ryDAKgmDPcQ++9eTTd2hSlHrdutFaRMFHxLEUH4Jilnt+pdcYZ/Pb
 EWPdK85aK1hjqhLjMHGYY
X-Received: by 2002:a05:620a:84c1:b0:7e3:3029:44c with SMTP id
 af79cd13be357-7e342aebd89mr515761285a.7.1752786622244; 
 Thu, 17 Jul 2025 14:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVTebp2sXm1zQJMaQUIUz460FvBUXOo4sBrkg5PyJ5Ii2pC0RKVIfE3V/DxUtak4hYNe7EDA==
X-Received: by 2002:a05:620a:84c1:b0:7e3:3029:44c with SMTP id
 af79cd13be357-7e342aebd89mr515757185a.7.1752786621660; 
 Thu, 17 Jul 2025 14:10:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e826469asm1413336666b.85.2025.07.17.14.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 14:10:20 -0700 (PDT)
Message-ID: <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 23:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Xilin Wu <sophon@radxa.com>
Cc: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N5LSVjWUKzheEcr1cN5VvZ6AfJ37rrfE
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687966bf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=ksxQWNrZAAAA:8 a=pGLkceISAAAA:8 a=LffbBSGFapktDZBAnWwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NyBTYWx0ZWRfX6rtU9mqRhORp
 dmBknZXgRF1iOaVZHB3iXgIern0PTVJPXw5ArbkGQ2Vw4ZbVzTXOtqr/MbHhWO5d3LC+Vzn/Nlg
 Yt8hECPaTCj8oXA7/nTmSTMfpMp+5OFoCzWVL9VJ5JeF399a8a+5Q4Uliy06+7aF7ut4uevF5xn
 4WHiDxcqpyA4fAJkfoUu++1hSrunxrjrXU/U6W+87AKsWGfh0GSp+ozr3AgK3Yu/t5XUxp0Rppe
 Asv04EJM++6BCbgfWtNohXnxlz681s5fquJRf2Ufd3WONA3607PCPBMKpuJqFNK97JcyQ0XGr/H
 tR+49bMkQHd3N71iqrS8X2z8MP8g88YVZxjl9Edl8dYxNLQqjZMa8POCEmfZG3l+RBWvpSJ8A5u
 Tn9gGSAWOlFhiS9FsCgd4FXwknSm4XvWWlNfYGpGbDWPdgZpdJ/2OXft70DpB/3U+beTj3d2
X-Proofpoint-GUID: N5LSVjWUKzheEcr1cN5VvZ6AfJ37rrfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170187
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

On 7/17/25 10:27 PM, Jérôme de Bretagne wrote:
> On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
>>
>> On 2025/7/15 01:35:42, Dale Whinham wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> The OLED display in the Surface Pro 11 reports a maximum link rate of
>>> zero in its DPCD, causing it to fail to probe correctly.
>>>
>>> The Surface Pro 11's DSDT table contains some XML with an
>>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
>>> (8.1Gbps/HBR3).
>>>
>>> Add a quirk to conditionally override the max link rate if its value
>>> is zero specifically for this model.
>>>
>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> index 4e8ab75c771b..b2e65b987c05 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> @@ -11,6 +11,8 @@
>>>   #include <drm/drm_of.h>
>>>   #include <drm/drm_print.h>
>>>
>>> +#include <linux/dmi.h>
>>> +
>>>   #define DP_MAX_NUM_DP_LANES 4
>>>   #define DP_LINK_RATE_HBR2   540000 /* kbytes */
>>>
>>> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>>>       if (rc)
>>>               return rc;
>>>
>>> +     /*
>>> +      * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro 11
>>> +      * reports a max link rate of 0 in the DPCD. Fix it to match the
>>> +      * EDPOverrideDPCDCaps string found in the ACPI DSDT
>>> +      */
>>> +     if (dpcd[DP_MAX_LINK_RATE] == 0 &&
>>> +         dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
>>> +         dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edition")) {
>>> +             dpcd[1] = DP_LINK_BW_8_1;
>>> +     }
>>> +
>>
>> My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max link
>> rate of 0. But I think eDP v1.4 panels need a different way to retrieve
>> supported links rates, which could be found in the amdgpu [1], i915 [2]
>> and nouveau [3] drivers.
> 
> Thanks Xilin for the sharing and pointers into 3 other drivers, that
> would explain the current limitation for Adreno GPUs. Fixing it would
> require a big contribution independent of the actual SP11 enablement.

FWIW Adreno is a wholly separate (from DPU - the display engine) block

> 
> Is it a feature planned in the short-medium term within the MSM driver?
> If not, would a quirk like [4] be acceptable upstream in the meanwhile?

I'm not a display guy, but this looks like yet another block of code
begging to be commonized across DP drivers, so I wouldn't expect it to
be a big blocker.

Adding a panel quirk doesn't seem in order, as the panel is /probably/
very much in spec, and it's the driver bit that's missing.

Konrad

> 
> [4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb
> 
> Thanks a lot,
> Jérôme
> 
> 
> 
>> [1]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
>> [2]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/i915/display/intel_dp.c#n4281
>> [3]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/nouveau/nouveau_dp.c#n101
>>
>>
>>>       msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
>>>       link_info = &msm_dp_panel->link_info;
>>>       link_info->revision = dpcd[DP_DPCD_REV];
>>
>>
>> --
>> Best regards,
>> Xilin Wu <sophon@radxa.com>
> 
