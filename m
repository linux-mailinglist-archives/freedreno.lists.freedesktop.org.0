Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6C34DF38
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 05:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909D66E840;
	Tue, 30 Mar 2021 03:23:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2896E840
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 03:23:56 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id z15so15134402oic.8
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 20:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XJ+II/5N1Hvyz6uuWXUQ+m2jul22u5rdFG3d3xmYGQ8=;
 b=XZ+lX/K9m/+z8BBmBTImdTLIfNIzicQmjr8dApFMHb34CaUpGb+6UaShh/SsxI8NMV
 wy7NjhxmVtzhIFO1S7zFnavjcN9SOIa0DrRY75lCrqO8QKOI37fA6M8pwsbOeoRryyPX
 cfbNpSAaErtz6Hw1KJzd5RsjFHW56cnetudVdLeQXyrFKQ+gsoCZhdjHhllX8QjhFJyJ
 ToJMwGn1k0R1CI4TfQepIQYuIyloIZR7td0va/lJMndsgJ+w88BePemr6NbL02O/lgBw
 YjdvQ2+ZtdOgRxY8wInf4vVEMvqqJ7j7dfJnqcShb/ECNnOlHzzocuhE588fspEYpuFr
 h4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XJ+II/5N1Hvyz6uuWXUQ+m2jul22u5rdFG3d3xmYGQ8=;
 b=MObrnFmc+/qEtmTLxYjjy84hM1YFANL1qRK3P8XBQj6EFpiF8J1zdcNtzsExca3eOy
 WV4wNERmfr/4wn65kmLauKBzSonCylnOoGO7knshYhJWRNhdSXWa4v8ZktDwcY2ViSZA
 5MT67gcYG6MVYWTFEABpo8Gu2LXI5lpP3LHNwTg5JpftmgtbI9qar5PfZW6qdCbdQgcb
 l/xivz8JIIZMr8pp5VTmFgGj0Usks2gW3S1AK5vRIZydAIiJa6pcoHG/wP0b9mOHAtap
 kcuwVpib/G6TYYi0s07a0tGXDGsVUbUPIt+ZhaqtiJGjyOuCr2TJ/AYJUIUkfcjB1CCW
 EU/A==
X-Gm-Message-State: AOAM531K4Nc3PNQRSqMIOb/9lVuH069EZjfHtVip8LjGA66CQ/MjP8Lm
 y6tybvNe2sF9fJQ3Q1gtepPsGg==
X-Google-Smtp-Source: ABdhPJxSeYNl2vFSLyTptFO+41Pe1NYsTjHnY8kt49eeWG8rQvjgKMnfTIdXVMS4Fynhf0gv023U8g==
X-Received: by 2002:aca:db85:: with SMTP id s127mr1639701oig.142.1617074635948; 
 Mon, 29 Mar 2021 20:23:55 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w2sm4196653oov.23.2021.03.29.20.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 20:23:55 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:23:53 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Eric Anholt <eric@anholt.net>
Message-ID: <YGKZybLYu5xQW9Yn@builder.lan>
References: <20210326231303.3071950-1-eric@anholt.net>
 <20210326231303.3071950-2-eric@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326231303.3071950-2-eric@anholt.net>
Subject: Re: [Freedreno] [PATCH 2/2] arm64: dts: msm8996: Mark the GPU's
 SMMU as an adreno one.
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
Cc: freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 26 Mar 18:13 CDT 2021, Eric Anholt wrote:

> This enables the adreno-specific SMMU path that sets HUPCF so
> (user-managed) page faults don't wedge the GPU.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Will, can you pick this together with the driver patch? (So that they
land in order)

Regards,
Bjorn

> ---
> 
> We've been seeing a flaky test per day or so in Mesa CI where the
> kernel gets wedged after an iommu fault turns into CP errors.  With
> this patch, the CI isn't throwing the string of CP errors on the
> faults in any of the ~10 jobs I've run so far.
> 
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 6de136e3add9..432b87ec9c5e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1127,7 +1127,7 @@ cci_i2c1: i2c-bus@1 {
>  		};
>  
>  		adreno_smmu: iommu@b40000 {
> -			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> +			compatible = "qcom,msm8996-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
>  			reg = <0x00b40000 0x10000>;
>  
>  			#global-interrupts = <1>;
> -- 
> 2.31.0
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
