Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301CBA61E35
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 22:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0794310E30D;
	Fri, 14 Mar 2025 21:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fOb4fcPd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3A110E30D
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 21:35:12 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so440909166b.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 14:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741988111; x=1742592911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bos2aOMKgHsaJC1nkN/p4VwslAdXZp9Z7Y5uqCN7ryE=;
 b=fOb4fcPdl3AyoZCHqxXWcZjw8KHu/o8985hrXgL3fWce3MCkCMmDqzc0udWgKuef2X
 eVEY63Vohd+cjOZS4I4PIwZuXh/cYwauFfJBAMFwm6Q5GxsXfA0pJDYHs6uyHIMMGC7n
 U4y+kZtKZhg8oJXgS8xD5QLK35GgKQcAhxGay/DftKDsqPG8BMsAsuQG98PPF3s0GOsZ
 Km4TNXwN6S13gYgiWx3JMT9nkvXjsoe0jWtRSPpqx30XvPq0B1tGwnCL8sPlC2/f44hr
 3j3usqH6qexzFG3mgKO1PHqPdoJ01zcFqlg7reJD0VnohmERb2SX8YtK32o6ep+Qn0du
 6wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741988111; x=1742592911;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bos2aOMKgHsaJC1nkN/p4VwslAdXZp9Z7Y5uqCN7ryE=;
 b=bM3pzW0Wdwl8JRAuX+okAVOH37QvRV0w9aAma05hoFf3tgy9uzLvKX5aHYod6ftYnB
 gpK79x+IgoySLdBJUcCkvRYLyeRkZYnIwUB4w0pPkKSWIHIwb15xWturoni4UrNNP4T2
 ZrRPlIhM1190bNLoQiQB3VNA2G5viW5rVm+9ANQu0MiENHkfefMx6CAY1MlqB8mIz9TJ
 uBmCvNwJyZK5rRIyA1hrKZNfugv3HAocQrRJL537BjmMZP/2IijHQ8qR2535WsUz9+l4
 zd6TW+XHHIUYzI8pEjeRXzS9OCbgu6MQLO/8Xe1nQ5duxEjif8u3y8JM96eYj5LE9GVo
 3yDg==
X-Gm-Message-State: AOJu0YzB/FZYtE6ULfW4X9S7go5EaiCUF1Fu5bZ/gSUSgxzs6s8mKM+L
 7T0KBQeg5lRBRvrB0sJi3BtiLXdiCTtPPgNdK58+Jeaeqqj9oFz+2wVQIQ==
X-Gm-Gg: ASbGnctCYCtxLVa8W0y8554RNSGX5sN/Sada0tBWKuQwk65ONgM0FgScWOKcgcY/EHH
 y36krbz6lBzsxnA+mYTK4zltzYWC2oITrp+3CEW9Ss8slzh9aelWlAWM8LMqgqBTfOIj/7Kh5cE
 fT0HNwDUY1eSAwRtRkgOMG/MNNvO/lL9Vv+k7PsotA67u5Z8hA0oPWZBP2J7EdeY25YiACqSAjL
 HZYrZrVuEa3gHaYl5krS0hBMC5D/nauGdE+i9VpNKEgtGVbQQsIlgEeXFUpeDWDgsfNNtR/hc/q
 BetVPQ90mzqzVF3bf1lRwK0HTslupW+R7nGLH1VZA4gQ5vl5vydUzhQSxMKH3fVYhp4Kx5+wUDv
 XTOqcVoGWOBTEuD4o5R4=
X-Google-Smtp-Source: AGHT+IHoWsZUZKcm4VfVSPJ9UMDdwqKWW1NUVEqAjE6vd71k9uQvfOAW+ymz2b7ITJ+MJqR1IstbRg==
X-Received: by 2002:a17:907:2d0f:b0:ac1:f7a6:fba9 with SMTP id
 a640c23a62f3a-ac3304e73b1mr484754566b.53.1741988110907; 
 Fri, 14 Mar 2025 14:35:10 -0700 (PDT)
