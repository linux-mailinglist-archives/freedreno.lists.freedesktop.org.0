Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC25C4885AA
	for <lists+freedreno@lfdr.de>; Sat,  8 Jan 2022 20:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B8010E12A;
	Sat,  8 Jan 2022 19:47:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7A110E12A
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jan 2022 19:47:26 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id f9so8718020qtk.3
 for <freedreno@lists.freedesktop.org>; Sat, 08 Jan 2022 11:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3CWi2h5DprlR4Vl7WU4YXWwszsHT9+S2ZOFMjmHxNuA=;
 b=a6kzP8zOTzvjTlVwsut+Y7x1Rzr7eGbWjEMKJUB/fJgCNowqaIjlfR+XgYBb1+EOL6
 gRxH3xq9ZhR8siugC5DIXoDprDJWV06IL6fgPed7yTswE7kWvvl03tHNmD7/QahjRgo6
 Ms9hP0IKR8Tz4qbXcxjttmdGUFU11g4AW7HJilWDfrebXH0SXATkf412jaFwBKzA/MD8
 cJc9AlkWV2cepFcPWW0cmsObWbx9P28x1ibWarn7uctaEpaX+MLpgp3sJMjEvYqLuqZx
 +jPwXllNE4RdbDpzBQ+ssd0iBASddM6I4er2CusUYTNM7scDQdz1bR5R2H5NBoei2mJ3
 19gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3CWi2h5DprlR4Vl7WU4YXWwszsHT9+S2ZOFMjmHxNuA=;
 b=qnwWf4tOCanEFJ4xvW8VEizlnnFNu8fYRPREnAX11txGEycuEx3X137mnRTI1KpfPk
 QjwGHGOLgc1Jo6IFcf6KH6Rg6fBeI6cN1ECR7HPwNTwpz0FebU8KphyMH9ieCiWaHNui
 Oh91Gm0Z+ue7PXOg5TRoX51+sWS52ltr/9WZyhK1A/EGVYSHgTT6PEd+1fqa+JXNrE6o
 g4rS8OdYdaWkDXu3U2ixRbym5JYgUCuxgzgCkyhRgmtsNitHazybjdp6W/4cEegXpOam
 yYjtAvVf4yx2vfTLn3Xcrngb2X3N57ZcPBTPP6Ht32kUA1rEgEUpkvIe39zIs2UncM5V
 T+Xg==
X-Gm-Message-State: AOAM533EmxHsEUr8v9ZVekYolLGfRF1+etAzHUakX+TWCiRlFqRM84yu
 MYDltZ5yK/fD1GV/KTBlujFhALYsP7Fp3wy3BPcGXg==
X-Google-Smtp-Source: ABdhPJxceZ0NOX+OY/O6kO4vVindsYOtCiHUesI+KvRrTZk8ceESpZeZbvrRZMjPyhUCOHl4Cf7FOw4lCnBOzk7IEeU=
X-Received: by 2002:ac8:5816:: with SMTP id g22mr7441491qtg.72.1641671245129; 
 Sat, 08 Jan 2022 11:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20220108190059.72583-1-david@ixit.cz>
