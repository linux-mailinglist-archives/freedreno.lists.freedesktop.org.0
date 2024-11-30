Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0A9DEE8E
	for <lists+freedreno@lfdr.de>; Sat, 30 Nov 2024 02:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C86310EE44;
	Sat, 30 Nov 2024 01:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SrKC7Gjw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DA110EE48
 for <freedreno@lists.freedesktop.org>; Sat, 30 Nov 2024 01:58:08 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53df63230d0so2929758e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 17:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931886; x=1733536686; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E8OZWsrIrTwnUzalAhGoRoN2jmtZFU/SWdczT+zM8Bg=;
 b=SrKC7GjwoPOZLO3Pdr9dIezm8SlLp25U8yeYRoenAVQgvA+4HaGhHAJw2Aps2iZP3j
 DM4BRobr5ArATE5WHo8Gkqjtwh/1lC3Tk2p63qcMlE1EEY4ixBs+6hDwu3L1lFkSsdbp
 64msB3hgx2uWn7myc5hVtHuSnZbZzHagSNFpCJMIjSzg3k8Ka8ZelemnohpIc4kcgMc8
 A4qlBqrGikQqKFVpG5/1DcL1hyH1o76Kq7O25TZ9Cn9hJp7pdWwfFNBfSCLl+ATn3QuS
 bIc1FpGtEoaZUKDxZ3wQyd8kUp7aNWsR9+nMDAwwwixwO35Nejd4aZTwu7v+ZJFlWCgR
 um/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931886; x=1733536686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8OZWsrIrTwnUzalAhGoRoN2jmtZFU/SWdczT+zM8Bg=;
 b=qQxBPATamFQNcDqh36Txp8l4aDpiUldnVskqW8fI5EHUOSiJaMtlHMO2D2svZVvDDi
 BYbD4nAPLlxh/8KgTb85AuWdJ9nM8oS1T1z1qSzkwBKcc0QbG/scucUg6UmMRhtgq5pe
 asdUdTSwngjM9aFLM5FAll31Pc7GDZNZI4MDXh7dViFoWXvDYc7CTIF5theUQM2v9+kC
 XH8MoPHxD/+8JxGkEP2VqSSNOIRVgyyunjR848TanAXiw0jRRpZ2T6L0pXFxQdcBvOrX
 u0HNWxZFrSN/tZO37F8bW6g6bMLCSfYi+b1bwUQuCgcPHz05+zciAUDUjLhjTpDNtI3A
 n6xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIY+k+0YtaCUfKNLY0ZFqc9mOz7RrBFfqXnE0635NJRZxxoMIdyvXcVdMJobRacaAntudzzbmMDxM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu+wCxywT2CZplD0QxR73HpiKh03rgq1iFsr09AaCc+sSaWssY
 Hn3bYba4vMCbBedsCegWKNFJcHca7YiQkp6kxFVBt2NypX2JQ9175H3tI8vGhUM3Gwh1FBeEFRK
 s
X-Gm-Gg: ASbGncstUWSgTub3b9r5oZIPAGtL+IHOR/EmTNcpPMmtIDND4mmg4jaS9HB2lDsegeA
 ugvPMQc/31E4GoVwFrbioO2m3YBy7J6W3a52/m+8g6NsOdGWaoW0HwIc1OI3YWd8bLws90qrtSP
 wd3qvOikqTkeDsi7NU4XRiDYCLAr9rydrJ5tZ160KfI/YqyFmHSpkZuBPlFe4vPrbFNf5FAhCOR
 fDY+MEt3f3mApzpAPMOpROmnEWKfp2oYHUKekCCc/FdxM/g/+MZVdKQKQh7n864/mOUoJERRGsK
 Z4oQHHgHcIy1M6i5knxzcOSWvanFqg==
X-Google-Smtp-Source: AGHT+IH3PxC/7zsS1K0DnMW67rOahIA/SiVj7/NI8dYtx07JEByEXiIOKaepX+9HHyKUtQ3n8U7v3g==
X-Received: by 2002:a05:6512:3181:b0:53d:a4f9:6141 with SMTP id
 2adb3069b0e04-53df00d1b1cmr7390373e87.14.1732931886173; 
 Fri, 29 Nov 2024 17:58:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfbb915esm5675341fa.19.2024.11.29.17.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:58:04 -0800 (PST)
Date: Sat, 30 Nov 2024 03:58:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
Message-ID: <6hunbphnn2m647swkujhyjywp3e7vnlxhrbye5tjakvlfclimc@j64qbwen2hh4>
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
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

On Mon, Nov 04, 2024 at 05:07:38PM +0800, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Fixes: 29ac8979cdf7 ("drm/msm/a6xx: use msm_gem for GMU memory objects")
Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 37927bdd6fbe..b26dfe0a76c5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1605,7 +1605,9 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  	gmu->dev = &pdev->dev;
>  
> -	of_dma_configure(gmu->dev, node, true);
> +	ret = of_dma_configure(gmu->dev, node, true);
> +	if (ret)
> +		return ret;
>  
>  	pm_runtime_enable(gmu->dev);
>  
> @@ -1670,7 +1672,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  	gmu->dev = &pdev->dev;
>  
> -	of_dma_configure(gmu->dev, node, true);
> +	ret = of_dma_configure(gmu->dev, node, true);
> +	if (ret)
> +		return ret;
>  
>  	/* Fow now, don't do anything fancy until we get our feet under us */
>  	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
