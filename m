Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2ED59C590
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 19:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FA99B429;
	Mon, 22 Aug 2022 17:58:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C26498BF7
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 17:58:12 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x10so11356112ljq.4
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=RWYLTrcCZlG0a48i/Axnj+NOJi6WNiY/wtEpP6R8Cso=;
 b=IgzBtvwxsGxNvJP1J3AH+pEA/ILQB4DRAD0OvIowCQIEzs75ZSursWuP07tv1lF9A+
 GTiNGTn2ZfXVUYh97diO2Bm/BeCZQ9BnpEilK0W2VqBWTAYiQeq7Cd9B+ykEClLE5Bhd
 efXl41/ZYCy8D3D3+S25jCs43miYrUMjuRl6Z9hgsCHV4wyUCNF4i4tw5dS22y/LSb8o
 nhKetgh0lYgMdLQJUL6Uou+mrL9/8S93q6rMcpA5MWnvmFDiOGVH8h5/spzoAm4rxOpm
 y+L1EkfucwypJUniALZOLQRY56qoLbQjbE67KB1DiB3wp9luzFdvXSBAe2R8SWZns9+L
 77yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RWYLTrcCZlG0a48i/Axnj+NOJi6WNiY/wtEpP6R8Cso=;
 b=praXPg8+hqaI0lguB9mDcWQ8RW47nnZKjwUeBqRZJaH/1yPIcLmZp8zpTAmlBcebuW
 qIDBdrr7ydig6kGzY7R7ioWkStPYcCgrQqGk189Y0kwDQsQ6BO8zxCxB4zlO+EIjkm8x
 F/pRip0Lqhk91ynPJYXKFqaSDpyk+fQAGoG7sGR/ilfSmPLUEUHfgfQYZiLjVO1CD0Gd
 CRVLsq0OQjPSj7rdasq08OW119pWaAzxfwGbonsRb/DZbM4LWMx9tL2GNTC/On89VyB0
 PkB9zNgVACOju1B40nlkfnhtkSdOxV/oOJHQDSxoY5mTqGu6FQDfDwRZEQJ4+txU3+HP
 ommg==
X-Gm-Message-State: ACgBeo23cZBywqP/Jz5F032RToG7ssV4/g3ZbWqWX9+JQVJoXobox1QT
 Af5R/OQ0jjt9f7Z/+wWZlN6s2w==
X-Google-Smtp-Source: AA6agR7dYWNWZi8FS8hwu9VcM99F98hvdjk2XGX0dbfCiTvE/xUerprDELcV2OpaaDuqxd7GvxCGOw==
X-Received: by 2002:a05:651c:220a:b0:261:cab2:3fc1 with SMTP id
 y10-20020a05651c220a00b00261cab23fc1mr2509753ljq.284.1661191090934; 
 Mon, 22 Aug 2022 10:58:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a05651c022d00b0025e49aaae10sm1928628ljn.12.2022.08.22.10.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 10:58:10 -0700 (PDT)
Message-ID: <a3a917b3-5dfc-761e-e5f6-5955c89db4a4@linaro.org>
Date: Mon, 22 Aug 2022 20:58:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-4-dmitry.baryshkov@linaro.org>
 <7b504ecb-b05a-549e-e2ce-18c539f68655@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7b504ecb-b05a-549e-e2ce-18c539f68655@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/4] dt-bindings: display/msm/gmu: account
 for different GMU variants
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

On 06/07/2022 18:52, Krzysztof Kozlowski wrote:
> On 06/07/2022 16:52, Dmitry Baryshkov wrote:
>> Make display/msm/gmu.yaml describe all existing GMU variants rather than
>> just the 630.2 (SDM845) version of it.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/gmu.yaml  | 166 +++++++++++++++---
>>   1 file changed, 146 insertions(+), 20 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index fe55611d2603..67fdeeabae0c 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -20,35 +20,24 @@ description: |
>>   properties:
>>     compatible:
>>       items:
>> -      - enum:
>> -          - qcom,adreno-gmu-630.2
>> +      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
>>         - const: qcom,adreno-gmu
>>   
>>     reg:
>> -    items:
>> -      - description: Core GMU registers
>> -      - description: GMU PDC registers
>> -      - description: GMU PDC sequence registers
>> +    minItems: 3
>> +    maxItems: 4
>>   
>>     reg-names:
>> -    items:
>> -      - const: gmu
>> -      - const: gmu_pdc
>> -      - const: gmu_pdc_seq
>> +    minItems: 3
>> +    maxItems: 4
>>   
>>     clocks:
>> -    items:
>> -      - description: GMU clock
>> -      - description: GPU CX clock
>> -      - description: GPU AXI clock
>> -      - description: GPU MEMNOC clock
>> +    minItems: 4
>> +    maxItems: 7
>>   
>>     clock-names:
>> -    items:
>> -      - const: gmu
>> -      - const: cxo
>> -      - const: axi
>> -      - const: memnoc
>> +    minItems: 4
>> +    maxItems: 7
>>   
>>     interrupts:
>>       items:
>> @@ -76,6 +65,9 @@ properties:
>>   
>>     operating-points-v2: true
>>   
>> +  opp-table:
>> +    type: object
> 
> instead: opp-table:true

Wouldn't this allow e.g. using just 'opp-table;' as a flag?

> 
>> +
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

