Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F054B7D6754
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 11:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B643710E624;
	Wed, 25 Oct 2023 09:45:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4A610E624
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 09:45:23 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so7430039e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698227122; x=1698831922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MsjAaqN9iQ0Nkn90LUrowVZcqqplmGKwBm93B8d6nXI=;
 b=xVaAXJ8WdHHCUmn5j0EfnPrTIcsGfVJGc0Dku7ZZUxfLrs6Z4uvF23XR3D4UVErX88
 DgGqwreyTaQqtjyLaxYuSRMEAbNjuNS1lHQw+OlmMgWZ1X8KW8X7KUVf8FBpSQgeJ5QI
 SM5/ILFlqGsh/hg4zGRTCAEV+6I32ijvxT1+lEW/LgMs9WU5GqGdq93+m58KjXkYqm8F
 GRVVhxa7weIUsypRtY2sAqZ+UYKEL7EBAzuHj5nyYrlHqtAn8Jz0g26FBzfUcWKCsNrY
 my0Blf/O0ONBZ+Ie2tY20zs3h54pBrnzUdf/ay+F2VJHH4/9c1dVP985MSnHNXeimp0w
 wr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698227122; x=1698831922;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MsjAaqN9iQ0Nkn90LUrowVZcqqplmGKwBm93B8d6nXI=;
 b=q+ms0eVszazDdqWpYypc8mbPqw0gry7N2Xex3ptC0PnHEbFSsWyZulwyfFjbwXgGJf
 p2W1K0Cjd8LwWN4AnDZemq8dRMzSN5uq3r3LMJNvymK7Zlgft6NMZlxpjjmLGPiZ0hXV
 DqY2dFo0Gwlk4n645OTbrqAaFcbHNd2wsDoICyo9npxfVh95cF83jlG7ryU5WYnBOnbn
 gZP/14IbwL+LrSVrOc2x/o5KnW1FYETlVzclL8axJOakpzqLypwvRie2+PZpbASuLr09
 /tf330z3lE5hmfl7J1f9h5n26sLZeJ8pQy2eGcEiHv6Qpu0vk3ychTY79uraKYBoBhgj
 F38A==
X-Gm-Message-State: AOJu0YwoN+rU8a1cd43qDqarUbOYNvLtNl/YKUnrYFLyd21cUA+FdBcM
 ThHzyXLOg01qHPlTr4mBANwxIw==
X-Google-Smtp-Source: AGHT+IEnEo1+RjkiO+az80sgQGWuS5PtpoiZ767Uk/FmfH696W7m+7r9mZZBsxcOs4GPycOhU6Z78w==
X-Received: by 2002:a05:6512:62:b0:503:385c:4319 with SMTP id
 i2-20020a056512006200b00503385c4319mr10767995lfo.19.1698227121559; 
 Wed, 25 Oct 2023 02:45:21 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k6-20020ac24f06000000b005007fc9ccd0sm2461452lfr.113.2023.10.25.02.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 02:45:20 -0700 (PDT)
Message-ID: <6e4408d8-2270-4abc-b9a7-24cae489a08b@linaro.org>
Date: Wed, 25 Oct 2023 12:45:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
 <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
 <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
 <55293371-9d7c-404b-a969-81248bf55e24@linaro.org>
 <a9c805b5-5c3e-9e25-ad82-021a421c309b@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a9c805b5-5c3e-9e25-ad82-021a421c309b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked'
 clock support
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/10/2023 13:08, Bryan O'Donoghue wrote:
> On 07/10/2023 00:45, Konrad Dybcio wrote:
>> On 4.10.2023 14:52, Bryan O'Donoghue wrote:
>>> On 04/10/2023 13:08, Dmitry Baryshkov wrote:
>>>> On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
>>>> <bryan.odonoghue@linaro.org> wrote:
>>>>>
>>>>> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
>>>>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>>>>> must not be completely turned off. However its design has one major
>>>>>> drawback: it doesn't allow us to properly implement the is_enabled
>>>>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>>>>
>>>>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>>>>> clk_rcg2_parked_ops. It also targets the clocks which must not be 
>>>>>> fully
>>>>>> switched off (and shared most of the implementation with
>>>>>> clk_rcg2_shared_ops). The major difference is that it requires 
>>>>>> that the
>>>>>> parent map doesn't conain the safe (parked) clock source. Instead 
>>>>>> if the
>>>>>> CFG_REG register points to the safe source, the clock is 
>>>>>> considered to
>>>>>> be disabled.
>>>>>
>>>>> Why not have a new bit in .flags ?
>>>>>
>>>>> Instead of lying about the clock being off, mark the clock as 
>>>>> "parked",
>>>>> or "safe parked" or whatever term we choose for it ?
>>>>
>>>> The main problem with adding flags doesn't fully scale. From the CCF
>>>> perspective, what should be the difference between parked and disabled
>>>> clocks? How should it treat the parked one?
>>>
>>> Exactly the same as a disabled clock, except you get a "parked" 
>>> instead of a "disabled" when looking up its state and you don't have to
>> The thing is that currently there's only the notion of "enabled"
>> or "not enabled".. Introducing a third state here would be the
>> jump from boolean to quantum logic!
>>
>> I think that abstracting this information away from Linux is not
>> an issue.. These clocks "can't be any more off", or the SoC will
>> explode badly and Linux will be unusable..
>>
>> Think of it like CPUs with a hypervisor, you shut them down, but
>> the physical number crunchers on the host CPU may not actually
>> get cut off from their power source, but there's no reason for
>> the VM to know that. That's probably what happens on our little
>> virtualized snapdragons anyway..
>>
>> Konrad
> 
> So not a state but a flag.
> 
> 1. The clock tree we declare _should_ be a fair and complete description
>     of the hardware clock tree.

