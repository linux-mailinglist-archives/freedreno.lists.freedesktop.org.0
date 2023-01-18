Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F2671130
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE53B10E64D;
	Wed, 18 Jan 2023 02:31:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153A010E64D
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:31:35 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hw16so68064620ejc.10
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NxnRboJU1+XhJT8S+hL0GtakvcimvGhXOcI4sktIq8U=;
 b=ucOtyDx//6iCvYOqmjUYETS4yW/rRmddl+enP//vK3+L+mVUoEaB070/V43zXuKwBe
 a5nmoXvO5vLV8xKwHe0I7xtxIghXIzDSp273/rEWti3SejJFXMJwXfvyVLhJ4M0KS+Rd
 WkWyhH/kVYjoswXmJtJYgmbG4QAw/PFclK4YJHxNGc7/9ylfuIwZ6jVxV7gYifJjKugA
 ho3ZqDrbax16e/J9bKPauRM/D+ueT3BWJ7Noxco+qFFROWzuKD5CPOuOA9G5Zes5PnIB
 7MG8LOFY+uYluOdPijpSWDNz+Oy+zZc7okq2qXgHo5seJkwOi1gBwgtqN+wYgAwmdZ/O
 BglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NxnRboJU1+XhJT8S+hL0GtakvcimvGhXOcI4sktIq8U=;
 b=JsOT5KDFLqKMlv6gdZQpqVwZh6GdnqI+tv8oQpxudID6q2O9Fc1QZ0pnJSbhLl1buD
 H8dzcxjZekK/FqAnKeLKwg2RLAUQ2kdZoFnp0ABYAVID/Hqb2Ol5iMnSQUvnDvuXNUBu
 OZJFWMIuFpGHOhUJuL/EZpMJmmasFsVjCLu8DED1ickKELJORmMvGWX9MP65TkNDj19l
 02l707rYM+lRUHFTrVeH+YF65WmzxiPn3P5nE22tTy2kzRghi7IanLbh+N4uh68B6TP+
 oUmyNbuV109vPL8MTTyp/sKommLdSbiD+0zmP0gzEiNHd1m5ugtLAXwARyFOWDWaEiqq
 A5HA==
X-Gm-Message-State: AFqh2kodxpaMVVPutXt302G0PpU0ADl3TIf9FyCVwNqfnyTAKJLm+krp
 5q9OlSQ9WyGIe0E7dX3JsofPQg==
X-Google-Smtp-Source: AMrXdXtJdLZSh4HZz7YAtRHiUQbJ1b1lV4FZnU1Q+nwC7Fj3zMcA6jHdKVoqTRlA5UEdCiKu6oubHQ==
X-Received: by 2002:a17:907:d007:b0:829:59d5:e661 with SMTP id
 va7-20020a170907d00700b0082959d5e661mr5340397ejc.29.1674009093565; 
 Tue, 17 Jan 2023 18:31:33 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a1709066b1b00b0087329ff593fsm1319138ejr.144.2023.01.17.18.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 18:31:33 -0800 (PST)
Message-ID: <44e5664b-ef88-8e63-ad62-db5c2c0ad130@linaro.org>
Date: Wed, 18 Jan 2023 04:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
 <20230116225217.1056258-3-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230116225217.1056258-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v8 2/3] dt-bindings: msm:
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, sean@poorly.run, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com, david@ixit.cz,
 dianders@chromium.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 swboyd@chromium.org, airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/01/2023 00:52, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../display/msm/dsi-controller-main.yaml      | 219 ++++++++++++++++--
>   1 file changed, 202 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 35668caa190c4..47faf08a37443 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -9,9 +9,6 @@ title: Qualcomm Display DSI controller
>   maintainers:
>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>   
> -allOf:
> -  - $ref: "../dsi-controller.yaml#"
> -
>   properties:
>     compatible:
>       oneOf:
> @@ -50,22 +47,23 @@ properties:
>       maxItems: 1
>   
>     clocks:
> -    items:
> -      - description: Display byte clock
> -      - description: Display byte interface clock
> -      - description: Display pixel clock
> -      - description: Display core clock
> -      - description: Display AHB clock
> -      - description: Display AXI clock
> +    description: |
> +      Several clocks are used, depending on the variant. Typical ones are::
> +       - bus:: Display AHB clock.
> +       - byte:: Display byte clock.
> +       - byte_intf:: Display byte interface clock.
> +       - core:: Display core clock.
> +       - core_mss:: Core MultiMedia SubSystem clock.
> +       - iface:: Display AXI clock.
> +       - mdp_core:: MDP Core clock.
> +       - mnoc:: MNOC clock
> +       - pixel:: Display pixel clock.
> +    minItems: 3
> +    maxItems: 9
>   
>     clock-names:
> -    items:
> -      - const: byte
> -      - const: byte_intf
> -      - const: pixel
> -      - const: core
> -      - const: iface
> -      - const: bus
> +    minItems: 3
> +    maxItems: 9
>   
>     phys:
>       maxItems: 1
> @@ -161,6 +159,193 @@ required:
>     - assigned-clock-parents
>     - ports
>   
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
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
> +              - qcom,msm8953-dsi-ctrl
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
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: bus
> +            - const: vsync
> +            - const: byte
> +            - const: pixel
> +            - const: core
> +            - const: core_mmss
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
> +              - qcom,msm8998-dsi-ctrl
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
> +              - qcom,sc7180-dsi-ctrl
> +              - qcom,sc7280-dsi-ctrl
> +              - qcom,sm8250-dsi-ctrl
> +              - qcom,sm8150-dsi-ctrl
> +              - qcom,sm8250-dsi-ctrl

Fails with:

kernel/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml: 
allOf:7:if:properties:compatible:contains:enum: ['qcom,sc7180-dsi-ctrl', 
'qcom,sc7280-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 
'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 
'qcom,sm8550-dsi-ctrl'] has non-unique elements


> +              - qcom,sm8350-dsi-ctrl
> +              - qcom,sm8450-dsi-ctrl
> +              - qcom,sm8550-dsi-ctrl
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
>   additionalProperties: false
>   
>   examples:

-- 
With best wishes
Dmitry

