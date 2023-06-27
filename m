Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F873F6D8
	for <lists+freedreno@lfdr.de>; Tue, 27 Jun 2023 10:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C025B10E2B6;
	Tue, 27 Jun 2023 08:21:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D29E10E2B6
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jun 2023 08:21:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso10033215e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jun 2023 01:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687854076; x=1690446076;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=62PvuKpVR4vvVJ+czbvONPwN6io0eLrvuJxR3ESd9KA=;
 b=GWJ9ONMSJlMwyYXp0QaRKdaJtu5jZBcNxzdkPKUwRpJhwrwX8c1oqud662S6O4ihKq
 F12QXcEAEIpIvy36KrpOXKMDntQowJdz9/xuPNmmzcv92GGCXuAMA4OGjXTlWB2cr0zj
 htXt7F/EKv+oWankZqOEy+DVMFKw0Edbljrb8IPfWM3xTyKxrrD+IqCiiJ6AY9o4RZXa
 MeWxAjQ09kxu5VA6De4g7ejM4B5ySaVEnB02kj/YjkbXYjr4VqSqSQ3fn5FWb9NuvRYn
 QB7lpctHLQPZLpQZn5XtQow9S4KY7bdecScKLdGxXOvNbzLL0apf6pIWdZY+Kla/eNep
 uB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687854076; x=1690446076;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=62PvuKpVR4vvVJ+czbvONPwN6io0eLrvuJxR3ESd9KA=;
 b=kwdk1sTtCTkRhtUjTHoUD38N3yxsMXgYhr8fqA8BebgJGxpOf/vUVgEAugnLpX7frc
 1EJHh4Pzb+hW1IXX7peQLbHVm5ZO73LAnaPmNfYfUUKc8S/DNiboTpJi/egp5R+g55ua
 bcOnuB7eD7aq2rnlYYUvQJB7DkpP8FIJU+Uy8RX9WuSNnvxJzPLwP92MJA+lPhg7KjvX
 fQsBdTnOxWlZL6E4CzAB8LAsynaDqZREsuwiYGz2LzbTZaJkCNUTct7SuMx6DOGsmKrQ
 STKOu+y/k91d+SjX4fa/i6NIJHuev2kbyLgPsJFIswAl0PoOt+/IaCOhjfSlQR0Y2F4p
 lMmA==
X-Gm-Message-State: AC+VfDxDYhtvDce6eezHjhpT1bNSJPDWj6e+sreWoZl3rSPdz7op6L60
 hJvOSdv2oyjv6mgMMBWo7Fxc6w==
X-Google-Smtp-Source: ACHHUZ4PvmNA0F8Q+dsc+125+loCwPVtHMhlTOLwsM5Ei8GYIzO5r9zAz/2rQpnzolZP8rtVPJDjVA==
X-Received: by 2002:a05:600c:3657:b0:3f6:8ba:6ea2 with SMTP id
 y23-20020a05600c365700b003f608ba6ea2mr29015214wmq.15.1687854075903; 
 Tue, 27 Jun 2023 01:21:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003f9b0830107sm12942303wmh.41.2023.06.27.01.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 01:21:15 -0700 (PDT)
Message-ID: <145ab255-b3f8-1c6c-824d-5f1b40568d30@linaro.org>
Date: Tue, 27 Jun 2023 10:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
 <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
 <52c57cab-10cf-2e7e-2c1d-fa6506786d45@linaro.org>
 <jmtjuya4c423rmdlo4ubvvqndbxvgapal5otjqnejdpdd25izp@kewbjmqdu2xs>
 <6311f26f-79ee-c471-649f-5e0b4629cfcc@linaro.org>
 <uuy5prkjhhs66te7h6z3pu4lzj2cfbiqk6ftjijwoeqpw573av@ogs6cboanvzc>
 <ziykmixskqkgheigefvyo4q3katbc4uix6jtcg7mncs25z4tj5@5gykrfgns4bm>
 <16731023-7dc7-d43d-1b16-fda44c0948ed@linaro.org>
 <yofju7jp7vmv33x7dzvzoelpumfsz3fjqy2ozakfphsuysunon@pglt2wzlsjex>
 <683a6f7e-bf1a-aff2-070b-472fb14e0353@linaro.org>
 <3nnk4xvmpnum2q6g6c6crjlqq3ra7j2z5zis53xcqbvevymuhz@mkffvs45n6ut>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3nnk4xvmpnum2q6g6c6crjlqq3ra7j2z5zis53xcqbvevymuhz@mkffvs45n6ut>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 03/15] dt-bindings: clock: qcom,
 dispcc-sm6125: Require GCC PLL0 DIV clock
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
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/06/2023 09:49, Marijn Suijten wrote:
> On 2023-06-27 09:29:53, Krzysztof Kozlowski wrote:
>> On 27/06/2023 08:54, Marijn Suijten wrote:
>>> On 2023-06-27 08:24:41, Krzysztof Kozlowski wrote:
>>>> On 26/06/2023 20:53, Marijn Suijten wrote:
>>>>> On 2023-06-26 20:51:38, Marijn Suijten wrote:
>>>>> <snip>
>>>>>>> Not really, binding also defines the list of clocks - their order and
>>>>>>> specific entries. This changes.
>>>>>>
>>>>>> And so it does in "dt-bindings: clock: qcom,dispcc-sm6125: Remove unused
>>>>>> GCC_DISP_AHB_CLK"?
>>>>>
>>>>> Never mind: it is the last item so the order of the other items doesn't
>>>>> change.  The total number of items decreases though, which sounds like
>>>>> an ABI-break too?
>>>>
>>>> How does it break? Old DTS works exactly the same, doesn't it?
>>>
>>> So deleting a new item at the end does not matter.  But what if I respin
>>> this patch to add the new clock _at the end_, which will then be at the
>>> same index as the previous GCC_DISP_AHB_CLK?
>>
>> I think you know the answer, right? What do you want to prove? That two
>> independent changes can have together negative effect? We know this.
> 
> The question is whether this is allowed?

That would be an ABI break and I already explained if it is or is not
allowed.

Best regards,
Krzysztof

