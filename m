Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB90A9F1261
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 17:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8916210E25B;
	Fri, 13 Dec 2024 16:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OUMdlwIT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2931410E25B
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 16:41:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso7535365e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 08:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734108061; x=1734712861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UhYZQe35crokcavC5cBfXzDPXtIKiULqcKxoeLDgk88=;
 b=OUMdlwITe+lG7qLcsUCoe7KLhRLRVAErEz3PDw2Nl/F995S2UL3g+w651abWPvBmXF
 h+S5X87Pnnh+gBDeLbABooPA8rf3r/l2wUAS3/Lpob3J2DbFLVJIIJEVxlxBrgSe3SMP
 mc8QgzrfcO9kEjNcOHxrfu1yGjthG97CDa2Rwa1JhCcVBOkALil5s6jW8FJSq1+YGuuO
 9ZOHa7g+j70EtrGzgqs+sKjZSHVVG6ZBAiGRf9HqW9ao1WvL/vWISnqo53QYFy9qad+O
 bksKpOj5djZdnz5PBEBkjEjmrF0PK4L7LUTg7VYaMlXvdmTfv+j8wEh2jM0KnhofVFdc
 XkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734108061; x=1734712861;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UhYZQe35crokcavC5cBfXzDPXtIKiULqcKxoeLDgk88=;
 b=d587LzU/cgUknJ+ClIdMgVTD14qsZOTDGIcEiIPXwC55MiNNSSnUQv4spVjJ7iO4dr
 M+LE50Q+A/xjDMu6kIXmFfwwr/de+TFJlmHbaV4jhkCtnxV52hi2RqgDzwi9dvAhj22E
 viGSBm+pVdbtY4G4PFXMrxAt8g3rtoc5wVSIaqx5q8sE2scpUEv+zCV4nanPGprWhUnl
 77utmS0RZbTX+ajJHSSJpO8kqe23Gy1EwpDcUeDL0tYcg8O0Kx8yJA0npjUtf1Jg/pOU
 DYk2M94X2aEWNLYo2Okhs3LDH0WBav+2soP00RfNIJL3QLjaNDDz4LpkR8Zeuue22r2x
 QYGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcrDglyh3M8z33LuPGpLu4Hr8kUH4GOua2DCjgT2l3XqAtAk8H8wtxxHJ7C10qp8Du1qwN1LvIWvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB5h69Yx24Fse15atKVyoDcI950Rbrr+8GRTxY6wXvhxtbh6+i
 Z3nA0+ZezOXqvONrYw0K6kMGHXAFI7Z/OncHZGlG58uWbLrzQDTMuVU/iIOu0yk=
X-Gm-Gg: ASbGncub+F3e9NzMlwGWOnn4r5pgP11LjJuMe4RniUPKV26qjHJ/yPdwnROrdglejpS
 ZbCQurgkEgvyiFlsDRzLtL/m70rWpMGWeaf39dqznYnsnZLMdYh6kW96+kl143nJCc1OGiLFjVw
 RksrBtdURWzvLOVp4hivy6Sq5jRRMevBVuddNGu2bh0AgJPnSqaTmgo8qoG5ASS1XTpJiYIOqNm
 booiURRMDZ6e9x1Lp4ECNJphh/j9724ETCl93xdE7vfPWDjJkYnoLzT13BcEgPAsmytIAuiqHxL
 LldXlIOYpMaP8dcJBQvTm1ak51n8hGnw5g==
X-Google-Smtp-Source: AGHT+IHhteapVHrOhIDQhnxAloCB38K7IQFWTgx0ajDWz0Pt0FetAnPdpqhRuEk0FUUisVsWd+Ja8A==
X-Received: by 2002:a05:600c:1e8a:b0:434:f5d1:f10f with SMTP id
 5b1f17b1804b1-4362aa52fa7mr31133025e9.17.1734108060613; 
 Fri, 13 Dec 2024 08:41:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70?
 ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362527ecc3sm56170105e9.0.2024.12.13.08.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 08:41:00 -0800 (PST)
