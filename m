Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F658745D17
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 15:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1B610E218;
	Mon,  3 Jul 2023 13:25:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EA010E218
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 13:25:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so43532735e9.3
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688390733; x=1690982733;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IOndpcYQZRei86HjTSa6sLCOIMedJ10F8ZmbDKThl2M=;
 b=vd7G70PqJmphoqcC5/iGI9byEgifXwK6Rj3mJrKjAIB8uLw1hpzkudZj36bLUzAfkk
 CjzNWks5k2enqZ83uiheJk1bPKP4uBNGIYPZq9fUuff3p2KtuZ3rqJncJyFJqF58Wk11
 z3wyE/Lpomy7vrHjrlZWBHS1lrFctL5sXDGQirjHnrOynrP0Lsyxy/RUFfpaiizpZ15D
 m2niLhmeobmjKoqyeci4H11VdTtxm8S2YpJ4x7pVGDNNw+N9JpOT8TaCH2LRBE6AMkMV
 2n86A3zQAeyy55sfLbSPXNIM5/Y7R6C5jvxqBMMqtnupqZrKysuVl4uSym0zdS0BCsLV
 ydtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688390733; x=1690982733;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOndpcYQZRei86HjTSa6sLCOIMedJ10F8ZmbDKThl2M=;
 b=jro3N9gihsJyvqQupLAK0dIsYjFhjz2Bz59fObcA2ah+ThWjFjEf4ondfLiuBIeq/h
 fKzFn/Mqxp59xwgibr94+sDH3BpJpo7DNyo6jXMafV1ZXrpe77RLegTAAtK1bPiR1I7m
 ivLjuDmaIZfWdLkNjmNR0KyVE3POeKpP6ANBOohXXU3A+AxOkRPFWnec+1GaYlVKS209
 XAtYALorfunOKdLZWS7UujR397XloqmdBTBDepetEqqoEVY+QHrCaBe3N1kG+qwSJKce
 C9uuBOCRSO56DVb2K6L9yhp1ii/eH2gdNXScPhFyTQ/cNO4w+78hyfZJynaNEC/dsY93
 w/xQ==
X-Gm-Message-State: ABy/qLYdS6GoBIp7oFME45mp53nPGsUJAKgQBsgfPNLuEkOyJuMgOEZ5
 Ih7abSihkHxNIoNHZJrRN5FIvA==
X-Google-Smtp-Source: APBJJlFRFQcvat3EQxFgB5SI6iSmXIGa31iU1VkZvt3I+z99Hnaof/6yj4+br2u7++97LUjZHWQZuw==
X-Received: by 2002:a1c:790e:0:b0:3fb:db66:8332 with SMTP id
 l14-20020a1c790e000000b003fbdb668332mr1599049wme.40.1688390733118; 
 Mon, 03 Jul 2023 06:25:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf0b:9dd4:190:b74f?
 ([2a01:e0a:982:cbb0:cf0b:9dd4:190:b74f])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c205300b003fbc2c0addbsm10279849wmg.42.2023.07.03.06.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 06:25:32 -0700 (PDT)
Message-ID: <1ed2eca7-b5bf-8d25-d38e-15022a8c8a39@linaro.org>
Date: Mon, 3 Jul 2023 15:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: cleanup DTS example whitespaces
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
Reply-To: neil.armstrong@linaro.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/07/2023 20:23, Krzysztof Kozlowski wrote:
> The DTS code coding style expects spaces around '=' sign.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rob,
> 
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>   .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>   .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>   .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
>   .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>   .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>   .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>   .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>   .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>   .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>   .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>   .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>   .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>   .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-

For amlogic ones:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>


>   .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>   .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>   15 files changed, 30 insertions(+), 30 deletions(-)
> 

<snip>

