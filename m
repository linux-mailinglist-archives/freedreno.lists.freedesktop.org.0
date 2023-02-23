Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6703B6A0063
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 02:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2803C10E029;
	Thu, 23 Feb 2023 01:02:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C8210E029
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 01:02:39 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f41so12338994lfv.13
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 17:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aUt5vaFiY/J1KCTPCZXw/K5A7JAcWXv/cCQm11f+4ro=;
 b=Ch0VGZ+U75F2E2CirtARLx8hxhiBsU9cDaTjVTNpYu9vh2l2DCG7Bc9gqLk46oANI7
 fIqWGQMuJate23sClgAK8oQXtn9mglLbZDjfFc0baMRRnOr7heAdaxBQ3hHXeC6O87iY
 ZNDSveoEo342j38hFdLuGYJDnx2VJpBIyFaMK9dFnQOdGigyCetkynJ42783vJUIT7mo
 9gDm5luZ1F3K29jwP3PAXMUiId+VXRqS7f0bUKwrYscPRnbbq/BCnC8ECMs4rKObX65l
 IhlZ33XQYeKM3p4RZ5GIS+TRj5O6UzFNeRTdZJqmT2ZTr7HJ97Vciy9BJN434H7anlGd
 qmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aUt5vaFiY/J1KCTPCZXw/K5A7JAcWXv/cCQm11f+4ro=;
 b=H09fTjqXbjwnd/vg4HPLdZKqsyyNblRQABFg9YF88tYtKRJr9YBdiRivXUkpsspxho
 OtyjkoBC8tIeciVlpc+jbivdnR0UZQGCH17YuhrSFAZuL+LDLTM8iig63vorscmkr9yT
 yepyR12jgOW6X0q+Zb9VxsFO+h3H084MsrkHULNlMsARGhktqUlV13exlsbEbjMPp+gZ
 YBfgUZwvuo6qBhLrRMSdBO3A7lCgKh9+pFVh493SB6ILb6+YCrnQwTUxv+1mFyLHXhnQ
 7Lihe9uc0KpDogSrgCvQby7wELJYZ8OXSLPJnzVdznnCINLF7skmGNz5EEijewTo4wh9
 fjVg==
X-Gm-Message-State: AO0yUKUgyaqESNNOg5DQrw7Ya7pp0I2nD+Q3HJbOTLWHpPEDhjDpEdD6
 DLaSc8CA8IQXC9NHvIrnrZdPcQ==
X-Google-Smtp-Source: AK7set/CK9Ov90Csl9IShFHW2HdeuqQpyirSA4ksEniWlvrsIbIQBmOQURoXaT/NNXkxEkm37+k0cA==
X-Received: by 2002:a05:6512:239b:b0:4a4:68b7:deab with SMTP id
 c27-20020a056512239b00b004a468b7deabmr4136958lfv.7.1677114157363; 
 Wed, 22 Feb 2023 17:02:37 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 y19-20020ac24213000000b004cb35b31b96sm2314974lfh.257.2023.02.22.17.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 17:02:36 -0800 (PST)
Message-ID: <8db1a336-1ba7-202b-8036-f3a522a96ea0@linaro.org>
Date: Thu, 23 Feb 2023 02:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-1-01021425781b@linaro.org>
 <6ff7aea6-6535-3f54-b8d2-718d9a38a1be@linaro.org>
 <180a33e7-d7b0-1b7f-9b91-20eb81d377dc@linaro.org>
 <c19b24d0-bb20-37ec-09dc-fb57aa8b4750@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c19b24d0-bb20-37ec-09dc-fb57aa8b4750@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 23.02.2023 00:16, Dmitry Baryshkov wrote:
