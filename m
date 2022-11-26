Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3C639699
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 15:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979AA10E146;
	Sat, 26 Nov 2022 14:44:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511AA10E14B
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 14:44:48 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b9so8193308ljr.5
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 06:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M3VFbb/urxLt4AAbODMiwaHIsutCiRetAeBhPsiZMY8=;
 b=lkK9tjAxY+rK64IySFXie0Pn7s+N3HzN3LSVyZNp1qk5LiWLHoS+D6aSmC4fzfLJMv
 e6aMj6VJLzj5YnZdIJNjGawiR1kQGYkGwtQqyaf29SnGNcLVZhEfi7GhnSI8Fxzt6FOw
 16QOCfwebHFOuOw9jkTkSQ1Lf5MkHB7Il+o8fGqyj9Mqtbn33TA3JsegGzs9Bsx5MQIi
 oyMKDPGqE1XbQkc5enMjVKMqDX5Kg1gZ8F52pETQQigqSIfB4fTQu2naTFqtV2eOTzJr
 yphXI7lfaf6Un7+dvfFj7P4cbWKKi9IQNscYMpo6dRLdtYp6XCeoc+NvLfiOfzfbA/1s
 FemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M3VFbb/urxLt4AAbODMiwaHIsutCiRetAeBhPsiZMY8=;
 b=Lu463/iu7/6RN68pAIrcQd1i8xEiXUM0HUlG/mUu15yeBoaIwefKdGndSeGgdB40Oe
 8FJ3kcktszZL3tSkSGCwoIga5UqAS/2p4hmrdgBmHM25LLv4p4dp0OJNywKDvaWfbqod
 eXIvYhbLwiccSsloyI87EhsYF2LjGQw0oEd53N1kDUQ/RnWBMrW6bkBLtcPY7YWJ9QLb
 WfP5Us4Q4u8HOnb5BkjM3xU7p5fCBVsUGnFF/OMTna3aEe6IA3Ps0mgUTF40huYD2fye
 SRs5jwbKPthdspdiXXi0Du6xTBpxK9zI5V2eFSAQRkZaf8sfdhUZ3v6JugzzSSqEmTx4
 29Bg==
X-Gm-Message-State: ANoB5plAyVSr44ruywZOPp8zMPyGFfvfPsb5ofkMv7l9mWC8cBQT+X8f
 +KtzaVVDuiX+8KhPYT8Jej7maQ==
X-Google-Smtp-Source: AA0mqf51Yx6WqiwVxyoyJfkAFW7n7xuxrcH0IkvAg4nEpDeV4o2XHda6z9Todbe0a8B+WQn7pA7oRA==
X-Received: by 2002:a05:651c:12cb:b0:279:774e:dfe4 with SMTP id
 11-20020a05651c12cb00b00279774edfe4mr5969907lje.303.1669473886576; 
 Sat, 26 Nov 2022 06:44:46 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac247f7000000b004aa95889063sm953784lfp.43.2022.11.26.06.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 06:44:46 -0800 (PST)
Message-ID: <fb3f9ad7-7b6f-fe22-8787-5bfa1d7caf05@linaro.org>
Date: Sat, 26 Nov 2022 15:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-6-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 05/18] dt-bindings: msm:
 dsi-controller-main: Document clocks on a per compatible basis
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 154 ++++++++++++++++--
>  1 file changed, 143 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index c4da7179999d2..88aac7d33555c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -9,9 +9,6 @@ title: Qualcomm Display DSI controller
>  maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
> -allOf:
> -  - $ref: "../dsi-controller.yaml#"
> -
>  properties:
>    compatible:
>      items:
> @@ -48,13 +45,8 @@ properties:
>        - description: Display AXI clock
>  
>    clock-names:
> -    items:
> -      - const: byte
> -      - const: byte_intf
> -      - const: pixel
> -      - const: core
> -      - const: iface
> -      - const: bus
> +    minItems: 6
> +    maxItems: 9
>  
>    phys:
>      maxItems: 1
> @@ -147,6 +139,146 @@ required:
>    - assigned-clock-parents
>    - ports
>  
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,apq8064-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: src
> +            - const: byte
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8916-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: bus
> +            - const: byte
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8974-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bus
> +            - const: vsync

minItems are 6, so does it actually work?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8996-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: byte
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-dsi-ctrl
> +              - qcom,sc7280-dsi-ctrl
> +              - qcom,sm8250-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: byte
> +            - const: byte_intf
> +            - const: pixel
> +            - const: core
> +            - const: iface
> +            - const: bus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm630-dsi-ctrl
> +              - qcom,sdm660-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 9
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: byte
> +            - const: byte_intf
> +            - const: mnoc
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: byte
> +            - const: byte_intf
> +            - const: pixel
> +            - const: core
> +            - const: iface
> +            - const: bus
> +
>  additionalProperties: false
>  
>  examples:
> @@ -157,7 +289,7 @@ examples:
>       #include <dt-bindings/power/qcom-rpmpd.h>
>  
>       dsi@ae94000 {
> -           compatible = "qcom,mdss-dsi-ctrl";
> +           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";

Not related to this patch.


Best regards,
Krzysztof

