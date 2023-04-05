Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CC96D71E8
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 03:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF07C10E04C;
	Wed,  5 Apr 2023 01:17:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD71B10E31A
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 01:17:54 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bx10so17453159ljb.8
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680657472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C6c5Q00PYl1cs2j8xO2m+HTtSG98Ekq0EFzsjgb6M2k=;
 b=ck41CZCfXU305YDXGRhjs7iF7zTXZ3byo52XKIytgFLn/alwIyIYDUNl999++R/PYl
 UvYndhBlsJLhiFHMI6Xwhhz2ElYW86jfxwHj28YPwgxHJGobGNFrm1nLOaKZrpi56hPk
 2fXpj2yHTre3bauEDYsByvvr4YNOomJHrBuMQNB/DI0wBHkmToT7n5u+mxBAZH0waB0q
 t6WA+Fc23I/4cC9ZFdjO3TIIA7GOMOduZVZdHPTs3I1pMb1C4ik0z+8LTmq1GKEiuSVL
 ajGIKjLWPFw8K57r39QHuTmnbf0a42U0gNBUSv1xiMhuqwcJszqi8/GAv4D0e+dHVCva
 XCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680657472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C6c5Q00PYl1cs2j8xO2m+HTtSG98Ekq0EFzsjgb6M2k=;
 b=rCbIA3/m/uNwH9nv9Qt+xqpwR6ERGDVFPM2Xq4OAw24Gvj1vvypC9xfl62CCLW4Mvd
 kPFOTNNMKik1Giu5pWXrRM9wmxQLyyGx88vw1t+Ot6NCNJgeBaqDpOSB1N3Wonn1Vqds
 wV6YI6uUZ4JuYydx8Qqx4jvG3u3ATkEfR1eWZ5GGN/EAO7XCKdaX9DuEHUvfLFRxqPQy
 Cq9UKLQpgUq0v1EF0aJ+rw33wZe60YDB4bpeqnfoIjsXCVNOaSZ8UxfXadZheL2SM4DF
 f64ynRC9doPCJ07vE04gRuwd5qosg7UWrgReAEzLyDejKx8FTBq9umSB+3Oli6A7DThL
 1reQ==
X-Gm-Message-State: AAQBX9fS48VvFn2f94FDqV5B8ru9CEVQ9CW6t+ycrt8dt9+rtiJBa4NS
 +lTZ5FFxSBWsysjhNS0xLLzm+w==
X-Google-Smtp-Source: AKy350ZZDF61ZwFGdh/LMrP2ut/UZ/LYxn0WEXRnqLuPKV1CzBK04Oy3xs7Vz8EyEnOf3jzJIPZA7A==
X-Received: by 2002:a2e:b0c5:0:b0:298:a7a7:47e with SMTP id
 g5-20020a2eb0c5000000b00298a7a7047emr1515201ljl.19.1680657472598; 
 Tue, 04 Apr 2023 18:17:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a2e9f13000000b0029a1ccdc560sm2590008ljk.118.2023.04.04.18.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 18:17:52 -0700 (PDT)
Message-ID: <dde4685b-2480-5973-b4c9-814fff6c952a@linaro.org>
Date: Wed, 5 Apr 2023 04:17:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
 <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
 <6948fe29-af08-9164-4cec-a6564dbb1e1a@linaro.org>
 <6b672c6b-5d89-a89d-d8ff-0cd4ec5b7961@quicinc.com>
 <397da2da-2e76-3565-6416-568397cf32c1@linaro.org>
 <7d86d29d-b13c-fc3b-9074-e017ca168999@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7d86d29d-b13c-fc3b-9074-e017ca168999@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK
 for sm8450's ctl_0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/04/2023 04:00, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 5:43 PM, Dmitry Baryshkov wrote:
