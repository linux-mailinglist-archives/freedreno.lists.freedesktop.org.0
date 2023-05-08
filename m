Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878F6F9DEA
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 04:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C88410E109;
	Mon,  8 May 2023 02:59:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D8810E104;
 Mon,  8 May 2023 02:59:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B916814;
 Mon,  8 May 2023 04:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683514783;
 bh=XpKaegjrUuuBU+lYU7WtJvcFA2w3wSOoDTm1CNlD8Io=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CLwm57VPuAOuDjKt9jAKlsqDa7z+WiDnc1r3hI10JpMCdSL3QD2QDO2xOb4TftxX2
 lhF0A6Y338EjJ+SG9ppNlCctTncIXSeqWHNQWahy89VTxW5lqiTTC9qaTwGUa98aBf
 YCtYFbdKl2sXHwqwaha//O1EraxNV2ZgwyPf99sg=
Date: Mon, 8 May 2023 06:00:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20230508030001.GT23514@pendragon.ideasonboard.com>
References: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
 <20230507201218.2339014-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230507201218.2339014-2-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/3] dt-bindings: display: hdmi-connector:
 add hdmi-pwr supply
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, freedreno@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Sun, May 07, 2023 at 11:12:16PM +0300, Dmitry Baryshkov wrote:
> Follow the dp-connector example and add hdmi-pwr supply to drive the 5V
> pin of the HDMI connector (together with some simple glue logic possibly
> attached to the connector).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/connector/hdmi-connector.yaml  | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> index 83c0d008265b..94f75359c6ff 100644
> --- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> +++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> @@ -36,6 +36,9 @@ properties:
>      description: GPIO signal to enable DDC bus
>      maxItems: 1
>  
> +  hdmi-pwr-supply:
> +    description: Power supply for the HDMI 5v pin connector

I'd write

    description: Power supply for the HDMI +5V Power pin

to match the HDMI specification. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: Connection to controller providing HDMI signals

-- 
Regards,

Laurent Pinchart
