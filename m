Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712057303D8
	for <lists+freedreno@lfdr.de>; Wed, 14 Jun 2023 17:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8146310E07D;
	Wed, 14 Jun 2023 15:27:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C408310E07D
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 15:27:28 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f76a223ca5so768324e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686756447; x=1689348447;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XaodULpx93bhaMgasCg20jVwTzInKVTrlrTMvfuinVI=;
 b=nFwS5B0lhBgtFdQVs7vOetdeXczFg68Koa9owmCGc1U4FHRTK4fATvLChYhFoFJU+r
 1NZpXR147c3UtQZQwteqzx9aHzsgJNefC/4G5myLggcstfvPQLCkwfp6hU0mzQINCEq+
 HWrJReOwEfcSUZwsuVo6PID/H/o+he/zGhDBXb2XGwnlMH8uPsB5o9S+HWXBzsM4wRdN
 nNgoOCIZxpJolG43LW5yhjncFO8PypumIrn8LrkL0SjjCvsXKBzH+fvR1QmWn2CZ/r83
 t+NEX0lYATbH5ONiaH5t3NDcw/yj9LJEkXEwsnWS9RBBuFx/ETSFi641JGjZwRkTjASB
 60Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686756447; x=1689348447;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XaodULpx93bhaMgasCg20jVwTzInKVTrlrTMvfuinVI=;
 b=ANV0WyBFDSSEjpJDq0aeFi5DpLN9qcTCayxu7k9vvUinoOgHcS5YHeL/jUCb8rshZj
 Q8BLNblAZOMhIhnMVf8EcqtFYyC1deEkTajcArV153nq3fNxeLXEhS+zzT4tvIcWHH6I
 T11f/jad5uDhTF0rxgGPjTvxJaA/PZFqyKWuKyry75t4Bb7GycZjme2rFuqNTfY9+6tR
 ZEGWxwBnK1XCUW0wbgnlnWRxUfokPBLZ+NsmLt4R9awz84FHKWQMVGO0gP+4X+kmytGf
 nOL3nRo5TIp2muo4cvgYRllx+P2j+j4ZVtw471klcJmRKFQCejbmEK+awEXAUf9cAknF
 NaxA==
X-Gm-Message-State: AC+VfDzwT1doUi/YajrUCnIxQ9k4Z24ToWJNwDFSrLZLaxR5aOVpS1Yj
 srIx5CPtMSJAOt1U47iZtLZ0nA==
X-Google-Smtp-Source: ACHHUZ5qHZ0XHSvNY5Er+5xVDd9+YbHVFL6nwRBwyo0osPEjAoRpp2Lu4p+OVeu3z9RoDZuVR1cJeg==
X-Received: by 2002:a19:6419:0:b0:4f6:1916:4170 with SMTP id
 y25-20020a196419000000b004f619164170mr7342197lfb.5.1686756446884; 
 Wed, 14 Jun 2023 08:27:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac25ec2000000b004f24e797c55sm2173748lfq.25.2023.06.14.08.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 08:27:26 -0700 (PDT)
Message-ID: <8f8d5e09-50a6-a83f-d4bb-3d7bc8c07162@linaro.org>
Date: Wed, 14 Jun 2023 17:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230614142204.2675653-1-quic_bjorande@quicinc.com>
 <20230614142204.2675653-3-quic_bjorande@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230614142204.2675653-3-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 2/2] arm64: dts: qcom: sc8280xp: Enable
 GPU related nodes
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 johan@kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14.06.2023 16:22, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add memory reservation for the zap-shader and enable the Adreno SMMU,
> GPU clock controller, GMU and the GPU nodes for the SC8280XP CRD and the
> Lenovo ThinkPad X13s.
> 
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

one question below
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          | 14 ++++++++++++++
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 14 ++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index cd7e0097d8bc..b566e403d1db 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -210,6 +210,11 @@ vreg_wwan: regulator-wwan {
>  	};
>  
>  	reserved-memory {
> +		gpu_mem: gpu-mem@8bf00000 {
Is it ever going to differ on other platforms, including the automotive ones?

Konrad
> +			reg = <0 0x8bf00000 0 0x2000>;
> +			no-map;
> +		};
> +
>  		linux,cma {
>  			compatible = "shared-dma-pool";
>  			size = <0x0 0x8000000>;
> @@ -390,6 +395,15 @@ &dispcc0 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
> +	};
> +};
> +
>  &mdss0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 5ae057ad6438..7cc3028440b6 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -264,6 +264,11 @@ vreg_wwan: regulator-wwan {
>  	};
>  
>  	reserved-memory {
> +		gpu_mem: gpu-mem@8bf00000 {
> +			reg = <0 0x8bf00000 0 0x2000>;
> +			no-map;
> +		};
> +
>  		linux,cma {
>  			compatible = "shared-dma-pool";
>  			size = <0x0 0x8000000>;
> @@ -518,6 +523,15 @@ &dispcc0 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
> +	};
> +};
> +
>  &mdss0 {
>  	status = "okay";
>  };