>> On 05/04/2023 03:39, Abhinav Kumar wrote:
>>>
>>>
>>> On 4/4/2023 5:33 PM, Dmitry Baryshkov wrote:
>>>> On 05/04/2023 01:12, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>>>>>> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL 
>>>>>> blocks,
>>>>>> so switch it to CTL_SC7280_MASK too.
>>>>>>
>>>>>> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add 
>>>>>> support
>>>>>> for SM8450") had all (relevant at that time) bit spelled 
>>>>>> individually.
>>>>>> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
>>>>>> despite being a mismerge, correctly changed all other CTL entries 
>>>>>> to use
>>>>>> CTL_SC7280_MASK, except CTL_0.
>>>>>>
>>>>>
>>>>> I think having it spelled individually is better. If we start using 
>>>>> one chipset's mask for another, we are again going down the same 
>>>>> path of this becoming one confused file.
>>>>>
>>>>> So, even though I agree that 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 
>>>>> to hw catalog") corrected the mask to re-use sc7280, with the 
>>>>> individual catalog file, its better to have it separate and spelled 
>>>>> individually.
>>>>>
>>>>> This change is not heading in the direction of the rest of the series.
>>>>
>>>> I didn't create duplicates of all the defines. This is done well in 
>>>> the style of patch37. I'm not going to add all per-SoC feature masks.
>>>>
>>>
>>> Yes, I was actually going to comment even on patch 37.
>>>
>>> We are again trying to generalize a CTL's caps based on DPU version, 
>>> the same mistake which led us down this path.
>>>
>>> So today you have CTL_DPU_0_MASK , CTL_DPU_5_MASK , CTL_DPU_7_MASK 
>>> and CTL_DPU_9_MASK and this builds on an assumption that you can get 
>>> 5 by ORing ACTIVE_CFG with 0.
>>>
>>> +#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | \
>>> +            BIT(DPU_CTL_ACTIVE_CFG))
>>> +
>>>
>>> This is again moving towards that problematic pattern.
>>>
>>> Why dont we stick to CTL features individually spelling it then work 
>>> towards generalizing as we discussed.
>>
>> Because adding a feature would become a nightmare of touching all the 
>> platforms?
>>
> 
> On the contrary, this would help us to enable the feature where it was 
> verified and not generalize it that when it works on one chipset it will 
> work on the other.

We have been discussing this while I was working on wide planes. I 
agreed there, because it was the topic which can impact a lot. In the 
same way the virtual planes even have a modparam knob as to limit the 
impact.

However I still have the understanding that this is not how the things 
should be working. This is not how we are doing development/cleanups in 
other areas. The usual practice is perform the change, verify it as much 
as possible, collect the fallouts. Doing it other way around would 
mostly stop the development.

> 
> There is another point of view here which we have already seen.
> 
> If we go with generalizing, then when we find one case which is 
> different, we end up decoupling the generalization and thats more 
> painful and led us to the rework in the first place.

No, squashing everything together led us to the rework. I'd prefer to 
see whole picture before reworking this part. I'm not going to do 
everything at once. So far the masks have been working in the boundaries 
of generations. The only one which didn't is the IRQ mask. It gets inlined.

If you want it other way, currently we have three defines which do not 
fall into the DPUn standard. I'd prefer to get more date before making a 
decision there.

> 
> 
>> We discussed not merging on major+LM. Glad, I agreed there. But I 
>> don't think that we should remove existing defines without good 
>> reason. We know that they work in the majority of cases.
>>
> 
> Ofcourse it will work today because we have covered only supported 
> chipsets but its just the start of a design which we know led us to this 
> rework.

Again, getting samples led us to the understanding and then the rework. 
Doing rework without understanding the issues is like premature 
optimization.

> 
> 
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> index 6840b22a4159..83f8f83e2b29 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> @@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>>>>>       {
>>>>>>       .name = "ctl_0", .id = CTL_0,
>>>>>>       .base = 0x15000, .len = 0x204,
>>>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | 
>>>>>> BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>>>>>       .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>>>       },
>>>>>>       {
>>>>
>>

-- 
With best wishes
Dmitry

