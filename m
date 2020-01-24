Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF29148D06
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2020 18:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E205D6E416;
	Fri, 24 Jan 2020 17:32:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692566E420
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2020 17:32:12 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q10so1450363pfs.6
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2020 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CxnFfi1OVtcvBCqSwcv0ZRctexZ9zrixK0G0Fd+YL9M=;
 b=uAQTbihJp9Y377xep7kVEyC+tfqQ1RNOMgHCu+FmUGNTld/PKnP5PmFCvPZfXYtMb+
 ujFDt5FsY2Su1FkuDyta3kmF08yhl6zQ3U1Cenpy7YkzAKaXGmP3idWcYd4JDxr6/Gh+
 aZsV1pyVwEBaDAjUOzQSlMRawIPJEDasbggi4218ieg1f/MvrxWgGrRDnLcc1kM1Vxz+
 ma2FUf0Nn6jga+b3Jr6v8Jw0z9JLIJFCjU5dex7gP1+xG4WrEJb2K8ZkPGTKarCVKMEq
 928fsSwlHio6XGBCtu8zSV9k/W7e+lYeZKi3z0j5TrE2dE2dNYZoo6tOllJf2qbOu+Ft
 KSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CxnFfi1OVtcvBCqSwcv0ZRctexZ9zrixK0G0Fd+YL9M=;
 b=JXnFD6cFlwX3bEh1qo0XNSXSmcAIyI3f+RZ3ePogqH7a3LXIn0muGzxK/xxn2w+x8Q
 4SVY/Zt86dxofIku6fXFkcDsFaOIgTf01En/j4ChahyVlL8aNSNw61UGTNkUxIxaRjcR
 MFRD/lYE7YkoUQP4fSvdJRaM7fIgUgrFDXUeNneOmD064OYv538IQRPPIeLnmz2AuEBV
 dZsQFxwaG22jYdGvPBSg1HD0fUDHxY9vCMUigwwS2SU1YJZX3/h2JOrfh2YQeP37YPwn
 sQIx+VgdrdgMTfVyszZLoZvTe5EbByyxC+YJDDGgi5UVk2xN56TtsxT2mvFVg9ecKt4C
 yL1Q==
X-Gm-Message-State: APjAAAWOVX7kMXipjUUtYpoytak42Vok5z0e97tvEzhh/1PR6C6QFVZT
 NFIktA/HG2YYhAI/h+M+gH3o+w==
X-Google-Smtp-Source: APXvYqwDf89NqtAzeKmdxMJBFd8Gev2DtVh0Oryoa24PJycUxhDvWQcSvp/ck/kZ74zux/rtOiZz+A==
X-Received: by 2002:a62:b418:: with SMTP id h24mr4455754pfn.192.1579887131841; 
 Fri, 24 Jan 2020 09:32:11 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id d2sm7245833pjv.18.2020.01.24.09.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 09:32:11 -0800 (PST)
Date: Fri, 24 Jan 2020 09:32:08 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Harigovindan P <harigovi@codeaurora.org>
Message-ID: <20200124173208.GZ1511@yoga>
References: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [v3] arm64: dts: sc7180: add display dt nodes
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 24 Jan 04:06 PST 2020, Harigovindan P wrote:

> Add display, DSI hardware DT nodes for sc7180.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Thanks for respinning this Harigovindan, just a few more small things
below.

Are the drivers ready for me to merge this?

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
[..]
> +&pm6150l_gpio {
> +	disp_pins {

You can omit this subnode level, i.e. just put disp_pins_default
directly in &pm6150l_gpio.

> +		disp_pins_default: disp_pins_default{
> +			pins = "gpio3";
> +			function = "func1";
> +			qcom,drive-strength = <2>;
> +			power-source = <0>;
> +			bias-disable;
> +			output-low;
> +		};
> +	};
> +};
> +
>  &qspi_clk {
>  	pinconf {
>  		pins = "gpio63";
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..3ebc45b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,130 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss: display_subsystem@ae00000 {

Whenever possible, use - and not _ in node names.

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
