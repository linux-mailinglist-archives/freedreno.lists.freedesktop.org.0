Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 620E76FA251
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 10:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FCA10E185;
	Mon,  8 May 2023 08:33:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077B010E180
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 08:33:56 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ac836f4447so40568521fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683534834; x=1686126834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sei4kkacSe2Rc6TEFuohNjVg3onpFrfpG9vWPIGkJOI=;
 b=Tsg91dPapRAhkbJdo4EKlUXb+aG6cSpUmRIuto7NVEOE+E8NgTHUyeh1C8l4dx/2zZ
 slF16EhLXXwJlHjXkrhFeLefEP3SdtYyPlN16IXedZidVL7sMTIXFWza8CIKq36iqxl+
 Fgfmb8fDGYZ3BGnKN//BJQY154FwXJKkInb1MkE97cX3w/7mwBZNQYtoAt3vXXCEi1cJ
 +LjfQT3blPrYdNF+AyVpn5gPEtthpRfTZUNPeiuKfr65n5M13M6NzEF5iTIDterBS8sN
 mYD+nWvI4+HQKGiP+NpJRegJRP7Rg7kwip9D0hKFyKvf14EqKMceB7Yw7QcZkx/qji81
 RvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534834; x=1686126834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sei4kkacSe2Rc6TEFuohNjVg3onpFrfpG9vWPIGkJOI=;
 b=BcbKTn60BfEhmxm6IC3jgITmjRgBFrnAVn6bELlUodxyDa5guf8VftRbH6T/Tv0Rj6
 d6O261gFREPQ/q83KfAepfo/IvvCiyt2xHgG6n5chq4uK1z7rjGhADzxv1+k21phGO9l
 zm0E9MZwOvpKUQ7lGKXbDkMQgX9gLlhVYWrA4YvifVAgdIOxNt2ubuSiyuRGnd/eK7RH
 DmfVvhPpPXZmU+VCStATjOue1p/WDeDjP2UbXNArphdM9PumzZFnoQFTWLg2RinENNR5
 iQJoisz9OHjRi+JQ/EOrI+P24WD4STr5+STqdY/9qkHpP/17dOQ6lZ/V8YHJ5zGXCmu2
 iyCA==
X-Gm-Message-State: AC+VfDy4ur43nk9fmKAJe2W4E0DWcurT6jzU8jo2BYowQsyOahvH0Pc9
 eoID9eI3zuUHdw5tQuGfSwdPQg==
X-Google-Smtp-Source: ACHHUZ5fB6p7WcGuhwnEYvzUsFmPc/aI7wgWQc1vVPb8MSPWLZSyGGmC3ar1Jn9zqOA20TxJWnGJag==
X-Received: by 2002:a2e:8047:0:b0:2a8:e4d3:11ca with SMTP id
 p7-20020a2e8047000000b002a8e4d311camr2800260ljg.38.1683534834528; 
 Mon, 08 May 2023 01:33:54 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a2e3516000000b002a77792f2c5sm1077417ljz.62.2023.05.08.01.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:33:54 -0700 (PDT)
Message-ID: <a86cfa8b-c205-6887-a64e-d51241b74b15@linaro.org>
Date: Mon, 8 May 2023 10:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard:
 enable adsp and MSS
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 7.05.2023 21:07, Dmitry Baryshkov wrote:
> Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
> differs from the one defined in the msm8974, so it overriden locally.
> 
> The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
> similarity with other platforms). This requires a patch for remoteproc
> to be applied [1].
> 
> [1] https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 6b047c679370..c893afc00eb4 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -4,6 +4,8 @@
>  #include "qcom-pm8841.dtsi"
>  #include "qcom-pm8941.dtsi"
>  
> +/delete-node/ &mpss_region;
> +
>  / {
>  	model = "Qualcomm APQ8074 Dragonboard";
>  	compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
> @@ -17,6 +19,13 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	reserved-memory {
> +		mpss_region: mpss@ac00000 {
> +			reg = <0x0ac00000 0x2500000>;
> +			no-map;
> +		};
> +	};
>  };
>  
>  &blsp1_uart2 {
> @@ -39,6 +48,25 @@ eeprom: eeprom@52 {
>  	};
>  };
>  
> +&remoteproc_adsp {
> +	cx-supply = <&pm8841_s2>;
> +
> +	firmware-name = "qcom/apq8074/adsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mss {
> +	cx-supply = <&pm8841_s2>;
> +	mss-supply = <&pm8841_s3>;
> +	mx-supply = <&pm8841_s1>;
> +	pll-supply = <&pm8941_l12>;
High time to move this to rpmpd!
I won't object to adding this though, as it obviously works
and is already used on other boards..

> +
> +	firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
Could you please keep it one entry per line?

Otherwise,

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators-0 {
>  		compatible = "qcom,rpm-pm8841-regulators";
