Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90912A1355A
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 09:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAF910E8F4;
	Thu, 16 Jan 2025 08:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S5nomleG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD2110E8F4
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 08:32:25 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30227ccf803so6080311fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737016344; x=1737621144; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JELxApQBYXscs6o4pzVvERT8kCwa0GBmZxwst9tiL/4=;
 b=S5nomleGH/QXoql4prefr4ocZhhtd7F2ZjK/Vat0H/KmUvt7KrfP68vO3DOmk93Ed3
 SXZybRMmBGEte/NKiVy3cXMsF090GfdqXwEx8TwJWqs+0Dp2dJybNtLLxXfSugDQWUFL
 G3wCcT3KNxW5yKoCPFlbrm5N+Na4OUpTcYPn+y1DDpxZtMVUcnTwbKLAr8oQg24s8Kz9
 Cm1BxMW13EIWSz/NUQYe+BQ3oJFyBa2RINPPyBl0oPXyTYkHvfo4Uvyoi/k1qMKGEO13
 BjcJ4bHhaqkRDt+JDQXau24A9TmUkI09TDswwck7amjurQYv41cVGG76bvPqjnOHCuKQ
 gBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737016344; x=1737621144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JELxApQBYXscs6o4pzVvERT8kCwa0GBmZxwst9tiL/4=;
 b=RF9Qe+KRNefESl1S1IAVzeE2oQaqdQMV0T9D0JKNv7eMGqdYxR8UznmXAkACxOlNtx
 /Uz3l93sFfjzMb/BJnI/VY2Jm+8QBPb2MMVwOlX1TeOQUH3O7iAxv/3wkrOr4oZGTJgJ
 SjI+/+Qw9LFvk2x+hJ4/bsUodxhSaxEqFI9YyX+jLv7zwL0rLEsqyb8Qm4AozTeNq3wT
 k9CPeS2neshF+XKI/DTB3kGkxAC1wrKohSULaFMb636B/BXkcGtFtntDoh8GmRplsQJP
 dXh7M6rxtHGANGDcEjx9Z9YkYpMLtjrdlM391EKoX3R7ptqCrXjhCSCC3pPHiRTSYC9U
 otlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7rutOFqq9S0vyQlp3sYRjpPwvPziAKqwpjpNUZDyVnV1qp0ob0DJxDodODesWR66v68lY88QZQtc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqxZ/Sp1sK6xiVu7ntHJGLygRoLJl89hG66V9dKedSuY9r5MZE
 4h16NnJlVqV8kmhJoAvbZuj7UcIg0vukUz8TLve7hVfRWrjpY7bdByqs4Jrf6fE=
X-Gm-Gg: ASbGnctkISu8ZopXIhnBG6XSwN2vni/ct29QVyiKLy4iSW2HmcsPvoHvSq1wKGZaPvA
 hoRRvQF3VtcK2pSyBd1DtLhmIi0WvlT5P/q9HiNPdyYJOv/09ezN/TDCw8t5zhnqhkMX6F7X45N
 SQs/9xIdz0FreqkTNUBPzFzD2eniOGU+giRAQU9gzlQcnHcqOTdNO59DbhEMemQCA4mg8pWf3Su
 nKJXZAOXY77XxF6sFLANI2C4NmENwprwEH+tkF/7i8PuDqlqfZjBiRpm3LfdGgoewnt5LBXhYS5
 lpB/ZZ27rXQwslnWOZB1ky96J4vWITogY+1A
X-Google-Smtp-Source: AGHT+IHf1QkPHEH+gYTiHUprZLlRzENM5Wzn0GjuOJKVCo+ZX8LZ/i1daAtaAZX+OpWKiFta2uF9Pg==
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id
 2adb3069b0e04-542845b9480mr9657745e87.14.1737016343789; 
 Thu, 16 Jan 2025 00:32:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0613sm2277202e87.181.2025.01.16.00.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:32:22 -0800 (PST)
Date: Thu, 16 Jan 2025 10:32:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> enabled.

Why? What is the issue that you are solving?

> 4 pipes are preferred for dual DSI case for it is power optimal
> for DSC.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 29 insertions(+), 14 deletions(-)
> 

> @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  
>  	/* Datapath topology selection
>  	 *
> -	 * Dual display
> +	 * Dual display without DSC
>  	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
>  	 *
> +	 * Dual display with DSC
> +	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
> +	 *
>  	 * Single display
>  	 * 1 LM, 1 INTF
>  	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>  	 *
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
> +

irrlevant extra line, please drop.

>  	if (intf_count == 2)
>  		topology.num_lm = 2;
>  	else if (!dpu_kms->catalog->caps->has_3d_merge)
> @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  		 * 2 DSC encoders, 2 layer mixers and 1 interface
>  		 * this is power optimal and can drive up to (including) 4k
>  		 * screens
> +		 * But for dual display case, we prefer 4 layer mixers. Because
> +		 * the resolution is always high in the case and 4 DSCs are more
> +		 * power optimal.

I think this part is thought about in a wrong way. If it was just about
power efficiency, we wouldn't have to add quad pipe support.
Please correct me if I'm wrong, but I think it is about the maximum
width supported by a particular topology being too low for a requested
resolution. So, if there is a DSC and mode width is higher than 5120
(8.x+) / 4096 ( <= 7.x), then we have to use quad pipe. Likewise if
there is no DSC in play, the limitation should be 2 * max_mixer_width.

>  		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> -		topology.num_intf = 1;
> +
> +		if (intf_count == 2) {
> +			topology.num_dsc = dpu_kms->catalog->dsc_count >= 4 ? 4 : 2;

This assumes that the driver can support 2:2:2. Is it the case?

> +			topology.num_lm = topology.num_dsc;
> +			topology.num_intf = 2;
> +		} else {
> +			topology.num_dsc = 2;
> +			topology.num_lm = 2;
> +			topology.num_intf = 1;
> +		}
>  	}
>  
>  	return topology;

-- 
With best wishes
Dmitry
