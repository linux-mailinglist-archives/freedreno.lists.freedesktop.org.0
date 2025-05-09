Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BDAAB1834
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 17:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C28210EA4A;
	Fri,  9 May 2025 15:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGFysvlf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82C510EA54
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 15:18:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDqxN010675
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 15:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 utDfRm9yEnEcuSD5wRoweKl442QKaEa5GIg5IOHfbG4=; b=AGFysvlfYlojTWJr
 fuPItSLQ7FohYoLGYuEZncqk5x81gXE0Tzxp4y9lR9GM3tEXuQGJIHGgC6h8taEm
 bU0IdJiS6F4O3VZe7p8njwElnL+D1+Y3uoimv11jNF6gUnZgi7I96DVpmOsOH0yo
 8s/Qfr4PqZ9vXcR+odwcZMJP5AcNXBglX2UU0I+v0VM1qccG73vfXuEggd7bxqhb
 WJGq252vq0daz2yxxHj0x1lw0koqHHGuOm3YAxk+UT7DN+MKpWPGhMg4mz0x/k5D
 k+6vp+3g3v2KyKPq10tMEVnxwThGeeaRLaRlEg3QWU5Lh3v62dJB49KlZw7atjCG
 ttNxhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmn3e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 15:18:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7cabd21579eso40305185a.3
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 08:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746803923; x=1747408723;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=utDfRm9yEnEcuSD5wRoweKl442QKaEa5GIg5IOHfbG4=;
 b=g6hxSmdyrVNQKxFV2REP5z8X6k3Kq5TRMcetrjkFIrPkwGmo4cCZk0GcfdimdEufyd
 PUzAdHvUBOR6icNxLeqdhHjEy7YI47EHwOsUBjzKsMO5EbEjagZTD88WreOGo0xNfmAS
 jj72cMIVj7MD16nIj+etgFLlc1O9RiqEbiFL2uA34jjgUk8l3QBxDsMp+KW+o8vadoMZ
 M6GkEmV61MzkpGg2hxcbtRgLi7PvZhlwhuN4yPljh3is1SWzB6TEt0oMeN4YBrX99/G8
 mdPpogoSry5NvSeidtXJz5oLW2GU7Y3LI4u2B4pBk8hX/K3nmPfSvCLVd2mKijuSBUrO
 NR8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP1z51VCYc37Y25Ckrt0o/gyZ5muP5QexARyP4Qz2ZrltO2Qfi9GEox7k/WJ4T66F3Qt5sAfpao5g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYnvXPlLwZRIq7tIAPWi/jF3YTKQuXZwpJHI5MtUqcKLw0fhrW
 zlW48e7+m0EEVki4crO5TBa+EeiolVKsdfR6+VquptVpO2lkkvzFeRAFFVHz8AuMb5AckKLjdap
 ynyBlrLWL8aYuB7h7SwTsQqGhH0a0E7ajDTPDZVK/axeSUAODKwPav6d+9lH7N1oaUAg=
X-Gm-Gg: ASbGncsB8UOAq7E/a8ODIxF71zMNT3ahsW3+4QxqhyqQNGY0ds0+7Yh4rA9lpEUfZUe
 N/6o3ucFhvekXaLeJmakPvQol6SWuJI13YaDbSDd9cfeRm3MoT5R47YwbD+uGnWVjMqyb/2xpNL
 dLTZYa60vigJI8kdgpnHuBCLm94timyz+JVOS/4vswEj+DRqEsl1NZo/HfbOoKQFt2mmF7BuOJE
 +0bSzCIfSXXcJO6dflzBYcljBSFNowtfdlmU3Nes9hzQKR27mTKrqMyKTV9/WPVlxKLCUFlstzp
 AGYArtmlhX6tarQzvi/oc2z/vTZ3ZJ6aIRkmHv0pb9dmJtXi27f8LrlnAz2CIBjrbePHX25R95x
 inIiEYMmspbijx2+fdJI4B+UOktHGeKkPgpUDKj3u4/7MLZCHMAVNbn6APA5Hdbh3
X-Received: by 2002:a05:620a:4727:b0:7c9:2383:afef with SMTP id
 af79cd13be357-7cd0115034cmr674763885a.37.1746803922677; 
 Fri, 09 May 2025 08:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPsqI2DXHYl8igD/hABxSIitYc1LfAKRC3bEPVNydkg0fxuqduKG1kw9aY/mt1U3TUllVG3g==
X-Received: by 2002:a05:620a:4727:b0:7c9:2383:afef with SMTP id
 af79cd13be357-7cd0115034cmr674759385a.37.1746803922301; 
 Fri, 09 May 2025 08:18:42 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a6:738a:e519:cad2:e720:53eb?
 (2001-14bb-a6-738a-e519-cad2-e720-53eb.rev.dnainternet.fi.
 [2001:14bb:a6:738a:e519:cad2:e720:53eb])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cee9sm305198e87.75.2025.05.09.08.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 08:18:41 -0700 (PDT)
