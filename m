Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAFA9F0D0A
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 14:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC3F10E26E;
	Fri, 13 Dec 2024 13:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/LLZD3S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A324510E26E
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:11:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD81hdT022255
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6AISjWpbF1IJZMjQ/KiY66//KgqPa1EroTjBzvcG654=; b=X/LLZD3ShUhZfANy
 uqr0/DyvdeaWTRn2gU0XYtUAQ4avmLLvp8Qf95TeyPG6oOdb0HhWcjCCOEhZvkbk
 3vJdTvi1GlyYl9eydChyZcF4GT7VGP4yVplxOQ9iL/NlIcCA8CYsLjOeGIGB2dKf
 Moo8EwrLFXWeActZAB2z5Ch3WYn0zhfRjkHe3C9sk8qucngmxy6mwHtHSfzCUH/8
 WzhywjpfIQShQwLLIUJJiynTCIIq3M07lIdCnScLAd7Usadt5dzeD3nXxz9bTy9w
 ieS4A06n05+wfpU/+7nRw+K/SFDSar6CO3zrR6RBgFsaCRmN35hMdmHCFsDhPzBI
 eullOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh270w1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:11:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b6f134dac1so22133585a.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 05:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734095496; x=1734700296;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6AISjWpbF1IJZMjQ/KiY66//KgqPa1EroTjBzvcG654=;
 b=MOaIbsq5veB4opym3EIS4MCb2sHhXm2s21Q2OuX2P9ZuNeCKOROjWXvrA5325DC/Mt
 vJK4lRmXRYI8By4whe363Oyp0q3v59AIp1ujXipWHGOqFD9MQQCmCblelPfFRq3NeDp+
 0oJ64yC2d/5tICS9g5V/9SSf47hLNCQUKGX7d5Eq+dO22AFKB0EuNbHVqB0kn0P3hfS2
 POBZJnZDI29z2L3j+gH4RXLot6+rwAIPl+U1rL98NgE+qgfqlwmjl14a2Pl+REqFET38
 pnNIn4olAI9B/ZJGWponUYps8WInPjX56ut+qhDvyT7OcIoaVrvPof1NGb7n8OamjUfT
 GQsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuYIxMh5spjghPPLhVXHL/eYWi+mzMsnYtB5K0C5zHwdxHIrSIT8Tpjb/slEF6qs36ofyTOVljQNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw83amX+ot5bICGrf0dp8YNe1QEJ8Y8mmu5znmxqaPvx8UE39t9
 VC4GGD88KwZTEjloGx1kKSxlOhW+1RLlEqTaN6G8gUGfvJWYEFd+1md/3s+chh0hT37rygMklnZ
 laULgY0kFKlx+pWLI4rXaQCBCP7fV9RI7LQq1NEgryJ3fARnT/eyvNHOt+oAcj+4NMAM=
X-Gm-Gg: ASbGncsufzBfXFo0gXcOGmQrbMUPIV4GSmRzwY0qaXM2wWYZH7Hd6pWc6Wu4kNm79iN
 /yqTqZQMyJ2U5FoBoSKRy1BnRcbmSdkaFk7Ihr/rzYt6wRqj30OY+0RKzPTgOGoNHbxzWplxPio
 jKj6x6jxUzp1nMSCEsGoExui7YZlvUn3GlK3hkT0pjeZf7p2Pp1MNtVTEp75DpksOiIlTQAR15o
 +3d4ABnHKFjd4gZE7NalNyVbwdYO1H82ZQ5aWFe6nxTe0+EezCSZ/PZvJHEwnnv5Z7zQcpGDSnA
 LDgIgdrfE6iCzLgqB4UebY00U4mnj8NhXcim
X-Received: by 2002:a05:620a:4012:b0:7af:cac7:5017 with SMTP id
 af79cd13be357-7b6fbed8ab9mr131128485a.4.1734095496606; 
 Fri, 13 Dec 2024 05:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVDJkdMa3HF7ND+pxXorwnRiVDzeerTXyFuekhXDUGU+RDYHlW86M95mXzGzm2rMstd7+ocw==
X-Received: by 2002:a05:620a:4012:b0:7af:cac7:5017 with SMTP id
 af79cd13be357-7b6fbed8ab9mr131125785a.4.1734095496153; 
 Fri, 13 Dec 2024 05:11:36 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa659f14faesm924841266b.101.2024.12.13.05.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 05:11:35 -0800 (PST)
Message-ID: <b792f88b-71c3-4430-b194-0a627de2f05c@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 14:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
 <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
 <CAF6AEGuwjpizRy+S-xCmGdZV9MX+CDACwQp-NNKc2eBroCt1CQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGuwjpizRy+S-xCmGdZV9MX+CDACwQp-NNKc2eBroCt1CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2ACp1k8ZOi1diDRL6k4FjBnKlEaO0yow
X-Proofpoint-GUID: 2ACp1k8ZOi1diDRL6k4FjBnKlEaO0yow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=566 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130093
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

On 23.11.2024 3:41 AM, Rob Clark wrote:
> On Fri, Nov 22, 2024 at 4:19 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 22.11.2024 4:51 PM, Rob Clark wrote:
>>> On Fri, Nov 22, 2024 at 4:21 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 21.11.2024 5:48 PM, Rob Clark wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
>>>>> helper macro to make it easier to add debug logging which can be enabled
>>>>> at runtime via drm.debug.
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +/* Helper for returning a UABI error with optional logging which can make
>>>>> + * it easier for userspace to understand what it is doing wrong.
>>>>> + */
>>>>> +#define UERR(err, drm, fmt, ...) \
>>>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
>>>>> +
>>>>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>>
>>>> I'm generally not a fan of adding driver-specific debug prints..
>>>>
>>>> Maybe that's something that could be pushed to the drm-common layer
>>>> or even deeper down the stack?
>>>
>>> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
>>> just #define UERR() to be a wrapper for it, since line length/wrapping
>>> tends to be a bit of a challenge.  And I have a fairly substantial
>>> patch stack on top of this adding sparse/vm_bind support.  (Debugging
>>> that was actually the motivation for this patch.)
>>
>> Alright, let's not get in the way then
>>
>>> I noticed that xe has something similar, but slightly different shape,
>>> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
>>> length problem into the if() conditional.  (And doesn't provide the
>>> benefit of being able to display the incorrect param.)
>>
>> Maybe rust comes one day and the lines will start growing vertically ;)
> 
> Rust for the userspace facing rendernode side of the driver, in
> particular, would be interesting for me, tbh.  Especially if handle
> related rust<->c layers are designed properly.  I've lost track of how
> many handle lifetime race condition UAF's I've seen ;-)
> 
> Re-writing entire drivers is a big lift, especially when there is so
> much hw+features to enable.  KMS is limited to drm master (generally a
> somewhat privileged process), so less of a concern from a security
> standpoint.  Much of the GPU side of things is "boring" power related
> stuff (suspend/resume/devfreq).  But the rendernode ioctls are open to
> any process that can use the GPU in a typical setup.

The boring part would benefit greatly from automatic scope exit
cleanup.. We've had lots of issues in the past with that (that are
hopefully? sorted out now, or should I say, for now)

Konrad
