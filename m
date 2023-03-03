Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7420D6AA5B5
	for <lists+freedreno@lfdr.de>; Sat,  4 Mar 2023 00:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2425210E788;
	Fri,  3 Mar 2023 23:41:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A57F10E787
 for <freedreno@lists.freedesktop.org>; Fri,  3 Mar 2023 23:41:08 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o12so16528804edb.9
 for <freedreno@lists.freedesktop.org>; Fri, 03 Mar 2023 15:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yMNrZUp6pzMsmCIoeKDAki7FuOXM5/PO0f2N1n3xENo=;
 b=Gke87oANQT5GpbGgDOYrs+zl7R4QeSxtcAbfDZX4/SLj63HpyKS0gItIdeZqgDFfnx
 Jcvh+eVekTl10KlChVgiZWYKKYV0NrG9jBs/lYC27Co0/knP6Z8zLhBwPLMZhPFHQlMi
 25i6zGeSjVG/IelJI5qZAQPAvbuk8FOkAOPpO62v43b3pHRs99IWs3dC2bDk8Hthb+Ml
 GUpb60f6CCWiyzhJYk+OzC0DCQLdI4jr5kObO5q8jJDFT5dzVEAEtAWiigiqE9U5PcHN
 +26u7YQg/iHnR0fQe+B1tOYgzxfnNGZ3MDb5UVMLAd1ogSIBcHqTtIDIjQBZtAyNGqFE
 uqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yMNrZUp6pzMsmCIoeKDAki7FuOXM5/PO0f2N1n3xENo=;
 b=ElmAVykJakhA2quNFn9hbPCI6X9zPoBE/HfUsQjp1e4i27stshdMulwNjgj4d4mP5R
 diTBZnzBZFikDfxp6n0BIOLQdCcYXKaDHBjyb/w+uupCd/UlO2+LMQHVZbczxMwIstPn
 JMzyz8A+HwSn67YtM7ZEp/+uPDQoEL60+TmxKQmQ289K55LAaIaYEcwAZxt4SEiXrW0j
 Nge9MKYdxmrai8VLyiMURgNhJjoWN/LZV2ZolY0eVPpzFur77spRjvVefRbHPAkc8iZR
 cp8IbySLGF8Oi+USrAYi6BsEL22YPj/shpdn4E1ZtjLQEAOnO5Xul7WXIOuVINzOf6c5
 xTFQ==
X-Gm-Message-State: AO0yUKV0f8lZinlg+olearOitasHq4AersZIOker2eeyiA5bkQzmRi5B
 T8nNrsQ73YimflpwO6OAU5lnQw==
X-Google-Smtp-Source: AK7set8R5K0Uxk42QxMR14lIf20ANl3YTOCrvpvH4LIk+JBOzaYhoc1dhxDaczVoPUaJ+pKQ9+171A==
X-Received: by 2002:a17:906:d542:b0:8b2:e93:3f59 with SMTP id
 cr2-20020a170906d54200b008b20e933f59mr3843838ejc.31.1677886866782; 
 Fri, 03 Mar 2023 15:41:06 -0800 (PST)
Received: from [10.203.3.194] ([185.202.34.81])
 by smtp.gmail.com with ESMTPSA id
 ca5-20020a170906a3c500b008bc2c2134c5sm1452968ejb.216.2023.03.03.15.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 15:41:06 -0800 (PST)
Message-ID: <d5e39671-fe26-e136-4ba0-fa5324414799@linaro.org>
Date: Sat, 4 Mar 2023 01:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20230303214223.49451-1-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: yamllint: Require a space
 after a comment '#'
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-crypto@vger.kernel.org, freedreno@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/03/2023 23:42, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-spi@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/.yamllint   |  2 +-
>   .../bindings/clock/qcom,a53pll.yaml           |  4 ++--
>   .../devicetree/bindings/crypto/ti,sa2ul.yaml  |  4 ++--
>   .../bindings/display/msm/qcom,mdp5.yaml       |  2 +-
>   .../interrupt-controller/arm,gic.yaml         |  4 ++--
>   .../loongson,pch-msi.yaml                     |  2 +-
>   .../bindings/media/renesas,vin.yaml           |  4 ++--
>   .../devicetree/bindings/media/ti,cal.yaml     |  4 ++--
>   .../bindings/net/brcm,bcmgenet.yaml           |  2 --
>   .../bindings/net/cortina,gemini-ethernet.yaml |  6 ++---
>   .../devicetree/bindings/net/mdio-gpio.yaml    |  4 ++--
>   .../phy/marvell,armada-cp110-utmi-phy.yaml    |  2 +-
>   .../bindings/phy/phy-stm32-usbphyc.yaml       |  2 +-
>   .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  2 +-
>   .../bindings/pinctrl/pinctrl-mt8192.yaml      |  2 +-
>   .../regulator/nxp,pca9450-regulator.yaml      |  8 +++----
>   .../regulator/rohm,bd71828-regulator.yaml     | 20 ++++++++--------
>   .../regulator/rohm,bd71837-regulator.yaml     |  6 ++---
>   .../regulator/rohm,bd71847-regulator.yaml     |  6 ++---
>   .../bindings/soc/renesas/renesas.yaml         |  2 +-
>   .../devicetree/bindings/soc/ti/ti,pruss.yaml  |  2 +-
>   .../bindings/sound/amlogic,axg-tdm-iface.yaml |  2 +-
>   .../bindings/sound/qcom,lpass-rx-macro.yaml   |  4 ++--
>   .../bindings/sound/qcom,lpass-tx-macro.yaml   |  4 ++--
>   .../bindings/sound/qcom,lpass-va-macro.yaml   |  4 ++--
>   .../sound/qcom,q6dsp-lpass-ports.yaml         |  2 +-
>   .../bindings/sound/simple-card.yaml           | 24 +++++++++----------
>   .../bindings/spi/microchip,mpfs-spi.yaml      |  2 +-
>   28 files changed, 65 insertions(+), 67 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # drm/msm
(and other Qualcom-specific schemas)

-- 
With best wishes
Dmitry

