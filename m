Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC5F4E9C74
	for <lists+freedreno@lfdr.de>; Mon, 28 Mar 2022 18:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F0710E729;
	Mon, 28 Mar 2022 16:44:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3539B10E729
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 16:44:05 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id jo24so12288109qvb.5
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZFIdehZrTxdj/RvUPXGwNiJz0CBRPSutTAor/H+cLso=;
 b=HY7BqZqay1vHlPzQoQMjzcnyQyiXyRjGp+TAREShAf3pydiqV7DKYRaYQoqT77XomN
 95E7RQUXQwKi69JGzrCjskWWNF3VvTACp2QapXR/gcLtFij4dmvrqC42wjHDRht+Dxwb
 qrIJkT4BC1sa/5QqCEZkCH+19SGG/vuhKj0p/2nrtMZgOoINM+J0EN7chOuZyCcc4kGp
 BLWLjETKDhQZZGTerzv3Gytz8FVyy1LGew3BsoJfUBA122woOjL/N4+SDb/dJnBMc26y
 6gtJ4loim8gQik4TgrcYztnMPkWzZvgrTAlLASvqNfzpk87vgb//cv2hRAzehoBw8tDz
 8ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZFIdehZrTxdj/RvUPXGwNiJz0CBRPSutTAor/H+cLso=;
 b=UyWvrVIYJF59+YWNVJlflu0V+/zh9oDtj3hj+hVNXs6a05fZTDNSBJFuZVftYfyWqy
 odR7ba1vwSKbLg/8/BwFd3mkWgVV9D1owiLrcbJQ9ZDldsLWGrvOZGAoON8xTyc8v/fP
 hQihixGfrRiToPNiPncP3kbEWtedcwmJzg8YpsjFaav4FyDXz8WLBUs4wEZyBaveJ+Ff
 KfySXo0okVPYdl8xnkzWB5e7t6Zml3dwtiV9PwOPalNm23boZXUyvGEBD0flpjQf3RhC
 7X/AxNeKfay7UOtEkOFRjyKq8dNeBzd3QG4I8bB53/8I/TW9uZIZad1ihcHtg72XGvzO
 f48w==
X-Gm-Message-State: AOAM532M4q7LW22/PnfF0Q4S24UTeYAgjvY/0P5RCxW3AurnSsyHKHIB
 X+J5Yw0VUnFGilkDyHrCjd6MIEylV5MnPu+0CI+ryfzfaqaK6w==
X-Google-Smtp-Source: ABdhPJzliM5etgMj0wPTZaXVmyqbng42nS8uHRrcWTfKZ4sLgNctWWdu5gzWqP4wan4eEECcgE1dx/vzA6PVuddrJ4s=
X-Received: by 2002:a0c:b2cb:0:b0:435:cb61:322e with SMTP id
 d11-20020a0cb2cb000000b00435cb61322emr21682847qvf.122.1648485844212; Mon, 28
 Mar 2022 09:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Mar 2022 19:43:53 +0300
Message-ID: <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] dt-bindings: display: msm: dsi: remove
 address/size cells
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DSI node is not a bus and the children do not have unit addresses.
>
> Reported-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

NAK.
DSI panels are children of the DSI device tree node with the reg = <0>; address.
This is the convention used by other platforms too (see e.g.
arch/arm64/boot/dts/freescale/imx8mq-evk.dts).

With the DSI split link it is possible to attach two panels to a
single DSI host, so addresses are necessary.

> ---
>  .../bindings/display/msm/dsi-controller-main.yaml          | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 7095ec3c890d..57f238f72326 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -51,10 +51,6 @@ properties:
>    phy-names:
>      const: dsi
>
> -  "#address-cells": true
> -
> -  "#size-cells": true
> -
>    syscon-sfpb:
>      description: A phandle to mmss_sfpb syscon node (only for DSIv2).
>      $ref: "/schemas/types.yaml#/definitions/phandle"
> @@ -154,9 +150,6 @@ examples:
>             reg = <0x0ae94000 0x400>;
>             reg-names = "dsi_ctrl";
>
> -           #address-cells = <1>;
> -           #size-cells = <0>;
> -
>             interrupt-parent = <&mdss>;
>             interrupts = <4>;
>
> --
> 2.32.0
>


-- 
With best wishes
Dmitry
