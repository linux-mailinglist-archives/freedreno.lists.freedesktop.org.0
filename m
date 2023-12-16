Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D98157C1
	for <lists+freedreno@lfdr.de>; Sat, 16 Dec 2023 06:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6021310E05E;
	Sat, 16 Dec 2023 05:26:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ADE10E05E
 for <freedreno@lists.freedesktop.org>; Sat, 16 Dec 2023 05:26:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 702BBCE3109;
 Sat, 16 Dec 2023 05:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDAFC433C8;
 Sat, 16 Dec 2023 05:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702704400;
 bh=k+HLfjiotNDdVkHZHPA8yO2hBIysL09Q2lJMiNnUa44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofEErLlT+b+m/fmlepLCT++JDLi3yPPnJyCUphwt7syqNT/9ZhptTJGovAn0CKNkE
 09qrbA4RafIeeCltUNVbYhqDRiBSifBC9kb7lzoHfeU7m+LOPgjPexkfjRyLjwgM2F
 O3s+eX/TuWHlE7XhlcLHWBx0gSYcwm5oRVKTiNeIEsgqvevb+MBnpt77K/RT33xSoS
 8uBFQMuK0qFYrRh+fuRakGmXws5zyStAtQ6JQDjOUJSVfv7pqbTfB43Ca0dQ/MptTc
 3TkfMAOqON19cFJe0VC8QDEq2mHns6yqvVdZ8LwTC8nIwW4NEcbVjTeomfwYYTbNKc
 RQyvjbFlBNb9w==
Date: Fri, 15 Dec 2023 23:26:37 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/3] ARM: qcom: merge remaining subplatforms into
 sensible Kconfig entry
Message-ID: <hhaf3ocpnejsxpkg6mfodwnkbjttyb2h5p3qsifbyukosvsavj@rwdpgzsovwak>
References: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
 <20231207125500.3322229-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207125500.3322229-4-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 03:55:00PM +0300, Dmitry Baryshkov wrote:
> Three remaining Qualcomm platforms have special handling of the
> TEXT_OFFSET to reserve the memory at the beginnig of the system RAM, see
> the commit 9e775ad19f52 ("ARM: 7012/1: Set proper TEXT_OFFSET for newer
> MSMs"). This is required for older platforms like IPQ40xx, MSM8x60,
> MSM8960 and APQ8064 and is compatible with other 32-bit Qualcomm
> platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/Makefile          |  4 +---
>  arch/arm/mach-qcom/Kconfig | 13 +++++--------
>  2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 5ba42f69f8ce..45fa8ac001c5 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -158,9 +158,7 @@ textofs-$(CONFIG_ARCH_REALTEK)  := 0x00108000
>  ifeq ($(CONFIG_ARCH_SA1100),y)
>  textofs-$(CONFIG_SA1111) := 0x00208000
>  endif
> -textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
> -textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
> -textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
> +textofs-$(CONFIG_ARCH_QCOM_SMEM) := 0x00208000
>  textofs-$(CONFIG_ARCH_MESON) := 0x00208000
>  textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
>  
> diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
> index 27d5ca0043be..0c99d0a746d4 100644
> --- a/arch/arm/mach-qcom/Kconfig
> +++ b/arch/arm/mach-qcom/Kconfig
> @@ -15,13 +15,10 @@ menuconfig ARCH_QCOM
>  
>  if ARCH_QCOM
>  
> -config ARCH_IPQ40XX
> -	bool "Enable support for IPQ40XX"
> -
> -config ARCH_MSM8X60
> -	bool "Enable support for MSM8X60"
> -
> -config ARCH_MSM8960
> -	bool "Enable support for MSM8960"
> +config ARCH_QCOM_SMEM

How about expanding this to ARCH_QCOM_RESERVE_SMEM or similar, to make
it more descriptive and less similar to the existing QCOM_SMEM option?

Regards,
Bjorn


> +	bool "Reserve SMEM at the beginning of RAM"
> +	help
> +	  Reserve 2MB at the beginning of the System RAM for shared mem.
> +	  This is required on IPQ40xx, MSM8x60 and MSM8960 platforms.
>  
>  endif
> -- 
> 2.39.2
> 
