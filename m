Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B05A24CD
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF1C10E57D;
	Fri, 26 Aug 2022 09:47:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C348710E7EE
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:47:16 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id x10so1069619ljq.4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=7/zLm6wYmIJxefFBwnQ6xTIL94BoETjg8bQDFj+L0EQ=;
 b=HIdAzMqZp+CHMUJvXZDL4kQfbbHEzP9oyvYz1ueQNzPdJuFdzN/xiOWNVvAI5PypY2
 phc7mMSMvv0CqdAk3VeOaSOG1rVJQhyoTe39lWgf29/RQtOFhD7d+DPbjBkxwJtUIkhy
 cta3uW2ybEZW+YD8Fw2dkJR4gv7MOtmY6qC+zYXXmj+Z4l5AhOceFVfeylnXwXhn1Qg4
 ld1fWsPQV5Kf/3HaxA9FJzTVAxTZPdCP38pgrmH64yfQ9etak3X7fthigbG+2fPn57OV
 wm7dDnDP5PGUOjHBGcdSnq4ZOYoc68PuhJYJy371olT9dw/BL1IEEx4esBwhZD/7bnUm
 gpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7/zLm6wYmIJxefFBwnQ6xTIL94BoETjg8bQDFj+L0EQ=;
 b=qIvM6NzcICrhxEevSMzTGi9ptTsyPKluJ+bhCASrib4AOi+cg+mcW0jJAYeqnKyWg5
 FpLXzfAHvjRTfBMcytN+FxJ0F+XBcuMsZRcapbLwjqZSok+scTbT/vBQpAYuPuFDlAPN
 VYifjYKN7Tcl9gU4MZGHmW+i3TNga4RWOpaYlO7p+u8GWWn+9d0ahuxxumTL9o69M8mj
 t2wUbGYQkNsBhDt0tvVP/1qK8iAXYpg1M1qaw+fVQOJAKxfVUC3ps9N3z4bOVhvP/B3T
 3O4T7XzsFVpwbcmfhlogtmdYWfDICd2wxTYV9ySgedGzgTGFN9eCSpEhCkQWjM+7wCGZ
 DbAw==
X-Gm-Message-State: ACgBeo3/RDyi/a4HsnvMZC7ANzBABp/9bk7PllhGsk9B9hgvvdf7Q8SI
 TSeOAfxbrVqFJsM4llnFNSZ1tA==
X-Google-Smtp-Source: AA6agR4NooJqTIyf/F5iZCsGcw1gdJa0BYVeuEHWvl+KrvNFJZWMb3qoex5YNXUISP81L4uvAWNr2Q==
X-Received: by 2002:a05:651c:179c:b0:261:8fbe:b729 with SMTP id
 bn28-20020a05651c179c00b002618fbeb729mr2140443ljb.114.1661507235107; 
 Fri, 26 Aug 2022 02:47:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a194316000000b004931817c487sm320823lfa.197.2022.08.26.02.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:47:14 -0700 (PDT)
Message-ID: <e4c5a39e-6a47-6814-92f7-c751bd95bdf0@linaro.org>
Date: Fri, 26 Aug 2022 12:47:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Marek Vasut <marex@denx.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 5/5] dt-bindings: display: drop minItems
 equal to maxItems
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/08/2022 14:33, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml   | 1 -
>   .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 --
>   Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 2 --

For msm changes:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   .../bindings/display/samsung/samsung,exynos5433-decon.yaml      | 2 --
>   .../bindings/display/samsung/samsung,exynos5433-mic.yaml        | 1 -
>   .../bindings/display/samsung/samsung,exynos7-decon.yaml         | 1 -
>   .../devicetree/bindings/display/samsung/samsung,fimd.yaml       | 1 -
>   .../devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml  | 1 -
>   .../devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml   | 2 --
>   9 files changed, 13 deletions(-)
> 

-- 
With best wishes
Dmitry

