Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F64A9DA8DB
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2024 14:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B1710EAD6;
	Wed, 27 Nov 2024 13:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CoKZ+Hmk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B0F10EAD0
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 13:43:20 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53de771c5ebso3386637e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732714999; x=1733319799; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LIXGs4fTwSxjqXemGFw9+p2YdwTHf2NnHZwaHRGF6Nc=;
 b=CoKZ+HmkKQJhpm/3cKRXQzrzZHSrqzm87AxWyPPhH04wt+yNDu8o36Ip/6kuQVQPet
 rxef94W2fgsgaVVKHEtaTT7BquYA1WA5YMrCKOEUqdmAvgc59CpeRTmPKWrMqvkE9nR8
 t2yYnyP1ouA4JTVMfrZ7jGkzV6LIh+Y2XhNc/r+OlYTH0+Se3y6vmomAlyNKLaRpV9l2
 wxtTJheeOkjYir91k00uQXJs1J9CYvraHzkXxUx392WFTwNhhjV4+BZISw83FlmkJG+w
 iTg+z49G9l21ez8ZiW0HzR0tOQB8yIz3XSxEkj77baR0IRhdSQa//4CBiAnunT/pChz3
 J7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732714999; x=1733319799;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIXGs4fTwSxjqXemGFw9+p2YdwTHf2NnHZwaHRGF6Nc=;
 b=SiZf4bbtRSjng+JErDCtNNcvPEiOwQETbTDlALWDJNerg6srlR02tw2D2e68bYVlQk
 UQEpkJfdilVk5M5bntCfdXk3xFiJeWqugR3lJHY1NRmJMTJShFUrulnCSNPdiaA4Fj01
 qKkAb8xpoLq1bjcplUTTACOq8xn7FklnPRGPg/ufK5y6u/VSY8BEkAJ2S6FA9wTg6cXI
 vLRilzyR6Cv/i3npT5H0kpAXFTaGxL9mvW0gH46MdjSZQ2XvLhNpxOzlcPjfliAMiRHT
 jDUwXrkWkGXc5AvC6NZw3T605HT8fLbJK/bwE6YtaH03GOxfm9w2UNKMwg24So2gVtgQ
 dVow==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1etZZPDoLxzeD2rcfBhIwQIgHwuFPcExA6xSSaIffl2b+RtrtWO+4RrtpvWa5cV6teokTojsHsB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwntbN+U9HpUBz5Zw7DHmRhVNmyt7cVH3s1ntHyEaBZYI1oDTQn
 Go70m1u1kTRAl1qwysriW4gsfZK8teqynCCY/sWnQs0ofaU6isKX+AmJHkTwqh0=
X-Gm-Gg: ASbGncubCp96tB/X5Asd5CnGwWrp7fjxCjORp8jmHsiN618VdKIyXTlQ/ewdLEq6aQ0
 laOsBg8lDX6g+uvEyelcFnXmQoHLgEbSz6po/cgv4jjS4Lys3vkraKnGhzlp0os9R+Gk3tMmO9x
 Ah2ZfQAonKdbzlnHe7+fnM8tuVMcZ3tykW+/ub1NhhAG8BE1d+kshFIAxr/7GTYj5jofM9BuRab
 YCHwlEMJ2hkrHvFNFZf1p4zQtcVMTWAt0iIK1Y9cTb8am5PQAoFWYAH1s049187XynZpHKs8b21
 vGzFtDBDsk34XpMroTj09Y6491t5RA==
X-Google-Smtp-Source: AGHT+IHl4xTqfFayy6N/PMSQFKk1zMBlFF166s3qCjZQxpVTE21zLDuT/xgWMcxx1dKM+yaLNkjIHg==
X-Received: by 2002:a05:6512:313a:b0:53d:f177:51d0 with SMTP id
 2adb3069b0e04-53df177526amr1071412e87.9.1732714998834; 
 Wed, 27 Nov 2024 05:43:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53ddbfc2b7dsm1721318e87.129.2024.11.27.05.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:43:18 -0800 (PST)
Date: Wed, 27 Nov 2024 15:43:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Ritesh Kumar <quic_riteshk@quicinc.com>
Subject: Re: [PATCH 4/4] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <2ld2iwmvhz6myn6ume3lspi63wjefa3hpctoj2rdreaqhwdxmx@seic3sq2yo4h>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-4-0d30065c8c58@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-qcs8300_dp-v1-4-0d30065c8c58@quicinc.com>
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

On Wed, Nov 27, 2024 at 04:15:51PM +0800, Yongxing Mou wrote:
> The Qualcomm QCS8300 platform comes with a DisplayPort controller
> with same base offset with SA8775P, add support for this in the
> DisplayPort driver.

Can we reuse SA8775P config then? And SA8775p compatible as a fallback,
not requiring any driver modifications.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index aba925aab7ad7c6652e81004043864c1cb3ac370..f870faa89f26a8cb5bd7f4caf11f42e919c9efac 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -118,6 +118,11 @@ struct msm_dp_desc {
>  	bool wide_bus_supported;
>  };
>  
> +static const struct msm_dp_desc msm_dp_desc_qcs8300[] = {
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{}
> +};
> +
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> @@ -170,6 +175,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>  };
>  
>  static const struct of_device_id msm_dp_dt_match[] = {
> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_qcs8300 },
>  	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>  	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
