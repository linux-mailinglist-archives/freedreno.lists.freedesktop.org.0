Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC75A31A22
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 01:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FD910E777;
	Wed, 12 Feb 2025 00:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iOEzFF/m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878510E777
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 00:07:29 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so6468766e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 16:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739318847; x=1739923647; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rSvVq0Q4byuw3K4FZfEe4v2n2HhjFTVAI/WWeumGLwM=;
 b=iOEzFF/mJB4BwkngYlkUsvi8dfdYbZsr8TLjB3o5u0PKK0KL0Q/rBjFT4cdbUIAmlY
 yWQEUCuSNOsmfVXkkAaDjbCTUd35XF/L8zoHU6DoGMmegX3bQLdkW11k0May9yc+y8TJ
 r/Yt6EXVJtge/0rOZ1V2ajP5u9R7k8p9SBoEbcAHakdJt9eZRRowdbVshY+Yrhb+0xzU
 YoHLBoWIyd/yAzxa3pgHmvrwktm57qnF9p5/m/iAoA3nMgToO8YwOP8gUbzvnLm+ZCz9
 F69IhS/3dIx0lybuOndnvnDii3If5fG+iczQhnNqtyPz1G5qoGuuhwzdQVT/HhMiGPE8
 hCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739318847; x=1739923647;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rSvVq0Q4byuw3K4FZfEe4v2n2HhjFTVAI/WWeumGLwM=;
 b=c+I7tZf0ntXrofv7D8xkM3JwMURSQJFScwk2KVjNmOHDX86jF0/VPIc9JX5ljRDY4v
 cvWuSolLAdgAMqsHXrq3KFV8ddQMQtOmaTNBPeB01oCVvF/bANaIj0d1P+7Td94uInMC
 xdatJ49H8dPmi+yjxWEqzjUB7wrelABZF8xldoX+o8cIGYMCwVAnkimRlL8brD/WvMUG
 s/Ox3VuITrI4AR2eEdm8te0s6Ik1cyDKLGzbatRb/ccPZ8nZcN5icgjShM6eOASX/CbD
 DeqzufC7Ax2uAAHhEpkscOhFnt2PHfhK+BkFNhuXaPobc3Yf7vo27XzJ9udtfwnncI7r
 276A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Z4lRh0GjGWoa+M49hqAVTR97U5hK9c3zHBJn6dkD8QAGxfBj1Ri13UR2ldkRKrFWlwye9B6AjT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY2aS9NZ05GNyUlD8JqKgPk4nC1lL6KrxqRNvexURi+HpudEs6
 OIw6SWrGOnRlcHmk5/LFRE6iB0ckJNziyco2cwuA8Wp/oPWCCwieRhXhg5gfz7c=
X-Gm-Gg: ASbGncvTWp/KZEKk+TDg7tU498XhoFxQ5zYCrq7+z4mJfHqw0IiBtA2N3WhmeFl+79O
 4fFlQ83iYu0KjpVoZFAMldj/a2SPkbbdbAzFhg6D/OOqGWSpHKPJneM8OscCW+5Bz/rrgmUo/AD
 1HpqVT5B/XV5EzLLgjatecaGrPzYng49DsmmgVK3zuWyRh89MdldZdm9gO7yW1vMrW0yDPfxGkS
 Yzg8Uzkl8tJGBH/vsk04wnZMTYvsslaognX47pUdUIbQSbbAgU6lEpYboewnEn9A7y7ql5rWSVU
 snB52QqMxzbvju+a0DztJr2cIrj4n92TCpuWnRdiZBbWl/WjIAa2cQn7Myoca1/LR8OU3Jg=
X-Google-Smtp-Source: AGHT+IEYSYjM6e26W3BebaqVj9AEp0qCBuSkwbasndm6u40vD94b8fZ5bLT2RmF5vB9zoS1z8G6pdw==
X-Received: by 2002:a05:6512:745:b0:545:c08:e193 with SMTP id
 2adb3069b0e04-5451810fe44mr196032e87.27.1739318847359; 
 Tue, 11 Feb 2025 16:07:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450bb646a5sm808177e87.146.2025.02.11.16.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:07:26 -0800 (PST)
Date: Wed, 12 Feb 2025 02:07:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Allocate the number of LMs based on
 max_mixer_width to support 4 streams MST case
Message-ID: <zri44j6baegrcxmnac3o7ujtrlm2ybhon4hq3ondvdbcqfhpa2@zjxcprel7zv7>
References: <20250211-dp_lm-v1-1-deeca9ac9bd9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-dp_lm-v1-1-deeca9ac9bd9@quicinc.com>
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

On Tue, Feb 11, 2025 at 06:37:43PM +0800, Yongxing Mou wrote:
> In 2x2 mst case, each 2k monitor will use 2 lms, but dpu_8_4 only have
> 6 lms, so let 2k only use one lm to support such case.

DisplayPort MST is not supported. Please work with Abhinav to get it
into his patch. Also it's LM and LMs.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>

This list of SoBs doesn't make sense.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..e8846bf8edc5f9b2b3b7f093e4d5aad75de53da1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -677,7 +677,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  	else if (!dpu_kms->catalog->caps->has_3d_merge)
>  		topology.num_lm = 1;
>  	else
> -		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> +		topology.num_lm = (mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width) ?
> +				   2 : 1;

Please extend commit message to describe how your change affects other
platforms.

>  
>  	if (crtc_state->ctm)
>  		topology.num_dspp = topology.num_lm;
> 
> ---
> base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
> change-id: 20250211-dp_lm-8f8ef15f5955
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry
