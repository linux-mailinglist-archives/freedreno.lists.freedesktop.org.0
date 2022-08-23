Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291BD59CEE4
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 04:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BEC10FAB2;
	Tue, 23 Aug 2022 02:59:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177A910FA6E
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 02:59:18 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bb16so14557303oib.11
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 19:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=qvhp/PN3z9UpYVuMsgcJC4Oy2/ZRSa/rXP6JnlrnMVE=;
 b=az+vjmCRAiH8OVkG5/hU8PD2mFnzsja9goZnbrBMHJd9nLcMTnLUg5MiEHoyqh7jnn
 wOm2wIMzhexx42WIblyq8kcg9WEyY9FzVna4DLoKKH1w+M2Cq4b5R9tmHYyFgC1mr41J
 kw9XBhn4x9y4g33vGeg83eV0TlNqNNSq7q2ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=qvhp/PN3z9UpYVuMsgcJC4Oy2/ZRSa/rXP6JnlrnMVE=;
 b=VBC2NIgOtWs4zXAsDWxiHPnOMrBcNnBjMXIAXvutrG/Z8OPSWaQeNd17KvFnGhGp1/
 HEfBYM8Gdoejp34DbaE42Ad8Et+8NQqJVaPieR75WNR/L3wzaTYCZaettItQn7L5dOf8
 XIctwzn+xmULABnr2NtH3qQuTrzQKewdXdBCURSp/OzqYNn2uol4glt7WQ4YQee0cgC9
 aFD58zjWVDDReQ5UX+Q95ovUv+G09fDlYD0X6cuaFsVW/9e7OtfIoMZOCVB6+VDY3/c+
 rB4QGk4TkrbNfiq1MbtFhzM7Iv+WL8NT1/rqaDznYt4Ic2XuX98nbUlqVpgevYaJo/Dw
 YpRw==
X-Gm-Message-State: ACgBeo3CMuSK4YuF6oWuDHFY0ROd3O/Gb9IgW/Id7BH3W3dXCM9E9ejo
 tBk3+CcIcOLw9OtYnMqQCg1krlWhRdHrYWj+6gdibQ==
X-Google-Smtp-Source: AA6agR6PXqCt0LKI+xicsTuPHjDNzX2YEQK4O0g6hF3ynofM3wUo3dz/OhsSM+18FJV2/aaMHYV1we5XWzeZaGEQuP4=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr508119oik.0.1661223557231; Mon, 22 Aug
 2022 19:59:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:59:16 -0500
MIME-Version: 1.0
In-Reply-To: <20220822184900.307160-3-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
 <20220822184900.307160-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:59:16 -0500
Message-ID: <CAE-0n50MJFha_OZqcF68rTGwNJmUo-34+erkw=7k3yEvXFg+4g@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/3] dt-bindings: msm/dp: add missing
 properties
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 11:48:59)
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 391910d91e43..52cbf00df0ba 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -70,9 +70,21 @@ properties:
>    operating-points-v2:
>      maxItems: 1
>
> +  opp-table: true
> +
>    power-domains:
>      maxItems: 1
>
> +  aux-bus:
> +    $ref: /schemas/display/dp-aux-bus.yaml#
> +
> +  data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      maximum: 3

It should be marked deprecated, right?
