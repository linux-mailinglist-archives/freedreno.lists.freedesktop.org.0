Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90DB74F9DC
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 23:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8650010E433;
	Tue, 11 Jul 2023 21:36:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7499910E443
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 21:36:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fa16c6a85cso9703755e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 14:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689111389; x=1691703389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NrSX7PhPKOGnA92pPm2YdNBTlBhRtkFT2QjTzX6SGZI=;
 b=rtPZbS4PGX83gYcAKsGtXuy7/HFRYvxeEKew1hmWfVgNZ5jtsyvTcvqu9uZ0nwB8C8
 sy9Wncq0GfGluYHEnwcwt1oREemNWxvdGtV5rATUhZisrtLmLf6+thIxGsyjEXSUCyXv
 FswX3LlRToL2g0U700lFE6maQEupl82vZZp9lOQCGBUjNqKyhZTpwQffLZ7z5zE6g8BP
 s21GkOZv7PnLCT05hCJwIQX5QGW+QvmyiMafr3dFFwuVfvj/fSnVNXyRsoW0ete/Cmm0
 s37jxOstrvIE0VWbnoM6FDskalvRIbmQuUqRsS2TBNafIdf0rdeEXhsfxjK+7E1eNlzN
 VEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689111389; x=1691703389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NrSX7PhPKOGnA92pPm2YdNBTlBhRtkFT2QjTzX6SGZI=;
 b=YhmHpVXOBh5TgoREIGPy/kqBpSUFJ+cCeeQCcxx56FDJYfyHDCtAf61OYAt25hsoCc
 1UqOv+AJzA/mZRTESpxyDhkb7z9aLTsDmdTS+AZ/Uu0MMTgPmZhpNOZwMhgdhNf+oW1R
 2WJLscvkXw6ckmM7a+Cu3AjuvPqlSmfFEpNX6UX6Dgqrs2zt+zUbxLW8VgtUwAEUlfz8
 TRfcaGmkC9f02WdHfzO3eLJ5sW7CsAmZtmZPskOQYvY+nf3CAYjkZ4C0OjoiLP69P8H+
 8h9mGDzP2coUck9RmT3lhcX2D151amNl0RWTjfaM1I2UkrBSF6q/RFUHUrcpjW5g96E3
 p0mQ==
X-Gm-Message-State: ABy/qLYKB/ayMN2BH7UohWAY4rDh8y6yNuY+mmnKAMhcwpRiwjRFJijD
 qSoTOuBYmpnQIXxwpaaFP7UegQ==
X-Google-Smtp-Source: APBJJlFUOSi8MCkUH+Y0rUL8y5Im/qUftlZYctWGmBHInd6hTEn4AKz8A/LXxDZ5a/Ta/o2gsyLoCw==
X-Received: by 2002:ac2:5b9c:0:b0:4f8:6800:86f6 with SMTP id
 o28-20020ac25b9c000000b004f8680086f6mr13412888lfn.49.1689111389300; 
 Tue, 11 Jul 2023 14:36:29 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
 by smtp.gmail.com with ESMTPSA id
 t3-20020ac24c03000000b004f8730eecf4sm453442lfq.184.2023.07.11.14.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 14:36:28 -0700 (PDT)
Message-ID: <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
Date: Tue, 11 Jul 2023 23:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add
 onboard USB-C redriver
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

On 9.07.2023 06:19, Dmitry Baryshkov wrote:
> Add the nb7vpq904m, onboard USB-C redriver / retimer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_phy_con_ss: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> +					data-lanes = <0 1 2 3>;
That's USB+DP lines combined, or how does it work? I'm confused :/

Konrad
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				redriver_usb_con_sbu: endpoint {
> +					remote-endpoint = <&pm8150b_typec_sbu_out>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &mdss {
> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>  };
>  
>  &usb_1_qmpphy_typec_mux_in {
> -	remote-endpoint = <&pm8150b_typec_mux_out>;
> +	remote-endpoint = <&redriver_phy_con_ss>;
>  };
>  
>  &usb_2 {
> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>  			port@1 {
>  				reg = <1>;
>  				pm8150b_typec_mux_out: endpoint {
> -					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> +					remote-endpoint = <&redriver_usb_con_ss>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				pm8150b_typec_sbu_out: endpoint {
> +					remote-endpoint = <&redriver_usb_con_sbu>;
>  				};
>  			};
>  		};