Yes and no. We already have clocks not present in the tree for different 
reasons: being handled by the RPM(h), being critical to the platform 
integrity, being useless for Linux, etc.

> 
> 2. If we remove XO from some trees with the only indication of
>     differentiation being the callback you bind the tree to you need
>     someone reading the code both know about parking, derive that
>     information from reading the callback, which means you require that
>     person to read the code in detail and understand it.
> 
>     That's alot of tribal knowledge we are storing up there.

I think adding a huge comment should help. Because otherwise you sound 
like 'we should not expect kernel developers to read the code', which is 
not true.

> 
> 3. A different approach is to add a new CLK_DISABLE_PARKS_TO_XO - or
>     whatever name makes sense.
> 
>     a) The clock tree declared in the gcc, camcc, dispcc, videocc or
>        is correct and aligned with the documentation and silicon.
>        Right away this avoids patches sent to 'fixup' incomplete trees.
> 
>     b) When you look at a clock struct clk_branch_gcc.clk.hw.init.flags
>        there is a big dirty CLK_DOES_THIS_THING flag which doesn't
>        require a developer to have tribal knowledge about how we've
>        hacked up clock parking.

But the problem is that this flag is not generic at all. I think we will 
be damned and prosecuted if we try adding anything about PARK_TO_XO to 
<linux/clk-provider.h>.

And also there is always a question on the state integrity: if the clock 
is parented with the XO on the driver bootstrap, should CCF treat it as 
'parked' or as 'enabled, clocked by XO'?

> 
> My basic point here is the declaration of a parked clock should be 
> obvious, easy to understand and not lend itself to "helpful" patches to 
> "fix" the clock tree.

We already tried doing that... And it failed. For the PHY PIPE clocks we 
ended up doing exactly the same thing, because it simplified the code 
_a_lot_.

> Also consider precedent. When you want to quickly get your clock 
> controller up and running - you generally open existing upstream stuff 
> to clone and own as much as possible. A BIT_DIRTY_FLAG transmits more 
> information than a small callback with esoteric logic buried inside of 
> the disable path.
> 
> I agree with your point on a new state but similarly I think the 
> callback buries too much information away. IMO the top level clock 
> declaration - rather like the DT should as closely as possible declare 
> an accurate clock tree.
> 
> If we need to do special stuff to an individual tree, then CLK_FLAG it. 
> Are qcom clocks really the only clocks in the world that need to park to 
> XO on the disable path ?
> 
> Alternatively continue on with the callback but make the name more 
> instructive not "park" since we are dealing with people who have English 
> as a second language, third language. English is my first language but 
> still a "parked" clock means little to me except that like you and 
> Dmitry I work with qcom stuff so I understand it.
> 
> "disable_park_xo->clk_disable" or something - even still I think 
> removing XO from the clock tree is asking for trouble.

clk_rcg2_disable_parks_to_tcxo_ops ? Slightly ugly but I'm fine with that.

> 
> Start from the principle that gcc/camcc/dispcc clock trees should be 
> complete and work from there.
> 
> That's my 0.02 anyway.
> 

-- 
With best wishes
Dmitry

