Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA6B298E27
	for <lists+freedreno@lfdr.de>; Mon, 26 Oct 2020 14:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3382F6E141;
	Mon, 26 Oct 2020 13:37:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14B6E9F9
 for <freedreno@lists.freedesktop.org>; Mon, 26 Oct 2020 13:37:52 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id m22so7991288ots.4
 for <freedreno@lists.freedesktop.org>; Mon, 26 Oct 2020 06:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t64kmtN/HDyxP4t5ivuGyA/qPv7YzZlRpPGh3lKtqTI=;
 b=JSYoKogoipLwKDt1oPc+lNYpVzNvpJF4WF/LQQazUBUwimZvgLpVhrIx00bdgVpxdZ
 DTDRCkG1J9JiZfepPsE0r6zytkr33kg+7FqG0KKh+uI14auZJMBCsFHrHRIOOGw9M1Gx
 nOLIkEQSeD7HZx1VVclEOu8hFK03w46GOWlQg6jrmRC4Adx5RTOoZ6Wkbu2yui4R1RWh
 9aeQwTegxRq56qUbSGy2yJ7hpITKAcPKltnqhZymPHGO6ac1IJ66mYJoHHjJaSrJeiTC
 NoudaHHjW/LVVAdyPWSLbLKpK9eTiBA4MDc7slfBPKMAE0yymC3Qteix54vSTeSxpIcp
 1exw==
X-Gm-Message-State: AOAM532yzekOq0NZicXfqV1IFO+N7kbuwjwvj7mjy5GxjyJpQw5sSmRH
 5WRCUFR/Ed2YUc6WsFR1GA==
X-Google-Smtp-Source: ABdhPJwFWowVXR46tpcBVBTc1a9/5mTGJ/6c9gdWvieDSmH6ZIEqs+3E3MTlTuX3IKjN2c0Qav7dfg==
X-Received: by 2002:a9d:3e54:: with SMTP id h20mr11224458otg.236.1603719471915; 
 Mon, 26 Oct 2020 06:37:51 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w9sm1502116otm.47.2020.10.26.06.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:37:51 -0700 (PDT)
Received: (nullmailer pid 42863 invoked by uid 1000);
 Mon, 26 Oct 2020 13:37:50 -0000
Date: Mon, 26 Oct 2020 08:37:50 -0500
From: Rob Herring <robh@kernel.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20201026133750.GA41262@bogus>
References: <1603113268-21161-1-git-send-email-akhilpo@codeaurora.org>
 <1603113268-21161-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603113268-21161-3-git-send-email-akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2 3/3] dt-bindings: drm/msm/gpu: Add
 cooling device support
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
 linux-kernel@vger.kernel.org, dianders@chromium.org, jcrouse@codeaurora.org,
 mka@chromium.org, robdclark@gmail.com, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 06:44:28PM +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 1af0ff1..a496381 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -39,6 +39,10 @@ Required properties:
>          a4xx Snapdragon SoCs. See
>          Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
>  
> +Optional properties:
> +- #cooling-cells: The value must be 2. Please refer
> +	Documentation/devicetree/bindings/thermal/thermal.txt for detail.

This file doesn't exist anymore.

> +
>  Example 3xx/4xx:
>  
>  / {
> @@ -61,6 +65,7 @@ Example 3xx/4xx:
>  		power-domains = <&mmcc OXILICX_GDSC>;
>  		operating-points-v2 = <&gpu_opp_table>;
>  		iommus = <&gpu_iommu 0>;
> +		#cooling-cells = <2>;
>  	};
>  
>  	gpu_sram: ocmem@fdd00000 {
> @@ -98,6 +103,8 @@ Example a6xx (with GMU):
>  		reg = <0x5000000 0x40000>, <0x509e000 0x10>;
>  		reg-names = "kgsl_3d0_reg_memory", "cx_mem";
>  
> +		#cooling-cells = <2>;
> +
>  		/*
>  		 * Look ma, no clocks! The GPU clocks and power are
>  		 * controlled entirely by the GMU
> -- 
> 2.7.4
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
