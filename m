Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9C4A620E3
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 23:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B816A10E15E;
	Fri, 14 Mar 2025 22:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LoGmW0GJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664E010E15E
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 22:54:00 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e673822f76so4370153a12.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741992839; x=1742597639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E8w5cCP7NSc4Gojufzvlj9E3bGhdF/gFJWrGAzC0j9g=;
 b=LoGmW0GJHsWw5laAhROCL9dm+fY0AzibMvasKgMSZguEz+7RteYuLnP076hA0UzfJr
 PAE5sqxnu8ky696dG7pdF8Avs3xYPg6MpUrlIX8u8FObPkEWSX6+k3a9T+RUEnPb4/jT
 tEsICL527ghE2Ydv5U5NPsBYwM9IwMP+zAKiG2yCEVppZJJ7Qv7PG0pnEV2lt9jZtait
 gFYba278CgBWmE+fyJWYTCZUqZxsre96gaKcsP8OFJb1evecU/sUlJjBzSOM8n87h71v
 XA3PWCzWdkLJZ5sYxzXS8cYvnBESVmcA/cDGX6WtHWu82DCjQJlJkbzu+MZ1zxpxHTPx
 vogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741992839; x=1742597639;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E8w5cCP7NSc4Gojufzvlj9E3bGhdF/gFJWrGAzC0j9g=;
 b=RbxmBEjYopfgM06o8yUbY7UhHFoQ++P6gxun87goqrYOMwyEJQfHT1lZdQ/8nIndes
 UZF8t1dhPmZgps2/xJJPWTFm9TLsKAv1Mp6lnm+iSZqx5yldr/7BQBrt0/+3FHSBzJCh
 9/p0oBV0Y9YBXRCD8rcGyrkqvHd9BltNkuW/K9XIZxEuvoivtu4mRgeilbHBHC2Kl/Tq
 dO1uUtb+0TvONioJG2fFAFX3d73v6uJRzOk9XBO8pu7Jkp3RGK6sW4X/MhpOpQO4gz00
 +uaME/VyLIDDKDSI7YCC6LNaxUjHRxm7NkKM2jZzNh0GpV/9KP+MnBjkFLisvU8hr4++
 EmkQ==
X-Gm-Message-State: AOJu0YykIj6ZafXjt+8Y9vPkTY45C4x2OLSaTEZKtH42gZYHHXrJp/0h
 7zFgPNxpfFFwUymXkiHV/MTSNGzytKTF/9uyOdC9BqhMSFeWDp71
X-Gm-Gg: ASbGncvwuoS7gnstiB6g7f5X7wDeEP/qcpk00eZWu8n5Ii3Z+TxmLGFN6NJx9O/JmBM
 TXp24f47vPEQZMraAknL89RACBSmTTdzC+lKCeOETqdLXRH1YDs5b45BxqV1X5p2+iM7msViSeI
 l+rMfcBU/LOzSIFQ3UZGrmO1BaE30czxzWKs3lph0noPsssGI1SnYjlVeEZO57+eamAMd9A9pNs
 AXch155vUxAC5Xy+7cxcXW+GM+qxEqKUD+egvxjUo/naNdY65ASkXl5zDJSjmoCpAIxArLYXbQZ
 4+3fttpVFjCSCAHm5b4yPImlvcYS5lfKcB6Bcu30f70bnvpPt2XSj9ADiYJhO6PVWaFTfhX9j3u
 JFr+2eEnjXeDtsvUmvPw=
X-Google-Smtp-Source: AGHT+IFnuhp6aziVK6HlYeqPek+YN4sm/pQ5SJswuxjV6I1uRAX4D3Or3KgdMAKCRGK3jklne+bFcg==
X-Received: by 2002:a05:6402:5210:b0:5e7:b081:e0d1 with SMTP id
 4fb4d7f45d1cf-5e89e6aba13mr4993478a12.3.1741992838387; 
 Fri, 14 Mar 2025 15:53:58 -0700 (PDT)
