Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6510A6A1B44
	for <lists+freedreno@lfdr.de>; Fri, 24 Feb 2023 12:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FE210E5BE;
	Fri, 24 Feb 2023 11:18:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A317F10E5BE
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 11:17:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id i34so28144123eda.7
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 03:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Vl8zU8kbmD0NXYO3MpGhm7tTD1vhneNkAGrrsmIsSw=;
 b=TZz/8/zzgzDt8+hZqJEeX7Y4spNoEB1x53DoiTOqrKyo+9YKWAjJPmHgR5FTbWNGpn
 GYysbJTX/QKQJ0kGvGNRLHM7Xr0TkoOBmweGm6vATdTeEp4sDTdIFoIfHi4JCryDUP3M
 cVQ1vtlMCj80ubXLb8QXhY5rp4U01Q1twHhn7qAMcUv6UxWpS7AcmsxuA6ZSKeNE0W/X
 VmpQvTu632nhPgHDinmsXAJBHA3VfjZnYK+IyHxzcvjjVBImvp18+Hjnl5LvtPXDtJ84
 2/+5v/fg59tVkZflqBzK1huB+xnWXfnGK9v0AqIwxJBC94IMofDvU0R0hQQ6VZlNam63
 0RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Vl8zU8kbmD0NXYO3MpGhm7tTD1vhneNkAGrrsmIsSw=;
 b=cx/0DtEpsj5qFgVZ1FY63R1iiX/VmYyVEgSr3BiqWIjWwJF4Ogmxw9/yWmIupChf31
 8CpiX8FxYK9khXHY1i5YsvU3oUufJgKfu4cveY9pViFFyRQSr8XWQYobQrsR9dzu/99E
 rfuHRGewjbUGD7TssQFK5dh9KTkcC0IbMP2RfWQqE/l23QHyVx7FZFv6PT6eWmFnF66d
 AIZTBVNwpFNu5Pf9fO4VBMlw+hcTyhLg4Vvh+96HzAoyidEwj9py87/DyggQkfxm46ip
 JpWuihFYn0QF3h7TRQ9NrXgZQNRdtLVWdvnIptBxLXgrZ73VZEqPIqwMRIwferYR/S3s
 AKZA==
X-Gm-Message-State: AO0yUKWZ7RjMJmu4KkItfosA2/V91DPnz+boiJyCPSZbo427QckoZdXb
 HhrYSpnX82egvDKaILLAZdmYIQ==
X-Google-Smtp-Source: AK7set+4KfFMeGNAYlcsDg1coF14sbqhpIKYYoNl+eBr/MJ1HdQqsV0dLeXgac6Vspjm/49TkSXQJA==
X-Received: by 2002:a17:906:518d:b0:8b1:78b6:bbd7 with SMTP id
 y13-20020a170906518d00b008b178b6bbd7mr29255076ejk.10.1677237477989; 
 Fri, 24 Feb 2023 03:17:57 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170906a28a00b008bda61ff999sm8119127ejz.130.2023.02.24.03.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:17:57 -0800 (PST)
Message-ID: <c3376575-c24f-18a3-1d8b-c3d67f072287@linaro.org>
Date: Fri, 24 Feb 2023 12:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
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

On 23/02/2023 13:06, Konrad Dybcio wrote:
> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> specified under the GPU node, just like their older cousins.
> Account for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 63 ++++++++++++++++++----
>  1 file changed, 53 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index d4191cca71fb..e6d3160601bc 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -36,10 +36,7 @@ properties:
>  
>    reg-names:
>      minItems: 1
> -    items:
> -      - const: kgsl_3d0_reg_memory
> -      - const: cx_mem
> -      - const: cx_dbgc
> +    maxItems: 3
>  
>    interrupts:
>      maxItems: 1
> @@ -147,26 +144,72 @@ allOf:
>                  description: GPU Alternative Memory Interface clock
>                - const: gfx3d
>                  description: GPU 3D engine clock
> +              - const: gmu
> +                description: CX GMU clock
>                - const: rbbmtimer
>                  description: GPU RBBM Timer for Adreno 5xx series
>                - const: rbcpr
>                  description: GPU RB Core Power Reduction clock
> +              - const: xo
> +                description: GPUCC clocksource clock
>            minItems: 2
> -          maxItems: 7
> +          maxItems: 9

Your commit says A6xx but this is a3-5xx. I don't understand this change.

>  
>        required:
>          - clocks
>          - clock-names
> +
>    - if:
>        properties:
>          compatible:
>            contains:
> -            pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
> -
> -    then: # Since Adreno 6xx series clocks should be defined in GMU
> +            enum:
> +              - qcom,adreno-610.0
> +              - qcom,adreno-619.1
> +    then:
>        properties:
> -        clocks: false
> -        clock-names: false
> +        clock-names:
> +          items:
> +            - const: core
> +              description: GPU Core clock
> +            - const: iface
> +              description: GPU Interface clock
> +            - const: mem_iface
> +              description: GPU Memory Interface clock
> +            - const: alt_mem_iface
> +              description: GPU Alternative Memory Interface clock
> +            - const: gmu
> +              description: CX GMU clock
> +            - const: xo
> +              description: GPUCC clocksource clock
> +
> +        reg-names:
> +          minItems: 1
> +          items:
> +            - const: kgsl_3d0_reg_memory
> +            - const: cx_dbgc
> +
> +      required:
> +        - clocks
> +        - clock-names
> +    else:
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
> +
> +      then: # Starting with A6xx, the clocks are usually defined in the GMU node

The comment is not accurate anymore.


Best regards,
Krzysztof