> On 23/02/2023 00:40, Konrad Dybcio wrote:
>>
>>
>> On 22.02.2023 23:38, Dmitry Baryshkov wrote:
>>> On 22/02/2023 23:47, Konrad Dybcio wrote:
>>>> Some older GPUs (namely a2xx with no opp tables at all and a320 with
>>>> downstream-remnants gpu pwrlevels) used not to have OPP tables. They
>>>> both however had just one frequency defined, making it extremely easy
>>>> to construct such an OPP table from within the driver if need be.
>>>>
>>>> Do so and switch all clk_set_rate calls on core_clk to their OPP
>>>> counterparts.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c | 94 +++++++++++++++------------------
>>>>    drivers/gpu/drm/msm/msm_gpu.c           |  4 +-
>>>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c   |  2 +-
>>>>    3 files changed, 45 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index ce6b76c45b6f..9b940c0f063f 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -922,73 +922,50 @@ void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
>>>>                ring->id);
>>>>    }
>>>>    -/* Get legacy powerlevels from qcom,gpu-pwrlevels and populate the opp table */
>>>> -static int adreno_get_legacy_pwrlevels(struct device *dev)
>>>> -{
>>>> -    struct device_node *child, *node;
>>>> -    int ret;
>>>> -
>>>> -    node = of_get_compatible_child(dev->of_node, "qcom,gpu-pwrlevels");
>>>> -    if (!node) {
>>>> -        DRM_DEV_DEBUG(dev, "Could not find the GPU powerlevels\n");
>>>> -        return -ENXIO;
>>>> -    }
>>>> -
>>>> -    for_each_child_of_node(node, child) {
>>>> -        unsigned int val;
>>>> -
>>>> -        ret = of_property_read_u32(child, "qcom,gpu-freq", &val);
>>>> -        if (ret)
>>>> -            continue;
>>>> -
>>>> -        /*
>>>> -         * Skip the intentionally bogus clock value found at the bottom
>>>> -         * of most legacy frequency tables
>>>> -         */
>>>> -        if (val != 27000000)
>>>> -            dev_pm_opp_add(dev, val, 0);
>>>> -    }
>>>> -
>>>> -    of_node_put(node);
>>>> -
>>>> -    return 0;
>>>> -}
>>>> -
>>>> -static void adreno_get_pwrlevels(struct device *dev,
>>>> +static int adreno_get_pwrlevels(struct device *dev,
>>>>            struct msm_gpu *gpu)
>>>>    {
>>>> +    struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>        unsigned long freq = ULONG_MAX;
>>>>        struct dev_pm_opp *opp;
>>>>        int ret;
>>>>          gpu->fast_rate = 0;
>>>>    -    /* You down with OPP? */
>>>> -    if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
>>>> -        ret = adreno_get_legacy_pwrlevels(dev);
>>>> -    else {
>>>> -        ret = devm_pm_opp_of_add_table(dev);
>>>> -        if (ret)
>>>> -            DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
>>>> -    }
>>>> -
>>>> -    if (!ret) {
>>>> +    /* devm_pm_opp_of_add_table may error out but will still create an OPP table */
>>>> +    ret = devm_pm_opp_of_add_table(dev);
>>>> +    if (ret == -ENODEV) {
>>>> +        /* Special cases for ancient hw with ancient DT bindings */
>>>> +        if (adreno_is_a2xx(adreno_gpu)) {
>>>> +            dev_warn(dev, "Unable to find the OPP table. Falling back to 200 MHz.\n");
>>>> +            dev_pm_opp_add(dev, 200000000, 0);
>>>> +            gpu->fast_rate = 200000000;
>>>
>>> We can skip setting the fast_rate, dev_pm_opp_find_freq_floor below will get it from our freshly generated opp table.
>> It's not reached in this code path.
> 
> I see. I got lost in all the ifs. What do you think about turning it into the main code path, since after this code block we always have a valid OPP table?
Sounds good!

Konrad
> 
>>
>>>
>>>> +        } else if (adreno_is_a320(adreno_gpu)) {
>>>> +            dev_warn(dev, "Unable to find the OPP table. Falling back to 450 MHz.\n");
>>>> +            dev_pm_opp_add(dev, 450000000, 0);
>>>> +            gpu->fast_rate = 450000000;
>>>> +        } else {
>>>> +            DRM_DEV_ERROR(dev, "Unable to find the OPP table\n");
>>>> +            return -ENODEV;
>>>> +        }
>>>> +    } else if (ret) {
>>>> +        DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
>>>> +        return ret;
>>>> +    } else {
>>>>            /* Find the fastest defined rate */
>>>>            opp = dev_pm_opp_find_freq_floor(dev, &freq);
>>>> -        if (!IS_ERR(opp)) {
>>>> +
>>>> +        if (IS_ERR(opp))
>>>> +            return PTR_ERR(opp);
>>>> +        else {
>>>>                gpu->fast_rate = freq;
>>>>                dev_pm_opp_put(opp);
>>>>            }
>>>>        }
>>>>    -    if (!gpu->fast_rate) {
>>>> -        dev_warn(dev,
>>>> -            "Could not find a clock rate. Using a reasonable default\n");
>>>> -        /* Pick a suitably safe clock speed for any target */
>>>> -        gpu->fast_rate = 200000000;
>>>> -    }
>>>> -
>>>>        DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
>>>> +
>>>> +    return 0;
>>>>    }
>>>>      int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
> 
> 