Received: from [192.168.1.17] (host-82-63-6-128.business.telecomitalia.it.
 [82.63.6.128]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816ad38f3sm2566634a12.63.2025.03.14.15.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 15:53:58 -0700 (PDT)
Message-ID: <48b7a410-7c6c-4aa5-b18a-3a54a2b4fffa@gmail.com>
Date: Fri, 14 Mar 2025 23:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/a6xx+: Don't let IB_SIZE overflow
To: Rob Clark <robdclark@gmail.com>
Cc: freedreno@lists.freedesktop.org
References: <20250314183455.120824-1-robdclark@gmail.com>
 <4525d045-745a-4d8b-987e-45d3fa9917b5@quicinc.com>
 <CAF6AEGuneF8Yi0ViA4ActvmGL7aOFT75jNBN=YZf37YyoBkCFA@mail.gmail.com>
 <642de5da-e6c5-464f-82a7-6f881323b429@gmail.com>
 <CAF6AEGvCmAVtmYi9bO_YQgQtbBvWXt1K_Y3i8QU49erhXLPU0g@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGvCmAVtmYi9bO_YQgQtbBvWXt1K_Y3i8QU49erhXLPU0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 3/14/25 10:56 PM, Rob Clark wrote:
> On Fri, Mar 14, 2025 at 2:35 PM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> On 3/14/25 10:08 PM, Rob Clark wrote:
>>> On Fri, Mar 14, 2025 at 1:07 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 3/15/2025 12:04 AM, Rob Clark wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> IB_SIZE is only b0..b19.  Starting with a6xx gen3, additional fields
>>>>> were added above the IB_SIZE.  Accidentially setting them can cause
>>>>> badness.  Fix this by properly defining the CP_INDIRECT_BUFFER packet
>>>>> and using the generated builder macro to ensure unintended bits are not
>>>>> set.
>>
>> I wonder if we should be returning -EINVAL from the ioctl when a size
>> larger than max is submitted. I say this because we do a 0 check when
>> submitting which this bug allows to bypass therefore putting a 0 sized
>> CP_INDIRECT_BUFFER pkt in the ring.
>> Fw is inconsistent as to how this is treated (should be a NOP but will
>> sometimes hang) and that is very confusing.
> 
> tbh, I'm not sure I remember why we check for zero.. at least sqe fw
> explicitly handles this case on newer devices.  Maybe it made older
> devices grumpy?
> 

The problem occurs when a CP_INDIRECT_BUFFER with size 0 is encountered, 
say in BV, when BV is disabled.

But yeah I don't feel strongly about this just wanted to point out that 
a check is being bypassed and it does lead to some kind of UB (not sure 
what this does across devices).

> But I wanted to avoid hard-coding (potentially) device specific limits
> in the frontend.  And decided that userspace is allowed to shoot it's
> own foot if it really wants to.
> 
> BR,
> -R
> 
>>>>>
>>>>> v2: add missing type attribute for IB_BASE
>>>>>
>>>>> Reported-by: Connor Abbott <cwabbott0@gmail.com>
>>>>> Fixes: a83366ef19ea ("drm/msm/a6xx: add A640/A650 to gpulist")
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>> Backport notes, prior to commit ae22a94997b8 ("drm/msm: import A2xx-A4xx
>>>>> XML display registers database"), just open code, ie:
>>>>>
>>>>>      OUT_RING(ring, submit->cmd[i].size & 0xfffff);
>>>>>
>>>>> Prior to commit af66706accdf ("drm/msm/a6xx: Add skeleton A7xx
>>>>> support"), a7xx_submit() did not exist so that hunk can be dropped.
>>>>>
>>>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 8 ++++----
>>>>>    drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 7 +++++++
>>>>>    2 files changed, 11 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> index d3978cfa3f20..ea52b7d0b212 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> @@ -245,10 +245,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>>                                 break;
>>>>>                         fallthrough;
>>>>>                 case MSM_SUBMIT_CMD_BUF:
>>>>> -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
>>>>> +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
>>>>>                         OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
>>>>>                         OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
>>>>> -                     OUT_RING(ring, submit->cmd[i].size);
>>>>> +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(submit->cmd[i].size));
>>>>>                         ibs++;
>>>>>                         break;
>>>>>                 }
>>>>> @@ -382,10 +382,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>>                                 break;
>>>>>                         fallthrough;
>>>>>                 case MSM_SUBMIT_CMD_BUF:
>>>>> -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
>>>>> +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
>>>>>                         OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
>>>>>                         OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
>>>>> -                     OUT_RING(ring, submit->cmd[i].size);
>>>>> +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(submit->cmd[i].size));
>>>>>                         ibs++;
>>>>>                         break;
>>>>>                 }
>>>>> diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
>>>>> index 55a35182858c..a71bc6f16cbf 100644
>>>>> --- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
>>>>> +++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
>>>>> @@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
>>>>>         </reg32>
>>>>>    </domain>
>>>>>
>>>>> +<domain name="CP_INDIRECT_BUFFER" width="32" varset="chip" prefix="chip" variants="A5XX-">
>>>>> +     <reg64 offset="0" name="IB_BASE" type="address"/>
>>>>> +     <reg32 offset="3" name="3">
>>>>
>>>> Why is the offset 3 here? It looks to me that it doesn't match the code
>>>> above.
>>>
>>> oh, bad copy/pasta.. it should be 2 (dword offset)
>>>
>>> BR,
>>> -R
>>>
>>>> -Akhil.
>>>>
>>>>> +             <bitfield name="IB_SIZE" low="0" high="19"/>
>>>>> +     </reg32>
>>>>> +</domain>
>>>>> +
>>>>>    </database>
>>>>>
>>>>
>>
>> Best regards,
>> --
>> Antonino Maniscalco <antomani103@gmail.com>


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>
