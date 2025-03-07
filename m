Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C63A5603A
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 06:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CB610EAD3;
	Fri,  7 Mar 2025 05:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QuI5O2PN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F4B10EAD3
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 05:48:23 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30bd473770bso14395651fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 21:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326501; x=1741931301; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QBJJ6mH3Lq4uasqO2w/mLpbOX1gw+uVajo1XywdLac4=;
 b=QuI5O2PN0shXkeiXhehaG+N4vwfyjW+rR83A18HJY0cnScn2MkAz6CBtiLUdpJaJ4x
 YGto3b7FgVsp/RCiMWfnSR8j2TByCps+lDGhmgyjxS/LqQlsU5wzA2bFcqUdNTwhKt19
 nZjhpX5I6b4QsQ9FECP1k6pdNqc+tBosgDrAEj0rcTG/mMFxyS+oqqOgaJIY5meAX6gQ
 G90FLfae+0UhUlbO82/E7mPNtadKrlrqx2qYgv/SNQfBzL2w1ZdFAhFRbUmk84WmE88/
 LwzeGRMtVi//TK1ToyKHP56/3pLW/p855luwiS2a7sRM38quiaFct90rx0+vW5qsuXbk
 Trjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326501; x=1741931301;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QBJJ6mH3Lq4uasqO2w/mLpbOX1gw+uVajo1XywdLac4=;
 b=EVfcjhbZoNAZG9ZIbNyE6pYeB+CQQTOCVO78PbKb1YPxd6S3UH+0DgGIz5mUtypQeW
 UKVuWGhv6bjFNI0WgItrdsvdKPk3Fej/WbVr+fmdubxnNjeH4m3SwALvWA2vGTOP1iPv
 f3ANYaEZzkkJzUR4x4R720/GKSniyvEFgSCg6kr8nGMqrcwkzlQ+wE2dg4GejSswLScD
 KLvBRKdTtMT9tj26y68kSMwmha2cbMlnLzZUSc780bEUIaTd5wIKpqc6G0rTcQdeFfZz
 sMau71pT/vkl8Y6wzMgVWqCVD/hGKaAk/ORv3kgkFTvM7fv4oGRYLJF4Qd2m84tqaWLl
 Iv8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNnp5082jDlAN3BmhbKk7mrHODHKG9FLF0x5XBGjDvZb1BpfCO2kHEzujkMrWgVhySxgxHDoflgik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8aQaCjlpnrz/ioyg+7srUUoMueKzViYx66ErqK7o8OXJcur+n
 OyhAPxAB+Iwa3SqAcP42ssUP7CQJNbvqMK8wFdSkAgWVCVEt+/t19OhEQzltlKs=
X-Gm-Gg: ASbGncuZWrNbz48+cXW6uJRyXNVLwQRwQFdcoAUz7FKurwy3z19EAN7AxeghxzheJnA
 yilqyscLIZ3dTi1wIxwXIEWrKeMfey8nzIFNDwK9GnKySvZYpDWVkYoFcWu89+pSvP2ES/iGEzU
 bwj34M3moi9ZvMMQgbthPTNmFnE29U5i5a1UiQq6cj5bdjXYD40gwa6e4MZUxeYqi4KxDuSwfy8
 VbuP4GxdRE7W+mYFI3Nfdw5BQpI2YFPwoA4J1GntjwtEMoIz7/Ah+Gq9R+tyq8nHyDmpeDf/A7R
 zihpT1/Ib+uOrOCx5gQCvfupt9rNt8t+255Wpw0QhdcVg2X55SEzZQt5nLqfr3pcN+7C7aLwBAU
 UZVBlZDgJ6Q63z3b3qDcC/P4W
X-Google-Smtp-Source: AGHT+IGmsERqhfZqLPyNL7GHC82EoyeyaDNDfDa4E87aEDrWxyBlXoZ/5KIqAbmzZjDQsHi6vMCl1w==
X-Received: by 2002:a05:6512:3d8f:b0:548:de7f:b3be with SMTP id
 2adb3069b0e04-54990e5e265mr590371e87.21.1741326501038; 
 Thu, 06 Mar 2025 21:48:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae579a3sm380848e87.53.2025.03.06.21.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:48:20 -0800 (PST)
Date: Fri, 7 Mar 2025 07:48:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 04/11] arm64: dts: qcom: msm8916: Fix KPSS ACC compatible
Message-ID: <5e3i5p4er7hcqsm55nf2qjvegmoozntq2aqrpk4lvw43ydlvcl@xsgxgx4fj6zx>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-4-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-4-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:16PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The current compatible has been used with no corresponding
> documentation. Replace it with one that has been documented.

qcom,msm8916-kpss-acc is also not documented. Most likely you meant
qcom,kpss-acc-v2

> 
> This has no functional effect, as these nodes' resources are only
> consumed through a phandle reference, anyway.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8f35c9af18782aa1da7089988692e6588c4b7c5d..33a28f8163dda0e53f4176d61738ce175efc096c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -2574,7 +2574,7 @@ frame@b028000 {
>  		};
>  
>  		cpu0_acc: power-manager@b088000 {
> -			compatible = "qcom,msm8916-acc";
> +			compatible = "qcom,msm8916-kpss-acc";
>  			reg = <0x0b088000 0x1000>;
>  			status = "reserved"; /* Controlled by PSCI firmware */
>  		};
> @@ -2586,7 +2586,7 @@ cpu0_saw: power-manager@b089000 {
>  		};
>  
>  		cpu1_acc: power-manager@b098000 {
> -			compatible = "qcom,msm8916-acc";
> +			compatible = "qcom,msm8916-kpss-acc";
>  			reg = <0x0b098000 0x1000>;
>  			status = "reserved"; /* Controlled by PSCI firmware */
>  		};
> @@ -2598,7 +2598,7 @@ cpu1_saw: power-manager@b099000 {
>  		};
>  
>  		cpu2_acc: power-manager@b0a8000 {
> -			compatible = "qcom,msm8916-acc";
> +			compatible = "qcom,msm8916-kpss-acc";
>  			reg = <0x0b0a8000 0x1000>;
>  			status = "reserved"; /* Controlled by PSCI firmware */
>  		};
> @@ -2610,7 +2610,7 @@ cpu2_saw: power-manager@b0a9000 {
>  		};
>  
>  		cpu3_acc: power-manager@b0b8000 {
> -			compatible = "qcom,msm8916-acc";
> +			compatible = "qcom,msm8916-kpss-acc";
>  			reg = <0x0b0b8000 0x1000>;
>  			status = "reserved"; /* Controlled by PSCI firmware */
>  		};
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
