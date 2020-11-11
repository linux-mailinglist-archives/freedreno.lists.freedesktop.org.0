Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D062AE7A1
	for <lists+freedreno@lfdr.de>; Wed, 11 Nov 2020 05:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545D689A9F;
	Wed, 11 Nov 2020 04:50:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7BA89A9F
 for <freedreno@lists.freedesktop.org>; Wed, 11 Nov 2020 04:50:57 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id m13so777672oih.8
 for <freedreno@lists.freedesktop.org>; Tue, 10 Nov 2020 20:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TgiY8fdn90Uls12wgNKgzxp/Onwmpb1Il5B5p1lyVJU=;
 b=VYELtnjAV5Ls0k8ZJfZ7zELRqNDR4/IyfkC7nMGABdnGpdE/Zb9PwJSfoGKyU92gq4
 7UiACwrRNIlrGnDXh7NNg/dHqywhUpUiTH97Emo5n0MQ/QsUQfNb1lkeRe/4BZeWAKW9
 5HbP/pl2a7ByW7MhaXMYXIgqX4pKvlIufMf9WOq182jsV7cCbhTBC0ukB46Zc191LFey
 BX8SF6f4cJdzGZ39ZM61Q2WktAgjlYYaJspMZjosGtj/3qA9+WDGkAj4MoH3qi7ysQ6J
 9/krSDyGAmatCg5vZTv3xqVOKoGRIUTREQBkirg6ltpjdDKe8J5DE9uUYjU+SB1XyAX1
 vh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TgiY8fdn90Uls12wgNKgzxp/Onwmpb1Il5B5p1lyVJU=;
 b=Ce5nqAkpVzvnKEjGjO+/uOruy+TKYO3esyTrFMZdZ9AqLZ9QfD+1hxqGA8hTK12gHl
 iKk6lMwfQxNhr0OefTcrxDk5IEImxZ8wxvwrX/Tgpbs7UoiU6EWCpvPhgEx73aYM7WpL
 ZXfUFFFbwByLEquWJk+UmSaX+QIJR0VmXwta5gkvbvYOQmTkC38y4jpVT3S2tKooZ2/G
 TKCsMirLRND5MhpnQBUjHyRPTo9IfyoQzVRYwJlHZmVNPgJp2TSlTVYGJv3suSUK90iB
 rS0IdOSqC/GELLINf5S7YSQE8U3jQgadbiOu1nSthH3+9cC0WtLbXEtWZ/15cGK21L3n
 w+ew==
X-Gm-Message-State: AOAM533YC2mlgV4oS563sURFzADpkejM/LaaDVq1MPKzmOMX8S0ZJ82B
 fiA9AoJjLKRo3j/k7cfUdlLETw==
X-Google-Smtp-Source: ABdhPJwzPtqe2oFKM2VjVJi3f9w9NPihcWFT8lNK7ABdSE3qphYjo0s4kjlFgvKpRXgW+uj2DIxPeQ==
X-Received: by 2002:aca:afd3:: with SMTP id y202mr968450oie.135.1605070256818; 
 Tue, 10 Nov 2020 20:50:56 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l19sm277147otp.65.2020.11.10.20.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 20:50:56 -0800 (PST)
Date: Tue, 10 Nov 2020 22:50:54 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20201111045054.GE173948@builder.lan>
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-2-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604054832-3114-2-git-send-email-akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v5 2/3] arm64: dts: qcom: sc7180: Add gpu
 cooling support
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
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org, jcrouse@codeaurora.org,
 mka@chromium.org, robdclark@gmail.com, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 30 Oct 05:47 CDT 2020, Akhil P Oommen wrote:

> Add cooling-cells property and the cooling maps for the gpu tzones
> to support GPU cooling.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..8e2000c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * SC7180 SoC device tree source
>   *
> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.

I took the liberty of spelling out 2020 here, as I applied this patch.

Regards,
Bjorn

>   */
>  
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> @@ -1886,6 +1886,8 @@
>  			operating-points-v2 = <&gpu_opp_table>;
>  			qcom,gmu = <&gmu>;
>  
> +			#cooling-cells = <2>;
> +
>  			interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>  			interconnect-names = "gfx-mem";
>  
> @@ -3825,16 +3827,16 @@
>  		};
>  
>  		gpuss0-thermal {
> -			polling-delay-passive = <0>;
> +			polling-delay-passive = <100>;
>  			polling-delay = <0>;
>  
>  			thermal-sensors = <&tsens0 13>;
>  
>  			trips {
>  				gpuss0_alert0: trip-point0 {
> -					temperature = <90000>;
> +					temperature = <95000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				gpuss0_crit: gpuss0_crit {
> @@ -3843,19 +3845,26 @@
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&gpuss0_alert0>;
> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		gpuss1-thermal {
> -			polling-delay-passive = <0>;
> +			polling-delay-passive = <100>;
>  			polling-delay = <0>;
>  
>  			thermal-sensors = <&tsens0 14>;
>  
>  			trips {
>  				gpuss1_alert0: trip-point0 {
> -					temperature = <90000>;
> +					temperature = <95000>;
>  					hysteresis = <2000>;
> -					type = "hot";
> +					type = "passive";
>  				};
>  
>  				gpuss1_crit: gpuss1_crit {
> @@ -3864,6 +3873,13 @@
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&gpuss1_alert0>;
> +					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		aoss1-thermal {
> -- 
> 2.7.4
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
