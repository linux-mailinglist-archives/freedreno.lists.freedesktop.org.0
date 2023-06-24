Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206373C61A
	for <lists+freedreno@lfdr.de>; Sat, 24 Jun 2023 03:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9E910E6FE;
	Sat, 24 Jun 2023 01:53:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD9E10E6FE
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 01:53:08 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f8689fbf59so2968937e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 18:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687571586; x=1690163586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xNrGZecLKe91T/RJadHDeBwRyXg51e++/hjjgaZ5Zfo=;
 b=fd2xR/W9T3VNdMGl2gDzFiJvpXAZKGwDScUe9qk28QUYT5uPn+DR6U3858yc+v8zsL
 lEJU+cSGuI3Ijm2JKHXTQ9EmcEVoiMwwPAc1VP1XB9j0knwLfBI+PgBYqdw7S9XIlfAL
 eVqXcrxzzeYSVZ1Yzsn7ZgUDtshcO02Ido4mlJGmVBBIO+A1+jHwNWFon6h3VOYqTMz3
 XGUIWBHc+Xg0zoADXhnSMWiMcjTyv093GYwBI2V8/4XhfesVkLy0mEBfof8XM+04eRtt
 KFDqQsmoe/+FtKNvAGR+06TddSqfymXySspmZJbZ8SC8J1/Vqg/L/kFi6CA5FPGRroGl
 a27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687571586; x=1690163586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xNrGZecLKe91T/RJadHDeBwRyXg51e++/hjjgaZ5Zfo=;
 b=RGUtNO0UswpZKOd8hRpRSzkFqcohFZV10vJtJx0NZi61pTRGrf8wnSv+PZI+XaUaUj
 20+xejZrhU49r8xMhRj7l1pAiOoG+JNbfq30OQrjydNBNA0FthQwaH+yPPUOSGoQO/Al
 0veyAzZFWwsbnGPmgmFbLRIoLasfFl4/vKNmSa4CCXoCWRulziBOr1KkDNZ/Vli+6bP6
 O2n7+OOd1f5C8i5b53DBCJtczM4EnzTlPECtdvzO66zaVroH1QCiFtKjnSdURRAYY2V2
 kAn2d6c78vMVezoYoNWUz3GxcFNN/4zknLYfvOOaWN2AwhjwJ1uFYxUfW1xY4BZmcQT+
 qhrQ==
X-Gm-Message-State: AC+VfDxPFJwJ4LX0eGQ+OBVk21IGyIsclDQtsyoxEQorWgcZiGjn8QDD
 XqaGKQ/9yELTGUSvXMKPIT6BWg==
X-Google-Smtp-Source: ACHHUZ4NbvdAMNbfgXRrkwClNB4QE38qmcc1+X8dG5c7wHh6GLwbGWLie6OsLeycuVureCf+/9Mf+w==
X-Received: by 2002:a05:6512:6d6:b0:4f6:e06:50bb with SMTP id
 u22-20020a05651206d600b004f60e0650bbmr11455242lff.30.1687571586381; 
 Fri, 23 Jun 2023 18:53:06 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
 by smtp.gmail.com with ESMTPSA id
 c6-20020ac244a6000000b004f85df6e650sm90971lfm.276.2023.06.23.18.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 18:53:05 -0700 (PDT)
Message-ID: <f061e2ee-7e9f-474e-c86e-24fa1d4bd10b@linaro.org>
Date: Sat, 24 Jun 2023 03:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-13-1d5a638cebf2@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-13-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 13/15] arm64: dts: qcom: sm6125: Add dispcc
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24.06.2023 02:41, Marijn Suijten wrote:
> Enable and configure the dispcc node on SM6125 for consumption by MDSS
> later on.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index edb03508dba3..7d78b4e48ebe 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
>   */
>  
> +#include <dt-bindings/clock/qcom,dispcc-sm6125.h>
>  #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1203,6 +1204,28 @@ sram@4690000 {
>  			reg = <0x04690000 0x10000>;
>  		};
>  
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,sm6125-dispcc";
> +			reg = <0x05f00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <0>,
are you..

> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_disp_gpll0_div_clk_src",
..sure?

Konrad
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_dsiclk",
> +				      "dp_phy_pll_link_clk",
> +				      "dp_phy_pll_vco_div_clk";
> +			power-domains = <&rpmpd SM6125_VDDCX>;
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		apps_smmu: iommu@c600000 {
>  			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
> 
