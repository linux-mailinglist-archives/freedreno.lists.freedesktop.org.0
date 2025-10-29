Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421EC19691
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 10:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE55010E756;
	Wed, 29 Oct 2025 09:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UnPN4LNL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF06F10E756
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 09:40:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso56544635e9.0
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761730827; x=1762335627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=MpD8LIzdwjI+LuQZp/Ng/8pA8/EN8OIRE+rVL25JQdI=;
 b=UnPN4LNLXrXscAmq24sDSkTq2HcHluCflWElt4RbEs4U8W0WLPqCnT4VnlTNtrTL/+
 P5iCpQVrKbKEX/lJAyg6GsFWkeB0iGm99UXbnktOp2a3G3rrxC77FmiXGYPCVxNtGaob
 iQhan9Y27LP6DbTFu+Vf5E2j8ChaDiMJhIsgzvfENx+YNxICuscNsvW2cUer6iIa2I+q
 7OSCI41MP1BHsshuu3LwSjoNbRMvDfNWHi7GnyqjJSmBV24nfRmJNHownmVtwIzn7sH8
 jPSxTXgB1ADuuAfRxQMIpHE9XjTaKyjX+KRElmGpy+cnU7kwVj1s5n2TZAJtQ+voa6ce
 8qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761730827; x=1762335627;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MpD8LIzdwjI+LuQZp/Ng/8pA8/EN8OIRE+rVL25JQdI=;
 b=SH0lva7GAgZUvsDRFoqpUaEVBCXhJtfKk2T++B2XfUBH1I6ABAoED5aN4V3IRU0tTG
 jphKKtCV7HWaFP7ngdV0G7MZXgxtS3EQiRyooBwoXH3k6sjMUvQ2osWuy0yUVbr+83FQ
 NeEg+o6eJoJEMDn7t0vCbjj+N/JLeNIZxmyvmwqHZkHm+3z8Qpu1CdLiSQvFczcDpcDj
 ovVlh9LE5pq2qkjuoB//jiPkKNY3DJVlj2aAU8y5LGWiKZ+B6YM27wL21VCDo2hcWPST
 mAZUIej6MaCGYMVblaC6aapTlQGDrsnsLVRG7sCGazHR1M1BNk437FFbKFxHhHmsIrrx
 ydGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxT1lhiz3fyVeakRxPahG6AsPW6ETGKZTukrq7/R+3OvTLphANi3Drsy3yppjFS6Rbi9nDIQMbRtg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXEp/U4pRv/sDkqV2Khk2fNcXld7pMWmFHdnU8UIB/4WVRxYZR
 Jg7DJ8xoxIkK7Rod6GyKZUkJYXN+YhSYVjFr/cLNMw6NMuRT8PFipjwqZzKiy7Efzo0=
X-Gm-Gg: ASbGnctyc32Mqa6SyX7aWm6sQkH017Mj/Z0ZTttmz/ZeMbEVVdi3KFMslMNxKhc+TvV
 OkDlestmd4tKHpKimw8TWAgTKOLv39npx+8CD0pHSwuUjbLnWB1lMkEQMNH5d/ZOes28OUQsCei
 7ThgYJNq9xFbKXNUVpelTPFv1oLg+QXFEt/RE6C+JnomfXUzwJPJ10Hl/kUr0lEI+6YGekFKHpw
 a2F9aMswDImIXBZRh7hv5ZK0dyfFEMZ/e4nFhhA+tZ0FdTW4FJcHCm0vJsejtbZirWpFPw/9PPn
 OddMMG1oUAhqREd+QQxZBp+0KbFJWIMrD6Nj2LfbriWWwj+yld1HZh5V0TdE4PS3oa06Cp06NzT
 VtaMh6VW8WzbKT3WjUThrYmOWc2cGwyOdfCHHDdGcHPEjLozA7itazTSnEunlMeleG0oROHxjDP
 C0H7vDWyHkMV8THzJQv9EuJZBHi5HYeK2WGQ/s+XuhnlWGcXhPKw==
X-Google-Smtp-Source: AGHT+IGnoupx3oh4ehhHWev6na4HNe4UnW8e6EUSqdzNJvKIIl1nuletM5oT3QUF4LOjqh0ytQBULQ==
X-Received: by 2002:a05:600c:1d1c:b0:475:da1a:5418 with SMTP id
 5b1f17b1804b1-4771e1c9da8mr18311955e9.1.1761730827171; 
 Wed, 29 Oct 2025 02:40:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0?
 ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb7e8sm25577436f8f.19.2025.10.29.02.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 02:40:26 -0700 (PDT)
Message-ID: <09cbf40d-6536-4bda-94d6-5b45a5746962@linaro.org>
Date: Wed, 29 Oct 2025 10:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
 <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
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
In-Reply-To: <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
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

On 10/28/25 20:52, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org wrote:
>> On 5/7/25 03:38, Jessica Zhang wrote:
>>> Filter out modes that have a clock rate greater than the max core clock
>>> rate when adjusted for the perf clock factor
>>>
>>> This is especially important for chipsets such as QCS615 that have lower
>>> limits for the MDP max core clock.
>>>
>>> Since the core CRTC clock is at least the mode clock (adjusted for the
>>> perf clock factor) [1], the modes supported by the driver should be less
>>> than the max core clock rate.
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - *crtc_clock -> *mode_clock (Dmitry)
>>> - Changed adjusted_mode_clk check to use multiplication (Dmitry)
>>> - Switch from quic_* email to OSS email
>>> - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
>>>    3 files changed, 39 insertions(+), 11 deletions(-)
>>>
>>
>> This test doesn't take in account if the mode is for a bonded DSI mode, which
>> is the same mode on 2 interfaces doubled, but it's valid since we could literally
>> set both modes separately. In bonded DSI this mode_clk must be again divided bv 2
>> in addition to the fix:
>> https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/
> 
>  From the docs:
> 
>           * Since this function is both called from the check phase of an atomic
>           * commit, and the mode validation in the probe paths it is not allowed
>           * to look at anything else but the passed-in mode, and validate it
>           * against configuration-invariant hardware constraints. Any further
>           * limits which depend upon the configuration can only be checked in
>           * @mode_fixup or @atomic_check.
> 
> Additionally, I don't think it is correct to divide mode_clk by two. In
> the end, the DPU processes the mode in a single pass, so the perf
> constrains applies as is, without additional dividers.

Sorry but this is not correct, the current check means nothing. If you
enable 2 separate DSI outputs or enable then in bonded mode, the DPU
processes it the same so the bonded doubled mode should be valid.

The difference between separate or bonded DSI DPU-wise is only the
synchronisation of vsyncs between interfaces.

So this check against the max frequency means nothing and should be
removed, but we should solely rely on the bandwidth calculation instead.

Neil

> 
> 
>> I'm trying to find a correct way to handle that, I have tried that:
>> ===========================><========================================
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 48c3aef1cfc2..6aa5db1996e3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> 

