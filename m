Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C509ED1D335
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 09:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8846810E3AD;
	Wed, 14 Jan 2026 08:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qij/XLsv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9811410E5B7
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 08:45:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47eddddcdcfso5966765e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768380308; x=1768985108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Nn2P+cTkVwAykWlPC24DGRgRkCJONiMX3KadIJciMfk=;
 b=Qij/XLsvziV/4yzF7CvLs3uqc5B6SUeUXq0GiaNRCd0KddlNeDZZ/j1d0T1byn+GbP
 xHWibFccxINFJK4zKRy2xFA1XRoqhrMBlZS9aVW+BTwbMMoNGwMG/3OPqxF0+tharY8S
 +YRMnLQOuvg1WyWXMPFXLtQHVoBeOBc8X8DnULx7jWGX5B2HvWieTfTcNS4W/g4GXsqg
 Bfgp87rjMqTSM8N3vqL80n9j/VqkjOWqB18LYkx2HcHqj9utUlNdPJFCYq4XU7+PVubq
 m/e7NN4jOC9KshrMhv1NSmapI/DGwXAK3jNtrUisSJ3cv+RmVKVAivBwsktlo9nHVnJD
 nIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380308; x=1768985108;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nn2P+cTkVwAykWlPC24DGRgRkCJONiMX3KadIJciMfk=;
 b=cj4ruHBg4FimEVvE/o9zd62hjSGzs6X2dvqbOYvL8qlyD5Dm3FwaYTEAajnSe72KuN
 OsOCMRo37xooQJnHA/mQbVXks8fVj4JBQioQTbQyCRPpFSG9DoSatpS/DIN+ik5iTacs
 xOzwhA62+cS6d86sFhWqmOkK8u+/qHd/TocTeFKCOa4B1O2xR8GUemaP9CRbmZGEX+rL
 Xn2filROZ5yQsGHYDa5urJnpsf0tyy5PakdNFqkPC9onmN8yLqXDjS52lZJJ4uMhJPp+
 MHGl6icVJAqYWw3BHXHi+9r1N58+frAsqVT/nn5X64UgQ05jhbmnWNjej5DZlTCnf8ni
 gPLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5/sY08ZW36O9KhZvdM37ffse3v9mVrorxhzj+EuG969DnavFaUucJ2u6ztoGoZcAu6fFx3mAALVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCMFgVzekJJPcoCHHxgnNMEQxf+3lPJCllx+yz85XCcoKxy0Vn
 shDf5R0TSRuRuvJWRCmebsdzQNFgHNur1pPyBp2fQBhEECBvCzwG29Uy69gUZ66LB88=
X-Gm-Gg: AY/fxX6l/0ECZUAzUmot/qB9E0b4gJRVnBizIcO8h/rohudzH3PHFCIhsH8PaMwlc2r
 Xb5qNdfmbb1OAPHUH6h5yzQhmNnI5OGhDnnTC/XfVrbhOl8jN1RmklAfX1FDXV+tvTNv8UaajHH
 YcQ4mo8AZnrn5mmVbByQ/sol3O52VGqOmbhLT4DxsafhledClV3rfERD6I59ebV9CmJFi8qdi92
 qjEPDAiTkKoDVYCb7M2eAqsYrI8GWDXke92A2ke7p59xDKg5RSajgx/sGZ12ZDBYusein19fojJ
 8bwwzc8vLIgMLiYbQ5u2Sdu0C01h+FG4grGSNaoWAjYG5fDVgxFbkP6JSW4KQFuZ8SXMoCQoxRe
 WT8J7d4HsRl+qwMwY7eqTb1Buf3PXt7J8oYWjHU4xOc2kGUXMqmI2VXl6MbGFbVfhjBf1EtXL8d
 ilyMYjxHKydg4pX2zNxOqmzsLTtVWMi1NszGdDePlR4m3OIQrVN69JXj4fkxQksvQ=
X-Received: by 2002:a05:600c:870b:b0:477:7b72:bf9a with SMTP id
 5b1f17b1804b1-47ee338a737mr19695785e9.28.1768380307818; 
 Wed, 14 Jan 2026 00:45:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450?
 ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee57a2613sm16475575e9.6.2026.01.14.00.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 00:45:07 -0800 (PST)
Message-ID: <e879d3a1-45d9-46f0-adaf-6bea243ab807@linaro.org>
Date: Wed, 14 Jan 2026 09:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
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
In-Reply-To: <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On 1/14/26 07:37, Akhil P Oommen wrote:
> On 10/22/2025 6:14 PM, Neil Armstrong wrote:
>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>> full performance:
>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>
>> In order to fix this state and allow the GMU to be properly
>> probed, let's add a proper driver for the GMU and add it to
>> the MSM driver components.
>>
>> Only the proper GMU has been tested since I don't have
>> access to hardware with a GMU wrapper.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>>   drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>>   6 files changed, 192 insertions(+), 195 deletions(-)
>>
> 
> Niel,
> 
> Could you please send the follow up revision of this patch? Lets get
> this fix merged.

I'm really struggling on the separate_gpu_kms part, it's not trivial at all.

I'll try again and report my current status.

Neil

> 
> -Akhil.
> 

