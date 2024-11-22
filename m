Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BD9D5D32
	for <lists+freedreno@lfdr.de>; Fri, 22 Nov 2024 11:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02DF10EB43;
	Fri, 22 Nov 2024 10:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FR9AfqRB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD09F10EB43
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 10:22:48 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53dd8a528feso200713e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 02:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732270967; x=1732875767; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ISPB4u0k/IY3WdqyYBfvJI1MUBGbBsUm1AW/lweuam4=;
 b=FR9AfqRBLS5R9ufOepmJg7X+Cvhmt1ZwD+i9jFacrdwze9+ALh9p4XqYt+9JFwz+u4
 9hNBdcXuxyTL5srLkCTPXSd3YNodDE7KRz9v/1UPBSOtGoKOszPUgrTJKYdGY+rrbOwq
 /Wt3CZYk2ql1/R54dRbPkQgkYSWBVUBvnIteNeeZSCQuNR43i/QdVXwFAMOL1Ij/F9IJ
 ErGBz+E8Rce4asaWzy9Dy8TeiUKgJ4cSK2piwBzKJNBiwMpOd259UyDTnygsWCT1t9Xh
 fSvKbFyVtmEA5k1nxrvc0nxRgZse0usY7N1oErwnKJirw4Nr0bCSes+ejO1C4sDCoocd
 sMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732270967; x=1732875767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISPB4u0k/IY3WdqyYBfvJI1MUBGbBsUm1AW/lweuam4=;
 b=PQFJ+yg6Hv24VKPElb94QS4xpeioB4cadSz7JLemDjsDl8/tnHN0eh84yP81phNjBg
 JOQbsG+XRI7V+5/Z/m8wf3D/Ywgky/DUOir9nVG2/lzbfnDDTgWTCkx8/xt6s9SKG09J
 gRL3A6qMk0zNI96p+Flb6juPKG+W2F/Ml4TFNRuljGALzg79s22mEC3ZIs9gCJ3n50CT
 0GyoZXeX9WtNc+cgJQ/Dh8C7fnEELJi1Ds43Sa4z3sQKF7i5T16ysTksh/thwSr4+CDI
 NnrWOu/lEDmvGQBbAcfP3mn6dbaGz5Dd/ztLaPin+hjQwl4wEuhwtRT4hf03/AQ9LB0d
 DUgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv3/9+zNo8pDJvdwtDGWgXj4HaZV5LRGpUDfIiTkbtotgdEI8ho/9Y1pUdU0vUokgmQ232VygqtvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB+SS4wIejwoWOAtRKkyznasUGQxBn5lYC3YG5D5m2XJj/KVSS
 18V/pRu5OVddHOKw4v2cdKAn1aNTaq3rWGFkd5xGoU5LF99TfPu+GS7FK6sypFI=
X-Gm-Gg: ASbGnctt+qEhCNWpAx8ALXGipV8//xqcM8pGIoyP8iuZZcDR2zJax5N76d2A4ZO/RMH
 ip14uzU9zUV7gFLW/jhotC78K2OBp74RKbCMoLFxboDtOccl7e2HmpgFRDs9DlW2Dh3EEkEkB30
 LrAUCKsBHslTJvlts7UkcldhRsJj3FEVA67IiyKDlikVBTmbDx23hP5FhGnWUe5lq2r3VtPpv4d
 zKt2bc06ym1iWEUcu7bxDaZZ1AZgxe4B6yLEU+yx/dsfyl7PALkxkZBllCJe7qcL+Yx+BUMG9f5
 1VfRMyQq2pzHxwZYjBge6VCV0D8HpQ==
X-Google-Smtp-Source: AGHT+IFS7C183Wt8hN7C/INKvkL1qt9YbaPn5aBu73dBkn87fnUOLWLXeKl+x6xSQFdRyLKoKS4qmA==
X-Received: by 2002:ac2:51b5:0:b0:53d:d3ff:77f6 with SMTP id
 2adb3069b0e04-53dd3ff77fdmr829792e87.46.1732270966827; 
 Fri, 22 Nov 2024 02:22:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd88b54cbsm62838e87.214.2024.11.22.02.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:22:45 -0800 (PST)
Date: Fri, 22 Nov 2024 12:22:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <azdmcs7uafw3n6cqbq4ei66oybzhtyvdyz2xl4wtaf3u5zextb@vdhbs6wnbeg4>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:52PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 RIDE board.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 76 ++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6d71f29934a8debba3a832882abdd..cc7dadc411ab79b9e60ccb15eaff84ea5f997c4c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -202,6 +202,82 @@ &gcc {
>  		 <&sleep_clk>;
>  };
>  
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	ioexp: gpio@3e {
> +		compatible = "semtech,sx1509q";
> +		reg = <0x3e>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <58 0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		semtech,probe-reset;
> +	};
> +
> +	i2c-mux@77 {
> +		compatible = "nxp,pca9542";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			anx7625@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupt-parent = <&ioexp>;
> +				interrupts = <0 0>;
> +				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +				wakeup-source;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						anx_7625_in: endpoint {
> +							remote-endpoint = <&mdss_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						anx_7625_out: endpoint {
> +						};

Where is it connected? Is it DP port? USB-C? eDP?

> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&anx_7625_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
