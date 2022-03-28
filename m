Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFED4E9B99
	for <lists+freedreno@lfdr.de>; Mon, 28 Mar 2022 17:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9D910EDAC;
	Mon, 28 Mar 2022 15:52:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE9A10EDAC
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 15:52:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so8847100wme.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Mar 2022 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GwP5ugk0tQduHftN8yL0lI1uYPDme19MV0QPD5H1y78=;
 b=arWhFvK2N7y5+CW4x51ZmDby82Ql23kNGRMi9uYrw1Cn13SAVJ07VNWWsyMqWmigJS
 p+I5GLteb7CmWLTs1zVORSuj0Sk/wcBrmkq/lO9aLiHtOMtrir04BDA9K918CKOhfWXq
 bzocvFVuU3o8hK+duUP7iMV4gdg7vjJ3b3xWLsIXAynNnn/L6+vuBU0Jdv12OZivb1u4
 5CCEytWu7yHvK52J/SUILF4y8456JdSsFQggVYsoajxFR+PW/AulYRv0YPJdnMx3g3Va
 ThzbvYWkBn0Jpv+DHFhQ515GNWJTMZvg0bj8LX6ji0IZUSEcD/cnszu3Ceku5BTNOYRm
 T6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GwP5ugk0tQduHftN8yL0lI1uYPDme19MV0QPD5H1y78=;
 b=V2HDlSGe+QXw/KCxMCtCRFsUMzfq0mx7i0xf8qAEqWHn70WO7xC3vVwVkmf8g8EIGO
 C0B34sUCKZirFaXDESX2cC3MG4w0ZO0fsZTVdn4uB+fN96aDgJ3KsLMhHIc3wzkI3AGm
 oK24nplgJZjPqOOD8i6kyZpxvMXhssxjnMtMXqjeNDJyi/42lbQ+JuDOzAiD8nlGFWsq
 DW+CV5Fj7uw9Bux+HaZsEGg9iOXg1h4dOX8i9fwbsYRpGNSetShijP3/ORome5ZeMqAF
 u1O6SPgaF1Hfe5hJM008oWMeBCYKelIDx2Ymnh+uQ/p59h1CkTIF6GCa4DQqNTYbwV3U
 rUsg==
X-Gm-Message-State: AOAM532P8MuZmArVbu5i6S6KVIGj1Cbu1wfRcn2i2Yg2x/hvWCms3ows
 k9VpNSqUIybvEnl5bl0+PnKnUw==
X-Google-Smtp-Source: ABdhPJyyUqsamosO4tTuybJr4KEp61RxvQgbNiyY0IkIVr55UV/cpGdkMnRiwYF0QSghJUBEDuttAA==
X-Received: by 2002:a05:600c:3546:b0:38c:a8ff:843b with SMTP id
 i6-20020a05600c354600b0038ca8ff843bmr27702630wmq.24.1648482724879; 
 Mon, 28 Mar 2022 08:52:04 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm12628577wrv.10.2022.03.28.08.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:52:04 -0700 (PDT)
Message-ID: <a43825b5-b7c7-e805-c9dc-0498d752d4f2@linaro.org>
Date: Mon, 28 Mar 2022 17:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Vinod Koul <vkoul@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/03/2022 17:29, Krzysztof Kozlowski wrote:
> The DSI node is not a bus and the children do not have unit addresses.

Eh, actually MIPI DSI is a serial bus, so address/size cells seem right
and my patch is not correct.

> 
> Reported-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


Best regards,
Krzysztof
