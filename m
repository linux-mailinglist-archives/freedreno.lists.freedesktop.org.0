Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE356D860
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 10:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36118B8F3;
	Mon, 11 Jul 2022 08:40:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CEB18B885
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 08:40:30 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f39so7542717lfv.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yHvdNmX8cwqCqH9wxQy8kt6GWFeeNK1eN99DTgUy0Bk=;
 b=HK/wlAHnZtrYUvscxl/4v9EvKJ4m+uwt5yBONVp+CoVH9hw54jrOWBU9GKHNMMjCAk
 XLXp1viXF3DhYFqk0z4/R+mlDOgqIZRLwrTFr5uc4kzGUdec4xqTagNMabEJ5kQxxTHO
 1FG1gO99AHs9QW80FOs7xlufqcB/KwZj1u4U3A/aq7GTqAOLhYt5R+Fu8dvs1a4XOipT
 MnXyfWPqs8vJiUe96+5RWMA3y+zzG8skJM4aiRMoXe0TvtCblZbsTrGoE7LcJnCO1DcU
 E2m7Bcw/4LiqpHP2z60CnBQ8EUcrcmuAXtt4X9YzsBXwwOoSB2C00y22fG7OLkA3U6P5
 g22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yHvdNmX8cwqCqH9wxQy8kt6GWFeeNK1eN99DTgUy0Bk=;
 b=Lzxwh6nbhU/14nMDMEepl7AVsV1vZ0m3ZV4U03FBedjZfzowNi4nyA3SARBRPTmavU
 xqd6D71Pbi1wQR2tIswNUVA0fQzI2avVu8ea4/WcqOo427RwXkEApqtPbqYiFGefDZ6U
 jnw5LdIHNMKEzTAzyvKAQvTmne1cXMY580uBjnUjkbzQXZeg4HAkogyaErnGnTuS8Gw/
 38VTK3saoCcvP52ObKeQTDTQSzfaeqW1AU6mK7fIn8N+05N+J+NTfdzsRBHKzlsWc9Rd
 9fbyr89q81E1NKvVTlyrXfpd02XS2lROkUaYK+8y58Qxnl7zUpukMP2FRtMEiByvltSh
 kIGA==
X-Gm-Message-State: AJIora+hGBFB7yUJDGIX4fjXVbf9dtCqOW7H4ZBYedoIp2f133ggLtzC
 AUT+6gYBWi79pcumq5yXdMdqWA==
X-Google-Smtp-Source: AGRyM1s0qou7Yi6cagSjEwRSsglNTS0WLIizq0UPV9g/NKHdLl0xZBL1KPkY2d0+WVAVkxIAwkxSIw==
X-Received: by 2002:a05:6512:b1c:b0:481:618f:ec9 with SMTP id
 w28-20020a0565120b1c00b00481618f0ec9mr11425375lfu.217.1657528828279; 
 Mon, 11 Jul 2022 01:40:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05651205cf00b00488d0e38283sm1404426lfo.153.2022.07.11.01.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 01:40:27 -0700 (PDT)
Message-ID: <fa238328-37b7-9898-179a-719281248a97@linaro.org>
Date: Mon, 11 Jul 2022 11:40:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd
 <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
 <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
 <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
 <a7f2e673-a732-d06c-e17e-746cedf42c7a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a7f2e673-a732-d06c-e17e-746cedf42c7a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/9] dt-bindings: msm/dp: drop extra p1
 region
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/07/2022 22:47, Kuogee Hsieh wrote:
> 
> On 7/8/2022 12:38 PM, Abhinav Kumar wrote:
>> + kuogee
>>
>> On 7/8/2022 12:27 PM, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2022-07-07 20:46:43)
>>>> On 08/07/2022 04:28, Stephen Boyd wrote:
>>>>> Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
>>>>>> The p1 region was probably added by mistake, none of the DTS files
>>>>>> provides one (and the driver source code also doesn't use one). 
>>>>>> Drop it
>>>>>> now.
>>>>>
>>>>> Yes, looks like the driver doesn't use it.
>>>>>
>>>>>>
>>>>>> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 
>>>>>> 1 -
>>>>>>    1 file changed, 1 deletion(-)
>>>>>>
>>>>>> diff --git 
>>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> index 94bc6e1b6451..d6bbe58ef9e8 100644
>>>>>> --- 
>>>>>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> +++ 
>>>>>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> @@ -29,7 +29,6 @@ properties:
>>>>>>          - description: aux register block
>>>>>>          - description: link register block
>>>>>>          - description: p0 register block
>>>>>> -      - description: p1 register block
>>>>>
>>>>> The p1 registers exist on sc7180. They start where the example starts,
>>>>> at 0xae91400.
>>>>
>>>> Do they exist on e.g. sc7280? In other words, should we add the region
>>>> to the DTS? For now I'm going to mark it as optional.
>>>>
>>>
>>> Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
>>> can you confirm?
>>
>> P1 block does exist on sc7280 and yes its address is same as the 
>> address mentioned in sc7180. So its not a typo.
>>
>> Yes, we are not programming this today but I would prefer to keep this 
>> as optional.
>>
>> I did sync up with Kuogee on this change this morning, we will check a 
>> few things internally on the P1 block's usage as to which use-cases we 
>> need to program it for and update here.
>>
> P1 block is for dp MST application.  This allow two dp streams can be 
> mux into same DP phy.
> 
> We should keep it since we may support MST later.

Thanks for the confirmation. Next question, does it exist on eDP 
controllers?

> 
>> The idea behind having this register space listed in the yaml is thats 
>> how the software documents have the blocks listed so dropping P1 block 
>> just because its unused seemed wrong to me. Optional seems more 
>> appropriate.
>>
>> Thanks
>>
>> Abhinav


-- 
With best wishes
Dmitry
