Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F37B7FCB
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 14:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD9A10E109;
	Wed,  4 Oct 2023 12:52:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5399A10E109
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 12:52:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40684f53ef3so6067625e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Oct 2023 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696423935; x=1697028735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QbDugttl8nO7QnKFiEkqSWobIkIULpVRulw4zvA/9Ss=;
 b=HzocKrYsrVKXKTfF+iJAfhfUcbqF48z3/9HowIgwPfs5H7isaeFmtTAu54CvLEaUze
 haDRkRwykCM0BXcd0bO1HhQRxAQ8WKOV8HKfIjD1WsAR7JJgoN5/Yx4Qef1wi5zI7Rmd
 CQTvbLv16O3SyZcdixqEwpAyvoRSdG+SYAoB7ody2/Rnj7zmlONrww9OFMFaJrGsL3yl
 cT1FqVDGJ/o4wJft/7Omwh0LJyHNjLXTglhW9R2CJ/z2oxVRiU6GPnxYH+h5Gmdxommq
 xqVLVmHFHRggaDLdUI/nPkWhbxt6zKslBh3LsazBizHadE3ZZNae6Bpv8VRjAdScHTcr
 RC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696423935; x=1697028735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QbDugttl8nO7QnKFiEkqSWobIkIULpVRulw4zvA/9Ss=;
 b=ZmfmbrUftCVfMcTybqUqNI82t6US2JdkB1k+98nx4r9loC0tlLObR1QUZUgX7K/6wy
 xWY5yspTYMo0xjqHl4O4DzBMOVFbPvi41kGxoFrL0177zfMRD3IVIAVewYGMkoRxrHdS
 xcZfHEzZrf0IGj+LCylogykp6wCZwtj+ow5DsNU93LnGoZzhmOy8nqd5c0ADYHk4CdEN
 8bctZGLP/FzzHGJgEpZzMptSclmQcy4cliWMmbqg1PqnY0VgqdyZKwMBOjGUFvCO4a4W
 yE4sJlhdsuVeoYhih1CJ3TPPXjeRkV1VG5/8P9L5Vdqylb3slF26MHn4pVxFEOkHUkgy
 E0SA==
X-Gm-Message-State: AOJu0Yw9uygWd+/JLp1dCEWEB7Dq6laepZRhSZwXUqe8l87GFi1G2fNp
 PvRIPuPvDBVk04MKmPmJHpfkog==
X-Google-Smtp-Source: AGHT+IGJ+zdeWqpzPPRNv7wIiJfoVXE4TrlF8rAbJtAcx3+5BGhrWDha7q+twXf5IEiIS8VaX5i7gA==
X-Received: by 2002:adf:ec82:0:b0:321:65f3:4100 with SMTP id
 z2-20020adfec82000000b0032165f34100mr2027993wrn.7.1696423935197; 
 Wed, 04 Oct 2023 05:52:15 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a5d570c000000b00327bf4f2f16sm3927903wrv.30.2023.10.04.05.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 05:52:14 -0700 (PDT)
Message-ID: <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
Date: Wed, 4 Oct 2023 13:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
 <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 04/10/2023 13:08, Dmitry Baryshkov wrote:
> On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>> must not be completely turned off. However its design has one major
>>> drawback: it doesn't allow us to properly implement the is_enabled
>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>
>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>>> switched off (and shared most of the implementation with
>>> clk_rcg2_shared_ops). The major difference is that it requires that the
>>> parent map doesn't conain the safe (parked) clock source. Instead if the
>>> CFG_REG register points to the safe source, the clock is considered to
>>> be disabled.
>>
>> Why not have a new bit in .flags ?
>>
>> Instead of lying about the clock being off, mark the clock as "parked",
>> or "safe parked" or whatever term we choose for it ?
> 
> The main problem with adding flags doesn't fully scale. From the CCF
> perspective, what should be the difference between parked and disabled
> clocks? How should it treat the parked one?

Exactly the same as a disabled clock, except you get a "parked" instead 
of a "disabled" when looking up its state and you don't have to

-	{ .fw_name = "bi_tcxo" },

Also you can then flag for branch2 clocks the same thing - so parking 
would be done at a higher level in the CCF.

---
bod
