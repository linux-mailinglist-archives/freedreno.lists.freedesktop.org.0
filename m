Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E09640E6
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393AE10E190;
	Thu, 29 Aug 2024 10:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QAZjHx5B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709D610E190
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:07:00 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-533496017f8so634669e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926019; x=1725530819; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p4m4sFOZMDTMX82iw7f1HhdQ6KEhLtr+hrPhztMpqLI=;
 b=QAZjHx5Bg5Pp/wHM2cc9lQF9HkeTFs1CuEq2G/bsp65DxdIUOaNFcmDStziPI8d3b7
 V6VTyIAA5gya9a3TDe2Rz5G7w5XD9WOM9VvezNEjGY0S9UO0yywEL3ewi+nqpFyPVsDx
 Pjr0Z6GC7lW1OQqismKr8SHy5sUGZ+/LDHziV/WHC8so5Vm8ZDtJnhtQlwolBDTsy5/J
 KID17/apP0oXKtwscBoMRplVlT/hKekF/k80PN5R23WX6srZ1GN5794GHk38pOVhcSnc
 8qzYYBfz24qsesrRZgLsqb9JVjM13uggJh2u/GMEeoYI8iBjPeKZwdX/3dLMAQ4T688O
 KVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926019; x=1725530819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4m4sFOZMDTMX82iw7f1HhdQ6KEhLtr+hrPhztMpqLI=;
 b=TaFyFLx9j1F0plWjK7t80BYX+1K711yFMacrPt9WDwNWPXELCKpLe/Vjh/IClEqbBO
 PWpU+LCr2bJxyQf9Vpg72nYlcdCHMP/5y83fghGqeK+kEtlmFA+mvuVSQ2kZkby2qXOL
 bf40O63Env8klhZgfjYGFWdm1en/8ucsc+KVqB+r/Ic25lVVX0FAduuysFkzV1To8zlJ
 e7XCQfIBuptyX8Jq+esz9ht9sUWwoiobOD/QKDXB0nvYj/JRi46xQCb2K/V+/O4xJY0f
 x0IVFf+BCqBHZSRqoElgjOMmMuvZhe5/0VJmGINMBeMVWBdw2XSXRdoKBbsKSuJuwwVF
 0qiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbDl/BCL10WpKW9ndUwEZcdCpdl9L3fZLTJgk5tvsGtHtKvUOScpH0Gw6wKT/exF8DeLbkEX8+AKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO6cy1VfzTijIuOkGZusLp81Pcf5sTGNsLlZfJMRb9L0/KJuHU
 380xJM4xH0TOjVSXtZ+IxP5MuJ1seXFS64gVBiHyIisZV+nVfn6zjoYJKFn8oK4=
X-Google-Smtp-Source: AGHT+IEAyzzgG0+l2SSqg3XbyWi54g9EJHgJyEiWmSeAfTXoSsLIi75kAP68EXftAzwcFS197Ifz8Q==
X-Received: by 2002:a05:6512:3f0a:b0:533:460c:e42f with SMTP id
 2adb3069b0e04-5353e5449b2mr1408030e87.4.1724926018326; 
 Thu, 29 Aug 2024 03:06:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408593d5sm112334e87.306.2024.08.29.03.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:06:57 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:06:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] drm/msm: Use devm_platform_ioremap_resource_byname()
Message-ID: <6k6hghic2ay277jg5tddihqal2i2fta2aam2du6dbjqq4whcjh@lilojqbwgnsx>
References: <20240828084849.2527115-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828084849.2527115-1-ruanjinjie@huawei.com>
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

On Wed, Aug 28, 2024 at 04:48:49PM GMT, Jinjie Ruan wrote:
> platform_get_resource_byname() and devm_ioremap_resource() can be
> replaced by devm_platform_ioremap_resource_byname(), which can
> simplify the code logic a bit, No functional change here.

NAK.

platform_get_resource_byname gets mdss_pdev, while devm_ function
uses pdev->dev. Passing mdss_pdev to
devm_platform_ioremap_resource_byname() means that the resource will get
lifetime management attached to the lifecycle of the other driver.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/msm/msm_io_utils.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index afedd61c3e28..6f7933f01ae6 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -54,13 +54,7 @@ void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
>  			       struct platform_device *pdev,
>  			       const char *name)
>  {
> -	struct resource *res;
> -
> -	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
> -	if (!res)
> -		return ERR_PTR(-EINVAL);
> -
> -	return devm_ioremap_resource(&pdev->dev, res);
> +	return devm_platform_ioremap_resource_byname(mdss_pdev, name);
>  }
>  
>  static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
