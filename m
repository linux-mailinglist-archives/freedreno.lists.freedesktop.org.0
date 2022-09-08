Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495575B1F5A
	for <lists+freedreno@lfdr.de>; Thu,  8 Sep 2022 15:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE6010E6FF;
	Thu,  8 Sep 2022 13:37:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1927E10E6FF
 for <freedreno@lists.freedesktop.org>; Thu,  8 Sep 2022 13:37:42 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z25so27803234lfr.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Sep 2022 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mg9cAuwjkSFrw35IeJp38HB0O0TPmsiUVUu8bVEz1QM=;
 b=iw03YHKoa1hqYNph53FKORbebKgOWi4Y+ocuspU6/3oxNgeNXe5e9T6vXEEnVwhh/p
 Zv8CS21DQ0DXerLzZ4g6isG/QFPZM2H5OEBQ1ex3aOI/cp3P5ubXD1bVyiOpus5iVE9R
 vf6occMq3nwYyADbRJbk7lHftIW8UIhJ9ypvZI2T9B4jo1w8Y87xetGCOf/Hv7tHLmHH
 4QnoyYOtg/fzuT8riOrBTSicE2/+BMKX+VEGwrJ4gf1mtbnGGKJhV8IOq4xX9WU448Vv
 A4hV8H22geiEjyGSFKArsbtG/kSFnyjLHJ+fuA2IgtUVFCqUsPyYgBuQlfjcRFG8lb42
 9rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mg9cAuwjkSFrw35IeJp38HB0O0TPmsiUVUu8bVEz1QM=;
 b=4I9bft+51cuPeD1gsOoQApOaBxy4WmKsd1OHWKUWTRyM7SQqzB480Mz5dC6pLJGIEg
 jw3FiirTLZaQsj5TM7RQmncUBIjqH2+FBcduInAqSH3lgj1WZn1yWKutz/0MGfaNKkHX
 SfyraKMkanaWJbg6kMnv54Ppra4kJDdBFrG9CKbMxBc62Cu0jCpvQtNof3O6SO1pbGfQ
 XRgwoHAcZWMEhyBVJOZlZOSWkFBKclNVKfPTLdGDcHAKw+cLezujjdYOOtJ2mYzAO7B9
 DTCbD0x8S4liv06hQsSExDWCdK8UtmYgAnUImrkEnYjzjPq7HT05BOQZ8quL6GcArmPV
 S1mw==
X-Gm-Message-State: ACgBeo1Dh9qaFHu5ldfqNazMuvETczS1XUeyjcPueFtkwjkdUXTwlFzO
 h0NIYJoM3yBE2XyQidfIX54xPg==
X-Google-Smtp-Source: AA6agR5JkCFywxWDiaXlWCjogpSBj7qQif3BMpiUND+cljMl4lbSknid5qxiBcr2rvUvaGE+D9QYvg==
X-Received: by 2002:a05:6512:3a96:b0:494:71e2:6d86 with SMTP id
 q22-20020a0565123a9600b0049471e26d86mr2988699lfu.274.1662644260395; 
 Thu, 08 Sep 2022 06:37:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25fc9000000b0049464d89e40sm1059515lfg.72.2022.09.08.06.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:37:39 -0700 (PDT)
Message-ID: <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
Date: Thu, 8 Sep 2022 15:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 01/12] dt-bindings: display/msm: split
 qcom, mdss bindings
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/09/2022 12:23, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added (optional) "core" clock added recently to the mdss driver
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>  .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> index 43d11279c925..65d03c58dee6 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> @@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
>  
>  Description:
>  
> -This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> -encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
> +This is the bindings documentation for the MDP5 display
>  controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
>  
> -MDSS:
> -Required properties:
> -- compatible:
> -  * "qcom,mdss" - MDSS
> -- reg: Physical base address and length of the controller's registers.
> -- reg-names: The names of register regions. The following regions are required:
> -  * "mdss_phys"
> -  * "vbif_phys"
> -- interrupts: The interrupt signal from MDSS.
> -- interrupt-controller: identifies the node as an interrupt controller.
> -- #interrupt-cells: specifies the number of cells needed to encode an interrupt
> -  source, should be 1.
> -- power-domains: a power domain consumer specifier according to
> -  Documentation/devicetree/bindings/power/power_domain.txt
> -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
> -- clock-names: the following clocks are required.
> -  * "iface"
> -  * "bus"
> -  * "vsync"
> -- #address-cells: number of address cells for the MDSS children. Should be 1.
> -- #size-cells: Should be 1.
> -- ranges: parent bus address space is the same as the child bus address space.
> -
> -Optional properties:
> -- clock-names: the following clocks are optional:
> -  * "lut"
> -
>  MDP5:
>  Required properties:
>  - compatible:
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> new file mode 100644
> index 000000000000..8860fc55cca5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Mobile Display SubSystem (MDSS)
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description:
> +  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> +  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,mdss
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 3
> +
> +  reg-names:
> +    minItems: 2
> +    items:
> +      - const: mdss_phys
> +      - const: vbif_phys
> +      - const: vbif_nrt_phys
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller:
> +    true

If there is going to be v7 - please make it one line.

> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +    description: |
> +      The MDSS power domain provided by GCC
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Display abh clock
> +      - description: Display axi clock
> +      - description: Display vsync clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: vsync
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    true

Ditto.

> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:
> +  "^mdp@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdp5
> +
> +  "^dsi@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdss-dsi-ctrl

This should be ref to dsi-controller-main.yaml... or based on previous
Rob's feedback you dropped it everywhere in children?

> +
> +  "^dsi-phy@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,dsi-phy-14nm
> +          - qcom,dsi-phy-14nm-660
> +          - qcom,dsi-phy-20nm
> +          - qcom,dsi-phy-28nm-hpm
> +          - qcom,dsi-phy-28nm-lp
> +
> +  "^hdmi-phy@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,hdmi-phy-8084
> +          - qcom,hdmi-phy-8660
> +          - qcom,hdmi-phy-8960
> +          - qcom,hdmi-phy-8974
> +          - qcom,hdmi-phy-8996
> +
> +  "^hdmi-tx@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,hdmi-tx-8084
> +          - qcom,hdmi-tx-8660
> +          - qcom,hdmi-tx-8960
> +          - qcom,hdmi-tx-8974
> +          - qcom,hdmi-tx-8994
> +          - qcom,hdmi-tx-8996
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mdss@1a00000 {
> +      compatible = "qcom,mdss";
> +      reg = <0x1a00000 0x1000>,
> +            <0x1ac8000 0x3000>;
> +      reg-names = "mdss_phys", "vbif_phys";
> +
> +      power-domains = <&gcc MDSS_GDSC>;
> +
> +      clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +               <&gcc GCC_MDSS_AXI_CLK>,
> +               <&gcc GCC_MDSS_VSYNC_CLK>;
> +      clock-names = "iface",
> +                    "bus",
> +                    "vsync";
> +
> +      interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +

No need for blank line.



Best regards,
Krzysztof
