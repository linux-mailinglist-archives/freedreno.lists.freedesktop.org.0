Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AC06FA302
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 11:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E44610E1BC;
	Mon,  8 May 2023 09:10:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEF410E1BC
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 09:10:07 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso4803166e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 02:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683537005; x=1686129005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OnfVyFSn31B+nyS/SZa/G75Krp06veCTxpPxh0j9G8E=;
 b=jJTxs54GT9sCoDJVUV42dYGIzIkF9heU3bsxsOCxiUnv0wtzxs8Vro26mo7ke8cS0M
 Ha6qtrgeoVHDivjSvAIZZ/qKR6ebaIfdKbwfPMkY9jOs0MFgrG1Lhp9SKD4r23mMQlHY
 5nG/VcS1J5SaEHUpMpNeF8b9sklrMyLpvdbQx5Zk9PUoFbom+cCPSCyg04I2oXBxWK3d
 xMlcYGikeKiZLFnekzouICyn+oVjopPiQkd5xyRS0LOHxffn6RKL9bmUO+XBUPSx+rC1
 vwbFqyKNxVWP/thpVhRsn28+nAgpg4svV4KjYsNrkpgk4lCFr6uj2bd5UEChU3rDqh0c
 XBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683537005; x=1686129005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OnfVyFSn31B+nyS/SZa/G75Krp06veCTxpPxh0j9G8E=;
 b=PBXGHQCYuPRVgoeI6aaKWUoOh6sHMcFDDAe6W0/C/xKRQprO+WqFKpqtw2fjfC7qDW
 VDzTG4oB8M7Nh4fsSf3oI4ridJD5CQ0gCVec/WmhuIpaF5tngcB2+r8tpXRLBX2KiEUF
 IH5VcksqGcQxedGsYpV4go+DcSmNDRocoKZv0kGfbw0apPUGH8IdutN27YNIuiD2udaP
 ZpmI/e/8xafRV57cxLTAxF/GWvlcY7v6AVV+OsfyoSR+DByJ3YC07WaGzRGA/iQfCesH
 CUOqwV15IUtHI61WOu124VbEhapzqypZh4WNBXdr6CPLTrFltuRofcXvMhZUkgLgQKa3
 gTaw==
X-Gm-Message-State: AC+VfDws9I3clKXXTL9zFACrlu9ip3a+6fPxDxqjNT88oxW5l+HXUphh
 GIokJLYn7Urt28HCZxfyeDI4Cw==
X-Google-Smtp-Source: ACHHUZ4zMrSGmYIGKNnjlfU8D1OYBsz7+8v2RvjakyKacrKqdWjDfSQyeq+VlFMd+R85jM7fQEAQyA==
X-Received: by 2002:ac2:5399:0:b0:4dc:84c2:96f1 with SMTP id
 g25-20020ac25399000000b004dc84c296f1mr2254171lfh.22.1683537004848; 
 Mon, 08 May 2023 02:10:04 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 m21-20020ac24295000000b004eeda2caa3fsm1235434lfh.55.2023.05.08.02.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 02:10:04 -0700 (PDT)
Message-ID: <fb22e37d-770f-40f6-678d-b2fb2b288cf1@linaro.org>
Date: Mon, 8 May 2023 11:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
 <20230507202841.2339127-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507202841.2339127-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v1 3/3] ARM: dts: qcom:
 apq8074-dragonboard: enable HDMI output
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



On 7.05.2023 22:28, Dmitry Baryshkov wrote:
> Enable HDMI output on the APQ8074 dragonboard device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 72f7e09a5bbf..850427bd2f82 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -20,6 +20,18 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		hdmi-pwr-supply = <&pm8941_5vs2>;
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&mdss_hdmi_out>;
> +			};
> +		};
> +	};
> +
>  	reserved-memory {
>  		mpss_region: mpss@ac00000 {
>  			reg = <0x0ac00000 0x2500000>;
> @@ -90,6 +102,24 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_hdmi {
> +	core-vdda-supply = <&pm8941_l12>;
> +	core-vcc-supply = <&pm8941_s3>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_hdmi_out {
> +	remote-endpoint = <&hdmi_con>;
> +};
> +
> +&mdss_hdmi_phy {
> +	core-vdda-supply = <&pm8941_l12>;
> +	vddio-supply = <&pm8941_l12>;
> +
> +	status = "okay";
> +};
> +
>  &pm8941_wled {
>  	qcom,cs-out;
>  	qcom,switching-freq = <3200>;
