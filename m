Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B65F2B40
	for <lists+freedreno@lfdr.de>; Mon,  3 Oct 2022 09:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14D310E223;
	Mon,  3 Oct 2022 07:55:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A8210E243
 for <freedreno@lists.freedesktop.org>; Mon,  3 Oct 2022 07:55:17 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id s17so541940ljs.12
 for <freedreno@lists.freedesktop.org>; Mon, 03 Oct 2022 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=AWWik7Ro2WMW3rP3zuTmOKWCoTINy486UbZe1BIOJ30=;
 b=jCc986gDVQOoJgz1tTSNWFlwcc7cwQUEYkuAkDH+Wwv/85G7GPheB8Q/gKpngA7LoW
 jOUYnmTNK9Idr/6yd2PkrpuIlZSg1F+cndMsuV0XBsl+0Mw1iRZyzH1rtt9Bp6zbbdsU
 yJqrpV9nZPfd87H+S89HyLHj/kF/gUF0AOb1QbD0U6Uq94NExN7tQ9MeWNLW3IwwPkVX
 E8L+D0XW1A/m/Ih//TlBtd+5c4aG8gE40FGFOAsiSJ60ySelzvnOEaqIIZ3NRyyfjh7l
 fNgXk8O7szMe1hqfPpMYHyhTOyvNJ3eEvqskNibXrPVVSPytOuLWwnAnBgoFdHNeRQxf
 GevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AWWik7Ro2WMW3rP3zuTmOKWCoTINy486UbZe1BIOJ30=;
 b=oyGK5FKQTeJt9QaYTSbokv5Dwy+gKG7xTncmWD5PdeoG2hwYYIF5gr8qtUmXUrRcPJ
 8/WUQ9CGIZIyVVOiuh87LCpVSyMjgVVyxKFWdcske2UxQg4a7EcDMP5o5HbUZG/D7H4O
 XrhKV0I3WlZXc5cvBYjo6ZoaY6fNmxlDz2Lj326Q59Cnal31oUzGgHNOoqwUgPTKdCJk
 e3LUcx3InCWB4xHh0d8xoD49DrI7ighR0vy+4J7H/MeBQfGAVCnt5mFj0qSp1hakRW9a
 0HvCjILBjLGTMWTRXVjrxBofoQRlMuWY++IOCfmoTN5cr0tuiOJWIleIxxWynZt9JKWd
 d9jg==
X-Gm-Message-State: ACrzQf1FHMzRm1tVCtRehrUxhqPpTKwjWXplkMlnhAT649emTWmR2yj1
 r+fT5OPvstpZ70tM5M8gHV38CA==
X-Google-Smtp-Source: AMsMyM6LazJpQxrBqhJQfb1vXbRFSUvDVP+Ts25muHd1R+0kQHdtCegacUeEqpXvowYR45JtZpfUqQ==
X-Received: by 2002:a05:651c:11cc:b0:26c:16cd:f1ae with SMTP id
 z12-20020a05651c11cc00b0026c16cdf1aemr5941193ljo.59.1664783715938; 
 Mon, 03 Oct 2022 00:55:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s7-20020a2eb8c7000000b0026ddf39da47sm194830ljp.81.2022.10.03.00.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 00:55:15 -0700 (PDT)
Message-ID: <267c17b6-070c-8b77-8f52-75368c74d59d@linaro.org>
Date: Mon, 3 Oct 2022 09:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
 <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
 <d2af0a8e-63fe-221f-1c53-9fe1c43fa04d@linaro.org>
 <aeae567c-ccf7-de73-61eb-1f04772d3bba@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aeae567c-ccf7-de73-61eb-1f04772d3bba@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 05/12] dt-bindings: display/msm: move
 common MDSS properties to mdss-common.yaml
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/09/2022 22:32, Dmitry Baryshkov wrote:
> On 22/09/2022 15:28, Krzysztof Kozlowski wrote:
>> On 22/09/2022 13:46, Dmitry Baryshkov wrote:
>>>>> -  ranges: true
>>>>> +    maxItems: 2
>>>>>    
>>>>>      interconnects:
>>>>> -    items:
>>>>> -      - description: Interconnect path from mdp0 port to the data bus
>>>>> -      - description: Interconnect path from mdp1 port to the data bus
>>>>> +    maxItems: 2
>>>>
>>>> I think this is not equivalent now, because you have in total minItems:1
>>>> and maxItems:2, while in past minItems was 2.
>>>
>>> This means that I should have minItems:2, maxItems:2, which, if I got it
>>> right, is frowned upon. Let me doublecheck though if it works as expected.
>>
>> It is frowned upon only if it is alone, because for missing minItems,
>> maxItems implies minItems. Here you have minItems in other schema, so
>> there is no such case
> 
> Well, I just checked, the schema will throw an error if I put a single 
> interconnects or iommus entry. If I understand correctly these two 
> clauses are evaluated separately. So, the dpu-common's clause tells 
> minItems:1, maxItems:2. The platform schema file contains just 
> maxItems:2, which implicitly adds minItems:2 to _this_ clause.
> 
> Thus I think I'll leave this part as is.

Thanks for checking. It's good then.

Best regards,
Krzysztof

