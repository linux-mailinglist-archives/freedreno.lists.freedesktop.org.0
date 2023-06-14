Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B48B730443
	for <lists+freedreno@lfdr.de>; Wed, 14 Jun 2023 17:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C0610E0B4;
	Wed, 14 Jun 2023 15:55:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45A10E0B4
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 15:55:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E13F61269;
 Wed, 14 Jun 2023 15:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76027C433C0;
 Wed, 14 Jun 2023 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686758101;
 bh=iI6igqMT60w7P/l0QhFqDEyNg7+YVbD5N8OO3TanF+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e48oeFwLHdIUlSFKmZpuhvaZIc6XX120LrcMPSpyEqB7BWuDFDEx67h7VG5wuG+/V
 MZ55YvNovcv/mJkjYdv4qw/Fg9V8aUml9KglqAzDpQnFQJj6WBmgLjZINSWGrPOFKW
 A4UJyJrm6EZnGRqzlethKgCNm6OmbCct4vFCZC3ztZhnngSbp8pzXo4cyHdNGZkwXz
 gmGqY4U4493FBCFLe1W+p6/yZ9AorFfR4Az6A8Ax6LKC06sOmpk/gWKymf+QLeQbmI
 v+58d1tk96zhctkcv00QPrklqa/1YQT9XY3e8vW+P2TBoD2h3BSqXYCgybGS7H+ljv
 vnyDkW6WNMmCA==
Date: Wed, 14 Jun 2023 08:58:23 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <20230614155823.g7xfgxff3eopukwh@ripper>
References: <20230614142204.2675653-1-quic_bjorande@quicinc.com>
 <20230614142204.2675653-3-quic_bjorande@quicinc.com>
 <8f8d5e09-50a6-a83f-d4bb-3d7bc8c07162@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f8d5e09-50a6-a83f-d4bb-3d7bc8c07162@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
 mani@kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>, johan@kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 05:27:24PM +0200, Konrad Dybcio wrote:
> On 14.06.2023 16:22, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Add memory reservation for the zap-shader and enable the Adreno SMMU,
> > GPU clock controller, GMU and the GPU nodes for the SC8280XP CRD and the
> > Lenovo ThinkPad X13s.
> > 
> > Tested-by: Steev Klimaszewski <steev@kali.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 

Thanks.

> one question below
> >  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          | 14 ++++++++++++++
> >  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 14 ++++++++++++++
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > index cd7e0097d8bc..b566e403d1db 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > @@ -210,6 +210,11 @@ vreg_wwan: regulator-wwan {
> >  	};
> >  
> >  	reserved-memory {
> > +		gpu_mem: gpu-mem@8bf00000 {
> Is it ever going to differ on other platforms, including the automotive ones?
> 

The memory maps for the two live different lives.

Regards,
Bjorn

> Konrad
> > +			reg = <0 0x8bf00000 0 0x2000>;
> > +			no-map;
> > +		};
> > +
> >  		linux,cma {
> >  			compatible = "shared-dma-pool";
> >  			size = <0x0 0x8000000>;
> > @@ -390,6 +395,15 @@ &dispcc0 {
> >  	status = "okay";
> >  };
> >  
> > +&gpu {
> > +	status = "okay";
> > +
> > +	zap-shader {
> > +		memory-region = <&gpu_mem>;
> > +		firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
> > +	};
> > +};
> > +
> >  &mdss0 {
> >  	status = "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > index 5ae057ad6438..7cc3028440b6 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > @@ -264,6 +264,11 @@ vreg_wwan: regulator-wwan {
> >  	};
> >  
> >  	reserved-memory {
> > +		gpu_mem: gpu-mem@8bf00000 {
> > +			reg = <0 0x8bf00000 0 0x2000>;
> > +			no-map;
> > +		};
> > +
> >  		linux,cma {
> >  			compatible = "shared-dma-pool";
> >  			size = <0x0 0x8000000>;
> > @@ -518,6 +523,15 @@ &dispcc0 {
> >  	status = "okay";
> >  };
> >  
> > +&gpu {
> > +	status = "okay";
> > +
> > +	zap-shader {
> > +		memory-region = <&gpu_mem>;
> > +		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
> > +	};
> > +};
> > +
> >  &mdss0 {
> >  	status = "okay";
> >  };
