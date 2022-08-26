Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B645C5A2586
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 12:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59E310E825;
	Fri, 26 Aug 2022 10:11:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555E010E831
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 10:10:57 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id m5so1390107lfj.4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=zBsaAPXHP/WINN92NN7t+ecJR0ITtEiUOYhWSRxDrOo=;
 b=ZUeoL8+bFhmGyi/2xXx0UdI4XZSmxqCoQ/yHxfiLH/DU9QQGvq9wEZGUVjYwgMXwKi
 26HcnUPfHIWYzIKhYqQoZx90f3H0nrZfVGP/eqKhMhYGWJD04pqDRjmwvRzRM6h1tcaE
 LRVVaFFo/wx3mmsFyOheVWHkOmEb2o1C4IziuaZBI94AH62n4M11qRSK7FOIrfQIzNf5
 vThpod+1K9nDrs5ER0gKpQtabrijnomOc8918irJfKNNhsd2DNxbrg/VkjLVjWgoWFMf
 kj7VPv/e9UqGXTgGWpvzn4orocfJ1/AjcFV9M5WeSnycQn0CMeGRZYnXfyhfkU9f+5aT
 EtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zBsaAPXHP/WINN92NN7t+ecJR0ITtEiUOYhWSRxDrOo=;
 b=K9xwIvwUHJQKuKnj0Mt5LX6Shbyhc8HAK3SdDP7hTQVA2O1euzeLEt1RrcziUPQ/YK
 amWd+kVln8QgGn9hiNzjFa5wAQacW+SUlr4H0r8ZdLIUBXQuOl5Gp2LndPN4u55csQ8c
 XjWDg+rAhf/tAI07hFGhT1upIbUVfnkMYDrt+bbt/Z9d90OOlCIrqTlF7NZZny9Bnp+Z
 ylhZNJgoXaw2M9HyEen/QQXeApvi1nG6+kf1F6t/L0RnLA5qzcIsDQsnWoywaqzljQmM
 qo9GUw0Q1JwBt2OJDL6QBv3HcBOM2eTmpvCvfZk0Vytf6cqsBbAcL9X5zXzeuZlDv0+k
 8Biw==
X-Gm-Message-State: ACgBeo2bVE/eipGX28cuPUdAmSNuoU1kvGf/HAf6K1s84goDULBpYSUS
 U9kQz3fvVZx9dPMzSQHbPvTTVQ==
X-Google-Smtp-Source: AA6agR5Ibvjx4/X46gslkNdnrORZcJxR+lxt0sY3ESbw+/23dXGNcAwyX3sJKgTU+5hglvPmE7IBFg==
X-Received: by 2002:a05:6512:2248:b0:48a:f8f9:3745 with SMTP id
 i8-20020a056512224800b0048af8f93745mr2137147lfu.256.1661508655644; 
 Fri, 26 Aug 2022 03:10:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a056512314f00b0047f7419de4asm330732lfi.180.2022.08.26.03.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 03:10:55 -0700 (PDT)
Message-ID: <47e1460f-e775-d1cb-f622-ccac3044ff86@linaro.org>
Date: Fri, 26 Aug 2022 13:10:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>, "James (Qian) Wang"
 <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20220823145649.3118479-11-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220823145649.3118479-11-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: Add missing
 (unevaluated|additional)Properties on child nodes
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/display/arm,komeda.yaml        | 1 +
>   Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>   Documentation/devicetree/bindings/display/msm/gpu.yaml           | 1 +

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

>   .../bindings/display/samsung/samsung,exynos7-decon.yaml          | 1 +
>   .../devicetree/bindings/display/samsung/samsung,fimd.yaml        | 1 +
>   5 files changed, 5 insertions(+)


-- 
With best wishes
Dmitry

