Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837869A7A3
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 10:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB87810E172;
	Fri, 17 Feb 2023 09:00:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570CE10E2C6
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 09:00:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m17so2165434edc.9
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ekNOF1bkOZQJm/qVwvKNIt0dSpLOM3/k1DSdulZe8LY=;
 b=u0R7xCkg647d+PdFtOjae2NNauQmSugx0nA2CnibFYJNb2TqRH6QZUxXuPoW5E5otf
 5x0s6r74XqEw2i+BBZpbvEUD4m8tp3h0qZvZ5cSSKfpQnnaN/Q7Uo3IuuRs+Uo4NTXm2
 sBXp8os91H2PSM7ZiKznGecqPLNTZwVOxTSeOdo3bHJlL1eb4l2+ds3nqHt5UjBKiYQu
 dkL4a/Hj84gZjPHoMjW3gax2UOBzw6ME+5HKDVsqezuk2EF9oJAkCIPjky7SdhwrCbbp
 dKFCpCwcljp/4D2fSuabF0pHcEChhlQr/Mudc4RVN7+XHddW94cgrRCtjdy8QqiLALLo
 1N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ekNOF1bkOZQJm/qVwvKNIt0dSpLOM3/k1DSdulZe8LY=;
 b=U5AHQ377gwKYWQ8xtlwRvGFX4JlqCxfSLd4Rf2TMb5Gq8OKDms2NQPRa+g7KVcBs6+
 jWaxQXlVgVYn3akN/RPF7L6pfJueht29GwXpsUqQjJjKgtinMmAyffYZdSLnLOWclKeO
 9nZe0lt8QY36Ixww1HCiBP6TgMBuEx+M5dl1JD/Ogj2RSKIIxzXaqSZjJTe9tPI8JA/s
 yqdrwEIzfbE5z47dPRCC1hRJ2kYczS1Ag9GUPd7R/wx8ot1DvJ8gBegOUk/8wagpspaT
 LGfDvghmqWCBP0i7ge13iOiQp8SxFAzpMPkDmzjZSDvWKefpbYScNxVC0jTqxzaA6dAC
 kSJA==
X-Gm-Message-State: AO0yUKV9p8G0rbA4yCVhJPQ+yl2MnJuJ+nFD1fyPzzkbf4KkI988rcR4
 EOdXklEQJeliU8ob1Tiz1B+W1Q==
X-Google-Smtp-Source: AK7set/ELRtrQY+LPmu6Ny5BmCpwfAgT22qZ3hPf7KIQmiUV5HJahas5slRjT0KhbQCmxe6/O4yovw==
X-Received: by 2002:a17:906:f28b:b0:870:b950:18d4 with SMTP id
 gu11-20020a170906f28b00b00870b95018d4mr34213ejb.5.1676624429688; 
 Fri, 17 Feb 2023 01:00:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 gx10-20020a170906f1ca00b007ad69e9d34dsm1877582ejb.54.2023.02.17.01.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 01:00:29 -0800 (PST)
Message-ID: <943daa4a-8101-d5fa-b38e-97aded3e3b4c@linaro.org>
Date: Fri, 17 Feb 2023 10:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230216131426.3996378-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216131426.3996378-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: msm: sm6115-mdss: Fix
 DSI compatible
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/02/2023 14:14, Konrad Dybcio wrote:
> Since the DSI autodetection is bound to work correctly on 6115 now,
> switch to using the correct per-SoC + generic fallback compatible
> combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Depends on (and should have been a part of):
> 
> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> index 2491cb100b33..146d3e36d1c9 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> @@ -40,7 +40,9 @@ patternProperties:
>      type: object
>      properties:
>        compatible:
> -        const: qcom,dsi-ctrl-6g-qcm2290
> +        items:
> +          - const: qcom,sm6115-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

You should rather keep old compatible as deprecated (so oneOf with two
options - items and const with deprecated).

Best regards,
Krzysztof

