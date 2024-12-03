Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4799E9E1DF0
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 14:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2082A10E13B;
	Tue,  3 Dec 2024 13:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yj5hAAty";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269EB10E45B
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 13:43:40 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53dde4f0f23so5534708e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733233418; x=1733838218; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BexXqu1YANquKbhWrZTOr7m0R8hKt1AEONAGEhu8ML8=;
 b=Yj5hAAtyVtQ2f3UoILIMS42IOMZV+vm/V8tjosat+CANgf20GvmxdhmKNPVRcQHwta
 8paQdUWSkY0bvUNQhgiZUygC3KmDauXAnAVQCrtkjHQ3rjQMIdKjbtDYWFtxMOScbHFh
 /MWFsdV2pG9gMyWURY803NBBz+J1ga/g2YPDEbsBYftulen9hXtb+FEO3WSehx29pa3z
 zF22FoVl+9w+F0FdrcgPYi0ivq6cuFKBEI5TvQwPhN9ZH30b0Vd3cKI7Qd+Uvm8Lsh2A
 EaLAAmdqylSd3UhD2oHqtijDYP/5zFLY0BNJeN4NfLlMlpNXqEifV4En/yWo/xyVgRIG
 N5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733233418; x=1733838218;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BexXqu1YANquKbhWrZTOr7m0R8hKt1AEONAGEhu8ML8=;
 b=BOvScTQPwd+plwqgsjCKRy4XpXu0/DNBxOEhd5/b5XwT9q7VI/UNNDnRsTst0+ShwE
 kAXN/7ybshzqZB54rCOh6GXtbY+XO8uV6o+NzsD1x3AxOiNuvF/6AbukXgtq4ZUCywyd
 TEQPzRgFlHknsNmW5nou8G8xGWlkS43mb/ZtEizmH64EeCyDFStgyFp0uQWikmLxlSAi
 p3UH/g1M2oZP07Urix4vpwLv4qFJ+OB6qATm+dY5x6vzmUQx7f85re3YNICMmEjWcnEd
 4lbJsCzsQvuZauE9uj2kn4iye13R4t2sj/zjT/Be4BgpevxzR53tU2EOOo2LwoaF7nyG
 ZpMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfO7oW1B1eDrOkC5uuE2fRecf9WV76YyC2tbbXYg/JCFpOU+SSVRsuce9YfHX31gtLULhXtlKsn2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhGDgSIA47CFqIjUCt18NiGqn9d1y3Ie2p0315sdsLEtx37VwS
 MPNeBU2AJfySLm/rEKakoL4hJurAzvGxVgM/Il8xMMq4pIZMzRE1dtH8EBUTRqQ=
X-Gm-Gg: ASbGncsys+IfH6mX7xJ+EhnMQkA26wETIx30jc2YdpZ32EGIQTLDzjgd2eRxrBcuyop
 JOramPUE5xsoWXlZc8VV+uu4dujbDe5RTB40XwrXo+Uq67lnGSUD9fNX9rVk31flOdLIUc1YsBP
 p9xRr4WwOaGm7kGhwhrh3HGBe2q20iOG72KGAR2FeVP3+NgEdxFQqgNmm8F7N0ET6kqYHZ3GRnS
 jN8eJORFAiEZk7A2qnVUh1L7uhUJKHKC4y0KQ43ZPqnZMb9VP+j1+xrV2soB9O5Ur5aGq2qgXo2
 Zg0JZKp+yV2VADeNwc0FWMrOvMzbfQ==
X-Google-Smtp-Source: AGHT+IE8R6jm4cCT/ek6WXdRlNZG6O64AcF1SkyDRfFBDn4mzR/uUulOEMTuStC5oxV2xJ+QqSD9DQ==
X-Received: by 2002:a05:6512:12cd:b0:53d:ea1d:50fc with SMTP id
 2adb3069b0e04-53e12a28351mr1659356e87.48.1733233418239; 
 Tue, 03 Dec 2024 05:43:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1394662fsm197862e87.38.2024.12.03.05.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:43:37 -0800 (PST)
Date: Tue, 3 Dec 2024 15:43:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
Message-ID: <edlw7grqy74rihy5jw5t2krcyfn24c6b2lfxht4b52wx6fvck6@pqeqrbnwtsf3>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
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

On Mon, Dec 02, 2024 at 07:31:41PM -0800, Abhinav Kumar wrote:
> On some chipsets the display port controller can support more
> than one pixel stream (multi-stream transport). To support MST
> on such chipsets, add the binding for stream 1 pixel clock for
> display port controller. Since this mode is not supported on all
> chipsets, add exception rules and min/max items to clearly mark
> which chipsets support only SST mode (single stream) and which ones
> support MST.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 32 ++++++++++++++++++++++
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9fe2bf0484d8..650d19e58277 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -50,30 +50,38 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
>        - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
>  
>    assigned-clocks:
> +    minItems: 2
>      items:
>        - description: link clock source
>        - description: stream 0 pixel clock source
> +      - description: stream 1 pixel clock source
>  
>    assigned-clock-parents:
> +    minItems: 2
>      items:
>        - description: Link clock PLL output provided by PHY block
>        - description: Stream 0 pixel clock PLL output provided by PHY block
> +      - description: Stream 1 pixel clock PLL output provided by PHY block
>  
>    phys:
>      maxItems: 1
> @@ -175,6 +183,30 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8775p-dp

Why do you need an extra platform conditional?

> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: core_iface
> +            - const: core_aux
> +            - const: ctrl_link
> +            - const: ctrl_link_iface
> +            - const: stream_pixel
> +            - const: stream_1_pixel
> +        assigned-clocks:
> +          maxItems: 3
> +        assigned-clock-parents:
> +          maxItems: 3
> +
>  additionalProperties: false
>  
>  examples:
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index 58f8a01f29c7..7f10e6ad8f63 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -177,16 +177,19 @@ examples:
>                       <&dispcc_dptx0_aux_clk>,
>                       <&dispcc_dptx0_link_clk>,
>                       <&dispcc_dptx0_link_intf_clk>,
> -                     <&dispcc_dptx0_pixel0_clk>;
> +                     <&dispcc_dptx0_pixel0_clk>,
> +                     <&dispcc_dptx0_pixel1_clk>;
>              clock-names = "core_iface",
>                            "core_aux",
>                            "ctrl_link",
>                            "ctrl_link_iface",
> -                          "stream_pixel";
> +                          "stream_pixel",
> +                          "stream_1_pixel";
>  
>              assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> +                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
>                                <&dispcc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
> +            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>, <&mdss0_edp_phy 1>;
>  
>              phys = <&mdss0_edp_phy>;
>              phy-names = "dp";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
