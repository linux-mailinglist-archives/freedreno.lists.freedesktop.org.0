Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C575A08D3
	for <lists+freedreno@lfdr.de>; Thu, 25 Aug 2022 08:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293F10F76D;
	Thu, 25 Aug 2022 06:26:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E2010F76D
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 06:26:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m5so16255489lfj.4
 for <freedreno@lists.freedesktop.org>; Wed, 24 Aug 2022 23:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Z1nM8n9D4cKIWi39fJN2NwqcjbnvD6EFp1Fh0bxjzc4=;
 b=hNvYAqJ2fMgVfTRnyfDWcky5oQJfdfYi+EdOJEgIcIKlbFGnhD+xji0eDdp3G4FiBV
 li/WRRGtpXvSBfIY9h+kEDodO0Nuvnsjqolc9rmpHT2pT5w7CV9jO4mANXyYd0sYkCMQ
 AGax0m2WPRn9KJ4tHlBY3rtMYpNYPldGdFTzojUDma+OXFM3bpp2NbA68S8BEAS+F/kT
 ASp1W/5Zgtuwd4GTAfSf3p/ectWSNTqB40+jWtcZCdXqIryvnbDUl6KMNxc/CAzpWtKm
 39qMJo5w6+kedsFKna1EV8Dwoa9fnBx8gkQljEdnVZpYy4fkw4qH5vur4bjXS26Uasr5
 qGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Z1nM8n9D4cKIWi39fJN2NwqcjbnvD6EFp1Fh0bxjzc4=;
 b=j08PJ7havEvvnNC36/hqXMz6yhUias6qNQO0YDva3HCTC3R4e+AyNe//GpHAnDr0/q
 rsrnIFel1EtJvgzEa+l0VzFIIl276stR2hGA2gmMridkn/RNbPkyErYRutkkDL1elXTj
 +jcGOcqLcU+uXSbG4hzFDz0/xSQoagAfkeJwlu8J4JyFp6MTDiBgW6W6GhWL2WS6Hz0l
 uf6qFN+M8oJvTaOUQLv8c95jhz7psln7hV1PDM5nsERj0Q0TNzycox6KVuLoaKQ5NrCV
 oEcaGh7HqPNEzzKnm8Um482r2OuKVCSP01T3ligrLSz3eeSG+nsvkhfm/AQMzMzzzlXO
 ghRg==
X-Gm-Message-State: ACgBeo0Dq/6+Xly5EO949A1Ln06m9Cvz1PxutGiz/a5QRs73YukvOPL8
 FCra0Bmx21IX0zWx/AcIsmlCHg==
X-Google-Smtp-Source: AA6agR7dN0Oeo86So9OoOfr2zzWDWG3FwxukDfc3LUcA3VWZLlGdSlmuXbMu+QCVHLh7M7V+OcogvQ==
X-Received: by 2002:a05:6512:a8e:b0:492:b3e5:adcd with SMTP id
 m14-20020a0565120a8e00b00492b3e5adcdmr674979lfu.374.1661408758612; 
 Wed, 24 Aug 2022 23:25:58 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a056512203c00b0048a91266268sm311509lfs.232.2022.08.24.23.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:25:58 -0700 (PDT)
Message-ID: <84caccd4-1e28-b344-8e7d-67a6d5c974f2@linaro.org>
Date: Thu, 25 Aug 2022 09:25:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20220823145649.3118479-11-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-11-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
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


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