Message-ID: <9dcf26e5-1c25-4a18-ab01-58ddf3fbd607@linaro.org>
Date: Fri, 13 Dec 2024 17:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
 <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
 <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
 <c2d8f443-5876-4293-8d2b-ecd13eaf8285@oss.qualcomm.com>
 <268d67c0-efdf-4ad4-b5fe-5b4f04e73131@linaro.org>
 <0d4d3ca3-ec8a-4e85-9838-a2bf1e07e872@oss.qualcomm.com>
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
In-Reply-To: <0d4d3ca3-ec8a-4e85-9838-a2bf1e07e872@oss.qualcomm.com>
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

On 13/12/2024 17:31, Konrad Dybcio wrote:
> On 13.12.2024 5:28 PM, neil.armstrong@linaro.org wrote:
>> On 13/12/2024 16:37, Konrad Dybcio wrote:
>>> On 13.12.2024 2:12 PM, Akhil P Oommen wrote:
>>>> On 12/13/2024 3:07 AM, Neil Armstrong wrote:
>>>>> On 12/12/2024 21:21, Konrad Dybcio wrote:
>>>>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>>>>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>>>>>>> along the Frequency and Power Domain level, until now we left the OPP
>>>>>>> core scale the OPP bandwidth via the interconnect path.
>>>>>>>
>>>>>>> In order to enable bandwidth voting via the GPU Management
>>>>>>> Unit (GMU), when an opp is set by devfreq we also look for
>>>>>>> the corresponding bandwidth index in the previously generated
>>>>>>> bw_table and pass this value along the frequency index to the GMU.
>>>>>>>
>>>>>>> The GMU also takes another vote called AB which is a 16bit quantized
>>>>>>> value of the floor bandwidth against the maximum supported bandwidth.
>>>>>>>
>>>>>>> The AB is calculated with a default 25% of the bandwidth like the
>>>>>>> downstream implementation too inform the GMU firmware the minimal
>>>>>>> quantity of bandwidth we require for this OPP.
>>>>>>>
>>>>>>> Since we now vote for all resources via the GMU, setting the OPP
>>>>>>> is no more needed, so we can completely skip calling
>>>>>>> dev_pm_opp_set_opp() in this situation.
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 ++++++++++++++++++++++++
>>>>>>> +++++++++--
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>>>>>     4 files changed, 46 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>>>>>>> msm/adreno/a6xx_gmu.c
>>>>>>> index
>>>>>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>>> struct dev_pm_opp *opp,
>>>>>>>                    bool suspended)
>>>>>>>     {
>>>>>>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>>>>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>>>>         struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>>>>         u32 perf_index;
>>>>>>> +    u32 bw_index = 0;
>>>>>>>         unsigned long gpu_freq;
>>>>>>>         int ret = 0;
>>>>>>>     @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>>> struct dev_pm_opp *opp,
>>>>>>>             if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>>>>>                 break;
>>>>>>>     +    /* If enabled, find the corresponding DDR bandwidth index */
>>>>>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>>>>>
>>>>>> if (gmu->nr_gpu_bws)
>>>>>
>>>>> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the
>>>>> "off" state)
>>>>>
>>>>>>
>>>>>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>>>>>> +
>>>>>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index+
>>>>>>> +) {
>>>>>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>>>>>> +                break;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        /* Vote AB as a fraction of the max bandwidth */
>>>>>>> +        if (bw) {
>>>>>>
>>>>>> This seems to only be introduced with certain a7xx too.. you should
>>>>>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported
>>>>>
>>>>> Good point
>>>>
>>>> No no. Doing this will trigger some assert in pre-A750 gmu firmwares. We
>>>> learned it the hard way. No improvisation please. :)
>>>
>>> We shouldn't be sending that AB data to firmware that doesn't expect
>>> it either too, though..
>>
>> Well we don't !
> 
> The code in the scope that I quoted above does that

No it doesn't, if the proper bcms are not declared in the gpu_info, it won't

Neil

> 
> see the full explanation here
> 
> https://git.codelinaro.org/clo/le/platform/vendor/qcom/opensource/graphics-kernel/-/commit/6026c31a54444b712f7ea36ac1aafaaeef07fa4e
> 
> Konrad

