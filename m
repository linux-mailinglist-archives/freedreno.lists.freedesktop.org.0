Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEDD6E9CB0
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 21:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF99010E61D;
	Thu, 20 Apr 2023 19:51:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0196210E5A5
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 19:51:24 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a8aea2a610so7706761fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 12:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682020283; x=1684612283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/a0xpbCUh8XvBFyvG3Vr8vwGN+W0r6uMQEO9ehg+QV4=;
 b=zBr3TpHqf1AS9j2rsa0zNinD/3EVDw8o66VhW6Cs1x9gQZOqenezbfaXcgGGI+wHd9
 7E2v5qh2QaItjfhTeNhXKUB9yuikZWqg9lrIiTaWWO86IteWxF7PKcSxKhhgpe7hlzIv
 +Ra8UnT08hKJttPIuAkoOFBSBg1+jkqWVeS9dOiQhpUAwB7+kA5rmprYuoaXUuKRGJva
 c/CscWhbir1fbJ8aTrJiFgOGZ9nVf2IFVk3Mg8GiDVk3wL0v4e6NHF04VJ8vZm8Ss/BG
 xPn6mh1eNYUmkFAh1ek0NJ7HQdzf9PHSYa1Yxh/g9At0nlp991N6Z7gaGb3Eu6HoGeer
 x+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682020283; x=1684612283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/a0xpbCUh8XvBFyvG3Vr8vwGN+W0r6uMQEO9ehg+QV4=;
 b=jmjOi6XwA9435/DjyPZTvjRX/M3RV51poXc293odxn1Ma9slW6XKuI30uIeEDArjSr
 n2kJV8SaaXO3csAsb+50aQZvkZoFB91C46Vqv9lXywZCChrf0419rMSYIoDzABCW2fCC
 1Pg0yNWbLwtBsE+aVijQQ/X1i0GI1PoH7hQCYYsCBKm9hrorncuV7xv//lXSmWtEW5F7
 5T3kByCNKn344qPeh7xpCJ+64N2bBr7l0Nko6Otlt0aeHuafyU7A2KUC96sCDW3pIIUJ
 hcUowJyMjN9gnBFg67MqWcoj/RNvGoj65PQ0tx5dPedr5EXDwQ7LPD37aL8q25WAuhhe
 Idcg==
X-Gm-Message-State: AAQBX9fhF5DK6yX2+13Q8HuXKP4pRv7JIshMFssEGfDOOE/6FpYmOJ4a
 sjPhagModB1Qrl/Hg565xxFDxQ==
X-Google-Smtp-Source: AKy350bJOaN/yiqVcikZK2R1lIXdVY7PZHt7PQe9jzpzreObSOXLbS7TfSQAXyaEMHcVORKfBHdasQ==
X-Received: by 2002:a05:6512:61:b0:4ef:5a59:12f6 with SMTP id
 i1-20020a056512006100b004ef5a5912f6mr17552lfo.16.1682020283052; 
 Thu, 20 Apr 2023 12:51:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l13-20020ac24a8d000000b004eb3b6acfe6sm311735lfp.213.2023.04.20.12.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 12:51:22 -0700 (PDT)
Message-ID: <0f469b3c-5f0f-e027-8a9f-d1233169c04a@linaro.org>
Date: Thu, 20 Apr 2023 22:51:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
 <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
 <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
 <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
 <6a335df7-ff0b-098a-feec-45714159df04@linaro.org>
 <b134d09c-55fa-7879-80ff-900e39c20c3d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b134d09c-55fa-7879-80ff-900e39c20c3d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 0/2] DPU1 GC1.8 wiring-up
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/04/2023 22:47, Abhinav Kumar wrote:
> 
> 
> On 4/20/2023 11:01 AM, Dmitry Baryshkov wrote:
>> On 20/04/2023 04:36, Konrad Dybcio wrote:
>>>
>>>
>>> On 20.04.2023 03:28, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
>>>>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
>>>>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>>>>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
>>>>>>> more, but none of them are supported upstream.
>>>>>>>
>>>>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
>>>>>>
>>>>>> Does this mean that we will see gamma_lut support soon?
>>>>> No promises, my plate is not even full, it's beyond overflowing! :P
>>>>>
>>>>> Konrad
>>>>
>>>> So I think I wrote about this before during the catalog rework/fixes 
>>>> that the gc registers are not written to / programmed.
>>>>
>>>> If thats not done, is there any benefit to this series?
>>> Completeness and preparation for the code itself, if nothing else?
>>
>> The usual problem is that if something is not put to use, it quickly 
>> rots or becomes misused for newer platforms. We have seen this with 
>> the some of DPU features.
>>
>> In case of GC (and the freshly defined DPU_DSPP_IGC, but not used) we 
>> have three options:
>> - drop the unused GC from msm8998_sblk.
>> - keep things as is, single unused GC entry
>> - fill all the sblk with the correct information in hope that it stays 
>> correct
>>
>> Each of these options has its own drawbacks. I have slight bias 
>> towards the last option, to have the information in place (as long as 
>> it is accurate).
>>
> 
> My vote is for (1) . Today, GC is unused and from the discussion here, 
> there is no concrete plan to add it. If we keep extending an unused 
> bitmask for all the chipsets including the ones which will get added in 
> the future in the hope that someday the feature comes, it doesnt sound 
> like a good idea.
> 
> I would rather do (1), if someone has time.

Agree, this was the second item on my preference list. Could you please 
send this oneliner?

> OR lets stay at (2) till 
> someone does (1).
> 
> When someone implements GC, we can re-use this patch and that time keep 
> konrad's author rights or co-developed by.
> 
> 

-- 
With best wishes
Dmitry

