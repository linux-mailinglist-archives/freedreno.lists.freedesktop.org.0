Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B29B0AA25
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 20:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB6910E1A0;
	Fri, 18 Jul 2025 18:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWjJPj1x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8057C10E028
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 18:30:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IIIo5l008417
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 18:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r4h89Vyse17RRrUr1f05/FGG03KvAET2RVT1D25eAKE=; b=oWjJPj1xH/VrdjzL
 tWfus+B2UXGhpidyUuyT0Qii23tUed3HUFf8cgQ5yfbNEUdr3Sk55TnXlVal48y2
 XYamV9MJUv+hY9L9IyQ9PQHBELHlwhx6Pw8dsdo3CONzbheGMeam9QSeRMTp7+Yi
 toAz0LEq9CsalNqGR/C+LajHghty4fnskS2xaaKUS6eTmSHWMuCvxOQzB7SJx8pt
 1i+S3VmTR8WHN4cEjVzESrR8HwZHEjkNkEa+Gha//sq/xgtDBg6pUfWreRW/h96O
 ftGFjxkkjW47Xqy7fnSb2+H5dgewxSuJezlxSCmZMkT8nuiiHYXMwBmBNC2eDu1I
 tS+DLw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcadr9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 18:30:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-88123a6a5f9so2986013241.1
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 11:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752863457; x=1753468257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r4h89Vyse17RRrUr1f05/FGG03KvAET2RVT1D25eAKE=;
 b=GvmAiGljhVW93UAHd/9e4Rg31hIAI9HJM+1bvnSbEwlGIY0BDK80ePf9YRyXJOL/u1
 OswNHywrnZej9286g8eJMELRgCi0C3NiL/MmYSYhdsqB/DVjIXY33MSrbc5MtASXIqnS
 vxz/Mb/E8pf4oZzniVdQxP9Pkbc5iQlwG4xf2vkOWNJn0/P87oM8LqaGQaLbRQ5oGack
 IuuohkQTmOmIIqReCQv46+TlnOaepZU1RK0WqB7uAwUu24eep1omoAFCQZD7bZGGqiR5
 Tql4xgUKfevxHC4ZFggFnptVnb47UpW5tpOVa1G0vrukyztNph+Va0ZPDp0HBlUpp1tf
 Sxkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRPksvcTEhDI20bhO/xpWc9M1MGXtPXDSuSNaLShKVie3xalpEGWCmnksnv0g4a3PGNjKaot92mIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh81x9dRnVkBQUktZHSGJnIJWkyjDoKc0YkYL4pkJGCbzNWktT
 UNvXDiU+QE8q5zDM1OgRZW8kyIl8Fp5Qlx9MEawlgJvAjbuB2TtXo/MzyqiDY+qGIqqzSpt/4m/
 eN4JOaqn7iqtMiRxMYZhhuKtQa1cCxz52uewEx+4Wat7ITfLd5c58QjnC0gOELVQI2L25l/k=
X-Gm-Gg: ASbGncvpjCr7krk+59dtl2d/bXfvXYhrf73kMx8qs4ga2aTq14AVdh37JlJlas2R5cX
 pT5Y0eEiKO+Lfudk0bM29eCwndbrOV5eUGDXN05fxlQK37/dhdDi7OmSRz1eq+XX6QwgLLgZWtH
 4XaQs4Bom6QYar82vyD6pq7Sen+rVrYvvk2znN1pgXS5kjKR82NkiWe0gpxM5O5YgKAYNzt3saP
 gmnKcxJfuXvFJ6rgreoQYJCHx53IxF5HAhrPNhcT0LVvDsTpL+1B1+LUoy+Tlk13c33CIkVWAfQ
 UcIMIeJ7gw6IKsUhuQpOM2DSMCPF9bCGisLJVdfBkT1h4aelCoT1G9mdgnabUgcQ5UcEBWo3eqa
 zwjK4NqtGhuRWAe9F26FjwUzLElLtAjn5CkOa2Yo8YoY=
X-Received: by 2002:a05:6102:3f90:b0:4e6:f7e9:c481 with SMTP id
 ada2fe7eead31-4f955aafcc1mr7300334137.7.1752863456626; 
 Fri, 18 Jul 2025 11:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWyWfF3+tSP9AxR7UCyIPlKJus3GeSYS6RzS+bb0n22cuscjLeVO6oqysB5eD95XIzb3VFmA==
