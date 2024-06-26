Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A78917A48
	for <lists+freedreno@lfdr.de>; Wed, 26 Jun 2024 09:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB0D10E14B;
	Wed, 26 Jun 2024 07:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="g4DFzsiM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D086310E7B2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 07:59:43 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-424ab8c2d95so1254225e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719388782; x=1719993582; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YKC9JWwz9mDZFJPWKIzZ35FYqwpsv8ltyyUAlB5rNg4=;
 b=g4DFzsiMe/vMIZl/Sgiaw8xXC7us+klkuVXn3+wXZ9IacDKzy8z5ww92YSksAMSbgR
 kjS1Wztdq6ScJqCUVF2VFozRD1lkQEVA/SA9lopJpKadE2QYVbF/0MYfqiiousNQHGTn
 Hbi+ACCa9NKfEJxmuI0ZlT4/l/PYB09kKE5As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719388782; x=1719993582;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKC9JWwz9mDZFJPWKIzZ35FYqwpsv8ltyyUAlB5rNg4=;
 b=cm+nIefgILjuZDjF+ssay4Y8jBw2dsKBlGR+jraPL4l0SJccrOoUOQCmTjliihgwGf
 rNREGNpx2FUoYS9RotIB5n/g/Uu/EAiQqrpw3f0EBr8FGo0t+/Vgv+KrCemeic0H9tw6
 V9W1uS6yDRwXurT7hRP/DR/GTPMNKW8JAYOD7TYsrPDNkh9/VJgeIuW7HMy0XYXZsxB4
 B6JyDP1xDF0X6iRO/SUcuBVfGUZyJBTe/UrMpQfC58ZoxfyIJEy+aNW9DEaxbxbFOdjT
 u/yxiVn6TlFCWE+riGMa94Et9Jy3i/31r3NHJNdQ0rnnjKtdEaBxT1LeFBjDleRuK5jB
 fbpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/OxnlVvaZkNJuWM+KifnHmODh9SySyxDsPb9D3lcr/2JmQramyMB62GarqFWWkELXt1GHc8EkQBPv4hIQclgoKAszbIpGjw1uyEaPAgiI
X-Gm-Message-State: AOJu0Yw22fUJ4vCfAe/sB4INl4OlYwhpXRGYYvJ3LXJxbJt4+uPbRrP3
 D4NYByrMGHIMH2I3rBpT0u7ALdWDPsvQ0N7YCF1oCWxERWqYMLcsVa+1y6rfYzs=
X-Google-Smtp-Source: AGHT+IG4EVOkrn1Y0XT/ql2oK40G3v2KP3e4L4gODD12bYa8V2Qg23ovSXufw0iA+4BOJcA67yWlig==
X-Received: by 2002:a5d:6d8f:0:b0:366:eb60:bcf2 with SMTP id
 ffacd0b85a97d-366eb60bd9amr6081538f8f.4.1719388781876; 
 Wed, 26 Jun 2024 00:59:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9c158sm15120701f8f.56.2024.06.26.00.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:59:41 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:59:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: De-spaghettify the use of memory
 barriers
Message-ID: <ZnvKa29EceUyZ62U@phenom.ffwll.local>
Mail-Followup-To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
 <20240625-adreno_barriers-v2-1-c01f2ef4b62a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625-adreno_barriers-v2-1-c01f2ef4b62a@linaro.org>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Tue, Jun 25, 2024 at 08:54:41PM +0200, Konrad Dybcio wrote:
> Memory barriers help ensure instruction ordering, NOT time and order
> of actual write arrival at other observers (e.g. memory-mapped IP).
> On architectures employing weak memory ordering, the latter can be a
> giant pain point, and it has been as part of this driver.
> 
> Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
> readl/writel, which include r/w (respectively) barriers.
> 
> Replace the barriers with a readback (or drop altogether where possible)
> that ensures the previous writes have exited the write buffer (as the CPU
> must flush the write to the register it's trying to read back).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Some in pci these readbacks are actually part of the spec and called
posting reads. I'd very much recommend drivers create a small wrapper
function for these cases with a void return value, because it makes the
code so much more legible and easier to understand.
-Sima

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 0e3dfd4c2bc8..09d640165b18 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -466,9 +466,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> -	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
> -	/* Wait for the register to finish posting */
> -	wmb();
> +	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
>  
>  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
>  		val & (1 << 1), 100, 10000);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c98cdb1e9326..4083d0cad782 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -855,14 +855,16 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* Clear GBIF halt in case GX domain was not collapsed */
>  	if (adreno_is_a619_holi(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> +		gpu_read(gpu, REG_A6XX_GBIF_HALT);
> +
>  		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
> -		/* Let's make extra sure that the GPU can access the memory.. */
> -		mb();
> +		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
>  	} else if (a6xx_has_gbif(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> +		gpu_read(gpu, REG_A6XX_GBIF_HALT);
> +
>  		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> -		/* Let's make extra sure that the GPU can access the memory.. */
> -		mb();
> +		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
>  	}
>  
>  	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
> 
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
