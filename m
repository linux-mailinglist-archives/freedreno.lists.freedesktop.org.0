Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB666921C4
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 16:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E477010E18C;
	Fri, 10 Feb 2023 15:16:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD6F10E19F
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 15:16:07 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id m8so4955727edd.10
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 07:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l8CFDc7Q6h4tHsEQ2o15gydhFTdkNgUBmcZbo1eZNCM=;
 b=E6DTdjabGvQ39rr9knwYpFeED6vmEVuSPCla0PBX/oZyo64j1Mg17QS3JlPBCoR96S
 Qfp0L3q2VHNjmlyjv7wqbAHpNHBWz9n84MVQwiwNEmxT1CQIfAQdfZDB3NIdtX3eGg0o
 hCuJjxYSB2m1ZJtJobTpiwx8gyKNxCiWftnvoif6hYgTOrMp21cirb5JHhAjWSTJve3n
 TSTVkvDolN4Bdv6gl6bmWAOMhdhnUbNQAqHy1vM46ppjHNCvN/NV8cQcT3NZIr/6Dh5t
 rv4fQBQQiSF97SlI1Z6epm2edee3N+LNz9R3Kf21z1KaZVMlg2Ws3XrnoScb45g2RiLU
 5wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l8CFDc7Q6h4tHsEQ2o15gydhFTdkNgUBmcZbo1eZNCM=;
 b=TJ1URUaBoU6DhLvNjxMC5KvyrYR2MmDv1eSk0Tn7ZRIwGBLhOmS9q9vzU2GMZ0alvK
 ie6Xt72/U3jf6kpZTHLTtqH8V2gvSnorC9F5pKeJW27Cgb8er1rkOV8dR9lykalU6ggO
 lZgMtJ+N9J3c0PXrKyKrHzqWsRhz8wEm2siXZDsCoh7G1qJDbsYm7eGzLRwkL2RszPbF
 uGa15ItsLHB1Bt/H76aNwpK+68y2VwE1XgzxnIx32nA23FyeKxkoSNPnw1WAKtUNojya
 eQEaq5W10g7gIx1rjg6iCHDc+8leBF9JGOQUVoxuCGNhESQzGLyriECwZ0Tb2FtXvPeu
 XKUQ==
X-Gm-Message-State: AO0yUKWEQ7oR3Vd8GIgWVvdrISxxeyCIp09HYe0Qy2Vt9NWYOjGIPw6T
 tVZHSg0SbF7/KhgllaI2vC7vQg==
X-Google-Smtp-Source: AK7set9GJwpO0Qq/hFPdLoHPZmF02QHKyZ5F0U5XlbyPvbWgDVlbuM0P695kOBX0NSN0a3NVPlZHiw==
X-Received: by 2002:a50:bb4e:0:b0:4aa:b40d:e0a3 with SMTP id
 y72-20020a50bb4e000000b004aab40de0a3mr16382386ede.34.1676042165662; 
 Fri, 10 Feb 2023 07:16:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 cq5-20020a056402220500b004acb2c8aeaesm286858edb.85.2023.02.10.07.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:16:02 -0800 (PST)
Message-ID: <226aeac5-d1b1-2a99-5c17-c26a8458c5ea@linaro.org>
Date: Fri, 10 Feb 2023 17:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-1-636ef9e99932@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-1-636ef9e99932@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/5] dt-bindings: display: msm:
 dp-controller: document SM8450 compatible
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2023 16:44, Neil Armstrong wrote:
> The SM8450 & SM350 shares the same DT TX IP version, use the
> SM8350 compatible as fallback for SM8450.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../bindings/display/msm/dp-controller.yaml        | 25 +++++++++++++---------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 0e8d8df686dc..f0c2237d5f82 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -15,16 +15,21 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - qcom,sc7180-dp
> -      - qcom,sc7280-dp
> -      - qcom,sc7280-edp
> -      - qcom,sc8180x-dp
> -      - qcom,sc8180x-edp
> -      - qcom,sc8280xp-dp
> -      - qcom,sc8280xp-edp
> -      - qcom,sdm845-dp
> -      - qcom,sm8350-dp
> +    oneOf:
> +      - enum:
> +          - qcom,sc7180-dp
> +          - qcom,sc7280-dp
> +          - qcom,sc7280-edp
> +          - qcom,sc8180x-dp
> +          - qcom,sc8180x-edp
> +          - qcom,sc8280xp-dp
> +          - qcom,sc8280xp-edp
> +          - qcom,sdm845-dp
> +          - qcom,sm8350-dp
> +      - items:
> +          - enum:
> +              - qcom,sm8450-dp
> +          - const: qcom,sm8350-dp

Neil, Krzysztof, I'm not convinced that this is worth all the troubles. 
I think it would be easier to have a flat list of compatibles and handle 
all the differences inside the driver. For example, for sdm845 we simply 
reused sc7180 config internally, while keeping separate compatible strings.

>   
>     reg:
>       minItems: 4
> 

-- 
With best wishes
Dmitry

