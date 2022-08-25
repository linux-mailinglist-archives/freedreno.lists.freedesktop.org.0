Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0825A0FA6
	for <lists+freedreno@lfdr.de>; Thu, 25 Aug 2022 13:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C6B11390F;
	Thu, 25 Aug 2022 11:55:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D71111390F
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 11:55:43 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s8so1714686ljj.5
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 04:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=6XKZfRQTbqgRZcANt6xELc2SVlUljiEWEfQE8Qx9J+8=;
 b=Qqf/eZldqtrSxY+Imp6UQb0gxT52HRHcfkvEHvpCVlEEUx0bABCkhI5Hvn07yHr970
 9O1i9/E74Y7k/gH4VzdlpLrv+Ux1Uq2HRIZKdWGlNX8tx/FSUy4N7jQ2gnh0FtBa0+9M
 Mr98uzkTkMjZWF9QwkwxNgCu/omlrI90+2tBpOgf3zutgux+DG3HoUNAAEk2z04tfckB
 oGNxAxuxM0m88qTgHjFll5yF32EOvSXwbRop+3MRbNazeGMyskV/tvIZlyqUf1klOdQj
 LkYesc9VmoU0fgEzD1pF/ezlRP7TFOBi/5gIHUoA8ofCsX/5YZ5EEHuBAfJog1gVnvgL
 GLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6XKZfRQTbqgRZcANt6xELc2SVlUljiEWEfQE8Qx9J+8=;
 b=DH3N1eGQMr1ZTNCD4bVDlnbx1cDLgMjTztCCKGcAvpZXCblzJIVI3lhBl3hLvdFTjU
 QwVz8sWrmWQHRZjC/FNcPAeIelsDGPNiDdFisLWR02mIaAjuidBTDwk2bFB4YbQ3bI9T
 N8Calj7YATsJFCq1HRaL59NgYVEAjpnfGw1XFb9XZ0LRcppQDC0adIpaGMWFgfeDA+DH
 MFNe85+dBZotMl+flZKfbxHAnvuwC2DAFNjkeWnvcCA+Q+QZhMaddJC5p/vkYaRuCx5N
 yoLRdvtS94AqI+HbByvNivbgo3OMV01E3aLw6paZdFSfsWS+/croFzjAy3Ql6Ob+BtU4
 fddg==
X-Gm-Message-State: ACgBeo2x5PYe/PFVwBG1m1Wrx5PzbZpVmiDdP8m7a8CGYB+SNCHaUTGa
 E3MweLFRQSR1MDx3kR0ox8jOqw==
X-Google-Smtp-Source: AA6agR6iJRh4adLmym6DhicDyzYTJIpz7bsuJ8SQG/bWGZqpju0gBB68YyMlqiclDMC2VDp5to2LeQ==
X-Received: by 2002:a05:651c:1025:b0:261:c071:c473 with SMTP id
 w5-20020a05651c102500b00261c071c473mr1002073ljm.71.1661428541105; 
 Thu, 25 Aug 2022 04:55:41 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a056512102f00b0048b0176bac6sm464706lfr.93.2022.08.25.04.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:55:40 -0700 (PDT)
Message-ID: <a0eb1fd7-4bc4-f62e-b61a-f02e388afda4@linaro.org>
Date: Thu, 25 Aug 2022 14:55:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 01/10] dt-bindings: display/msm: split
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/08/2022 12:50, Dmitry Baryshkov wrote:

(...)

> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    true
> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +oneOf:
> +  - properties:
> +      clocks:
> +        minItems: 3
> +        maxItems: 4
> +
> +      clock-names:
> +        minItems: 3
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: vsync
> +          - const: core
> +  - properties:
> +      clocks:
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - const: iface
> +          - const: core
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

This goes after properties, not after required.

Best regards,
Krzysztof
