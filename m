Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190F463D436
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 12:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EE510E449;
	Wed, 30 Nov 2022 11:18:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6C410E451
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 11:18:03 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l8so20459503ljh.13
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=otStQxmxOG6LpjBUQIYuow/PF/UV5Z7DPxX9LVFmQEo=;
 b=fa9DTGfn6miiSdGDtIzetZ3cP+Y//XHFAUdhDMe/rcDBMGLkWiIlAIXblHykz3XBdq
 YzC0fnxzFt/60yWvxiqVbFIVXSJ+vvPP7rzKgGOIGzZ8p4rczzLY/n7Jh0d3pSP6asmS
 7GIf+V6LW3muePp0QgVBYwDrtglEYK8SCNEgQmgKpQhlICmt+y8IaUUoeshYPm5bZ4Y0
 PG6iXABOS/F6ufJVLLCEuzHlIzBc+YhSNmcYiVRL4gfQItJ34mAZq32Mnrbtno7K0rl/
 g7f0JjDMNEMQP/zEIVKTJcQ4yvgxgWRd4HROJpKo9uYKlGAB1AJ6i3yiZVXORWvn6uCv
 ILhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=otStQxmxOG6LpjBUQIYuow/PF/UV5Z7DPxX9LVFmQEo=;
 b=mN+mprGIu7GlbFP5wX8IfDPp/NmrU4SD58F79KszwWmGztCwvYk6CotoYQbjRCwogk
 LFpdNSDxBEaVbs2bKFoWMwQpIrswShqGDTZfSOs7aldV4ph+tMAZgSnTKyHncceLeHXr
 cgplMGB9x2iOrDWpMr35/aiKMl77J0M9geY6AiulXbsBiUwBwefHh7xsP40yet3NYV5Y
 y4aIetDYpqqba/1vJR2i5iffc879Fti0aBaBAuwMDoFDlvxtauXDGXrpT1qylDumZorZ
 VaNZBf2AvFbXzmURUeaS9T/cWoCYIBqvtn+5YPiQLYNWMtN6NAnwF3xLHAttbCLCQlk8
 AibA==
X-Gm-Message-State: ANoB5pkhkBSY8r8v1E/Ni2oAiLCmZzL0PNPNYqsktNeL7PA5dYnK+7lC
 LkK3rUtDZE2gdwiNJcfYL9VjrQ==
X-Google-Smtp-Source: AA0mqf6wG9cAljfGq/fOblhbS+7rNoNwLhQu0yt79NeJDaajfzWbs9CAdx2+LxPPPMd07rqtVe40Hw==
X-Received: by 2002:a05:651c:88c:b0:26c:4e3a:516 with SMTP id
 d12-20020a05651c088c00b0026c4e3a0516mr14687322ljq.510.1669807083389; 
 Wed, 30 Nov 2022 03:18:03 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 u22-20020ac258d6000000b0049e9122bd1bsm216515lfo.164.2022.11.30.03.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:18:02 -0800 (PST)
Message-ID: <46202b25-e253-0a5a-0c90-9d699906d3d7@linaro.org>
Date: Wed, 30 Nov 2022 12:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-8-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-8-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 07/12] arm64: dts: qcom: sm6115: Add dispcc
 node
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
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 29.11.2022 21:46, Adam Skladowski wrote:
> Add display clock controller to allow controlling display related clocks.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 6d14bbcda9d3..ea0e0b3c5d84 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,gcc-sm6115.h>
> +#include <dt-bindings/clock/qcom,sm6115-dispcc.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -717,6 +718,19 @@ usb_1_dwc3: usb@4e00000 {
>  			};
>  		};
>  
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,sm6115-dispcc";
> +			reg = <0x05f00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <&dsi0_phy 0>,
> +				 <&dsi0_phy 1>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		apps_smmu: iommu@c600000 {
>  			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
