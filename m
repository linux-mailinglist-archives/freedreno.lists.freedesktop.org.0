Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386A74DCEC
	for <lists+freedreno@lfdr.de>; Mon, 10 Jul 2023 20:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FD510E2BD;
	Mon, 10 Jul 2023 18:00:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC2D10E185
 for <freedreno@lists.freedesktop.org>; Mon, 10 Jul 2023 18:00:55 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b6afc1ceffso78435461fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Jul 2023 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689012052; x=1691604052;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dPczIFUT5swcmN5pPJIcNlKf/rMlVyDjhcPHAsFTnXg=;
 b=R5D0I9Ir5SJAEDqpFN2S2SzstQAB5rTv/SjvJKvIqEDQYGzRbO9SgbV0OT3gDos6oO
 dCBDBnCZ/YuIzEmD5J9EG83fcQnUdDpfVn7O06RjZlztrWnwRtBM5VyZwCo6wDlS3FBI
 wxht3EPVzkNUKV71SvDM9NqGwa+GC4HFmeNrQVDX2TEKL/xS8mhWKxBLnoHQUhjOf7zd
 Mt8wmEO9RCryQH+mxNwIFOoqCtGhmKttA/SMX5oqxU8WrbS5yywTkKNkx+6bqshngfY1
 yLL5X0gq8F9RiJO8MElyZnebyCjLw0M6Uo/qCMP7uQ0SdBk+BD/i7IKIBhHUqKxx5md1
 fUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689012052; x=1691604052;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dPczIFUT5swcmN5pPJIcNlKf/rMlVyDjhcPHAsFTnXg=;
 b=W4ciF0NLNQXoV6lSjIbkQoocZ+xYvjqcoI60HjtcRoFRcu8be1Z4YSslm+ZU0KbdTW
 9t+I2yLswvj+yh7yIsi5dO+c6nsLEuJ4eijh68lKk3BkureHN058+9iwsbQ17Y4i6l2y
 Oi26z0PyzEkzJq134KrXJoOFHMqCrGs+9KCnEtNsWMEkjSKlvF93Y5QXRBhFkxHxgTQD
 ZHLLz4g5zE3TtvSB1CwVpkA5d/78DvQ4yyWh4GgVz4r7zI70Y7ePxiCWgW1p8jCXeRsP
 Yr68mXXH6J6XPHW2CMgeBLsf+1iHokVz8GvaekCM26xFco7yne5YFQQOd0XHHHj5Dz0Z
 tF3w==
X-Gm-Message-State: ABy/qLaQ1ofG1X0l3a4aGndMjxKqtuuuIo9I0LF8KKUiUm0jzxuVTpFQ
 SN9kHB4dLvvfxI8EwpUgYzcACQ==
X-Google-Smtp-Source: APBJJlFmZm9+86iGEXvex6hgMwhGxAlxtSK/mzvgG+u333wcjJZCS7fwoTcXY4jPp/goq79ZGQNU+g==
X-Received: by 2002:a2e:880a:0:b0:2b6:cc93:4ecb with SMTP id
 x10-20020a2e880a000000b002b6cc934ecbmr12115534ljh.43.1689012052149; 
 Mon, 10 Jul 2023 11:00:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a2e9011000000b002b6c92fa161sm74538ljg.61.2023.07.10.11.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 11:00:51 -0700 (PDT)
