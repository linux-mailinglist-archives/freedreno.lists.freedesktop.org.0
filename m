Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC927B870B
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 19:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD43410E395;
	Wed,  4 Oct 2023 17:57:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335D410E395
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 17:57:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so125259e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Oct 2023 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696442238; x=1697047038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/zKg7f6kpVshrRISQ4xbKZAM7kHw6RbXQvKDo5fo5gI=;
 b=AKcYWZFQmo29LsCfzzRduMFzdbWJoC4Fe0ehccYk4D4tspYMLQW3Vj8HkBZj3kgQ/x
 pf+4FXK5DvdFslhkUpvL0RYisU8zCVTvh074T1ByIFvKBuqg8ew0vXIXX2SFQqOgU707
 Aln5OCY+vVlPGfNqvFKFpLVBXd1zgb8nhV43V4/w6ABJKCZBeOwXZFmuuRxOEGAs5YKQ
 iqMYeFkc0WNRGJWoGl8pGc78g7kRVh8Pfq8A76XbAeQDPxk6f8TFV7UiaMCDKHOoOd1z
 z3ijsdCpxnbBA6zMBZvYu7i+iihcT4pFJ97JZfLM0ENzroDizGoE2jQdThSksT/kaALi
 ZQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696442238; x=1697047038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/zKg7f6kpVshrRISQ4xbKZAM7kHw6RbXQvKDo5fo5gI=;
 b=DMhq14teG952obJ60zfimyCPcrUESc5tl/TN6dsOsy1TzOrLrzycbJaEzM17pZvhA3
 qTrAYEIIQ2mU93mwBc+DDawTB4behP9IWCgCZoGjHORVTSDpOkxwRWO+hms6PtxF/5ka
 v+4EDtxcW3/4FRJ+02N4ZAzMyilyJqIplLYWm3h7jd30P2WDeb5DrpySZJlQuSPY5W5f
 CMUtLK9FvKhUd41cq5KEtTuoEjlD2MKLWZHCWbA7sACrCZIdAjJqf+2ntuJiA+Wph6W8
 dpbO7Toz24UmT+h/IvH+y0no35DEiaiEv5+pzXDkiNT8B+ftw/R0jSo3o6jeZWzAWUDI
 cTQQ==
X-Gm-Message-State: AOJu0YzdhZiqpqBIP2pLZ3zUebQDngEC3KXcfHWQgJiwDzvcmXT4r3JF
 s6hWSfMOaeK9usPUSrmBRq1urZiwrRvwkCWIBJU=
X-Google-Smtp-Source: AGHT+IECOXMOL4C0XYUOKmTR5hKYMMj/PCobgcCBBRPWv6ENacPOxkFttgRQ8wL39jthck2CPNQxcg==
X-Received: by 2002:a05:6512:3190:b0:500:d8d6:fc5a with SMTP id
 i16-20020a056512319000b00500d8d6fc5amr3960473lfe.37.1696442238325; 
 Wed, 04 Oct 2023 10:57:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r14-20020ac252ae000000b00505723e56acsm679513lfm.273.2023.10.04.10.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 10:57:17 -0700 (PDT)
Message-ID: <7e28c09b-f2fd-4a42-b4f3-a337ec31a073@linaro.org>
Date: Wed, 4 Oct 2023 20:57:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
 <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
 <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
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
 Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/10/2023 15:52, Bryan O'Donoghue wrote:
> On 04/10/2023 13:08, Dmitry Baryshkov wrote:
>> On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
>> <bryan.odonoghue@linaro.org> wrote:
>>>
>>> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
>>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>>> must not be completely turned off. However its design has one major
>>>> drawback: it doesn't allow us to properly implement the is_enabled
>>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>>
>>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>>>> switched off (and shared most of the implementation with
>>>> clk_rcg2_shared_ops). The major difference is that it requires that the
>>>> parent map doesn't conain the safe (parked) clock source. Instead if 
>>>> the
>>>> CFG_REG register points to the safe source, the clock is considered to
>>>> be disabled.
>>>
>>> Why not have a new bit in .flags ?
>>>
>>> Instead of lying about the clock being off, mark the clock as "parked",
>>> or "safe parked" or whatever term we choose for it ?
>>
>> The main problem with adding flags doesn't fully scale. From the CCF
>> perspective, what should be the difference between parked and disabled
>> clocks? How should it treat the parked one?
> 
> Exactly the same as a disabled clock, except you get a "parked" instead 
> of a "disabled" when looking up its state and you don't have to
> 
> -    { .fw_name = "bi_tcxo" },
> 
> Also you can then flag for branch2 clocks the same thing - so parking 
> would be done at a higher level in the CCF.

Without this removal there is no easy way to identify if the clock is 
parked to XO or if it is reparented to that clock.


-- 
With best wishes
Dmitry

