Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96BCA542FB
	for <lists+freedreno@lfdr.de>; Thu,  6 Mar 2025 07:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D9E10E8FB;
	Thu,  6 Mar 2025 06:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tC/ZBtu5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904DD10E8FB
 for <freedreno@lists.freedesktop.org>; Thu,  6 Mar 2025 06:45:01 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30613802a59so3167701fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 22:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741243500; x=1741848300; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vJcWTKFiNofQSBl8Y+/9Hv1NdwHNGxMC5GhCSRQfHSY=;
 b=tC/ZBtu5qse2hWerOHAyv32foU+GsRgprOU78etf5yMB5IGmXm+Esvm3IPez6vPdlh
 Hqxu2wgwepsdPi/VK32bq4L1MDkJqUKG2GP++B74SLoyfnHEZUHvyJ5AHT+Ky+OCKlHi
 jEgHRw221jGza4icA8SNovejLC3lQEAMtXbokSBE6gZFHhLszj7Tn3LZdQXPTQ5xls7i
 qPDl9ogRnXBQncyhIfY29ZfIFXrNCB9G2LH6kqjizN7Ir2QmvCmcHKXRVBS9XFpeI2TO
 skYm6rLuYCV72hAmEXAQRYb1rNu+bhuRNUGDtHjj3nWpMJ2ug8aLrpg8A47GiElXGrMT
 DdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741243500; x=1741848300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJcWTKFiNofQSBl8Y+/9Hv1NdwHNGxMC5GhCSRQfHSY=;
 b=h/kazvYfvRYeseX00ENRBF2U9TrGTAsmjcmYOQI3dwZM+SgryhRh99xLZzSJrs8ykx
 p0NF37nwjw6kYA/lXVFlF5l8YhEIKcEcC2hgXia/QW00ZPnVfZ3dHKjDDuJ/ZYkQKUmp
 uhnAw1OEeI72+FMbnSS5ugpUkp42N2r6ihnbk4rh5pDwgisjew8ao/E+wChNoSr875t8
 i3haJwj2Gu9huhaSPOxqtKafOfdjNFFACGbqjgFMvhSTNhT/hE7gjpRE2OgUWVkjbURo
 f4NHOH/1LPAlSIfRKeu5hFkx5n5IHsJKgTZizwUlD4/YRIQve/obBquu1zO6ab0QwI4J
 w6Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG4i44jlZLAdJE4nnUouneskCc3Cu2NbDtuCgjKZb2s/+y/BbA3wChlJ5OrxxOk+0hoWrOjEQpdLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhA+TiRcFR2bJOYofNvSmPHfqnrUXvNWBMQkp2cIu3pQiX2Zs5
 9iZNWYzYgLUt1VEpDzrCFBmYVDSZw5jMVeBpDkpkx9c/EpUDVFF4CF+4oBpU5us=
X-Gm-Gg: ASbGncs72IDKqgvHEJc5IoTJCH0dCZeaEtqm8lUwLuQeH3GU9+cvwv1O92dozWHUvre
 00aTSmtQDCHULSAN2jYISDE6Muc3DXXIh76qPG7Q9FywKuZVKSNz8k5hR91/h1OLnIYYqNUokoW
 slaWNLzl4dM3den3GBNs0GVWZriRySHjHCxC8DqeNIl3PxlN+eVj3m0obbHvmWDzFhELbdc0Q95
 ygOcaKNXfpFnbJHVqcD38xR4tCDKR74gExrPquOlgKtWfjoEbQNSfseP01NDRCpmklKSzqqSn+/
 rr7/vFwaLIXm7PjY1Pps0/ZhBiYY5rK+EZl1sCgigLetBUqzfZu+Q5j8ClSLkI1M2J/52NTUXGN
 Q008rIH1ZfKX58EEDb7CAaz1x
X-Google-Smtp-Source: AGHT+IGKZmSCFgA/R9sb1yzYNL1vBOalW8LPwb3ZSbsOkodGM8bD2zIilQTAga0vyIRSmk9t4Oethg==
X-Received: by 2002:a05:651c:4cb:b0:30b:ee44:b692 with SMTP id
 38308e7fff4ca-30bee44d138mr619121fa.33.1741243499788; 
 Wed, 05 Mar 2025 22:44:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be99c8319sm1034191fa.76.2025.03.05.22.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 22:44:58 -0800 (PST)
Date: Thu, 6 Mar 2025 08:44:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Message-ID: <vjufkcrkungrwy7w4pxzsac57ilzk2dt3eeypzy6pna2z5ocxg@uf237ixu6kqq>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
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

On Wed, Mar 05, 2025 at 07:16:51PM -0800, Jessica Zhang wrote:
> Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> dedicated CWB PINGPONGs
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> index ae1534c49ae0..3f88c3641d4a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> @@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
>  	mux_cfg = DPU_REG_READ(c, CDM_MUX);
>  	mux_cfg &= ~0xf;
>  
> -	if (pp)
> +	if (pp >= PINGPONG_CWB_0)
> +		mux_cfg |= 0xd;

Shouldn't it be 0xb for PINGPONG_CWB_2 and 3?

> +	else if (pp)
>  		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>  	else
>  		mux_cfg |= 0xf;
> 
> ---
> base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
> change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry
