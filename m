Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD7847F9B
	for <lists+freedreno@lfdr.de>; Sat,  3 Feb 2024 03:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019FE10E310;
	Sat,  3 Feb 2024 02:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RGBIj2VV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551010E310
 for <freedreno@lists.freedesktop.org>; Sat,  3 Feb 2024 02:56:06 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6040a879e1eso28620147b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 02 Feb 2024 18:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706928966; x=1707533766; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lD8inCL3n27QmNoGKrfX9I7qIbx7Ok8T+KP8sX1X1QQ=;
 b=RGBIj2VVsOqRNDQeFYFwIBVndY0ZtDMaWrnnwd4PBD4/JknCLttfu+OffTVSWg2Wok
 2i5FEnHsIXji99R7bak+Lw/AFhwYLIF3OCm3V6170WDtUf0gXC9V0Fvz+tfS0nRc2SCD
 4V5qBbpEF4PhuweJHXodOVAuZnFDH1OiutguAol9W2pBE61vNGfmlAjgDeOlJjsWUvwC
 lz9UeP3K9wTIUzBFEHvlhlHOrkbb/Y597S4OkIzUzuSngzITFDZ75yockJg8prTepNQl
 WPYX/J3zFaQhhT8jW9bKeec2nu7W8H3Gpt/v1uuFyKXaPN+si9xSSeqov/FAEHzYU2t8
 KjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706928966; x=1707533766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lD8inCL3n27QmNoGKrfX9I7qIbx7Ok8T+KP8sX1X1QQ=;
 b=ssGkLYMCPYfsoqTxDq83Mv16sU2lwKw4qLMdBkfbRtzzSzTgu+W/FJvs8ogGdGx4WQ
 I732pgVRFJUOY5FRyLvd0bBQFsF3d4KIRkBzUo/e0ILv0o1FY6GxoPCM21UcSNz9SMfW
 D5EHqPQts2Gpsnh9xfVoEYdHnOdzY0C/BhfjsVfvkGvNP5tgtJ2n2BkbOtkEwf4u8TaU
 y0BFRmaUS6NFcY9m8gLmj7VJBpHoqNu7pcPwXtonJ46ZMa+bgQ63DDUwMjMysrMmIhXp
 Nka1/EaYeZY6wPWj5Vs7n9o/7JbCMf9b/yRzdAAzgeNfddHBvID7TxgJy6dH9Uik8Yho
 wC6Q==
X-Gm-Message-State: AOJu0YwPuk6HmPlTvmias6+ceh7F0Bi8wRBijHh9Stq/ndUAkzNfnK8V
 W9NCHBKKMFbWMHqFGjngpzYVvDZpXkTZiz2SheDgwemcsAQ6GVRU0oPtyKv0YnUtUjWjOVtHNk5
 iYz4FjustY5cTHy08vNJ4bt38uJhYETyRaZT1Cw==
X-Google-Smtp-Source: AGHT+IHmlfW1+Y+uGaT2G3NHFhtiRRriUyg0EgG+M84bGJD/GcVW5/hm/XCO5OApuPCvWl03vUjaXZykG56jQolv2XU=
X-Received: by 2002:a81:ac20:0:b0:5f1:f638:2bd8 with SMTP id
 k32-20020a81ac20000000b005f1f6382bd8mr10182961ywh.31.1706928965823; Fri, 02
 Feb 2024 18:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20240202222338.1652333-1-robh@kernel.org>
In-Reply-To: <20240202222338.1652333-1-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 3 Feb 2024 03:55:54 +0100
Message-ID: <CAA8EJpooe=RsZSD_mRKH2S8NUxAEqVw_AcMyn68_AWwhovPFsg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: msm: sm8650-mdss: Add missing
 explicit "additionalProperties"
To: Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 2 Feb 2024 at 23:23, Rob Herring <robh@kernel.org> wrote:
>
> In order to check schemas for missing additionalProperties or
> unevaluatedProperties, cases allowing extra properties must be explicit.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Rob, if you need it for some rework, please feel free to pick it into
your tree, otherwise I'll pick it for msm-next in the next few days.


> ---
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> index bd11119dc93d..24cece1e888b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
> @@ -37,18 +37,21 @@ properties:
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>      properties:
>        compatible:
>          const: qcom,sm8650-dpu
>
>    "^displayport-controller@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>      properties:
>        compatible:
>          const: qcom,sm8650-dp
>
>    "^dsi@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>      properties:
>        compatible:
>          items:
> @@ -57,6 +60,7 @@ patternProperties:
>
>    "^phy@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>      properties:
>        compatible:
>          const: qcom,sm8650-dsi-phy-4nm
> --
> 2.43.0
>


--
With best wishes
Dmitry
