Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1063D8E9
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 16:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBC310E482;
	Wed, 30 Nov 2022 15:10:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F5710E482
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 15:10:26 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u27so16399932lfc.9
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 07:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J3Su5v2vdmDewKthBrtRFm+e13oXU523NmM0FV1oQU8=;
 b=UGdY4Ll7FF8qoI0YeGrA0rIaaXlaaFuBei4wsmZtPINCSzvnUJT+90MuRpjxmRuSGT
 J8EXutfubxLaShHq7c6BnttwGrHh0GFfnrxBd+XCqOBzIbwGYygrRgMcaqjYTvm3oqob
 Zvh7Kezr1vz2P6+B8KuRr3LWEJyWyNDg93grQSncIaOzm6swZKOXDMO/W9kMIQbzJrZz
 lTYqPBBvl66dq1HJqzZESIl4DrkAOONcD0ZqhAKof6+e8OwT35HaoLZ2+nYFpWOGlDY9
 sT7ecbB2956MLqPOrQbHValv6E7l1G1BtJurm6zZhqCmCjHx90DIU5oCuFuAMVcY7Ra2
 PDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J3Su5v2vdmDewKthBrtRFm+e13oXU523NmM0FV1oQU8=;
 b=peVFBPTQ3+pyJYwN8fJ6K+kDfwr39ff6zvxISr5nMweBovRLhKhNJxMcZ9jX56WNEo
 /9IDr+i/uk3hbLyD8uvLL1Y70cdWl2/kl3hPdt1cjVYGaecYs7QR5oIkyIfD5Brkem2N
 CQvM0rqcVZH/yf7ij8EEclgetgSagXLTR0ZgJGqZ1pWm+9+EpCSb9FLqsE7vEmTzGnOX
 +VW8FvXT6UDspPV05csCezm7cfydBCAEmSx5QrTpM9tb7HQIogtDFofVGXe77dz4peQH
 egbTFXGP2Wuppw+El5ENLm1Dbu0YD+lZasEtQqRFiKe2r9+se29sZa1yS3TBKMaH2gll
 Fxew==
X-Gm-Message-State: ANoB5pma+c+cqgpt6U6uiLU5pX2HouB1aFEibz83rcLi/Z1x4qZL1fYh
 1depUECDZvK+4WX4H7UaY1UaNw==
X-Google-Smtp-Source: AA0mqf6H4COlxILbroNSMWuDH3SQhpzqcaGSWYKTuKDUwWXh9jsj1UxAf2lYa04YY2JuGCwkbkTyUA==
X-Received: by 2002:a05:6512:131b:b0:4b5:1ae4:f234 with SMTP id
 x27-20020a056512131b00b004b51ae4f234mr5110099lfu.391.1669821024300; 
 Wed, 30 Nov 2022 07:10:24 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 n9-20020ac242c9000000b00494942bec60sm294211lfl.17.2022.11.30.07.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 07:10:23 -0800 (PST)
Message-ID: <b3c4fa2a-4904-f16e-52e4-a534f4555455@linaro.org>
Date: Wed, 30 Nov 2022 16:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-11-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129204616.47006-11-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 10/12] arm64: dts: qcom: sm6115: Add i2c/spi
 nodes
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/11/2022 21:46, Adam Skladowski wrote:
> Add I2C/SPI nodes for SM6115.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 287 +++++++++++++++++++++++++++
>  1 file changed, 287 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index e9de7aa1efdd..d14a4595be8a 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,gcc-sm6115.h>
>  #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -357,6 +358,90 @@ tlmm: pinctrl@500000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  
> +			qup_i2c0_default: qup-i2c0-default {

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Missing -state suffix. Same in other places.

> +				pins = "gpio0", "gpio1";
> +				function = "qup0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};

Best regards,
Krzysztof

