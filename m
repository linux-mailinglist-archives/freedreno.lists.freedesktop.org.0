Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20B0A48CC2
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 00:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0A910EBB0;
	Thu, 27 Feb 2025 23:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zBSXKMh9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4588910EBB0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 23:27:05 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-546267ed92fso1527559e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 15:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740698823; x=1741303623; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7WNTtnPyIuJT+/uJWKYo/FYFhAssVEsvM4kIc7boJOo=;
 b=zBSXKMh9w7pPYReJfENZNf+vdnFVylR4j+xrZP9aK3eKtWZUI57uEP6AKw355NT4yz
 Lm4SzU/XlV7/vxM7uQ9ITY/zrlGLi7LfaO3vFxJ2lAJk/Poy+HFfxsuLXH5MQLmxtIpZ
 2y7sBHvr7RCbfwTm3mrnY/MOyzz4lfPSCaOfylnUc9byBPkQNKXqUvybvpapnFN5jKuD
 IL3Y2hBln6WLOHC0+kp6zcBLwYrLf/eJ4aRnhPU2196XT7Gv8h8Rv0PBbUsgpjt5mcC0
 SZOqoC1ZtwtvUWeG//lJweggQcmLbbaCrcgaxht6ovsTN6hEhGV/aXBI3iuTE+W2cI+J
 QFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740698823; x=1741303623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WNTtnPyIuJT+/uJWKYo/FYFhAssVEsvM4kIc7boJOo=;
 b=P1iF8ITQtgdVG+/OOtkopr+pS8CI8QZXR4IAzoRGpNo6jrzRBWu5clx9CyEQ7gU22f
 cOhlKwciKTu0ZhYNRDLTCFeoKc9Ratf8yhMnHIzrCAVbNvvUiYmmvP97oQ/zTuCbCQta
 8UqiC1oGurZV9iMA8f/C0W5ck/pK9/MecujhO1xwSbbAk3lq8rFz6U6v7Vm5gYB/kxCs
 ClhpaI0/oWQkExsGnYlwzEaVjuWHkgHvfVavUhkrdzFqYAw92X/qmLk9rJL5I3LC140E
 kgDat3jVpH6vq9BacsMFWr0kBzdj8iNUVbZUUVXykpall1g0XJxe/N06AgewwvBe08jt
 XSAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2NGr3OR14c5j7tljMPSHpG/8Rl/oxSdlHrkrFYGZO6WJ0fz3GLrh/125l73oH06Hm6YBsVUuGu9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRAh09V9eVkXMr6W+AhEUK3aA75peTIb+CRUFNFGQWUCL+v2Ub
 E2KpS3s6RPEdfxKy50pfo/MEkfybSi7SNcaXsNp2BKxgPFKhagXU51IOvnXRwNw=
X-Gm-Gg: ASbGncvCY4/fNmcmmZIob0Yc57jrjAfJ0VmrDrYffHcJVJ/HYUMQqx3cru5A92mvdGl
 0g+sCN0ZuIQulNh5ndu57oVFP3b9oJz+K4watDcij7KmR2Y/qxMPIU/0MNytkfdk1pg/J8PsdwU
 hdwLpp1u7ucrmhJa5HDaKgUEUmT8j4flvO/AEOM2nCQXOIg/2q9PwfnMg0OfWSN5xXCps+0P9hd
 lV/MyR9jwrjJbEZsFV/bPCp+9KoZCS8O0/eKeQ7zx54aqFcijifOwwczolzpgFN7aLW/oxlbArL
 Jwxe0YW2QvwpNKV6yGlWel3l4zWaJTiNfRhB3Hv3NFurBATwU1hyeDHqW8SQPW+tMZdxBga+5f2
 eruLmGg==
X-Google-Smtp-Source: AGHT+IHxjxlMLhD3oxVC5PDwEv4tONUbYy57JLfGirnQiWK4YcosMJV+1qf98e7hbSx7Q8klj5cPTw==
X-Received: by 2002:a05:6512:281d:b0:545:2950:5361 with SMTP id
 2adb3069b0e04-5494c129f93mr514211e87.5.1740698823331; 
 Thu, 27 Feb 2025 15:27:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443be608sm299637e87.173.2025.02.27.15.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 15:27:01 -0800 (PST)
Date: Fri, 28 Feb 2025 01:26:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Add support for Adreno 623
Message-ID: <67jiudy4bopd3mzoylj47stuxwc5jdt63akxwn5qqo4dov47za@xcece4v2k3m5>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
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

On Fri, Feb 28, 2025 at 01:37:51AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>  4 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..1820c167fcee609deee3d49e7b5dd3736da23d99 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  		gpu->ubwc_config.uavflagprd_inv = 2;
>  	}
>  
> +	if (adreno_is_a623(gpu)) {
> +		gpu->ubwc_config.highest_bank_bit = 16;

Just to doublecheck, the MDSS patch for QCS8300 used HBB=2, which
means 15. Is 16 correct here? Or might the be a mistake in the MDSS
patch?

> +		gpu->ubwc_config.amsbc = 1;
> +		gpu->ubwc_config.rgb565_predicator = 1;
> +		gpu->ubwc_config.uavflagprd_inv = 2;
> +		gpu->ubwc_config.macrotile_mode = 1;
> +	}
> +
>  	if (adreno_is_a640_family(gpu))
>  		gpu->ubwc_config.amsbc = 1;
>  
-- 
With best wishes
Dmitry
