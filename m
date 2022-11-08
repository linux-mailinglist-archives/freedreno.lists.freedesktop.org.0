Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CA6211B2
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 14:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0582D10E050;
	Tue,  8 Nov 2022 13:00:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED0B10E050
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 13:00:31 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id u2so21004254ljl.3
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+kDjx/qzL2eh0m5wmlwsVx4x6L1R0dhYWzrrpOUccM0=;
 b=BQCNeJKIieoDBIAbTLQmr5SsfrzWxJdQ8odb739ZpsbXnIIoXJ6kKQ/uR5prOyAsIG
 E30yRLq11cpGe2l49t1UE5Anm28aOSCFL8ol1Mv2clj500sTbHvTz/+HqpzWjuvVE4mh
 lzxVUAG3FEKOwMU3Eo8n2YSjIwzipRG0K0eAuolBakV6utWJ3dhNe4gseNClVc4PD17P
 DNnOLCEKqJIu5AFswLkR2bFMniFJTvYL+NSfBdHlryHJtQteSOuUgcA+1QhEKSxl1/sk
 oJstNBKCEyiAEJ+APCyg0uVqXTrGpfLA0k6ca6mGu2Wem87mbFak5IoAcMX5He0Ibrah
 9yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+kDjx/qzL2eh0m5wmlwsVx4x6L1R0dhYWzrrpOUccM0=;
 b=Mzaw1TPWANvZ3d2SOZWVsGjxEj92Ya3zWeR7ugyJc0WyBoNS7qZ9tNhts5joit8Usd
 hxDxEcfXaP3JbYN/KWZp2wHIL5qbUxPF6+13qrFQm3RL8EpA5AZQd71JwvofnS8EGx/Q
 x2h7GqlUzZ5BQImib3P/vjAAPcau4Y6x2F2rR9MRdZrPXxG9RWfVe4GaWnRbrBbjqU0u
 ATVknNkm9YZwQaQ63R01lujbYayfv9+p+xD1Jiay6mVP1Gd1uFBKI3AumOTw9E2mJkuB
 hwdi0nrg0NMn8Lk1a4hp3xfl9C8ydFjLmWfqqakJqaYBrcDZ0BT/I29x0Ibyt1VaJm+p
 WtnA==
X-Gm-Message-State: ACrzQf0OK4SSkZOANDxJImrgxUQ3IsgiY4rkwZX3Y+X6Tg8sYpRaAPHz
 T67uvOHUmski3LQeVrq6IBXanA==
X-Google-Smtp-Source: AMsMyM6qrseYnJvmYhGPEvo2m0jeaZaM8yLMkfFFJSe2l9UtWRUdVcy9J/LnwHDzusZVXXYtM7zxpw==
X-Received: by 2002:a2e:98d0:0:b0:277:979:85da with SMTP id
 s16-20020a2e98d0000000b00277097985damr18057672ljj.23.1667912429363; 
 Tue, 08 Nov 2022 05:00:29 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056512114400b0049480c8e7bcsm1774176lfg.176.2022.11.08.05.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 05:00:29 -0800 (PST)
Message-ID: <eb36741a-6e07-402e-b707-0eb0708f6b9d@linaro.org>
Date: Tue, 8 Nov 2022 16:00:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-5-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221107235654.1769462-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 04/18] dt-bindings: msm:
 dsi-controller-main: Fix clock declarations
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/11/2022 02:56, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

However it might be easier to move this patch after the patch adding the 
per-platform compat strings. Then you can push these items into the 
clauses where they are required.

> ---
>   .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 0f7747e55b9be..cab38a20a54b0 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -35,6 +35,10 @@ properties:
>         - description: Display escape clock
>         - description: Display AHB clock
>         - description: Display AXI clock
> +      - description: Core MultiMedia SubSystem clock
> +      - description: MDP Core clock
> +      - description: MNOC clock
> +    minItems: 6
>   
>     clock-names:
>       items:
> @@ -44,6 +48,10 @@ properties:
>         - const: core
>         - const: iface
>         - const: bus
> +      - const: core_mmss
> +      - const: mdp_core
> +      - const: mnoc
> +    minItems: 6
>   
>     phys:
>       maxItems: 1

-- 
With best wishes
Dmitry

