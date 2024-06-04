Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223CB8FB646
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 16:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20A110E405;
	Tue,  4 Jun 2024 14:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f0CC7NFa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DAB10E498
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 14:55:21 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e73441edf7so61278491fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717512920; x=1718117720; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kLNdPFPac+SFgbJFTdkAXzLcUkAub2hF475OhZIL36Y=;
 b=f0CC7NFaBtZPJaSZga/ee+3R0l+4JQ154bFcWNXQj8fEXHLXps8TmvvWPC3W5+cD/B
 6/HJ4CgngIgej8i8N/R+PEinqrnDXsbbN9WNzouLzpwnGZqXqOAZHdBd73FvU4ixWz5g
 kGp7hWT6xTho42Ef31IuKDvWdqLTZkl3QHhwnNJVGLTOVhIroSbqanF6m7CON7YYNJst
 f+OkoRdkR0pwdTKOfrDMbE+ccNrIUgfWpCH89bKWad4MAnPZ+wOFjdp5JsMGnOVYTlrs
 cNO4//wVjTxEnOkV+ys8GEU3QcKpwXLwdpBl9V6CGN/TOVcNBP8QvACjwXyGqwnZILJ/
 1hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717512920; x=1718117720;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kLNdPFPac+SFgbJFTdkAXzLcUkAub2hF475OhZIL36Y=;
 b=Vmml9SCvLmyGaDo060Y4ZINzzzGfch8Ej6rdC3DU7NF5ujFMwN6jbdz+0qY67BdjEE
 InkBNZGeV0xIsoKbQOXuHQZ/0GCMgsup0PV+seIjGVX+KeZd25f5QQIZo6jTmiM8HMpD
 knFReyodFt6vD1rAE//Yr749TFUa0io+bkWUb8biMtT0W2xweidH91axrBdpQOPXYhXd
 SreBJJeUZBju9dQmGqnkFWh1oq1RfyXdCBfYTzq2/WUUNAlrwc4SfXqx1AurSN9uQfsF
 7Bly7vT01xUWjBNO/CaL4mxdvMoYv7FzXICWDk6X6bZiPoD61F1lulGwxcW/C71fY/DD
 RuyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMizI/iX3w4DtRgvD3o/pXF0VS+luga9oDjaUJ/5UVz5H53Dy9Miu1dRsG8kGVG9eH+XySY+x7E8/eufAJZ8lACPw649JwCWiWFRHme0Iq
X-Gm-Message-State: AOJu0YyopeVrIgOmLb6IMJrTySPgQfXXS9QINuUbFL/IXNH4u0+8LSMI
 JR0T5PUFE28FGze13ueYmg6TVjqOPFuPAelIba1Av6FVlQXmitIRwmLSS05bNcE=
X-Google-Smtp-Source: AGHT+IGXupYnnuI77gfzxZuWZkyquJcBGxUXKKVzbJwEgcxiyALsDg39Ld+RBwQFb78sIGEYFACIAA==
X-Received: by 2002:ac2:598b:0:b0:52b:aa4c:49e4 with SMTP id
 2adb3069b0e04-52baa4c4ac0mr161821e87.7.1717512919778; 
 Tue, 04 Jun 2024 07:55:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d347d8sm1540431e87.29.2024.06.04.07.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 07:55:19 -0700 (PDT)
Date: Tue, 4 Jun 2024 17:55:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
Message-ID: <6zbddkrd5wp73le7tvhtrzp2uyehrpwlmltmrbhsxhh7q3frpw@njhdsgnbrh64>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
 <648b2798-9302-4c6e-9ef2-e4318066d28f@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <648b2798-9302-4c6e-9ef2-e4318066d28f@freebox.fr>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jun 04, 2024 at 03:49:24PM +0200, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> Port device nodes from vendor code.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 100 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index ba5e873f0f35f..f65a76da61ea8 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -2785,7 +2785,7 @@ mmcc: clock-controller@c8c0000 {
>  				 <&mdss_dsi0_phy 0>,
>  				 <&mdss_dsi1_phy 1>,
>  				 <&mdss_dsi1_phy 0>,
> -				 <0>,
> +				 <&hdmi_phy 0>,
>  				 <0>,
>  				 <0>,
>  				 <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
> @@ -2890,6 +2890,14 @@ dpu_intf2_out: endpoint {
>  							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf3_out: endpoint {
> +							remote-endpoint = <&hdmi_in>;
> +						};
> +					};
>  				};
>  			};
>  
> @@ -3045,6 +3053,96 @@ mdss_dsi1_phy: phy@c996400 {
>  
>  				status = "disabled";
>  			};
> +
> +			hdmi: hdmi-tx@c9a0000 {
> +				compatible = "qcom,hdmi-tx-8998";
> +				reg =	<0x0c9a0000 0x50c>,
> +					<0x00780000 0x6220>,
> +					<0x0c9e0000 0x2c>;
> +				reg-names = "core_physical",
> +					    "qfprom_physical",
> +					    "hdcp_physical";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <8>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MNOC_AHB_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MISC_AHB_CLK>,
> +					 <&mmcc MDSS_HDMI_CLK>,
> +					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
> +					 <&mmcc MDSS_EXTPCLK_CLK>;
> +				clock-names =
> +					"mdp_core",

Nit: usually there is no line wrap here, but it's fine from my POV.

> +					"mnoc",
> +					"iface",
> +					"bus",
> +					"iface_mmss",
> +					"core",
> +					"alt_iface",
> +					"extp";
> +


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
