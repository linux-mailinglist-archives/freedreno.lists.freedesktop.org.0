Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB2E6ADF0E
	for <lists+freedreno@lfdr.de>; Tue,  7 Mar 2023 13:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B2B10E123;
	Tue,  7 Mar 2023 12:48:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86AC10E139
 for <freedreno@lists.freedesktop.org>; Tue,  7 Mar 2023 12:48:47 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a25so51967531edb.0
 for <freedreno@lists.freedesktop.org>; Tue, 07 Mar 2023 04:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678193326;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gXMDjluJDUvPLUicyi9DzXJkAKHHUVttkvC/e23H4Xg=;
 b=gBNpW4hE+viaph3Z9oHqJD+5k9T0kLFVksSmYDaYHCpYrjYet2Y7xzwCXwhRqORnWg
 wE/6W9M/kc2+Vve5aDGSeGrXaWB8YjgQ1XUCQyjvp3SwsV+/jnfGbM0RdpGcyF9bbsYV
 lOYcZyKaGNtFSN4ipuq8gqyuTT3TnA4YFmx2/+HNIVvKoDFUhMgSCOj0EOxNurAeeMHR
 BKML1W/QnpTHpizWDwPqbpCTwS8V3VqmklGMmeFRE+B+KdKB43IAX7OGr9zWxyZm3Tp3
 zA0DYbSuK1C1R2g2MQFf5E8PEfKrZpH6MuFnOzGHIORxpGRoS/T/AApE89N8YE7aN/l5
 UWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678193326;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXMDjluJDUvPLUicyi9DzXJkAKHHUVttkvC/e23H4Xg=;
 b=yyMiZv+MzkvUns7G5AxT4lRbxcdqjslCPbMXIbC43YNvu8DIE++DqxSJqINdb+g1YP
 II5j6SGe+g98HGyzbPP9mv385XjRbyLBebo41mhtvK/VcXIEAecC2wa5jOa1PZ6hUTK+
 r9KYqCr4Qn/Qrj+xSxXGa2StCDAwbt9xcZxRWykWfj4toyY4EO7PqBoR/e1j7/CCGvy2
 HdLgIunw8Rh/CgtQyrIR7z6DyfYoyoB3Ek+V97D0UFxqIG3dwXQER5N9NOGSjJ823Upp
 D7ES0aZD/Xk2/9gF8GMvfNAiQeWnoWkXst+BjewuJBYcbBGKOG2S5TsuNYT8ElEDwWco
 m92g==
X-Gm-Message-State: AO0yUKWUwDI+t6+2WfaYhsfu5lUJu0LZGY0JpJAS9J581ZiYKRqAiHO5
 ar4JiPI1H9B4SX6/ioTwij3qcw==
X-Google-Smtp-Source: AK7set8MCzzEe4umSH1sYZCblI6WJ1yy9vx+YgB8ty6up6YK0RjeqU1A/CLPMaRwTV8qico7a1qLyw==
X-Received: by 2002:a05:6402:7ce:b0:4c0:57b:47a9 with SMTP id
 u14-20020a05640207ce00b004c0057b47a9mr13267661edy.35.1678193326220; 
 Tue, 07 Mar 2023 04:48:46 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d?
 ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
 by smtp.gmail.com with ESMTPSA id
 le16-20020a170907171000b008da6a37de1bsm6174070ejc.10.2023.03.07.04.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 04:48:45 -0800 (PST)
Message-ID: <de9d5cdb-29d5-8252-6884-dd50a22d1580@linaro.org>
Date: Tue, 7 Mar 2023 13:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-9-konrad.dybcio@linaro.org>
 <bcb5c17f-da78-9d68-66eb-b620ee583602@linaro.org>
 <22970751-8bc0-9cbd-eec1-cbc92f0b4ea7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <22970751-8bc0-9cbd-eec1-cbc92f0b4ea7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 8/9] dt-bindings: display/msm:
 dsi-controller-main: Add SM6115
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/03/2023 12:14, Konrad Dybcio wrote:
> 
> 
> On 7.03.2023 10:17, Krzysztof Kozlowski wrote:
>> On 13/02/2023 13:10, Konrad Dybcio wrote:
>>> Add a compatible for the DSI on SM6115.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> index 2494817c1bd6..f195530ae964 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>> @@ -25,6 +25,7 @@ properties:
>>>                - qcom,sc7280-dsi-ctrl
>>>                - qcom,sdm660-dsi-ctrl
>>>                - qcom,sdm845-dsi-ctrl
>>> +              - qcom,sm6115-dsi-ctrl
>>
>> This looks incomplete. You also need to add it to MDSS binding.
> https://lore.kernel.org/linux-arm-msm/145066db-5723-6baa-237d-7c2b8fd476d9@linaro.org/
> 
> Does this.. but I guess I'll resend this as one series, as it only
> makes sense.

It should be one commit. Adding sm6115 here is incomplete if other
binding (using this one) does not allow it.

Best regards,
Krzysztof