Received: from [192.168.1.17] (host-82-63-6-128.business.telecomitalia.it.
 [82.63.6.128]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a462basm275897666b.133.2025.03.14.14.35.10
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 14:35:10 -0700 (PDT)
Message-ID: <642de5da-e6c5-464f-82a7-6f881323b429@gmail.com>
Date: Fri, 14 Mar 2025 22:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/a6xx+: Don't let IB_SIZE overflow
To: freedreno@lists.freedesktop.org
References: <20250314183455.120824-1-robdclark@gmail.com>
 <4525d045-745a-4d8b-987e-45d3fa9917b5@quicinc.com>
 <CAF6AEGuneF8Yi0ViA4ActvmGL7aOFT75jNBN=YZf37YyoBkCFA@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGuneF8Yi0ViA4ActvmGL7aOFT75jNBN=YZf37YyoBkCFA@mail.gmail.com>
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

On 3/14/25 10:08 PM, Rob Clark wrote:
> On Fri, Mar 14, 2025 at 1:07 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On 3/15/2025 12:04 AM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> IB_SIZE is only b0..b19.  Starting with a6xx gen3, additional fields
>>> were added above the IB_SIZE.  Accidentially setting them can cause
>>> badness.  Fix this by properly defining the CP_INDIRECT_BUFFER packet
>>> and using the generated builder macro to ensure unintended bits are not
>>> set.

I wonder if we should be returning -EINVAL from the ioctl when a size 
larger than max is submitted. I say this because we do a 0 check when 
submitting which this bug allows to bypass therefore putting a 0 sized 
CP_INDIRECT_BUFFER pkt in the ring.
Fw is inconsistent as to how this is treated (should be a NOP but will 
sometimes hang) and that is very confusing.

>>>
>>> v2: add missing type attribute for IB_BASE
>>>
>>> Reported-by: Connor Abbott <cwabbott0@gmail.com>
>>> Fixes: a83366ef19ea ("drm/msm/a6xx: add A640/A650 to gpulist")
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>> Backport notes, prior to commit ae22a94997b8 ("drm/msm: import A2xx-A4xx
>>> XML display registers database"), just open code, ie:
>>>
>>>     OUT_RING(ring, submit->cmd[i].size & 0xfffff);
>>>
>>> Prior to commit af66706accdf ("drm/msm/a6xx: Add skeleton A7xx
>>> support"), a7xx_submit() did not exist so that hunk can be dropped.
>>>
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 8 ++++----
>>>   drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 7 +++++++
>>>   2 files changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index d3978cfa3f20..ea52b7d0b212 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -245,10 +245,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>                                break;
>>>                        fallthrough;
>>>                case MSM_SUBMIT_CMD_BUF:
>>> -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
>>> +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
>>>                        OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
>>>                        OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
>>> -                     OUT_RING(ring, submit->cmd[i].size);
>>> +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(submit->cmd[i].size));
>>>                        ibs++;
>>>                        break;
>>>                }
>>> @@ -382,10 +382,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>                                break;
>>>                        fallthrough;
>>>                case MSM_SUBMIT_CMD_BUF:
>>> -                     OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
>>> +                     OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
>>>                        OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
>>>                        OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
>>> -                     OUT_RING(ring, submit->cmd[i].size);
>>> +                     OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(submit->cmd[i].size));
>>>                        ibs++;
>>>                        break;
>>>                }
>>> diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
>>> index 55a35182858c..a71bc6f16cbf 100644
>>> --- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
>>> +++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
>>> @@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
>>>        </reg32>
>>>   </domain>
>>>
>>> +<domain name="CP_INDIRECT_BUFFER" width="32" varset="chip" prefix="chip" variants="A5XX-">
>>> +     <reg64 offset="0" name="IB_BASE" type="address"/>
>>> +     <reg32 offset="3" name="3">
>>
>> Why is the offset 3 here? It looks to me that it doesn't match the code
>> above.
> 
> oh, bad copy/pasta.. it should be 2 (dword offset)
> 
> BR,
> -R
> 
>> -Akhil.
>>
>>> +             <bitfield name="IB_SIZE" low="0" high="19"/>
>>> +     </reg32>
>>> +</domain>
>>> +
>>>   </database>
>>>
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>