In-Reply-To: <20220108190059.72583-1-david@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 8 Jan 2022 22:47:13 +0300
Message-ID: <CAA8EJpoTThckN-=rdJsQXaEzarWEnZvVEwy_0fjdLO9jN+-JeA@mail.gmail.com>
To: David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [WIP PATCH] dt-bindings: display: msm:
 dsi-controller-main: distinguish DSI versions
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 ~okias/devicetree@lists.sr.ht
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 8 Jan 2022 at 22:01, David Heidelberg <david@ixit.cz> wrote:
>
> Update documentation compatible and checking to comprehend
> both V2 and 6G version bindings.
>
> Following this commit, there will be update for
> compatible string in chipsets dtsi.
>
> Additional changes:
>  - switch to unevaluatedProperties
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Rob, I know you mentioned using rather chipset names, but since
> meanwhile I coded this, I'll let you decide if should make sense to
> change it or keep it this way.
>
>  .../display/msm/dsi-controller-main.yaml      | 271 +++++++++++++++---
>  1 file changed, 230 insertions(+), 41 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 35426fde8610..8eb41952c2a7 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -11,11 +11,227 @@ maintainers:
>
>  allOf:
>    - $ref: "../dsi-controller.yaml#"
> +  # V2 and 6G definition:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^qcom,dsi-ctrl-v2-[a-z0-9]+$'
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 7
> +          maxItems: 7
> +
> +        clock-names:
> +          items:
> +            - const: iface  # from dsi_v2_bus_clk_names
> +            - const: bus
> +            - const: core_mmss
> +            - const: src  # from dsi_clk_init_v2
> +            - const: byte  # from dsi_clk_init
> +            - const: pixel
> +            - const: core
> +
> +        assigned-clocks:
> +          minItems: 4
> +          maxItems: 4
> +          description: >
> +            Parents of "byte", "esc", "src" and "pixel" for the given platform.
> +
> +        assigned-clock-parents:
> +          minItems: 4
> +          maxItems: 4
> +          description: >
> +            The Byte, Escape, Source and Pixel clock PLL outputs provided by a DSI PHY block.
> +
> +        syscon-sfpb:
> +          description: A phandle to mmss_sfpb syscon node.
> +          $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +        avdd-supply:
> +          description: 3.0 V supply
> +
> +        vdda-supply:
> +          description: 1.2 V supply
> +
> +        vddio-supply:
> +          description: 1.8 V supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^qcom,dsi-ctrl-6g-v[0-9.]+$'
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Display byte clock
> +            - description: Display byte interface clock
> +            - description: Display pixel clock
> +            - description: Display escape clock
> +            - description: Display AHB clock
> +            - description: Display AXI clock
> +
> +        clock-names:
> +          items:
> +            - const: byte
> +            - const: byte_intf
> +            - const: pixel
> +            - const: core
> +            - const: iface
> +            - const: bus
> +
> +        assigned-clocks:
> +          minItems: 2
> +          maxItems: 2
> +          description: >
> +            Parents of "byte" and "pixel" for the given platform.
> +
> +        assigned-clock-parents:
> +          minItems: 2
> +          maxItems: 2
> +          description: >
> +            The Byte and Pixel clock PLL outputs provided by a DSI PHY block.
> +
> +      required:
> +        - power-domains
> +        - operating-points-v2
> +
> +  # Specific 6G revisions:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            pattern: '^qcom,dsi-ctrl-6g-v1.[0-2].[0-9.]+$'
> +    then:
> +      properties:
> +        vdd-supply:
> +          description: 3.0 V supply
> +
> +        vdda-supply:
> +          description: 1.2 V supply
> +
> +        vddio-supply:
> +          description: 1.8 V supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,dsi-ctrl-6g-v1.3.0
> +    then:
> +      properties:
> +        vcca-supply:
> +          description: 1.0 V supply
> +
> +        vdd-supply:
> +          description: 1.8 V supply
> +
> +        vdda-supply:
> +          description: 1.25 V supply
> +
> +        vddio-supply:
> +          description: 1.8 V supply
> +
> +      patternProperties:
> +        '^(lib_reg|ibb_reg)-supply$': true
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,dsi-ctrl-6g-v1.3.1
> +    then:
> +      properties:
> +        vdda-supply:
> +          description: 1.2 V supply
> +
> +        vddio-supply:
> +          description: 1.8 V supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,dsi-ctrl-6g-v1.4.1
> +    then:
> +      properties:
> +        vcca-supply:
> +          description: 0.925 V supply
> +
> +        vdda-supply:
> +          description: 1.25 V supply
> +
> +        vddio-supply:
> +          description: 1.8 V supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,dsi-ctrl-6g-v1.4.2
> +    then:
> +      properties:
> +        vdda-supply:
> +          description: 1.2 V supply
> +
> +        vddio-supply: true
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,dsi-ctrl-6g-v2.2.0
> +    then:
> +      properties:
> +        vdd-supply: true
> +
> +        vdda-supply:
> +          description: 1.2 V supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,dsi-ctrl-6g-v2.1.0
> +              - qcom,dsi-ctrl-6g-v2.2.1
> +              - qcom,dsi-ctrl-6g-v2.3.0
> +              - qcom,dsi-ctrl-6g-v2.4.0
> +              - qcom,dsi-ctrl-6g-v2.4.1
> +              - qcom,dsi-ctrl-6g-v2.5.0
> +    then:
> +      properties:
> +        vdda-supply:
> +          description: 1.2 V supply
>
>  properties:
>    compatible:
> -    items:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,dsi-ctrl-v2-apq8064
> +              - qcom,dsi-ctrl-6g-v1.0.0
> +              - qcom,dsi-ctrl-6g-v1.1.0
> +              - qcom,dsi-ctrl-6g-v1.1.1
> +              - qcom,dsi-ctrl-6g-v1.2.0
> +              - qcom,dsi-ctrl-6g-v1.3.0
> +              - qcom,dsi-ctrl-6g-v1.3.1
> +              - qcom,dsi-ctrl-6g-v1.4.1
> +              - qcom,dsi-ctrl-6g-v1.4.2
> +              - qcom,dsi-ctrl-6g-v2.1.0
> +              - qcom,dsi-ctrl-6g-v2.2.0
> +              - qcom,dsi-ctrl-6g-v2.2.1
> +              - qcom,dsi-ctrl-6g-v2.3.0
> +              - qcom,dsi-ctrl-6g-v2.4.0
> +              - qcom,dsi-ctrl-6g-v2.4.1
> +              - qcom,dsi-ctrl-6g-v2.5.0
> +          - const: qcom,mdss-dsi-ctrl
> +
>        - const: qcom,mdss-dsi-ctrl
> +        deprecated: true

