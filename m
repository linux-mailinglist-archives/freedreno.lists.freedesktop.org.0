Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05B747312
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 15:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC7210E135;
	Tue,  4 Jul 2023 13:45:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A7010E135
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 13:45:52 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-c5c03379a76so1016965276.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688478351; x=1691070351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=;
 b=f//c71F+CiiJ0nQYLNnQXUSbAHrEMuUk0nw1wwalcqczyC4cibu2CBc5Bqq1RtJtEK
 FXsYoEaQ7ltPESn8l7IvqYRBWfzWOkclLdWaPGFVrKHk+5accVNfp1ogMQeHL57mySgK
 7REX07YJruKKEqpeJ1dFpEAhuIMJL793hsMehXu3dJIkAXpGsq2VMuqxiKntG4+N+dhi
 m1YwWB8Dp0tYJs5Z1Epaw+dcPiE1gnPCw1dfO9E/U1X/Fe4jvfwhFUGRUdFPE5QKYlk+
 j3l5fF84hhm/UUWt+erN34P6+c7IDsRD/GAzIQeE+5mP6ziVCt7nHB6EakqfCgM6laVa
 8abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688478351; x=1691070351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=;
 b=cvuCvpO2sNt75Q/zIIGe7Rcr7yCA6CW5Ih0fhZILAOygO3PDTKTJ1S3YG2k4nWhp57
 cVa5ZTC8jaCjh62EQy65VQIRP9trdW8aFOwLmOmLH+7fUntH8/4C1mnfwDM3+N4GD9zi
 UNlRRvsbbGWN65s3uao4zdmPT8e1niGL5grjlb4mW+4QQ+/WhJNETjgO5tzZysc1cLUz
 zMcxR6u3l5i9W/GKHqUTnXksIp+UiNDGwB+zZCvgCEK0upCsuuSf/Qb+j8EdzqV7RaNX
 wzGP5SC24xzgl2SWvy7/sMF1gKB70Gozb90b7tDgzKpHG2XA1+YrUaFMe4ZS35jCRNuk
 wySw==
X-Gm-Message-State: ABy/qLb3DMQY/bmYaLvoKFnwg9RZ9EtNerFrv95ICF8l9qUWV+/ppZif
 W3/GL9ueYDcey7hNy/zIvb2a20PQpfrF1AontykbSg==
X-Google-Smtp-Source: APBJJlEleHWeClZf2D74mZ0WM0CjCPjrraHn2hhQsLjcjs+MPeKaQJowGKx5dWhdHhQ6pcRJZwraIGBorgd0saV7QNw=
X-Received: by 2002:a25:c5c3:0:b0:bc1:dfa5:83a4 with SMTP id
 v186-20020a25c5c3000000b00bc1dfa583a4mr11215700ybe.13.1688478351717; Tue, 04
 Jul 2023 06:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 16:45:40 +0300
Message-ID: <CAA8EJppVOc0_e_o3CX_U9BvDWFKaz2-0FSZsXt11kDg5SXBn5A@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] dt-bindings: cleanup DTS example whitespaces
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 2 Jul 2023 at 21:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects spaces around '=' sign.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Rob,
>
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>  .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>  .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>  .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #display/msm

>  .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>  .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>  .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>  .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>  .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>  .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>  .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>  .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>  .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>  .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>  15 files changed, 30 insertions(+), 30 deletions(-)


-- 
With best wishes
Dmitry
