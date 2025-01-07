Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B6A04C6D
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 23:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B7710E3F9;
	Tue,  7 Jan 2025 22:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UcxppJk3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE12010E3F9
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 22:31:20 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5d932eac638so6509305a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 14:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736289019; x=1736893819; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
 b=UcxppJk3yA5pJ+kaRXW5tWFWJM73P+Alpwa2O3ZVeU/DN+b5g3Ahij/zRhpus9I2KI
 t5ODJF9gTdgCqJzpNy774rUcJLiNl7Rg4I82LyT6SMeXGS+syH98cYZObjCGCt/spNUE
 j38QdF6UnTl/cmBJqgjhZzySr0by7m7WohW0VIo/1/8pdZjBn+d2Rn1gPEGQBXs6Z6re
 Xij43jp19MEEB6Q1Oc/jr8Ao/UpY176KFCp7zZingeKGfVaTlHh7/7Nj2EUJJTLKb13m
 fl/OCJ9XuJ8x5ovEIUBD7pVXn5vE6utL6Konom1i68imSPjJGMtqgePMgQvUEYha01NE
 LJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736289019; x=1736893819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
 b=Nvm70I1ot1B44LzWD0x0q30Vp7wl3T9t7DkEK4qSw68tTCBlHPpVRW+aZnYhI+Zv1T
 Mt4rCwFlTAWGdpR7D6m9WwTbFcCu7tEBaCbqW48dxW6d2XgUM8kEcXi7Kf9HC/tnKNGS
 wrrMOctwGfzOEgpy4Vqv/UkjDz93PiqH8vr1YagdGQn5txrPl1U+/3GOe/cab9bf7ULo
 85NP3KS5Adu4FLzv1CZI9JN8aQsNIWyUjV7NEmcneM9clncqcHrhep144PqLfD7VDNoA
 lYRfCveCxyDz0toWwPmyfGgNzbolGyq1C1aU+Sbp7X/YwFifT+zEZTz0UV4J3CS3H2sG
 1V1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHj4QJRYPJvTwR81r9aruID/9rvhKcCKgKTXhg5OxBZEkYXS1niNlC8NBPFtgoRo6bKaZEqHRq+mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/BQ7r1OJ/3UBaxX4X2WOonzsBNs1p7dn6wQVdfr1uEkrjVQKi
 lHX99dOTaaoeJVRpVGkSx+v0vUzb/tHCR5PAOHQMwSYDKNCM++5ZSYEy0UkT/2lZ6AmnxdG+o4L
 D
X-Gm-Gg: ASbGncv4QxtIaTl9l4DqNwrFfB6h+ERmr7a6ac9ZqHomz6hDtHWdWpvS2ImHvKomT5z
 DIJZxZl/Cy19ElNmJsRMjQYzcRcvI5jpqUGrYNLBARZL+vaiBIiywiwBpVksJ5kp/JOQIhlyVRc
 SI35You5KHv+JEvY1Xljai9hNsLlMKwPHDnEUFFhrs/48Qpdt32RlhxmlBnoFLDEQnM6ygmRNJ9
 JX5SimKLW5evPjHrnC34LavV2n6fD6g2zTEef2sYNiVpXdjA4zYblzchC3F9g6SK1JdbeCsnq3F
 cZmP5rwGnXutLn3ufsIEG65aJ3j+LutJQamC
X-Google-Smtp-Source: AGHT+IFnS+89P+R20rxSVwXMFgmVIida5oAviwnvCG7UgPRL6sqycM/IAnw4EINYUJaJOUGjeMeCug==
X-Received: by 2002:a05:6512:23aa:b0:540:358d:d9b5 with SMTP id
 2adb3069b0e04-542844ad98bmr149812e87.0.1736288546084; 
 Tue, 07 Jan 2025 14:22:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832b6csm5379607e87.273.2025.01.07.14.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 14:22:24 -0800 (PST)
Date: Wed, 8 Jan 2025 00:22:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <g5u4xazpsgoxes3bwowufrdd266uhwqw2qidqs3tm4wq2qbk6h@bpzh4cnwybaj>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jan 07, 2025 at 01:58:51PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>  .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>  .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>  .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>  .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>  .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>  .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>  .../bindings/display/renesas,cmm.yaml         | 12 +--
>  12 files changed, 221 insertions(+), 222 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

I think we can take it through drm-misc-next (or even
drm-misc-next-fixes) once we get acks from Renesas and iMX maintainers.

-- 
With best wishes
Dmitry
