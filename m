Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD81449B22
	for <lists+freedreno@lfdr.de>; Mon,  8 Nov 2021 18:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07226E16D;
	Mon,  8 Nov 2021 17:55:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE906E107
 for <freedreno@lists.freedesktop.org>; Mon,  8 Nov 2021 17:55:43 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id u2so28808769oiu.12
 for <freedreno@lists.freedesktop.org>; Mon, 08 Nov 2021 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LhWfz+5JE21inJr4S250OgcbtsWmt4NJR6DvKNs5YBk=;
 b=NLZ/NWmaut34l69Gi0IMn3FhSPoI8MJxyT511eGKct44ivuZgMwua7hT0tOyLsDZUP
 TrgDXxUaUA7ChA+L3cFnC1wxXZ9OKrp2DAiclSjd/0dAqPiEQUMxdLhwh7TJBeW62J0y
 sxa7L/gO7PUUgBqELeaWYWMpjfyrDPN5orMWbR0tgee7qH946wvFrwRkNxmCE20baibN
 k+IRalaydJaBo+7hWaDZNjCRUOsSOX8GaiuqRGVUZ8nIAxdWVmPEL4ubW46Kx7KoptLH
 NXfufoYJtTJtYYpAQh2ZV1xuOG4OC8fEO2gNDc7SVhOr6lUM1CgDwpMx+e8MVxkv1JSD
 yRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LhWfz+5JE21inJr4S250OgcbtsWmt4NJR6DvKNs5YBk=;
 b=oQNEtudvYNVtWs8aDGiCKK1Ydg0PpWH+6tqlKb7hCCsyvQUS2Eh3PwNk9+UDL0fv9u
 lMdMwUvzbXSTM2woib1lX56R3GAtNPUSeYqSZnlbCvraWgQ3syfmUaFiMPJCDPm8pZoO
 EacBQw7HwRevdoGWqZHr/R1Ft9gIoijMivs/1TQweYRtPakKLjpepJ1f7bBBlv372GJC
 Ctl76gvIVuCmpTn1X8PD3RjdJ7c/5p2ATnjruQo/b99LSf9TYnqHSZOkDNIHgu9eVbo0
 xIwZdz19z84HZjbEg/V9xjXUjCoI4tZ3N1aExy+B0kxocNJr+zsa0+fW4jyRbEqTfK0a
 FC/A==
X-Gm-Message-State: AOAM530GPvQsFeEgspQbTiCUIT0OeqSMJ7zAGagKwOYvp5bRea/RdV/E
 A1hmxOCGGUsANU186jmc8r4hCg==
X-Google-Smtp-Source: ABdhPJz9eQvKIrPc8ta+sw34+CJDdEJVNU0OWR59hAmfrup/u3GDs03M3CvU50HHVxV7g2TUwoHwZA==
X-Received: by 2002:a05:6808:128d:: with SMTP id
 a13mr98463oiw.29.1636394142851; 
 Mon, 08 Nov 2021 09:55:42 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id c16sm6822645oiw.31.2021.11.08.09.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 09:55:42 -0800 (PST)
Date: Mon, 8 Nov 2021 09:57:19 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YYlk/2VZCzX6tokf@ripper>
References: <20211108171724.470973-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108171724.470973-1-robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] iommu/arm-smmu-qcom: Fix TTBR0 read
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 iommu@lists.linux-foundation.org, Shawn Guo <shawn.guo@linaro.org>,
 freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon 08 Nov 09:17 PST 2021, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> It is a 64b register, lets not lose the upper bits.
> 
> Fixes: ab5df7b953d8 ("iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault info")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 55690af1b25d..c998960495b4 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -51,7 +51,7 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
>  	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
>  	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
>  	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
> -	info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
> +	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
>  	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
>  }
>  
> -- 
> 2.31.1
> 
