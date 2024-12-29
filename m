Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3D9FDD52
	for <lists+freedreno@lfdr.de>; Sun, 29 Dec 2024 05:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E151A10E25E;
	Sun, 29 Dec 2024 04:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ng2GnJfr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7905210E25E
 for <freedreno@lists.freedesktop.org>; Sun, 29 Dec 2024 04:49:53 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-540201cfedbso8671458e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 28 Dec 2024 20:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735447732; x=1736052532; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=49KnvXyqtzHNP5zpXwkwN+VDBQ2sz7fI/cBjo8ecRUM=;
 b=ng2GnJfra818x8jXRdCnjEY4DTEuid5PExopiTZWYdmhLJexz844aWvtz10kmUTU2E
 EvKVGTYLEUEzPM1S56LsZZxv45HrhIs0LzO0i0m74a/K3L/YdG4Sevp1JB4ztCmHjx8x
 YwK5kvdgHm0XPkmOx4ml51CiA0vp20fOPJmZbdmv6/91HvQgDy2UVwMJsVbaYVDE9BGK
 oXzBpSBj3H4GRf7VLqtsifZP05G6b3UXiWvK8uAN+96CLV69MammtpzQVESGQkfNZ9Dq
 EBmGhw/kGzS7CweimFf/hh07TjGDijffM0oWaXMpmWGNTrxBvLG18MF0H3eT2/XZNjXn
 lFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735447732; x=1736052532;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=49KnvXyqtzHNP5zpXwkwN+VDBQ2sz7fI/cBjo8ecRUM=;
 b=ickyxoqk9jXns0Yc0IouLsCd3j2v4IUqgi3fX7GKCwrcjVcsmVc12+Z6GhyP/461tO
 KrX1MOz/jgT0YN18kqIMSmzcN2Argbf/2ylLbz8X+AniHn5yHdHdlCvDhh1dHz4AkK28
 zKjBHr/ufPTvP5e2bJ5cM0YsyVEperAPNr+rYi2i76W4V8MmGrI97ryEc2KqCxYasyi8
 7pPntvVH6omMW+BkxM4FNQ4zLqgj7hZ/ihJsHHBONjKPdrxBiUpO7/jsCm6GS6Pj6EJv
 NH52LTjeYs9p3PSgdrPyIOrCFuDiJoZY40Hxhl/FEhq4arBWLUdBrHoGTc5r8H4PAGjK
 VYuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ5cIROdKiudNfH5dFgDXzS84uUWx4Vjw6rhuqVt7kUqp0yrKQ7KWQwy8+EiAtI/IhItDafQoIVhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1gSM/5L2aKUjjOOIJMmiHtsoG0NXeJBSGsxiH24nrdL1i/K/C
 YbtFnDfLqN1yRz2l+zb8XKzOMRrd5sbPpqb8x5A8Ll1OFonxYBB2JBqXtf5Aw7arhACYCPVX9P2
 D
X-Gm-Gg: ASbGncvDYQ71MWRom1YPw0NuoTUkROtTLIWGsuxBU/U3DSkPlkAsnDAKVLXAP9lexcI
 VJbs65wReU7papw+fevMN+EahXcB+NDj/DiOSEaWBzdOupPKDPN9WMN+xsA8ndEsiXh9uikG6Me
 d8yXA1efz8JLPXRaK7EUxqA6Ezt5JIroN5GJzFz0STUwccWbhjVzMJb4Ee6e1KDEuM+EO2jeNey
 xCYk6ISzUmfSAdMhS3j/mDqb8l2oVNXf8HiPh7npz1lFbinoniONtg5pkwe/TcLOgwVt3hD7qts
 UEkf/kOEy5k8AZGf2GgZZ2C4KV/aH/eglqaF
X-Google-Smtp-Source: AGHT+IHofLwFYxWucuHyLIawAriYNYKQ/SrKehOlm3Ec2J5KACyiss5kzgeMpgISL832D3TRqtyLHg==
X-Received: by 2002:a05:6512:3e23:b0:53e:12dc:e805 with SMTP id
 2adb3069b0e04-54229582252mr9675190e87.45.1735447364447; 
 Sat, 28 Dec 2024 20:42:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301e0sm2834926e87.248.2024.12.28.20.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 20:42:43 -0800 (PST)
Date: Sun, 29 Dec 2024 06:42:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: phy: Add eDP PHY compatible for
 QCS8300
Message-ID: <kz5qakmiy7n72p5yrrkgcjrmtvwl7knnkbzmh44g6cfunpjxad@3titlwwt32ux>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>
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

On Thu, Dec 26, 2024 at 05:40:48PM +0800, Yongxing Mou wrote:
> Add compatible string for the supported eDP PHY on QCS8300 platform.
> QCS8300 have the same eDP PHY with SA8775P.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml         | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Everything else is display, this one is PHY. Consider separating this
one to a separate series.

> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index 293fb6a9b1c330438bceba15226c91e392c840fb..eb97181cbb9579893b4ee26a39c3559ad87b2fba 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -16,13 +16,18 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sa8775p-edp-phy
> -      - qcom,sc7280-edp-phy
> -      - qcom,sc8180x-edp-phy
> -      - qcom,sc8280xp-dp-phy
> -      - qcom,sc8280xp-edp-phy
> -      - qcom,x1e80100-dp-phy
> +    oneOf:
> +      - enum:
> +          - qcom,sa8775p-edp-phy
> +          - qcom,sc7280-edp-phy
> +          - qcom,sc8180x-edp-phy
> +          - qcom,sc8280xp-dp-phy
> +          - qcom,sc8280xp-edp-phy
> +          - qcom,x1e80100-dp-phy
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-edp-phy
> +          - const: qcom,sa8775p-edp-phy
>  
>    reg:
>      items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
