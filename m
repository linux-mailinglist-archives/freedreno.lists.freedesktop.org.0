Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E77620E1D
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 12:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43C810E3D5;
	Tue,  8 Nov 2022 11:05:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB98B10E3BE
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 11:05:22 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g7so20742782lfv.5
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 03:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WmA4SwRAK4FKhvbkswEw6v9u4o5Xo6uAQ5jvXjJ9JHs=;
 b=x+lUOScQI2UK3mV8gMgM4ALhWKQ5J8qhEO23u/nHu/FkhLd3emRQJj/XilDluE9hYF
 cNz+e1I8EFkpjzlfTeJi7LFZwWpxK+X4144Czxh9WB4jILvjdJHgXT1zNxil4Xglpoj8
 9OEkdh0B/f6bWlbhoq8zeTsDa/Fqz20UKwr02P93OCX3r7nQoux931fBNPein6IUt+pC
 qdTq+K+ExjQfP7DlrEDmYGTC3Y3GCHt2/e7i3RjWqbVAxJhgCNh8tDgmmwoTiR1hlBHo
 NMjqRZwBpqW9YdhXai7zBWusStWYzVYx3ocGxCOhJ5Mf/FO5ooETg4PzcTCZR4VlOVh9
 aI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmA4SwRAK4FKhvbkswEw6v9u4o5Xo6uAQ5jvXjJ9JHs=;
 b=TQ/5XWrY5KLe+6V5SyAlzIeWI2J6+HiLLqRY/WV6k7pSvI61YdmGS7F/roxdVbYhAa
 8A9bov+qEnakO+10R4+4M3W+ZeUWiGrsBh+3DuGqD8jEbekWxapzjPNSahpkC4dVsvk6
 OHe/9B29JEBrZNCJmcuPMfTuMZsKWPTBNsWfY+JX3ap9otQEj4tS8EHX9qzVzkoh2iAp
 U9ICnLU2XXfsqjm7CXaH9kkbHgx1CI90ryXG/I1OFuYUlf1mnx8GIkpc6Cwwy0M1bKnD
 6M+egYJ+aWGY+JmANWimOtVanYrtKSryIOtEewbqrFCx+6SLkeI6krYxtE4jmu78dd4J
 qHfA==
X-Gm-Message-State: ACrzQf073SS/45quN+Qlx8wgzGFcQCDmRYVf8bPNemQNiwPYD/lzZxob
 KoIul184GlksO/B/Ya6Zc7ffwA==
X-Google-Smtp-Source: AMsMyM4QCZNhzqj/hg5k7Q/ywTj5eooBtNeEJafutY0EP3/GsLy+44CVVIEhKeAoePc6bKJbhlxDYw==
X-Received: by 2002:ac2:5dce:0:b0:4a2:2dad:7ad4 with SMTP id
 x14-20020ac25dce000000b004a22dad7ad4mr18570086lfq.654.1667905521139; 
 Tue, 08 Nov 2022 03:05:21 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a2ea229000000b0027765fd616asm1705206ljm.20.2022.11.08.03.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 03:05:20 -0800 (PST)
Message-ID: <f72aeaa0-0c0a-86d9-0b9b-db3810c35fad@linaro.org>
Date: Tue, 8 Nov 2022 12:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
 <20221024164225.3236654-6-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024164225.3236654-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v9 05/12] dt-bindings: display/msm: move
 common MDSS properties to mdss-common.yaml
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/10/2022 18:42, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.


(...)

> +    minItems: 1
> +    items:
> +      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
> +      - description: Interconnect path from mdp1 port to the data bus
> +
> +  interconnect-names:
> +    minItems: 1
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +required:
> +  - compatible

For consistency this should not be required here, but in schema actually
defining it.

> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +  - ranges

Keep the same order as in list of top-level properties.

> +
> +additionalProperties: true

Best regards,
Krzysztof

