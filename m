Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954531E093
	for <lists+freedreno@lfdr.de>; Wed, 17 Feb 2021 21:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECEA6E7DC;
	Wed, 17 Feb 2021 20:36:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1E36E7D5
 for <freedreno@lists.freedesktop.org>; Wed, 17 Feb 2021 20:35:59 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id e9so6954219qvy.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Feb 2021 12:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PtFYCUOobnFXmegfiYZJ33XeNVIXq0ITGP2K5dRUFqw=;
 b=IKN8NDde24/KFJ5MVx2fp5NwVTpJ8+pX0A1BaZJu5w8HXkW+kzGerFd5H0klrfnV6G
 kt39mImE05ClNR63gYQxCaNgdQQg9T6RcQWUyEKu5PtxHordLlS7A7kpAeGAikhTOziD
 38sSsyfRXB8pjqWJhLFUUyf5LVzo0lOYlDIB+ZTV9oqXxD67aLL1cLhv14QVxjz3j+CY
 lTALrsLRA3hI8cNprAqweyKfwGk6J8jd6FWQDd8rfJau4E2xyG8xR2QtZMyF+7IlZ+j9
 P/SvJKd+iAlCHKKsXjj1jlDndo5jsNYSpabUsNdQ7kZjLz/8avUyAc4IbBxW9+JqXdEH
 2eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PtFYCUOobnFXmegfiYZJ33XeNVIXq0ITGP2K5dRUFqw=;
 b=t64Ed+XafmZkQjpkP1KL2LOxVX2A3z5BzW4LsCRFT4lkJhYLNOCYMjgXs5bart8x99
 IvK4MOk6hTROiCPMUOWTeI/plFtd6q74jLSCjawdrNu2hZxFJzOa8kKg9rd2FiSgHkBi
 IlFEzHHAyG6VG/cXsj7KoB+E27OX1qA90xO7dPFBRUH9BWBinq8Zp8T4ByFp+Tm08wR1
 so4XPqO1gCraCti/KhuY1/BwT2kCkYtvK2NOQ/HnyZqx9pngFB0ICNUap1JEnub/tkel
 tWqPsYTG2U1NVJ9C9ajQ3KznP9ZDTjTHp/hYhQmgQ+R0WGmXTSwylPhYFzGUon0HD5+7
 ws+g==
X-Gm-Message-State: AOAM5324erqeg7X/0wxWHo+CXUyfxinXnnosIIZ9nAJ3fJqBMlThcJnK
 bz6soOM0S+vVqmnIeUBVhZFySQ==
X-Google-Smtp-Source: ABdhPJx6Ee7D1e/VOvTXn/LiULM0iNhsJf5Ojv96o578uqlRaqjKtbKZxZ3drkgpdjmIr4alTTbdww==
X-Received: by 2002:ad4:4390:: with SMTP id s16mr1061338qvr.10.1613594158760; 
 Wed, 17 Feb 2021 12:35:58 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id 136sm2450099qko.12.2021.02.17.12.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 12:35:58 -0800 (PST)
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>, 
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Eric Anholt <eric@anholt.net>, Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
 <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca>
Date: Wed, 17 Feb 2021 15:35:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: fix for kernels without
 CONFIG_NVMEM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2/17/21 3:18 PM, Rob Clark wrote:
> On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>>
>> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
>>> On 2/17/2021 8:36 AM, Rob Clark wrote:
>>>> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
>>>>>
>>>>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
>>>>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
>>>>>
>>>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
>>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> index ba8e9d3cf0fe..7fe5d97606aa 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>>>>>
>>>>>          cell = nvmem_cell_get(dev, "speed_bin");
>>>>>          /*
>>>>> -        * -ENOENT means that the platform doesn't support speedbin which is
>>>>> -        * fine
>>>>> +        * -ENOENT means no speed bin in device tree,
>>>>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
>>>>
>>>> very minor nit, it would be nice to at least preserve the gist of the
>>>> "which is fine" (ie. some variation of "this is an optional thing and
>>>> things won't catch fire without it" ;-))
>>>>
>>>> (which is, I believe, is true, hopefully Akhil could confirm.. if not
>>>> we should have a harder dependency on CONFIG_NVMEM..)
>>> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw' property,
>>> we will see some error during boot up if we don't call
>>> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev, "speed_bin")"
>>> is a way to test this.
>>>
>>> If there is no other harm, we can put a hard dependency on CONFIG_NVMEM.
>>
>> I'm not sure if we want to go this far given the squishiness about module
>> dependencies. As far as I know we are the only driver that uses this seriously
>> on QCOM SoCs and this is only needed for certain targets. I don't know if we
>> want to force every target to build NVMEM and QFPROM on our behalf. But maybe
>> I'm just saying that because Kconfig dependencies tend to break my brain (and
>> then Arnd has to send a patch to fix it).
>>
> 
> Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
> other dependencies, so I suppose it wouldn't be the end of the world
> to select that.. but I guess we don't want to require QFPROM
> 
> I guess at the end of the day, what is the failure mode if you have a
> speed-bin device, but your kernel config misses QFPROM (and possibly
> NVMEM)?  If the result is just not having the highest clk rate(s)
> available, that isn't the end of the world.  But if it makes things
> not-work, that is sub-optimal.  Generally, especially on ARM, kconfig
> seems to be way harder than it should be to build a kernel that works,
> if we could somehow not add to that problem (for both people with a6xx
> and older gens) that would be nice ;-)
> 

There is a "imply" kconfig option which solves exactly this problem. 
(you would "imply NVMEM" instead of "select NVMEM". then it would be 
possible to disable NVMEM but it would get enabled by default)

> BR,
> -R
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