X-Received: by 2002:a05:6102:3f90:b0:4e6:f7e9:c481 with SMTP id
 ada2fe7eead31-4f955aafcc1mr7300253137.7.1752863455983; 
 Fri, 18 Jul 2025 11:30:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f?
 (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b7c0sm357341e87.10.2025.07.18.11.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 11:30:55 -0700 (PDT)
Message-ID: <0bb0c437-e680-4160-b98f-efb816c9f049@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 21:30:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Xilin Wu <sophon@radxa.com>, Dale Whinham <daleyo@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
 <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
 <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
 <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
 <CA+kEDGGVimBZDq1sa0gOXB7Vi6U8AVgD2E8mG_iTUJDce=56PA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CA+kEDGGVimBZDq1sa0gOXB7Vi6U8AVgD2E8mG_iTUJDce=56PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE0NyBTYWx0ZWRfXz5pi7D8Ua2Zi
 YRLtY0TFB1LlZfeKZWrPglizVzIeiemyNVBvNzwndzi+n3oNukdhUI7or1IGtzdkGsKGbimednK
 0yIR5jNdp2G7jyCJSevpKEJ8YVubDDml9E6CYAfOzr7tAiw/NSXjod6W1IFymLEuGP7tOJRBD52
 tIWH4c9UrUijDAXzshOtNL5qfqOTvyk0wN4zbmCjKCdU4Gup7TONmlya52KUt6XJK0e0uno2HzF
 F7vZ2AtoIiU6WoFIGMgMBLtoUHJ4dZLArDgv9jN9eRc9DxEsvypsXDdHgALxqvRbcS7hDW1FAe8
 ObEaWUwUBTkepbmvYwG9ravO+YPwVqZ3NJPq3rJaxPnWejjhlCb7Ypoe0B1N0qh+gZHyuio9rYB
 bsJ8+QxFJjxslt8kYyM2thRgSbuXp3kAdspt+b8WdY2rLyux6JqeXfa3cMv6YsA/5YA/wz73
X-Proofpoint-GUID: MBJlSr9d0bVn2NUptZkT1Yws9WA3MPPR
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a92e2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8
 a=pGLkceISAAAA:8 a=t_Of-uX1f6KDt8Xra0EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: MBJlSr9d0bVn2NUptZkT1Yws9WA3MPPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180147
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

On 18/07/2025 21:26, Jérôme de Bretagne wrote:
> On Friday, Jul 18, 2025, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Thu, Jul 17, 2025 at 11:36:38PM +0200, Jérôme de Bretagne wrote:
>>> Le jeu. 17 juil. 2025 à 23:10, Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> a écrit :
>>>>
>>>> On 7/17/25 10:27 PM, Jérôme de Bretagne wrote:
>>>>> On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
>>>>>>
>>>>>> On 2025/7/15 01:35:42, Dale Whinham wrote:
>>>>>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>>>>
>>>>>>> The OLED display in the Surface Pro 11 reports a maximum link rate of
>>>>>>> zero in its DPCD, causing it to fail to probe correctly.
>>>>>>>
>>>>>>> The Surface Pro 11's DSDT table contains some XML with an
>>>>>>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
>>>>>>> (8.1Gbps/HBR3).
>>>>>>>
>>>>>>> Add a quirk to conditionally override the max link rate if its value
>>>>>>> is zero specifically for this model.
>>>>>>>
>>>>>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>>>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>>>>>>>    1 file changed, 13 insertions(+)
>>>>>>>
>>
>> [...]
>>
>>>
>>>>>
>>>>> Is it a feature planned in the short-medium term within the MSM driver?
>>>>> If not, would a quirk like [4] be acceptable upstream in the meanwhile?
>>>>
>>>> I'm not a display guy, but this looks like yet another block of code
>>>> begging to be commonized across DP drivers,
>>>
>>> I agree 100% in principle, but the 3 implementations are different today.
>>>
>>>> so I wouldn't expect it to be a big blocker.
>>>
>>> Well, it is for me :)
>>>
>>>> Adding a panel quirk doesn't seem in order, as the panel is /probably/
>>>> very much in spec, and it's the driver bit that's missing.
>>>
>>> I agree that a quirk shouldn't be needed. I guess we'll work on
>>> upstreaming everything else and keep an out-of-tree patch for this
>>> issue for the moment That's a bit sad as this will block regular
>>> users from easily installing / testing via the Ubuntu Concept ISO
>>> for instance.
>>>
>>> Or could the quirk be accepted temporarily with good comments
>>> then reverted when the driver adds the missing support? I guess
>>> it would depend on the time scale of this support landing.
>>
>> Unforutunately, there is more than that. We should also be writing the
>> LINK_RATE_SET register. So, just setting the max_bw is not enough.
> 
> Maybe I've misunderstood. When you say max_bw is not enough,
> are you talking about some future driver changes or about a potential
> shorter-term fix?
> 
> I can confirm that this initial simple patch (and also the updated one
> reusing the quirk list [4]) is enough to get the SP11 OLED display
> working whereas it doesn't probe and remains off without such a fix.

These parts were changed in eDP 1.4 and then 1.5, but basically, if 
MAX_LINK_RATE is 0, the driver should also write LINK_RATE_SET register. 
See how it's handled by the intel or AMD drivers.

> 
> Thanks,
> Jérôme
> 
> [4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