Message-ID: <6cfc706f-4909-4121-9849-a37e4769ab2f@oss.qualcomm.com>
Date: Fri, 9 May 2025 18:18:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before
 checking plane
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
 <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
 <CABymUCMuiKQwtuYW-HX4bwyTR4awm4scwXTWNzVCEmyQsQ29aA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCMuiKQwtuYW-HX4bwyTR4awm4scwXTWNzVCEmyQsQ29aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681e1cd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=sWdYkf8P3oHYA_MdvdkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: C1ODK1bX1jnXiSd1t9xgcjF-vWaAMKG7
X-Proofpoint-GUID: C1ODK1bX1jnXiSd1t9xgcjF-vWaAMKG7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1MSBTYWx0ZWRfX47WDOT0xlWHp
 VR5N8ms8Uo7DxHbDI0J/ibarpdj7T2gr4dXLwRtOAAhzZU1hCVODaK3uS0ChwHReXrnnj5Nwmbu
 eCH+yZsscoOUyjSkfabCh4OS5L8YZrbRa5RzeExjA2zBUOUt/LOpqngGM2vVlHPwyCKh2vbeFQk
 tq5owR9LRCpS+xUjG20wE4dgkiqRBtoDXosdXXMbUOWjm4CqmGDmbgyTyoIuuha3gu79xiMDXsU
 lPX9TBcwTGQPcTzGzvUDvCdhCm9lvyzysZgolSj6CKgo0bdNlaK8gwisqjaVzDgKzNiusuPYHBx
 aCtj1lLEYFBYPDG11PNv6QzCeNISID8uoLL6e9E3O+0sE1GVwSVn1nWpxNNLN6/d5TC4piRqIH7
 +KQJFqe7usYdxhSfdWrBFdU0gvoLXq6v6PIq4pMj1hzyLPrOCGbvprelI2MvdJ4q+huDKAGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090151
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

On 09/05/2025 06:08, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年5月8日周四 18:47写道：
>>
>> On Tue, May 06, 2025 at 11:47:31PM +0800, Jun Nie wrote:
>>> Some display controller support flexible CRTC and DMA, such as the display
>>> controllers in snapdragon SoCs. CRTC can be implemented with several mixers
>>> in parallel, and plane fetching can be implemented with several DMA under
>>> umberala of a virtual drm plane.
>>>
>>> The mixer number is decided per panel resolution and clock rate constrain
>>> first, which happens in CRTC side. Then plane is split per mixer number
>>> and configure DMA accordingly.
>>
>> Here you are describing a behaviour of one particular driver as a reason
>> to change the framework.
> 
> Yeah, the specific driver requires a change in framework. Maybe the
> comment is not
> proper?

Yes. Explain how does that benefit the framework / other drivers. 
Otherwise the answer would be as simple as 'replace 
drm_atomic_helper_check_planes() in your driver'.

>>
>>>
>>> To support such forthcoming usage case, CRTC checking shall happen before
>>> checking plane. Add the checking in the drm_atomic_helper_check_modeset().
>>
>> So, now drivers will get two calls to atomic_check(), one coming in
>> circumstances which were not expected by the drivers before. Are you
>> sure that this won't break anything?
> 
> Yes, it is a concern. Is there any way to limit the change in
> framework to specific
> driver with a flag, such as DRM_FLAG_CHECK_CRTC_BEFORE_PLANE?

Definitely not with a flag. You can try adding a new helper callback, 
but I don't know how DRM core maintainers would react to it.

>>
>>>
>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>>> ---
>>>   drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>>> index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>>>                        return ret;
>>>        }
>>>
>>> +     for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>>> +             const struct drm_crtc_helper_funcs *funcs;
>>> +
>>> +             funcs = crtc->helper_private;
>>> +
>>> +             if (!funcs || !funcs->atomic_check)
>>> +                     continue;
>>> +
>>> +             ret = funcs->atomic_check(crtc, state);
>>> +             if (ret) {
>>> +                     drm_dbg_atomic(crtc->dev,
>>> +                                    "[CRTC:%d:%s] atomic driver check failed\n",
>>> +                                    crtc->base.id, crtc->name);
>>> +                     return ret;
>>> +             }
>>> +     }
>>> +
>>> +
>>> +
>>
>> Too many empty lines. But the main quesiton is: why are you calling it
>> before mode_valid()? According to your description a better place would
>> be in drm_atomic_helper_check_planes().
>>
> Agree, that's the proper function. Will remove the empty line in next version.
> 
>>>        ret = mode_valid(state);
>>>        if (ret)
>>>                return ret;
>>>
>>> --
>>> 2.34.1
>>>
>>
>> --
>> With best wishes
>> Dmitry
>>


-- 
With best wishes
Dmitry
