Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F29873F8
	for <lists+freedreno@lfdr.de>; Thu, 26 Sep 2024 14:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC18510EB1C;
	Thu, 26 Sep 2024 12:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h2SXK8I7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E69810EAF6
 for <freedreno@lists.freedesktop.org>; Thu, 26 Sep 2024 12:59:44 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53659867cbdso1561956e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 26 Sep 2024 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727355582; x=1727960382; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mvD5VesI/aj5ylaTV7+TzQ4pLVD1SRNWc/3077REPN8=;
 b=h2SXK8I7gAMsHqy7YHcR87fDqteQkpN/kPzt7nHx7icnwrkyuPK2srHzZQid8b0NM/
 oomaBj0+ZVIIgj/cwO5zl5LZcfAs+drygSZF1jyDlx9OjNKsPZ3u4V+/oeDrzSAPpmZF
 +JpquHk1XPHjgt5jdjNk000aQvM4Nkel/Ok4c/qLOKHWIwZ9H2z+ZWDg+bLDXe5DgJuK
 HvZYClFf//OX1ROZZ1VIqF5k5m9JG1WbA7qM0fNLXhbPVFg6PGWt+CPBbZL9JUX76CWg
 fpa8abU5IB1Mlze6Uql5jpuvYhNmf3URccgBx5bZvHdrvz7xa9FUrdgKEYsUdHZaEhYq
 aG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727355582; x=1727960382;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvD5VesI/aj5ylaTV7+TzQ4pLVD1SRNWc/3077REPN8=;
 b=HiWUwby3H8xw7rG59OiT5Yy2o9KuncnFjMBejqW66JLci6kdTmfgXIuEc9k5s9dUV2
 ZUXfqNqI4TAjt85FNI8bk0kcHuxJa2UXNf25CgUeVg90vKZmjdvoeYsMN4CwtlJSbX5k
 E5OvNUll4fwwHsf11LVuEBTkBhF5jgJEWMeFyLyFSWikcX5vBcWdufmqeqqiU3AmJnFF
 pWxOTn58BSu+BQ9BYuLbpxtslPJpjqCQlxsbRxQC9jH7xghlrcL2h2EADjeUgtinLXsB
 0CFKg3fRzyHkQ79BaIn7B/wwSkDHnGL4ZZXGRFqGxCWr6Z8IvhUDmJWwVGUn6aL9LI8X
 sNaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzYAIsZGjnGKZeaKqhUE8rhaOdtdiaCQr0hiYZZus9BeOXUNS0HP3QZyRhiFUeHAs1xveDyt0+jVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0Yn/58lfesh1bClq6BH4K0/wyGrukdTno+3FCiHs1XCRCuev0
 VBdblhQKjOWtEWllOkMRv6IQkYGUj3CELbz5YAnLtlFe0lUuaFDzt6EtH0W9ADQ=
X-Google-Smtp-Source: AGHT+IHDWkduitjhzRm6lHTb8hOr4NlvZ7w8mBztIp0QiKdICcPR7Kr0FiZmnSQrsTJV08gYOhqOVg==
X-Received: by 2002:a05:6512:104c:b0:52c:d628:c77c with SMTP id
 2adb3069b0e04-5387755cc25mr5494174e87.43.1727355582176; 
 Thu, 26 Sep 2024 05:59:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a8640908sm798094e87.122.2024.09.26.05.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 05:59:41 -0700 (PDT)
Date: Thu, 26 Sep 2024 15:59:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
Message-ID: <2vspsymfbsavcpnx3kuoqnhczuhvhqtdzdzp7qedbjl2ozvnz2@sf65rybvixps>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-2-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926110137.2200158-2-quic_mahap@quicinc.com>
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

On Thu, Sep 26, 2024 at 04:31:33PM GMT, Mahadevan wrote:
> Document the MDSS hardware found on the Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
> 
> [v2]
> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>   adding proper spacing and indentation in binding example, dropping unused labels,
>   dropping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> 
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 239 ++++++++++++++++++
>  1 file changed, 239 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> new file mode 100644
> index 000000000000..e610b66ffa9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -0,0 +1,239 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SA87755P Display MDSS
> +
> +maintainers:
> +  - Mahadevan <quic_mahap@quicinc.com>
> +
> +description:
> +  SA8775P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  DPU display controller, DP interfaces and EDP etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8775p-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    maxItems: 3
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sa8775p-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sa8775p-dp
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +        compatible = "qcom,sa8775p-mdss";
> +        reg = <0 0x0ae00000 0 0x1000>;

0x0, not just 0, please. Here and alsmost everywhere else.

> +        reg-names = "mdss";

-- 
With best wishes
Dmitry
