Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF34A52B3
	for <lists+freedreno@lfdr.de>; Mon, 31 Jan 2022 23:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785BA10E3DD;
	Mon, 31 Jan 2022 22:57:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E877E10E3DD
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 22:57:35 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso1218186oon.5
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 14:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dN1eWoFdpgCZVld6VXRl4qQRQ3uz/MKpz+wMFlzFQrA=;
 b=R023hhJF5fERNWKU07shRsYyUTlQD46lARD776Z3yLzpInKwAIAhFMxDclzomELD5Y
 SFJvs3fnHI2JMYG4SaMPxn3qe7yoZEwwAduV3xjCC0UpIiKSOyaWYsQKMRR/eeSMgtOu
 BKtUkN3Yk+33I5v/VM8aMY5DqG1vfXAVTAf8R0IY83pBT3xP3zqyPbFMQiaZZ7LBTB8A
 nq6Zd+sY+7bo9+xrhBEsf92mPrbE6bZFAOGaJZVo/TbdWVWAcp+uiiFPKfpehCLGL11J
 6FVnTB+addNSCn5wcrMQXVE9iDy3WJrXeY0z897DS6SPZrGUAVQmSPDua4LhZ+vU8OV2
 yIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dN1eWoFdpgCZVld6VXRl4qQRQ3uz/MKpz+wMFlzFQrA=;
 b=ORN7lxoi3Oxur0hmytO7mKERXHIXCXfo+LjSZz8aZpj8VQG2HkqmTdjCwDJqM2dboC
 cAK/+c/Q6KceN++ajKXJgU8yggl7cPceHW1Ekju2q8o06P0oQwYgph11k4g4A7ME+ppp
 FKArF/aMwDnHrW6paR9oWhpt+ld55eOXwvLKKjDAdrcGclWhbGoUxZEf93A0T56QgQ/3
 VtFlGkO7PSPcoGgixac/YrCkBL3roIGLO6WVKwgraCSCZ7l3MRQl3EzSwYCO7M3PyyUK
 Ui7HZajObrRDEjr13cj/PNRiM1ziwqyLm14psVULqPUVf/53VNqWD0tJ22t/aQshu15C
 ecSA==
X-Gm-Message-State: AOAM531ikXdqHaYQWo/DOlGk2+RnUMQwdB5/ESsBqg64oJnJMzm5oYS4
 QT3SQXH5S1FVk9COjYWG/glOAhrG+7ivFw==
X-Google-Smtp-Source: ABdhPJwRn6LacBFjex+kHprwEqwpJmOke2/IQAUMOEKO+ejw3nSLsT3YbO/WmS6me/j05Nej/NHk6w==
X-Received: by 2002:a9d:5c8a:: with SMTP id a10mr12764932oti.248.1643669855224; 
 Mon, 31 Jan 2022 14:57:35 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id 31sm12099372otr.13.2022.01.31.14.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 14:57:34 -0800 (PST)
Date: Mon, 31 Jan 2022 16:57:32 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Message-ID: <YfhpXFNcl4L+1rah@builder.lan>
References: <20220119205012.v2.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
 <20220119205012.v2.2.I4c2cb95f06f0c37038c80cc1ad20563fdf0618e2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119205012.v2.2.I4c2cb95f06f0c37038c80cc1ad20563fdf0618e2@changeid>
Subject: Re: [Freedreno] [PATCH v2 2/4] arm64: dts: qcom: sc7280: Support
 gpu speedbin
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
Cc: OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed 19 Jan 09:21 CST 2022, Akhil P Oommen wrote:

> Add the speedbin fuse and the required opps to support gpu sku.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 46 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 365a2e0..f8fc8b8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -605,6 +605,11 @@
>  			power-domains = <&rpmhpd SC7280_MX>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			gpu_speed_bin: gpu_speed_bin@1e9 {

No underscores in node names please.

Regards,
Bjorn

> +				reg = <0x1e9 0x2>;
> +				bits = <5 8>;
> +			};
>  		};
>  
>  		sdhc_1: sdhci@7c4000 {
> @@ -1762,6 +1767,9 @@
>  			interconnect-names = "gfx-mem";
>  			#cooling-cells = <2>;
>  
> +			nvmem-cells = <&gpu_speed_bin>;
> +			nvmem-cell-names = "speed_bin";
> +
>  			gpu_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> @@ -1769,18 +1777,56 @@
>  					opp-hz = /bits/ 64 <315000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>  					opp-peak-kBps = <1804000>;
> +					opp-supported-hw = <0x03>;
>  				};
>  
>  				opp-450000000 {
>  					opp-hz = /bits/ 64 <450000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>  					opp-peak-kBps = <4068000>;
> +					opp-supported-hw = <0x03>;
>  				};
>  
>  				opp-550000000 {
>  					opp-hz = /bits/ 64 <550000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>  					opp-peak-kBps = <6832000>;
> +					opp-supported-hw = <0x03>;
> +				};
> +
> +				opp-608000000 {
> +					opp-hz = /bits/ 64 <608000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					opp-peak-kBps = <8368000>;
> +					opp-supported-hw = <0x02>;
> +				};
> +
> +				opp-700000000 {
> +					opp-hz = /bits/ 64 <700000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					opp-peak-kBps = <8532000>;
> +					opp-supported-hw = <0x02>;
> +				};
> +
> +				opp-812000000 {
> +					opp-hz = /bits/ 64 <812000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					opp-peak-kBps = <8532000>;
> +					opp-supported-hw = <0x02>;
> +				};
> +
> +				opp-840000000 {
> +					opp-hz = /bits/ 64 <840000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					opp-peak-kBps = <8532000>;
> +					opp-supported-hw = <0x02>;
> +				};
> +
> +				opp-900000000 {
> +					opp-hz = /bits/ 64 <900000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <8532000>;
> +					opp-supported-hw = <0x02>;
>  				};
>  			};
>  		};
> -- 
> 2.7.4
> 