I'd suggest to list all other attributes after the 'compatible' , if
that's possible. In my opinion, It's nice to know which compatibles
are available, before actually checking which properties to define.

>
>    reg:
>      maxItems: 1
> @@ -26,23 +242,13 @@ properties:
>    interrupts:
>      maxItems: 1
>
> -  clocks:
> -    items:
> -      - description: Display byte clock
> -      - description: Display byte interface clock
> -      - description: Display pixel clock
> -      - description: Display escape clock
> -      - description: Display AHB clock
> -      - description: Display AXI clock
> -
> -  clock-names:
> -    items:
> -      - const: byte
> -      - const: byte_intf
> -      - const: pixel
> -      - const: core
> -      - const: iface
> -      - const: bus
> +  clocks: true
> +
> +  clock-names: true
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-parents: true
>
>    phys:
>      maxItems: 1
> @@ -54,28 +260,12 @@ properties:
>
>    "#size-cells": true
>
> -  syscon-sfpb:
> -    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> -
>    qcom,dual-dsi-mode:
>      type: boolean
> -    description: |
> +    description: >
>        Indicates if the DSI controller is driving a panel which needs
>        2 DSI links.
>
> -  assigned-clocks:
> -    minItems: 2
> -    maxItems: 2
> -    description: |
> -      Parents of "byte" and "pixel" for the given platform.
> -
> -  assigned-clock-parents:
> -    minItems: 2
> -    maxItems: 2
> -    description: |
> -      The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
> -
>    power-domains:
>      maxItems: 1
>
> @@ -102,7 +292,7 @@ properties:
>                  maxItems: 4
>                  minItems: 4
>                  items:
> -                  enum: [ 0, 1, 2, 3 ]
> +                  enum: [0, 1, 2, 3]
>
>        port@1:
>          $ref: "/schemas/graph.yaml#/$defs/port-base"
> @@ -118,7 +308,7 @@ properties:
>                  maxItems: 4
>                  minItems: 4
>                  items:
> -                  enum: [ 0, 1, 2, 3 ]
> +                  enum: [0, 1, 2, 3]
>
>      required:
>        - port@0
> @@ -135,11 +325,9 @@ required:
>    - phy-names
>    - assigned-clocks
>    - assigned-clock-parents
> -  - power-domains
> -  - operating-points-v2
>    - ports
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |
> @@ -175,7 +363,8 @@ examples:
>             phys = <&dsi0_phy>;
>             phy-names = "dsi";
>
> -           assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +           assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +                             <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
>             assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
>
>             power-domains = <&rpmhpd SC7180_CX>;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
