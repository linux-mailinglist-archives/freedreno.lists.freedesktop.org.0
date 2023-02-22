Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD369FF51
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 00:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCC710E1F8;
	Wed, 22 Feb 2023 23:17:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448B310E1F8
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 23:16:59 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id r27so10008260lfe.10
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 15:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PHL2cw/bX+BkntqQWOvSV23wPQnaAnpjYGrDTrF6lOM=;
 b=hmtniHM/e6IQ/dcYidKaXH1RTZKaIImwwZLDYd93ET+HrclAIGiB24iaJkBiJLjbob
 DXxwpTlvNolhL0IA0HuHAr+4tAQOPWfGiKlYQmYEodufgBD6CjZgFBO0PASacfeKds8u
 +JBq1FCECW5BQMSXzliWm2YskyE85RM9thcNPc9OSVjxN3AvVOkfx7nl76mesNjkTnrK
 GQY16vxecub+M30EGGMa8nw6SbjcSU8zRvQhvnrgxYq9ekwDG2lL9dt7BHw9hEnck0lq
 H1uvahsliOMSbxk7LgWjC8Y0Og6P5j2nCE0tmxAQRxX/8RIAb3qnYtJx/vevWWHoksB7
 HUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PHL2cw/bX+BkntqQWOvSV23wPQnaAnpjYGrDTrF6lOM=;
 b=rmIEmot9UxrffRdUBJSDfu1sBM1nnZPvHH6LlLBjYFeBTAWnM5T8VpGHASSel9vzhh
 yWAXsWAeWLQq+ifaimdjqUX/ry30AZdP1GMLuAE48WVNQJGe6ntL96fw2nw1YxINV5jk
 Kuj5USec9/bc0A7Qy2ACpQhyyoW5yRmh2PvP0w6V8ntys2xbdfYdMNsCIVx/FP++NT0Q
 O69MYaQ8t3sdYZrX/mtfWz5HOw/ewNLZRKNvfvfiM5lYWhFWteD/uGF/xaA9wkgu4qKs
 va6aXijPgXA36lL4xX6QOHM7m4i8vmYzKRHZDhWKg5OmpcqNbfdm13KWkhznTY/7x3o1
 ZZPA==
X-Gm-Message-State: AO0yUKUOCibJ/a6KolqkC3dmLbTJKzkO/eD7kMXwAocHmg7lyL+xRRR4
 cHztT9P6W/hclJz3RKjpkTnzpA==
X-Google-Smtp-Source: AK7set+eOaU77sSzyeaXsNwEUg6b7bnTDs2RXQpBAlvraDnK/bWREwZLuYftGfySz6ikRjHWZdZpwA==
X-Received: by 2002:ac2:560f:0:b0:4d5:c96f:f7c7 with SMTP id
 v15-20020ac2560f000000b004d5c96ff7c7mr2975566lfd.23.1677107817480; 
 Wed, 22 Feb 2023 15:16:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a056512051600b004cafa01ebbfsm298980lfb.101.2023.02.22.15.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 15:16:57 -0800 (PST)
