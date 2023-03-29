Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E736CF42B
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 22:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072E510EC39;
	Wed, 29 Mar 2023 20:13:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4378510EC33
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 20:13:37 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id k37so21813211lfv.0
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680120815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQCrJvIAi8d5vr9Rmgb3GfKwe2GYjnRcMdwIw2E9S1Q=;
 b=PBm+HevLzaANAiaOKuKR9wz5q1jaq2klVC3G7CGePfsI7ciPdEvadZ/5ugn9pPydb0
 pNDZpqc06g+MopXZNlylyBEpMaYKY28YTsUkw92aGyY6ja2bQ/Q+J9M+ufP/UMVjkCxm
 b4yNpJ9yS52MpUN10wk7Ov2b1BIVxTky08nCz+k9D6osa5WWprSxkr9G2CpgJDzzcKvd
 wPp6nNA2zSQ1wNO/Hd38HMRKJc17t9ASWPVNjbub4COwB1sbNRnC6M6g6dxhSCE9yMBq
 Bpp61bKCtEk5V2PRtjf8ROQ+u2U8Z3zLbszk47VsZYuAAW89YJCx7wdPC6uSIvruvxOG
 9qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQCrJvIAi8d5vr9Rmgb3GfKwe2GYjnRcMdwIw2E9S1Q=;
 b=e+8YFqd1KynGR2Ra8rzViH/piSFKtDDhwg1Uj/DO0kt/ry/2UxU1SukhDchz7G5H8S
 LBE27PdUL/DFZM04CacfhJjHAtEeHyi+ZWUqq6b8DFG5m3kNt67avif5Ud3im7ADny5B
 ShWDfp6KkmSwHKQi5W7PxCG1AgSP73cyeWdIrzSZu4R2d7XISGrB/75JvOuQA3tSpoI3
 s3Gb0CntNq6mIx1zsOe/598ERrFiVFa/VJgkmfnwegyFpAGm4NSwCg81IKacuUm4TsRP
 d97m3vX/gAQGM1UEX3hiKG5ZS/KpYiV4tNt+u6J2UFkWf+Anu30k82sVvk4dYOn7utPO
 1skg==
X-Gm-Message-State: AAQBX9cgiOHAtLXBRxJ1FQMvh85yvF9G/61L7zRV3F44Fg4KE4vNUy1T
 hbhqHUBlSka2G1K+NXkOmlFoOQ==
X-Google-Smtp-Source: AKy350bqFBR1/bLn2+h5C96CNiXHrwe4VeVDilWwnXSAsd4PHM96EcS8ugCMls5mi4Wc9S4QapkSIQ==
X-Received: by 2002:a19:ad48:0:b0:4ea:f6ad:2975 with SMTP id
 s8-20020a19ad48000000b004eaf6ad2975mr5918334lfd.60.1680120815483; 
 Wed, 29 Mar 2023 13:13:35 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a197012000000b004e95a1aca1bsm5581253lfc.87.2023.03.29.13.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 13:13:35 -0700 (PDT)
Message-ID: <420b5400-844f-4ca9-a4e3-1f5f6536f7a2@linaro.org>
Date: Wed, 29 Mar 2023 23:13:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Rob Herring <robh+dt@kernel.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <168004255469.1060915.1800625604847213121.b4-ty@linaro.org>
 <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 0/7] drm/msm: add support for SM8550
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/03/2023 22:52, Rob Herring wrote:
> On Tue, Mar 28, 2023 at 5:38 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>>
>> On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
>>> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
>>>
>>> This patchset is based on the SM8450 display support serie at [1].
>>>
>>> In order to work, the following patchsets are required:
>>> - PM8550 LDO fix at [2]
>>> - DISPCC driver at [3]
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [2/7] dt-bindings: display/msm: document DPU on SM8550
>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4557e40338d2
>> [3/7] dt-bindings: display/msm: document MDSS on SM8550
>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/0e4205eb8663
> 
> And now failing on linux-next just as my bot reported:
> 
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dts:24:18:
> fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
> directory
>     24 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:419:
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dtb]
> Error 1
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dts:25:18:
> fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
> directory
>     25 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> 
> Please fix. And quickly please. Fixes in the DRM tree seem to take
> forever to get in...

I pushed the fix, so it will arrive in linux-next tomorrow or the day 
after tomorrow. Please excuse me for breaking it again. I checked that 
the patches were merged, but didn't notice that the header name was 
changed in the process. Mea culpa.

-- 
With best wishes
Dmitry

