Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED473EEC2
	for <lists+freedreno@lfdr.de>; Tue, 27 Jun 2023 00:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A46D10E262;
	Mon, 26 Jun 2023 22:46:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AC110E262
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jun 2023 22:46:34 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so4772312e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jun 2023 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687819590; x=1690411590;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g/HbI+tlHDdTUjnW9h4L8w2WP0zE6rcb9swUHefgPkU=;
 b=SOpWDX2f3Sf5+j1ArGQZP/YJvY47JwcAoGYiM0PA4TdvZKjtFHVL7C79r1CKa+9sGP
 HWgavLF/CMaFsyMfN/W86D/ZXSxdwaJPt/BrHnQNRwuGVfQ9/jBuaGtYqUajNZkySabX
 QeMwlAvoCXvJvAXEFusyEhfl3n55Wma/kqU+EeGxJG40KTzI7GOWz59muJfsxcvOfjD5
 8FH1S9PCEg3xvcgsRaT8fmXZUiL0qM/bwlOCfs/XSkg8CwXE40RPNLZXuEVlXskGIvm4
 xjbAf79YnLLFuDnKELitkEf3Wq6RvTrYH9wrHb7Aml7w2g0wc0uwK6D0ty8zRu9pj0mE
 HRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687819590; x=1690411590;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g/HbI+tlHDdTUjnW9h4L8w2WP0zE6rcb9swUHefgPkU=;
 b=TJgabusVLpKGHgkZAmpTPipVATNBGi82LCWFZZIZSjYM9a0ypRQEqU9BB4s/STphqN
 uPcJue/9TWgxk0vz91DPvNady3eqlksHJnOCa4e7c+HZu7jvQT6AJLIEyJOWMbyB76kf
 JSPumBDNCOZ/2P+EV/cZuMkzLIjVvMfWXFanvavm3VNKNgC6aLyQ98qtiZOLs/OSM4X6
 XWCy5RoP9U6TcYQdTYjT4wTfVXFAn8Db4OpkvYtQDszPsHb6hGJ70X/JtxJkcjS/VZBu
 FGpnpqqD/vzbIPZTmmUJVpJr53Blyg1sPB53M3vUT3ZsOXL8zgxD8qKS5C+jKus3h3Qc
 6rQA==
X-Gm-Message-State: AC+VfDzpkUgzEwanZtwWi4mFtNhis6APKCWi8XzOeEcMFP7OEdmHefVB
 k4C1ZS3nNHHzLl5KJ6vllKuBfQ==
X-Google-Smtp-Source: ACHHUZ7orXO0/gHnY40bHHASzmg4vD9JU29mG9WnTHLbvrh5LxgCuKRDdOKL+vDSA5TiHT1i6pW4ZA==
X-Received: by 2002:a05:6512:3088:b0:4f6:2d47:274c with SMTP id
 z8-20020a056512308800b004f62d47274cmr12489431lfd.15.1687819590412; 
 Mon, 26 Jun 2023 15:46:30 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
 by smtp.gmail.com with ESMTPSA id
 q1-20020ac25101000000b004f858249932sm1277950lfb.90.2023.06.26.15.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 15:46:30 -0700 (PDT)
Message-ID: <1808f43b-5a76-d4e6-a36d-88779ecd3836@linaro.org>
Date: Tue, 27 Jun 2023 00:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
 <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
 <75d64lixeawfoqbrctm4thzh73cxkvnlmnh5xgbpf277pmh3gz@zthnqvvuxmeq>
 <a6f3906a-98a7-de7a-3e26-4b8c45fe93f7@linaro.org>
 <w3bbdq72thnerbyglb4dyshzg4vu5go2wpsciprk27vah6w2ms@yc4eqclct24a>
 <3daf9990-79da-9adf-af6a-d9007c186557@linaro.org>
 <26pqxmuuyznb4qbi4wkiexr5excxenfmiuojrqgrz5k5t5palm@ttlk6m2zuokm>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <26pqxmuuyznb4qbi4wkiexr5excxenfmiuojrqgrz5k5t5palm@ttlk6m2zuokm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu:
 Describe SM6125
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26.06.2023 22:28, Marijn Suijten wrote:
> On 2023-06-26 20:57:51, Konrad Dybcio wrote:
>> On 26.06.2023 19:54, Marijn Suijten wrote:
>>> On 2023-06-26 18:16:58, Krzysztof Kozlowski wrote:
>>>> On 25/06/2023 21:52, Marijn Suijten wrote:
>>>>> On 2023-06-24 11:12:52, Krzysztof Kozlowski wrote:
>>>>>> On 24/06/2023 02:41, Marijn Suijten wrote:
>>>>>>> SM6125 is identical to SM6375 except that while downstream also defines
>>>>>>> a throttle clock, its presence results in timeouts whereas SM6375
>>>>>>> requires it to not observe any timeouts.
>>>>>>
>>>>>> Then it should not be allowed, so you need either "else:" block or
>>>>>> another "if: properties: compatible:" to disallow it. Because in current
>>>>>> patch it would be allowed.
>>>>>
>>>>> That means this binding is wrong/incomplete for all other SoCs then.
>>>>> clock(-name)s has 6 items, and sets `minItems: 6`.  Only for sm6375-dpu
>>>
>>> Of course meant to say that clock(-name)s has **7** items, not 6.
>>>
>>>>> does it set `minItems: 7`, but an else case is missing.
>>>>
>>>> Ask the author why it is done like this.
>>>
>>> Konrad, can you clarify why other 
> 
> (Looks like I forgot to complete this sentence before sending,
> apologies)
> 
>> 6375 needs the throttle clk and the clock(-names) are strongly ordered
>> so having minItems: 6 discards the last entry
> 
> The question is whether or not we should have maxItems: 6 to disallow
> the clock from being passed: right now it is optional and either is
> allowed for any !6375 SoC.
That's a very good question. I don't have a 7180 to test, but for
you it seems to cause inexplicable issues on 6125..

Konrad
> 
> - Marijn
> 
>>
>> Konrad
>>>
>>>>> Shall I send a Fixes: ed41005f5b7c ("dt-bindings: display/msm:
>>>>> sc7180-dpu: Describe SM6350 and SM6375") for that, and should maxItems:
>>>>> 6 be the default under clock(-name)s or in an else:?
>>>>
>>>> There is no bug to fix. Or at least it is not yet known. Whether other
>>>> devices should be constrained as well - sure, sounds reasonable, but I
>>>> did not check the code exactly.
>>>
>>> I don't know either, but we need this information to decide whether to
>>> use `maxItems: 6`:
>>>
>>> 1. Directly on the property;
>>> 2. In an `else:` case on the current `if: sm6375-dpu` (should have the
>>>    same effect as 1., afaik);
>>> 3. In a second `if:` case that lists all SoCS explicitly.
>>>
>>> Since we don't have this information, I think option 3. is the right way
>>> to go, setting `maxItems: 6` for qcom,sm6125-dpu.
>>>
>>> However, it is not yet understood why downstream is able to use the
>>> throttle clock without repercussions.
>>>
>>>> We talk here about this patch.
>>>
>>> We used this patch to discover that other SoCs are similarly
>>> unconstrained.  But if you don't want me to look into it, by all means!
>>> Saves me a lot of time.  So I will go with option 3.
>>>
>>> - Marijn
