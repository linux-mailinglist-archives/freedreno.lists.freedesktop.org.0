Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D282617E52
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 14:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF54810E5DC;
	Thu,  3 Nov 2022 13:47:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43F010E5E2
 for <freedreno@lists.freedesktop.org>; Thu,  3 Nov 2022 13:47:46 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id x15so1137091qvp.1
 for <freedreno@lists.freedesktop.org>; Thu, 03 Nov 2022 06:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2Nr5wIdGbAWm3WH/I4UVUKpbhCh82dprUQ26IZeMhc=;
 b=qPv7iGDsarIyeVkPtASpJ9T0zxFA9vMYe5noup38EWHE174XLESSO8pOb+cAor4t9T
 ohhqAr79b6QEkwtwsx1unZIDNieHhMgFD9w9spQ4q/VBD5K4xYW68UL2J9qaz1sr6Qt9
 azDBNxlr5M/IQ4Ff9DHEhfwoCRVapzw1g0YsApKJoFs0cSqXJ2Q7SHX/X0YoeZbRbzOx
 BymutPAUVmDMaT8ZbF4AFM7Ajszy/g2+5VFI3IeKTLVfTKsjqPpXt6WrbOUBszbc7IAe
 /5k9YdNLB5XOFmjitCa51wUbm3bUWV+u5wZwSVmsl8M9vNCHMCGUzZFSZWkv8rLhmt9H
 ye/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2Nr5wIdGbAWm3WH/I4UVUKpbhCh82dprUQ26IZeMhc=;
 b=Gm+PLi4ZBU5t3mLS1cIR/rFVJJ+p0MljtEG0ricY+9fI28XXYYY9m03ml+9s26Ypp4
 5uJtWj9xzcg+V3eb3pSJLdvMPHGNBHumdctcBXF7io47ECFCK6FJbUwitQy4cjixe44S
 +dY8UIF4f4zsOCRwZBzI9UjpG45DhO94IgC5JRPujvmfKM9PF0uOzcrKjCuZLqNK4i42
 EZbKItTv1W+JuFUKETY8WF6YxKFElbL5AB4yl7YUlWQFJzhuR2x2+bqYvmZ4MyAZLSLA
 /lzZwBtjAKHNad2fPrbTTaAnlCkmIm6TMY6khXC151um7CiXtZGlHB3Q4fkVuVDZChx/
 lmqg==
X-Gm-Message-State: ACrzQf2rqU6+hs4+i9AV1idX8sqtVqUVTyTBkxYlMBT5qeTmPp95TyjC
 /dc4I+7LpajvHTBwTAi+kAYuMQ==
X-Google-Smtp-Source: AMsMyM4EEMjML/TvKjG45RThBKF8f13QmyxMU3XEC+DuAu8ouWpZko/uukZBffWcUYkLAXPI5btEJw==
X-Received: by 2002:a05:6214:20aa:b0:4bb:7e1a:9df0 with SMTP id
 10-20020a05621420aa00b004bb7e1a9df0mr26673735qvd.34.1667483265779; 
 Thu, 03 Nov 2022 06:47:45 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a05620a449100b006fa31bf2f3dsm802424qkp.47.2022.11.03.06.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 06:47:45 -0700 (PDT)
Message-ID: <07fca6e0-994f-ed08-632c-dd26bc7086b8@linaro.org>
Date: Thu, 3 Nov 2022 09:47:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102220844.569977-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102220844.569977-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RESEND PATCH v1] dt-bindings: display/msm: convert
 MDP5 schema to YAML format
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/11/2022 18:08, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 

Thank you for your patch. There is something to discuss/improve.

> +
> +  clock-names:
> +    oneOf:
> +      - minItems: 4
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: vsync
> +          - const: lut
> +          - const: tbu
> +          - const: tbu_rt
> +        #MSM8996 has additional iommu clock
> +      - items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: iommu
> +          - const: vsync
> +
> +  interconnects:
> +    minItems: 1
> +    items:
> +      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
> +      - description: Interconnect path from mdp1 port to the data bus
> +      - description: Interconnect path from rotator port to the data bus
> +
> +  interconnect-names:
> +    minItems: 1
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +      - const: rotator-mem
> +
> +  iommus:
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc.

You could include here information about number of ports per variant.

> +
> +    patternProperties:
> +      "^port@[0-9a-f]+$":

[0-3]

> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    # at least one port is required
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mdp@1a01000 {

display-controller@......

> +        compatible = "qcom,mdp5";
> +        reg = <0x1a01000 0x90000>;
> +        reg-names = "mdp_phys";
> +

Best regards,
Krzysztof

