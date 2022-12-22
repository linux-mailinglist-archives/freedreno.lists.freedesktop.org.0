Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2882653F46
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 12:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6815310E049;
	Thu, 22 Dec 2022 11:47:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADA510E03D
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 11:47:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id m29so2323283lfo.11
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 03:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0EHYXR6sSgB5vdGVmrtOtKLZP6yhiJpLufZUquvuMTM=;
 b=pn1uImfgSjqommdSMhzsURLzDugGu0FTd7vckLh0eIppD+Hkw6yti7KierhwC+ebZK
 YF138uC/8YhdSSV20XcVnzKKwga9gEKb1OcBV+e08oHnK+JtwEPEbB735yPazKU/no34
 XDTspm8RPAH0vFr4eyWfXAmb8lnd2u+PpHJBrEeIE8NyCKdi4D61hKBafoBeLdnKj14V
 mMeoiV/ttwezyotlUUS5QQqu0dXsDHglxuBhKe49Qn9dWEmYTIa7TYC8tFmAugoJS5/B
 r0XnifxQkvH4tQF90cwlwL7BOj8N0wx2F/WMw04riTFamr+FzXbqRhlobs1jLiN4TepR
 ny4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0EHYXR6sSgB5vdGVmrtOtKLZP6yhiJpLufZUquvuMTM=;
 b=iAPrGFskYsER2O0GtvhJ8TPpJ0ybE5B5T05/y8mGcnEamBTwinLOA5YKuBrfzc5acn
 7bJW06y/m34twaoXID/viHVLneZwvatmN9wFD9xYWys9onk2jOV839xzbpa4cLioJf/J
 YXZnZPgmd4T5LMVQPkzOr6cQjeZX1emxlTsjGVpB50Ota2/SZCGMTtpHpCdSRACfZDc6
 H21Ylp1vW9Ls9mIBFxmP4OGLe/qErPdkqjSp6wy+5so0H4SpJrA9l17QfelNoRsrGSb2
 gy69f5kMgfAbv87TYt4KV8plU3KXNGOpOkempQr0SGvk+hs+GXoLOPdbkV+HgafPiaJ+
 4UYA==
X-Gm-Message-State: AFqh2ko11Yt8LMYs74BwlgffWt+89ZaqbAKPMsulQW+qmQDLYWP+ghxW
 DMrM70MD6wCDLn8DV1FXbwQjnw==
X-Google-Smtp-Source: AMrXdXvejv9SNAwlLbnZmw6FcDQmaKFCvnGJeIOT1kCLtjTtnwqqgUvY/tTwCYifiYAFep31jdzGkA==
X-Received: by 2002:a05:6512:1582:b0:4b6:e494:a98d with SMTP id
 bp2-20020a056512158200b004b6e494a98dmr2133911lfb.44.1671709645143; 
 Thu, 22 Dec 2022 03:47:25 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 r12-20020ac25a4c000000b00492d064e8f8sm42937lfn.263.2022.12.22.03.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:47:24 -0800 (PST)
Message-ID: <51770a1c-45f6-9f5a-871d-022cd78a0d4b@linaro.org>
Date: Thu, 22 Dec 2022 12:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-5-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 04/21] dt-bindings: msm:
 dsi-controller-main: Add compatible strings for every current SoC
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
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8953-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,msm8998-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> 
> Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 6e2fd6e9fa7f0..01afa9e9c4b3c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -14,9 +14,21 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,dsi-ctrl-6g-qcm2290
> +    items:
> +      - enum:
> +          - qcom,apq8064-dsi-ctrl
> +          - qcom,msm8916-dsi-ctrl
> +          - qcom,msm8953-dsi-ctrl
> +          - qcom,msm8974-dsi-ctrl
> +          - qcom,msm8996-dsi-ctrl
> +          - qcom,msm8998-dsi-ctrl
> +          - qcom,dsi-ctrl-6g-qcm2290
> +          - qcom,sc7180-dsi-ctrl
> +          - qcom,sc7280-dsi-ctrl
> +          - qcom,sdm660-dsi-ctrl
> +          - qcom,sdm845-dsi-ctrl
> +          - qcom,sm8250-dsi-ctrl

Usual comment: can we keep the list sorted?

Best regards,
Krzysztof

