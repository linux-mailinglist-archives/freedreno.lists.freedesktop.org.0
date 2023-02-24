Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB56A1B9E
	for <lists+freedreno@lfdr.de>; Fri, 24 Feb 2023 12:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3060110E881;
	Fri, 24 Feb 2023 11:51:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF0410E881
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 11:51:27 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bp25so17714153lfb.0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 03:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677239485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TnexSMd+XVoyj7y7yaOeBmQu7EBkAmuDHGXQa8H9Mtw=;
 b=pw5jsbH6Ahef7qZKvgF3EtWIxOg45xrKzGuv2DkJzX/meHHDnjUelN4xqa08NuR2Tz
 nyC+9kjJXnRTY0v+0wha6BAHyB6bgzSRaehem/88QFTzvOi/B+kMM3MBN9tD3LMQ7Qr9
 s+3+Frj3QYO7MGMXlpV6mebZl+VujPqZJgBP5laTCM99SnAhtLLFXMX/vnp7h/0cGsXK
 Ezv6W0u81c9yXmbluxS5WTj9ABCHi7RXwDrRL9kCZY/IC4QEMayF0STDLIezqy7cXnKu
 UOi1Ug4Ke2PRMehSgjU0fO/YhdulY7osNGhrkOov58zIpm7CSf2EhcTehGzPdwVHpwwY
 j06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677239485;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TnexSMd+XVoyj7y7yaOeBmQu7EBkAmuDHGXQa8H9Mtw=;
 b=VSlRWLdxSKsplHUs2Kdh1zS+fR42NQ+nzK9KpKYsJB/qDSVfudOIKuPynOXMSmDcae
 TAU2aJh0SKUxqR2I2RwRJ9xO7GXTYj9yBupbyEbOeQqzok1A9y2J3d2N6e2urqfc/ru9
 2qkLzhBPG3rv+1v9cAtaR1O8TTkaFAVKtUtctkvHW/k/mnjiRO3N/tHzZ1v7d066TK2g
 EjQnoEfrnDfCVe7/9WAirP1cdP67qkUKV6inRw5LicpkaWiX9mvCTy/YrUWXKJ2Ko/hG
 nxHXJSioyr602nm8YLxVBLeKmkmVMG4dLm9DHOypde1WLqPXk/Kk/nrrSgC733kVUSUd
 KEQg==
X-Gm-Message-State: AO0yUKUTPbrKu5ZWszyCOmb8pv3k3K/6XPVpSBJrwQ33zI99LmUr+uAT
 IPNM4rOkJPrf0rD5teO2xYdldw==
X-Google-Smtp-Source: AK7set/FkVC3ts6OtmMUhOGLdSYYVCrglgLPa706kH6YP7Eze6YmEYBTVypJE8rX+86gHX2+wzb/Yg==
X-Received: by 2002:a05:6512:3d90:b0:4da:f379:9f60 with SMTP id
 k16-20020a0565123d9000b004daf3799f60mr5682703lfv.33.1677239485520; 
 Fri, 24 Feb 2023 03:51:25 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a19c20d000000b004dd6c32532bsm576631lfc.263.2023.02.24.03.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:51:25 -0800 (PST)
Message-ID: <a28c4e67-78b4-21b5-7094-9953316576b2@linaro.org>
Date: Fri, 24 Feb 2023 12:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
 <c3376575-c24f-18a3-1d8b-c3d67f072287@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c3376575-c24f-18a3-1d8b-c3d67f072287@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 01/15] dt-bindings: display/msm: gpu:
 Document GMU wrapper-equipped A6xx
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 24.02.2023 12:17, Krzysztof Kozlowski wrote:
> On 23/02/2023 13:06, Konrad Dybcio wrote:
>> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
>> specified under the GPU node, just like their older cousins.
>> Account for that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/gpu.yaml       | 63 ++++++++++++++++++----
>>  1 file changed, 53 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index d4191cca71fb..e6d3160601bc 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -36,10 +36,7 @@ properties:
>>  
>>    reg-names:
>>      minItems: 1
>> -    items:
>> -      - const: kgsl_3d0_reg_memory
>> -      - const: cx_mem
>> -      - const: cx_dbgc
>> +    maxItems: 3
>>  
>>    interrupts:
>>      maxItems: 1
>> @@ -147,26 +144,72 @@ allOf:
>>                  description: GPU Alternative Memory Interface clock
>>                - const: gfx3d
>>                  description: GPU 3D engine clock
>> +              - const: gmu
>> +                description: CX GMU clock
>>                - const: rbbmtimer
>>                  description: GPU RBBM Timer for Adreno 5xx series
>>                - const: rbcpr
>>                  description: GPU RB Core Power Reduction clock
>> +              - const: xo
>> +                description: GPUCC clocksource clock
>>            minItems: 2
>> -          maxItems: 7
>> +          maxItems: 9
> 
> Your commit says A6xx but this is a3-5xx. I don't understand this change.
Right, it's a leftover unrelated hunk. I'll remove it.

> 
>>  
>>        required:
>>          - clocks
>>          - clock-names
>> +
>>    - if:
>>        properties:
>>          compatible:
>>            contains:
>> -            pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
>> -
>> -    then: # Since Adreno 6xx series clocks should be defined in GMU
>> +            enum:
>> +              - qcom,adreno-610.0
>> +              - qcom,adreno-619.1
>> +    then:
>>        properties:
>> -        clocks: false
>> -        clock-names: false
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +              description: GPU Core clock
>> +            - const: iface
>> +              description: GPU Interface clock
>> +            - const: mem_iface
>> +              description: GPU Memory Interface clock
>> +            - const: alt_mem_iface
>> +              description: GPU Alternative Memory Interface clock
>> +            - const: gmu
>> +              description: CX GMU clock
>> +            - const: xo
>> +              description: GPUCC clocksource clock
>> +
>> +        reg-names:
>> +          minItems: 1
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_dbgc
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +    else:
>> +      if:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
>> +
>> +      then: # Starting with A6xx, the clocks are usually defined in the GMU node
> 
> The comment is not accurate anymore.
I'll argue the semantics, they are still "usually" defined
in the GMU node..

Konrad
> 
> 
> Best regards,
> Krzysztof
> 