Message-ID: <ebafc2ec-947f-0c9f-4ac3-14f66468b63c@linaro.org>
Date: Mon, 10 Jul 2023 21:00:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-2-git-send-email-quic_khsieh@quicinc.com>
 <fc5501cf-c335-81f7-1ad7-26fdc1b6922d@linaro.org>
 <72cb729b-a9d3-3e5b-c70a-0761f47a6779@quicinc.com>
 <CAA8EJpqKVBKRpFs=sS2rwrJpDP22sNrd00kCYm-b_ZB96O=s5g@mail.gmail.com>
 <10de9309-19f9-18af-3e01-1cda7d76e73e@quicinc.com>
 <8a8b24ea-1abf-922c-439e-50a27cf2e5fa@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8a8b24ea-1abf-922c-439e-50a27cf2e5fa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v1 1/5] drm/msm/dp: remove pm_runtime_xxx()
 from dp_power.c
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_jesszhan@quicinc.com, airlied@gmail.com, andersson@kernel.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/07/2023 20:25, Kuogee Hsieh wrote:
> 
> On 7/9/2023 1:32 PM, Abhinav Kumar wrote:
>>
>>
>> On 7/9/2023 11:00 AM, Dmitry Baryshkov wrote:
>>> On Sun, 9 Jul 2023 at 20:22, Abhinav Kumar 
>>> <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 7/7/2023 5:06 PM, Dmitry Baryshkov wrote:
>>>>> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>>>>>> Since both pm_runtime_resume() and pm_runtime_suspend() are not
>>>>>> populated at dp_pm_ops. Those pm_runtime_get/put() functions within
>>>>>> dp_power.c will not have any effects in addition to increase/decrease
>>>>>> power counter.
>>>>>
>>>>> Lie.
>>>>>
>>>>
>>>> Even if the commit text is incorrect, review comments like this are not
>>>> helping the patch nor the author and will just get ignored anyway.
>>>
>>> The review comment might be overreacting, excuse me. I was really
>>> impressed by the commit message, which contradicts the basic source
>>> code. pm_runtime_get() does a lot more than just increasing the power
>>> counter.
>>>
>>
>> It says within dp_power.c. Nonetheless, please let us know what is 
>> missing in the context of this patch like Bjorn did to make it an 
>> effective review and we can correct it. In its current form, the 
>> review comment is adding no value.
>>
> I am new in pm.
> 
> Any recommendation to revise this commit test?

I'd say, squash patches 1 and 2 and then state in the commit message 
that you are changing pm_runtime code paths because you want to power up 
the device from the runtime callbacks rather than just waking up the 
device in the power up path.

Generally it is much easier to justify changing from A to B rather than 
just dropping A and then adding B.

> 
>>>>>> Also pm_runtime_xxx() should be executed at top
>>>>>> layer.
>>>>>
>>>>> Why?
>>>>>
>>>>
>>>> I guess he meant to centralize this around dp_display.c. Will elaborate
>>>> while posting the next rev.
>>>>
>>>>>>
>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/dp/dp_power.c | 9 ---------
>>>>>>    1 file changed, 9 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c
>>>>>> b/drivers/gpu/drm/msm/dp/dp_power.c
>>>>>> index 5cb84ca..ed2f62a 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>>>>>> @@ -152,8 +152,6 @@ int dp_power_client_init(struct dp_power 
>>>>>> *dp_power)
>>>>>>        power = container_of(dp_power, struct dp_power_private, 
>>>>>> dp_power);
>>>>>> -    pm_runtime_enable(power->dev);
>>>>>> -
>>>>>>        return dp_power_clk_init(power);
>>>>>>    }
>>>>>> @@ -162,8 +160,6 @@ void dp_power_client_deinit(struct dp_power
>>>>>> *dp_power)
>>>>>>        struct dp_power_private *power;
>>>>>>        power = container_of(dp_power, struct dp_power_private, 
>>>>>> dp_power);
>>>>>> -
>>>>>> -    pm_runtime_disable(power->dev);
>>>>>>    }
>>>>>>    int dp_power_init(struct dp_power *dp_power)
>>>>>> @@ -173,11 +169,7 @@ int dp_power_init(struct dp_power *dp_power)
>>>>>>        power = container_of(dp_power, struct dp_power_private, 
>>>>>> dp_power);
>>>>>> -    pm_runtime_get_sync(power->dev);
>>>>>> -
>>>>>>        rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
>>>>>> -    if (rc)
>>>>>> -        pm_runtime_put_sync(power->dev);
>>>>>>        return rc;
>>>>>>    }
>>>>>> @@ -189,7 +181,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>>>>>>        power = container_of(dp_power, struct dp_power_private, 
>>>>>> dp_power);
>>>>>>        dp_power_clk_enable(dp_power, DP_CORE_PM, false);
>>>>>> -    pm_runtime_put_sync(power->dev);
>>>>>>        return 0;
>>>>>>    }
>>>>>
>>>
>>>
>>>

-- 
With best wishes
Dmitry

