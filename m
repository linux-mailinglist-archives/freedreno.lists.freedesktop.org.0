Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC495CAB4
	for <lists+freedreno@lfdr.de>; Fri, 23 Aug 2024 12:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF6D10E54C;
	Fri, 23 Aug 2024 10:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NM9PmEFl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE96110E53E
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2024 10:44:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-429e29933aaso13406995e9.0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2024 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724409866; x=1725014666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TVmP6ojwfJA9IaR5bDfQtTdpMJGMktg0fabmxgK6590=;
 b=NM9PmEFlDKz1j+30Bg9T0Hnv7eaoGemb1AEdalSX2y7W2/92CNnjdiMetxgwmuEN+B
 3xw0/eK0PokqPTY2WzaRtM0DwD24GFJy/hrPIO/3OVyGdiM8bIgXVEiMCXUonHQ8aiNH
 V7tcumeXTrEnp0y6dW/mM2XIgOATtal5TggKFEO0PKtoVCnI5y0SJWxLr5ShgrIeObSX
 8KGw+pwKj6pxzGB4kM4g4LJRf2U/AnCzNlNoglABQToizoDIrtVCY0j26qaa4+CkX56b
 j80ob42hhAm3VYmjSQbKnn1+tOz/NsDJurdu353cmZFTzOoYlwgWIbV5dgJwEAea4+Dd
 PKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724409866; x=1725014666;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TVmP6ojwfJA9IaR5bDfQtTdpMJGMktg0fabmxgK6590=;
 b=HWIhywjdmxqHNMHa8LycWY5hh3Jc4oqPtvcEAdenG33HLKKZA0Sr3lWJSKWO9eOTv5
 leetUOeespQSleqxpTVYxpG4+NbqPyj6FQi4uqGUS2+g0wD+qwKgkmYHBgz74M/8ciT+
 h2g2vjsM7/3nZNWtBcYQJ8+g/G+WkI2MRtg2d78vMimhEpJA0K/nX5L5RHhGcUOHFRB1
 Tb0G+mi5SyKeE9wKgvWg9zg+/H0KekqCBpPICjfpitQktK6vpaVcp0Z5QZBT2VHlU0Y/
 Ton+dmPbHNUJesBR2zynGLL5LXDxSfJsZO+1jQroCELY02knnyi1L5luaU8/noe6revv
 H6SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY/yKx3ZSGlTFkW20SjMxINXz+sHPSyGyqcjCODpKpJVIP6AS9M8TtTjH6P8LWgmkOgmjvkzPqKCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFt030HW7Oz2s2GvCbi6fi/xV8B+uftSzNejtp/xHle+GhearC
 AZT+z82PVYRCJN3wb0dJLeyb3sLNlCPXg4Zd3OB7X2hb/BL8GJMhJKTdGxJQnyY=
X-Google-Smtp-Source: AGHT+IFdk9CofB6PBJT5jah9JSl6icoRfyxDLqLF+MakugI7qNwi8X30PDwv3ScpFgwP6yqIX2DKng==
X-Received: by 2002:a05:600c:4ed2:b0:428:314:f08e with SMTP id
 5b1f17b1804b1-42acd542443mr10762475e9.5.1724409865680; 
 Fri, 23 Aug 2024 03:44:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:995c:3fea:6b19:4a51?
 ([2a01:e0a:982:cbb0:995c:3fea:6b19:4a51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ab6e7de7bsm96371635e9.0.2024.08.23.03.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 03:44:25 -0700 (PDT)
Message-ID: <d92afb55-ff28-40d3-b5c0-400b00b1a4e0@linaro.org>
Date: Fri, 23 Aug 2024 12:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] Preemption support for A7XX
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <95f0517a-ed86-4905-85e5-a123880c6fa8@linaro.org>
 <CACu1E7FxE3rLN8SV1-5Zg7=+LqCAwHuiCcXroikS4=yRPsdnMQ@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CACu1E7FxE3rLN8SV1-5Zg7=+LqCAwHuiCcXroikS4=yRPsdnMQ@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/08/2024 11:54, Connor Abbott wrote:
> On Fri, Aug 23, 2024 at 9:30 AM <neil.armstrong@linaro.org> wrote:
>>
>> On 15/08/2024 20:26, Antonino Maniscalco wrote:
>>> This series implements preemption for A7XX targets, which allows the GPU to
>>> switch to an higher priority ring when work is pushed to it, reducing latency
>>> for high priority submissions.
>>>
>>> This series enables L1 preemption with skip_save_restore which requires
>>> the following userspace patches to function:
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>>
>>> A flag is added to `msm_gem_submit` to only allow submissions from compatible
>>> userspace to be preempted, therefore maintaining compatibility.
>>>
>>> Some commits from this series are based on a previous series to enable
>>> preemption on A6XX targets:
>>>
>>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>>
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> ---
>>> Antonino Maniscalco (7):
>>>         drm/msm: Fix bv_fence being used as bv_rptr
>>>         drm/msm: Add submitqueue setup and close
>>>         drm/msm: Add a `preempt_record_size` field
>>>         drm/msm/A6xx: Implement preemption for A7XX targets
>>>         drm/msm/A6xx: Add traces for preemption
>>>         drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>>         drm/msm/A6xx: Enable preemption for A7xx targets
>>>
>>>    drivers/gpu/drm/msm/Makefile              |   1 +
>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
>>>    drivers/gpu/drm/msm/msm_gpu.h             |   7 +
>>>    drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
>>>    drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
>>>    drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
>>>    include/uapi/drm/msm_drm.h                |   5 +-
>>>    11 files changed, 995 insertions(+), 16 deletions(-)
>>> ---
>>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>>
>>> Best regards,
>>
>> For what is worth, I've tested it on the SM8650 QRD with the Mesa 30544 MR & vkcube
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>>
>> If you think of more tests to run, please tell me.
>>
>> Neil
> 
> Hi Neil,
> 
> I think it would help to test this on SM8550 and SM8450 too. I don't
> have SM8450 to test with. Maybe also worth mentioning that there are
> now vulkan CTS tests that try to test L1 preemption:
> https://github.com/KhronosGroup/VK-GL-CTS/commit/7e0e4a000f34e748bb527b39f730f78b595140b9
> although it's not in a released version yet.

Sure, It's in my plans, I'm currently testing it on SM8550.

Thanks,
Neil
> 
> Connor

