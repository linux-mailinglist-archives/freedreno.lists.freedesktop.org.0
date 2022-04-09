Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6953A4FA97D
	for <lists+freedreno@lfdr.de>; Sat,  9 Apr 2022 18:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86E210E165;
	Sat,  9 Apr 2022 16:29:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553FA10E190
 for <freedreno@lists.freedesktop.org>; Sat,  9 Apr 2022 16:29:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z99so4722960ede.5
 for <freedreno@lists.freedesktop.org>; Sat, 09 Apr 2022 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=013KQyZoC1kiZK8acrvQDTsvOmSOuQ5IBcDI4parlh4=;
 b=yRLY31N37VK2cj40RKzRn4+6jDccfmifkjJE0UtauU4xkiKlwJatKyqvpuf9zcyk99
 1HxMksrcfB3cF0MZ/9jQazdY+jqCsLCOGJw+X6rTvWrZveibmeqQuLja+LFPoMZHJchL
 dNqjc4m/hmCCjTeS5PCVAYThu/vRzu9iOFOWoojX+bZoay1vK2wnaPE77qL2ML0W996L
 dfxWcptyWqo7jrhuTrl9/n+Kq7N3G6efYjeZ6N8bYrI+qVnUonDQPl81jSnDgRlPsl3i
 YGSXAEmXdgZoq+Cq2MYipbejX8LZbtU+tNRWgLrUWJPciF1xtwiclBJKiLo5qpenLRDw
 HgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=013KQyZoC1kiZK8acrvQDTsvOmSOuQ5IBcDI4parlh4=;
 b=1A1rvOOncSX992RQY7kVeMdpHDTsgrVv/0IptIH7lM+iumfahcHdOQldBj9kD9wM5v
 6tN4L1kCwyDXOctsn3R52oLp/pMtGz7gXgU93irQVCrRDg7KUQSS2seldWy+QyJMQcoX
 QBAGyNtwG7O07w0LSH6hAXSKx/r5gJ34/GB86IfgUbreSYOqFrhyTSwioiMIj7GfrvT1
 XEJQfeYaPNg9KvT+NH0H/FZsNIkgw8O2QbfB8Zh1MzCauGdZdHq5zkz1ituPRLccbEkU
 PUm1aJ4hLrFpxztpizALsJpgTxq7wVqbtB8EDPXO/9ryDnuEi5rE2X+upvruJpS4CM1J
 vCcg==
X-Gm-Message-State: AOAM533mkrb78spMum6rrl1hXk1OyH2TVnr2Am/MBvng/MhddruJNwAX
 d2Y/tMdoyX7GhbOtq2iWIFK6wA==
X-Google-Smtp-Source: ABdhPJzQFbm5lCSBjckKBhmk/0GHd3D233fa4uyGyQrZQ8dNln3xQBzO5NCowNNtBZahuYgMrlTpkw==
X-Received: by 2002:a05:6402:2554:b0:41d:79:945f with SMTP id
 l20-20020a056402255400b0041d0079945fmr15417239edb.120.1649521758824; 
 Sat, 09 Apr 2022 09:29:18 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 f26-20020a170906825a00b006e7efc52be8sm6865768ejx.166.2022.04.09.09.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 09:29:18 -0700 (PDT)
Message-ID: <c63f7e1c-b40f-474b-507f-86d214048a5b@linaro.org>
Date: Sat, 9 Apr 2022 18:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220408210253.581337-1-bjorn.andersson@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408210253.581337-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display: msm: Add
 optional resets
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/04/2022 23:02, Bjorn Andersson wrote:
> Add an optional reference to the MDSS_CORE reset, which when specified
> can be used by the implementation to reset the hardware blocks.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - None
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