Message-ID: <c19b24d0-bb20-37ec-09dc-fb57aa8b4750@linaro.org>
Date: Thu, 23 Feb 2023 01:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-1-01021425781b@linaro.org>
 <6ff7aea6-6535-3f54-b8d2-718d9a38a1be@linaro.org>
 <180a33e7-d7b0-1b7f-9b91-20eb81d377dc@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <180a33e7-d7b0-1b7f-9b91-20eb81d377dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/adreno: Use OPP for every GPU
 generation
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/02/2023 00:40, Konrad Dybcio wrote:
> 
> 
> On 22.02.2023 23:38, Dmitry Baryshkov wrote:
>> On 22/02/2023 23:47, Konrad Dybcio wrote:
>>> Some older GPUs (namely a2xx with no opp tables at all and a320 with
>>> downstream-remnants gpu pwrlevels) used not to have OPP tables. They
>>> both however had just one frequency defined, making it extremely easy
>>> to construct such an OPP table from within the driver if need be.
>>>
>>> Do so and switch all clk_set_rate calls on core_clk to their OPP
>>> counterparts.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c | 94 +++++++++++++++------------------
>>>    drivers/gpu/drm/msm/msm_gpu.c           |  4 +-
>>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c   |  2 +-
>>>    3 files changed, 45 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> index ce6b76c45b6f..9b940c0f063f 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -922,73 +922,50 @@ void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
>>>                ring->id);
>>>    }
>>>    -/* Get legacy powerlevels from qcom,gpu-pwrlevels and populate the opp table */
>>> -static int adreno_get_legacy_pwrlevels(struct device *dev)
>>> -{
>>> -    struct device_node *child, *node;
>>> -    int ret;
>>> -
>>> -    node = of_get_compatible_child(dev->of_node, "qcom,gpu-pwrlevels");
>>> -    if (!node) {
>>> -        DRM_DEV_DEBUG(dev, "Could not find the GPU powerlevels\n");
>>> -        return -ENXIO;
>>> -    }
>>> -
>>> -    for_each_child_of_node(node, child) {
>>> -        unsigned int val;
>>> -
>>> -        ret = of_property_read_u32(child, "qcom,gpu-freq", &val);
>>> -        if (ret)
>>> -            continue;
>>> -
>>> -        /*
>>> -         * Skip the intentionally bogus clock value found at the bottom
>>> -         * of most legacy frequency tables
>>> -         */
>>> -        if (val != 27000000)
>>> -            dev_pm_opp_add(dev, val, 0);
>>> -    }
>>> -
>>> -    of_node_put(node);
>>> -
>>> -    return 0;
>>> -}
>>> -
>>> -static void adreno_get_pwrlevels(struct device *dev,
>>> +static int adreno_get_pwrlevels(struct device *dev,
>>>            struct msm_gpu *gpu)
>>>    {
>>> +    struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>        unsigned long freq = ULONG_MAX;
>>>        struct dev_pm_opp *opp;
>>>        int ret;
>>>          gpu->fast_rate = 0;
>>>    -    /* You down with OPP? */
>>> -    if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
>>> -        ret = adreno_get_legacy_pwrlevels(dev);
>>> -    else {
>>> -        ret = devm_pm_opp_of_add_table(dev);
>>> -        if (ret)
>>> -            DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
>>> -    }
>>> -
>>> -    if (!ret) {
>>> +    /* devm_pm_opp_of_add_table may error out but will still create an OPP table */
>>> +    ret = devm_pm_opp_of_add_table(dev);
>>> +    if (ret == -ENODEV) {
>>> +        /* Special cases for ancient hw with ancient DT bindings */
>>> +        if (adreno_is_a2xx(adreno_gpu)) {
>>> +            dev_warn(dev, "Unable to find the OPP table. Falling back to 200 MHz.\n");
>>> +            dev_pm_opp_add(dev, 200000000, 0);
>>> +            gpu->fast_rate = 200000000;
>>
>> We can skip setting the fast_rate, dev_pm_opp_find_freq_floor below will get it from our freshly generated opp table.
> It's not reached in this code path.

I see. I got lost in all the ifs. What do you think about turning it 
into the main code path, since after this code block we always have a 
valid OPP table?

> 
>>
>>> +        } else if (adreno_is_a320(adreno_gpu)) {
>>> +            dev_warn(dev, "Unable to find the OPP table. Falling back to 450 MHz.\n");
>>> +            dev_pm_opp_add(dev, 450000000, 0);
>>> +            gpu->fast_rate = 450000000;
>>> +        } else {
>>> +            DRM_DEV_ERROR(dev, "Unable to find the OPP table\n");
>>> +            return -ENODEV;
>>> +        }
>>> +    } else if (ret) {
>>> +        DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
>>> +        return ret;
>>> +    } else {
>>>            /* Find the fastest defined rate */
>>>            opp = dev_pm_opp_find_freq_floor(dev, &freq);
>>> -        if (!IS_ERR(opp)) {
>>> +
>>> +        if (IS_ERR(opp))
>>> +            return PTR_ERR(opp);
>>> +        else {
>>>                gpu->fast_rate = freq;
>>>                dev_pm_opp_put(opp);
>>>            }
>>>        }
>>>    -    if (!gpu->fast_rate) {
>>> -        dev_warn(dev,
>>> -            "Could not find a clock rate. Using a reasonable default\n");
>>> -        /* Pick a suitably safe clock speed for any target */
>>> -        gpu->fast_rate = 200000000;
>>> -    }
>>> -
>>>        DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
>>> +
>>> +    return 0;
>>>    }
>>>      int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,


-- 
With best wishes
Dmitry

