Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1DF653FC2
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 12:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386C710E0C2;
	Thu, 22 Dec 2022 11:50:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7853A10E4EE
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 11:50:21 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id v11so1617821ljk.12
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 03:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y6zbNVvUnUZ8o4kZcOTLR6KagKMfi5R7wiaU4278DEU=;
 b=a/zmMZNdXQeHq719bi47ZJCtdikNXOc0xis60e5rgzIAMoUR/FScBMs7i7jjbgSIrC
 VR2YS+apShCH1+PhG9sTCNYAa9OozWx7Yp2EpmMf0jLBLLrOJt5BJ7BEQJMgRgpm7kVQ
 6HIoCjSFNOBCq30HVlhHtHuD8Lx9vzYKqD4MspTgltifTgPEwsvaZbbCNacUDbSpVaW3
 0QGMxaEx/4hzxqiO1mP+v64VnnB4UXfkADDkL3YnN3m4IAYtrYjXTo/P7j9IkIeP2E2I
 P2knlEf/rmUoY2MD7CAFzZNDH9nVkHLkB4vVSGkHQZOrAGCoEksRXMP8Z/DzayIJ3Ob3
 kfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6zbNVvUnUZ8o4kZcOTLR6KagKMfi5R7wiaU4278DEU=;
 b=XeRoZysLDb7p8bQWCul7lkXiDyKOSKXMxiTLXJEnvnxZEFOAjYjHFgtp2dkKbWpzJy
 L1KWriEC+js2hDYAMg5doVQHLc4Nlo1ZL0LLPX2LcsX67K5gFxpScfoR4LWvkRGNVOxX
 0/KaMpe5dQd+Na7TCh9v22zPgkt/M0iGilLT1Icesr2n6mxNdBYc81yrVhII2Nx22Z9c
 tw6fx89ky5xTctbT2UEbokVEgH1qYy1Xpl19EDO7lrQCYFzeM0pxe99gpYf7GF/FzFMO
 ic+rfTaEFE/u4iKGE2tCERsPr5cgVLi4fl1xr7OezI6e/U7Mk21yac1ymXTSBVfJ/XDU
 hApg==
X-Gm-Message-State: AFqh2kqmKODrP/ts/8BmPzsXwGJZcq7GJEXwI4MX7fuBLH4dR8wZaaiF
 xFVhkT50IDiJBhFX7H3ZqaYe9A==
X-Google-Smtp-Source: AMrXdXtFCO9TlMOcSbYrHeCeIWjx6v7GVy95v/qvA+USs+fHF3IExmCDsebPaR9GuVGgSfO7psI7SQ==
X-Received: by 2002:a2e:99d4:0:b0:279:e84f:cd08 with SMTP id
 l20-20020a2e99d4000000b00279e84fcd08mr1314614ljj.48.1671709819749; 
 Thu, 22 Dec 2022 03:50:19 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a2ea304000000b00279f3c58278sm26857lje.51.2022.12.22.03.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:50:19 -0800 (PST)
Message-ID: <4115ec26-dedf-ca80-b81a-409d9db88f52@linaro.org>
Date: Thu, 22 Dec 2022 12:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-6-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 05/21] dt-bindings: msm:
 dsi-controller-main: Deprecate qcom, dsi-ctrl-6g-qcm2290 in favour of qcom,
 qcm2290-dsi-ctrl
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

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format
> qcom,qcm2290-dsi-ctrl.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 36 +++++++++++--------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 01afa9e9c4b3c..98d54a7ee28d4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -14,21 +14,27 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - qcom,apq8064-dsi-ctrl
> -          - qcom,msm8916-dsi-ctrl
> -          - qcom,msm8953-dsi-ctrl
> -          - qcom,msm8974-dsi-ctrl
> -          - qcom,msm8996-dsi-ctrl
> -          - qcom,msm8998-dsi-ctrl
> -          - qcom,dsi-ctrl-6g-qcm2290
> -          - qcom,sc7180-dsi-ctrl
> -          - qcom,sc7280-dsi-ctrl
> -          - qcom,sdm660-dsi-ctrl
> -          - qcom,sdm845-dsi-ctrl
> -          - qcom,sm8250-dsi-ctrl
> -      - const: qcom,mdss-dsi-ctrl
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,apq8064-dsi-ctrl
> +              - qcom,msm8916-dsi-ctrl
> +              - qcom,msm8953-dsi-ctrl
> +              - qcom,msm8974-dsi-ctrl
> +              - qcom,msm8996-dsi-ctrl
> +              - qcom,msm8998-dsi-ctrl
> +              - qcom,qcm2290-dsi-ctrl
> +              - qcom,sc7180-dsi-ctrl
> +              - qcom,sc7280-dsi-ctrl
> +              - qcom,sdm660-dsi-ctrl
> +              - qcom,sdm845-dsi-ctrl
> +              - qcom,sm8250-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl
> +      - items:

I would just squash it with previous. You are adding some code and in
next patch immediately:
1. re-indent it,
2. remove it (qcom,dsi-ctrl-6g-qcm2290)


Best regards,
Krzysztof

