Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BFF9D124F
	for <lists+freedreno@lfdr.de>; Mon, 18 Nov 2024 14:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD81A10E4D7;
	Mon, 18 Nov 2024 13:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dSd///vs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D95510E4D7
 for <freedreno@lists.freedesktop.org>; Mon, 18 Nov 2024 13:43:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso16976525e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 18 Nov 2024 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731937380; x=1732542180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0MNIeWbXOEpIdi177GrMSJrZweM2zZKOMnvj4ie3c6U=;
 b=dSd///vsVWffLoDUsbNPQ/nhIofTdPRE0cTYa73SQ5Cdm+oDc4YN7bHZI1WcOuflot
 fuXP01zwwI+FRrJjxDRyeffj3hn7P/P35jzUV+Jmw87ZiBafaqzYLbg+gEY/nFpAN1Xu
 VjZLqMzFevetxmc621tiGNSN1gUrJCvaElcScZ7uAW2MIwjjr+Of+OkQ3CY0nX+Qgsn1
 s3TOWtNRNaqPX8fkpWw+CxuMqNzcPBdk9zZ6VuuAJh3+9QH610F1NjKZw/Xa4XrNAqAV
 F5joCKVwWkCbiQ31gaXBuVLIHoJ42tkwbVQQD+YsVFczmFvKUDlRkEdVAQ+68ARLPNLL
 tXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731937380; x=1732542180;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0MNIeWbXOEpIdi177GrMSJrZweM2zZKOMnvj4ie3c6U=;
 b=GdV7nCC/DfyEoZLKguZVmNQCCTgJ3GeZuNSKscbkN+zQB54iVTgbs+X3Y78s6zAxpC
 oXP3RMw9hVPEX1Qt7Q76FLwrEz4N1yp4dDXT6vOSotO2cJpm9YQUhUpqiBJTfN4jVh9d
 o8pxHCHLWR+jo9Zztzb2wlV66LSs/9oBxbN5rmqIjstbOz0AOUf/CMx5U/L8SfBmWhlZ
 Dmb6nyIJTvBwtREpr/RaCfwOwCy315LRCTtYyTO1JOrvhBNnvHH+Pl87QO0nrn0qiZEA
 zyk5BdEuKXBGhzNWFdk1jnmQmA5lG54IeaIWs7XlFIBB8WwAL2L/1yceG/ML1/HoFf1U
 jlUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/ta46HIfBRnqmzEPrObfxMvOa6dAY+bSfzRNE7XHEU9yElTksLGcMnTj6pj0UgkLfPZnKco6cCJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO9TD6wGp0egMyraKRIw7MoQc73gH37iF7wFAXs0t348yXmxCd
 tmq9I33hKXE2Ev/VErKI0ww1Axx7zNOWHM16umf8XDz2h1v/JK2KghQlOSzlYHY=
X-Google-Smtp-Source: AGHT+IGrzGPi3KYjZ8eO1BUfXR+Xyqy1kzwZJiWe9WGbERnH/MbM0pDrrlujHkivsIJkNzef6M1Jyw==
X-Received: by 2002:a05:600c:510b:b0:430:563a:b20a with SMTP id
 5b1f17b1804b1-432df72a7c3mr102661245e9.11.1731937380092; 
 Mon, 18 Nov 2024 05:43:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed47:520d:3d5c:3acf?
 ([2a01:e0a:982:cbb0:ed47:520d:3d5c:3acf])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da2946a3sm157868985e9.35.2024.11.18.05.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 05:42:59 -0800 (PST)
Message-ID: <e76a2531-a96a-441d-ac2d-bc1557370aa5@linaro.org>
Date: Mon, 18 Nov 2024 14:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 6/8] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-6-3b8d39737a9b@linaro.org>
 <nw2sqnxmhntvizzvygfho6nhiwfni4xfquwst5gd5g2tel6pnr@h66d4mw46jcf>
 <8df952a8-3599-4198-9ff0-f7fac6d5feaf@linaro.org>
 <p4pqswgaxbx2aji6y5v2qngn3xp4gdlruthhbzpb4cgfs2earz@mo7zbsgqwc4b>
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
In-Reply-To: <p4pqswgaxbx2aji6y5v2qngn3xp4gdlruthhbzpb4cgfs2earz@mo7zbsgqwc4b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 15/11/2024 15:39, Dmitry Baryshkov wrote:
> On Fri, Nov 15, 2024 at 10:20:01AM +0100, Neil Armstrong wrote:
>> On 15/11/2024 08:33, Dmitry Baryshkov wrote:
>>> On Wed, Nov 13, 2024 at 04:48:32PM +0100, Neil Armstrong wrote:
>>>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
>>>> is in place, let's declare the Bus Control Modules (BCMs) and
>>>
>>> s/let's //g
>>>
>>>> it's parameters in the GPU info struct and add the GMU_BW_VOTE
>>>> quirk to enable it.
>>>
>>> Can we define a function that checks for info.bcm[0].name isntead of
>>> adding a quirk?
>>
>> Probably, I'll need ideas to how design this better, perhaps a simple
>> capability bitfield in a6xx_info ?
> 
> I'm not sure if I follow the question. I think it's better to check for
> the presens of the data rather than having a separate 'cap' bit in
> addition to that data.

I don't fully agree here, I just follow the other features (CACHED_COHERENT/APRIV/...)
nothing fancy.
I'll introduce a features bitfield, so we don't mix them with quirks

> 
>> There's other feature that are lacking, like ACD or BCL which are not supported
>> on all a6xx/a7xx gpus.
> 
> Akhil is currently working on ACD, as you have seen from the patches.

Yep I've tested and reviewed the patches

> 
>>
>>>
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
>>>>    1 file changed, 24 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..014a24256b832d8e03fe06a6516b5348a5c0474a 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>    		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>>    		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>>>    			  ADRENO_QUIRK_HAS_HW_APRIV |
>>>> -			  ADRENO_QUIRK_PREEMPTION,
>>>> +			  ADRENO_QUIRK_PREEMPTION |
>>>> +			  ADRENO_QUIRK_GMU_BW_VOTE,
>>>>    		.init = a6xx_gpu_init,
>>>>    		.zapfw = "a740_zap.mdt",
>>>>    		.a6xx = &(const struct a6xx_info) {
>>>> @@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>    			.pwrup_reglist = &a7xx_pwrup_reglist,
>>>>    			.gmu_chipid = 0x7020100,
>>>>    			.gmu_cgc_mode = 0x00020202,
>>>> +			.bcm = {
>>>> +				[0] = { .name = "SH0", .buswidth = 16 },
>>>> +				[1] = { .name = "MC0", .buswidth = 4 },
>>>> +				[2] = {
>>>> +					.name = "ACV",
>>>> +					.fixed = true,
>>>> +					.perfmode = BIT(3),
>>>> +					.perfmode_bw = 16500000,
>>>
>>> Is it a platform property or GPU / GMU property? Can expect that there
>>> might be several SoCs having the same GPU, but different perfmode_bw
>>> entry?
>>
>> I presume this is SoC specific ? But today the XXX_build_bw_table() are
>> already SoC specific, so where should this go ?
> 
> XXX_build_bw_table() are GPU-specific. There are cases of several SoCs
> sharing the same GPU on them.

So it's gpu-specific

> 
>> Downstream specifies this in the adreno-gpulist.h, which is the equivalent
>> here.
> 

