Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE3A38C44
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE6610E5C2;
	Mon, 17 Feb 2025 19:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zHL5TbuQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC1D10E5B8
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:22:48 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so2154069e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739820167; x=1740424967; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S9GjiPamODZZMscfrw9WONv6M/bFOtmRPiKnVBr0uxQ=;
 b=zHL5TbuQ/9mDNXnWtgMxUqCeszvoXr6tKDiE5w+exlKFLCyhQs6aJtG1Yi4t/1RhUx
 5bla9NXhGp0fXfhk7XL8Q+Wh9wkt+FbQpCN43TMVrvdpCFe38hWrhTEWPZuvG0NALVXJ
 tHUe2qzl8GackHCqke7qHjiS628xWFfVC51VpGMv8sJCbEwpyw7DVi7gOi38U6GPuphO
 WT7dC1znu1+8B4zu2GPLQP20SqD2uz2SV0z9j91koVxwRhyJIAIanjZhIs8x55AV/St/
 mOzSMdfOHEK5fP6FoVvl28ZcGHzpns6vBnlJFqdr3etkYK3a35AtSNA74ijq83mR7Yit
 YJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739820167; x=1740424967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9GjiPamODZZMscfrw9WONv6M/bFOtmRPiKnVBr0uxQ=;
 b=h7E7emwLkna1w3w6h0g4zM+hjiR3wpTDK/DCuRzCGU9DNWp0CATUkG21AE1HBTTjQh
 ndzH2GQFr4fnDwH6p0Y6996YCe8toCUrwnlS94G4x1hMW93eHBFR1uJqh6fyc4++kFa8
 1Dh/jYGhrYQNczfajJRaPaB4pFef1z0nmWN0F0PGBoegfX68y8+VgC4kDz5rz9kkhetK
 lBolqExrv6V0Q1ne3otxiQvdkdTGHtaGIVbzGorU6acZr12aFSjVzuko2r0HJ5Kh3xPx
 SUedFHJWMxl49SDWZDIm5p+H+ydqy3KyjP3IJhDTluLscBTTFbVmeaqg80X0F1PPfS20
 WHRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGZyaIFhLftqtm8gSVL+08l6PNkvHalOdJmTTFN6yqQz4HJEaogPUfn9l7PV9RgkqCvu5ypH+afpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQSmINFkEkSnGpCCbY7YBcaCD1cMcMhbQ/aBUnLZSdlZZ6M2tR
 EeTel8/Ph+oaRcEQy4V/okq+yLRBpWxIxHyGqIYNjtfsfnMYvyQMYK1aU27ivCc=
X-Gm-Gg: ASbGncuaDt+nfDPf6Dc6jdqc1Weob734SLqbBNY4q9M8lWjbdaLNxRI6YvcicUDXadJ
 WP89GIb6rlw+OxC36VgI69K/YwVx0umtcjn6peTp7P4Bb4FDCvjR3DM/XvhZ9EleoR5LBDsDsBq
 hw6DadHD2c6oFM21lY9pz2+vcvRMGjf4LXw2eae7sUDSI4bG8ZehFCQjn4yff08LPCpSj4WfbNQ
 0+V9MBdB/I2wf53MCf+4zkwnuJRAPRy6hmaDCrmxf3Mpr0iHR2ODedoW8sT5Z/fHZGLHLzogAz0
 CN19g2asFFo5qAsUX6njUpi3qihbyKBj1WH035OTw8XCN0QxFSkgSvobem5wJpC/pqXgC8I=
X-Google-Smtp-Source: AGHT+IFlV1UP/wKVxhbwSwQTJ2SEmKZ4/rOsrk8g+x6pZhmGCoSOJCnGQ4bptI2YGeo2RC0BYkCcnA==
X-Received: by 2002:a05:6512:108f:b0:545:16a8:6a5d with SMTP id
 2adb3069b0e04-5451dfc13a5mr4931403e87.2.1739820166729; 
 Mon, 17 Feb 2025 11:22:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452cb59c35sm1293957e87.203.2025.02.17.11.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:22:45 -0800 (PST)
Date: Mon, 17 Feb 2025 21:22:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 08/16] drm/msm/dpu: Drop useless comments
Message-ID: <w3i4e3hkbemmjdbzp5kevxouv4smftsnzml3wa6mkd2e7mzmi6@op2uaa26kz2z>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:29PM +0100, Krzysztof Kozlowski wrote:
> Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
> SoC because it's duplicating the actual name of structure.

Historically there were more SoC-specific data, now we are really
limited to the LM sblk. Maybe that points out that we should rename
those to drop the SoC name. Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
>   * MIXER sub blocks config
>   *************************************************************/
>  
> -/* MSM8998 */
> -
>  static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 7, /* excluding base layer */
> @@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>  	},
>  };
>  
> -/* SDM845 */
> -
>  static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 11, /* excluding base layer */
> @@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	},
>  };
>  
> -/* SC7180 */
> -
>  static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 7, /* excluding base layer */
> @@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	},
>  };
>  
> -/* QCM2290 */
> -
>  static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
>  	.maxblendstages = 4, /* excluding base layer */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
