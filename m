Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A9F9DB887
	for <lists+freedreno@lfdr.de>; Thu, 28 Nov 2024 14:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FAF10E070;
	Thu, 28 Nov 2024 13:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zSOlTNDa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4B210E070
 for <freedreno@lists.freedesktop.org>; Thu, 28 Nov 2024 13:26:12 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffc357ea33so8864571fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 28 Nov 2024 05:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732800370; x=1733405170; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3jPSeZs2I9m/vryfi0ZM9iDP+RKgceUThW/Per9F688=;
 b=zSOlTNDakeuLnsaLxBYLFJmASxKRYHe31TUM8EGRvuJQFyVU0EpJ/JF7UaVY31i+FI
 myh1OB57HXZ9CL1fkUIXcz4Z2IXFKJ/MHRzmiRUSbbzLaVKVUtNdy/a/Ov1G2ys4Xcyl
 8YQqdYKI/0PPf7NKfgv9aPUaJg+146D3j5ghTzKZP8Y5625yOShLMqXVNaudRaUn352n
 WFi5CYbCLbs4yX4biJ5LtGCVSyPcU5ph5FalCptqN2uZ0wM1IIG3cPhR+6SFn/o2tgn8
 qdpL91MFvLVZ7Pfb9qggBSYIsiu4rbO3eOrwZbLsV6OomixcC1ykmMj5F1REvSNCcFts
 VG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732800370; x=1733405170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jPSeZs2I9m/vryfi0ZM9iDP+RKgceUThW/Per9F688=;
 b=LuNPeJ8TRurvARO1suL6SEjsfA9aY6UNP1IKZisONuYHFxGnBcayJxpeEhcIrkEiTi
 dV5e1XLFVRck6Bqr4gYp2DqpSpiKs+uu/7UdXtWwOzDJTqvDqMS6FTubxN3i42C7gRgW
 mZF7CCJqB6ox99RMtL8xOnsEllCj/pNFWNBIz0HKBKT3VWjLEy/4/5M7Am5nthEdYray
 WjCY431PvWQ5WWKAREx12WRO4ssvxOVqhTHvxpR9arzMnE9FOtitCgTg4mzfvoroATnm
 ZQK8Q2FsKIGyB8fwg2UkWdMOzuhV6DnT0ZpmBr0jxOhygP52OvDpKCpmJl6jTr16UyO3
 /4Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTjymM9a+DQcti6z3RFDGwTDQwQtJd3BUOoZEFQh7knih3arzOh827iN/210lzBh70SKg1qAXQusQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeD4HjethvL+2Ux4sVImYPrZ8IXQ3lKHzRv9Ya6WNeu7S/qZzm
 pZh2jPt6/zLUzDVpdwTwYPAB5MXA0Z9CO5bdcesqfE8tA0SB7oxnHlFKokXfD9o=
X-Gm-Gg: ASbGncukdd+iHcwdkXDGRR6h432Mxid3wtqmNLTXBCTRit4hsbt4aCyk8/T1/N4Njy+
 OKgr8/ZAiB2LGqcSGw8lrbRMOC7VSjYAdbD6AFI4nxIhXsAI545/yuDDDGzp69AenbPDKJ1i8li
 IKkPOd1650SmPrIoPh7E/szzTF1Wu+5+3eWdaRrbYyXz0k87dILFlyhicuXFyiL1CC2SANSzZxo
 Q9CevvlumhIoD30+CeVpUwfb8WRaV4ze3ifcx6Dy2UBtoiN+YdjtSY74Dm8JAFIdjZlFvreRtd9
 vfLOMxvybfUYOerwQx8OKT5wCMtypw==
X-Google-Smtp-Source: AGHT+IF/6PgZ+LtPfmfUOVevzirM+qCJqHyVs/NHs1RDx6TmQskfyIC9ph9W+JY2vHF9iu8Qa8S+1w==
X-Received: by 2002:a05:6512:3d88:b0:53d:d3cb:dee9 with SMTP id
 2adb3069b0e04-53df00c604amr4180999e87.10.1732800370439; 
 Thu, 28 Nov 2024 05:26:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443199sm177806e87.98.2024.11.28.05.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 05:26:09 -0800 (PST)
Date: Thu, 28 Nov 2024 15:26:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
Message-ID: <7ylrgy44dlitavefgwaobve7runpy6eqyhufmtkxmwnqkj2g25@pfdjlf5aj4j6>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-6-81d60c10fb73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-6-81d60c10fb73@linaro.org>
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

On Thu, Nov 28, 2024 at 11:25:46AM +0100, Neil Armstrong wrote:
> Each GPU OPP requires a specific peak DDR bandwidth, let's add
> those to each OPP and also the related interconnect path.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..545eb52174c704bbefa69189fad9fbff053d8569 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2114,6 +2114,9 @@ gpu: gpu@3d00000 {
>  			qcom,gmu = <&gmu>;
>  			#cooling-cells = <2>;
>  
> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

LGTM otherwise.

> +			interconnect-names = "gfx-mem";
> +
>  			status = "disabled";
>  
>  			zap-shader {
> @@ -2127,41 +2130,49 @@ gpu_opp_table: opp-table {
>  				opp-680000000 {
>  					opp-hz = /bits/ 64 <680000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					opp-peak-kBps = <16500000>;
>  				};
>  
>  				opp-615000000 {
>  					opp-hz = /bits/ 64 <615000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
> +					opp-peak-kBps = <16500000>;
>  				};
>  
>  				opp-550000000 {
>  					opp-hz = /bits/ 64 <550000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					opp-peak-kBps = <12449218>;
>  				};
>  
>  				opp-475000000 {
>  					opp-hz = /bits/ 64 <475000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
> +					opp-peak-kBps = <8171875>;
>  				};
>  
>  				opp-401000000 {
>  					opp-hz = /bits/ 64 <401000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					opp-peak-kBps = <6671875>;
>  				};
>  
>  				opp-348000000 {
>  					opp-hz = /bits/ 64 <348000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
> +					opp-peak-kBps = <6074218>;
>  				};
>  
>  				opp-295000000 {
>  					opp-hz = /bits/ 64 <295000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +					opp-peak-kBps = <6074218>;
>  				};
>  
>  				opp-220000000 {
>  					opp-hz = /bits/ 64 <220000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
> +					opp-peak-kBps = <6074218>;
>  				};
>  			};
>  		};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
