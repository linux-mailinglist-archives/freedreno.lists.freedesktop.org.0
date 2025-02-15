Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D7A36F17
	for <lists+freedreno@lfdr.de>; Sat, 15 Feb 2025 16:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8744610E0AC;
	Sat, 15 Feb 2025 15:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HztlpRaL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED8D10E0AC
 for <freedreno@lists.freedesktop.org>; Sat, 15 Feb 2025 15:26:21 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-307c13298eeso30300371fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 15 Feb 2025 07:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739633180; x=1740237980; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lyhHNrVNorAeI2lBG6ZlhdNRJfwPg8zvhZHfhDTm/Fo=;
 b=HztlpRaLEAYt39uaBGb5J5wpoo16vCyK26i8Keon2KmUtgFXNxC9NzOsqQ1figEZ9r
 Y5JPRZ0mwzAmtFxhO3lktGPL3aQExHeV2FZp3xmOuTHHWy1jdr7Yt5wyB6WIWWJF61/f
 MnK6Z2UJa5+ZIehR4sB5Rb6DAlXf+OlUM1RMrMg9Ub7VKkzjIYzTi5Dj34jXOP5tTsfd
 ncLjcQuJEg9/WDtwbZimYxIlAIuLMMuaJZ7QRo4NVZYRfDzBoCPdxvSQfTSmlrAqUT00
 81sUj2aOQ43p6gr5Tff7ZQidaWLjq2mkycTC8DgidoCCwY/LNsGBdbE8nu3I1+rSY+mh
 cVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739633180; x=1740237980;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lyhHNrVNorAeI2lBG6ZlhdNRJfwPg8zvhZHfhDTm/Fo=;
 b=wBrt5tlZStP6UDzYAu7sGTZyIM9Hue0Qu5iivn7806hlyqNCUdsQF7LLoSQlN8QiON
 vz5kTBdohqdlxnmcazRDqKtrGKHMVBQbpYjvap/peSKHcmpcJUl99Amaz37Otsq4jswQ
 v0O99XXC9VEG9sR9otg8jOR2xlBO+jTG+iQu+r/J6ZgcNeIH/rAzpvPZWLjAbBZTF+9t
 cJJP3HFbKsVlNyUEqsx4Y1Xbiuy+LDiffQ730rgraHKv5R6iLDt387YpNqv+sdCtzL83
 GkIJvWTG/WfBnwmpyGEqv13o9hFmM+AOiULNZaY8SI8NaLJ421noL/Gu50uk7D6XQL0R
 Nrxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQuQdzl+4YTnBZIEMc6+SwHTlaHvMXOyL44Khukcn9oqLsHgtgI9n61a2r5uUd8g0lTnYJP+CV/n8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDP1sfayl6ZWqqTtQNflr5W9+8lzzI8aHfONeC5zKO0KDES12/
 zj4MWqGjTQdNdyzh8s/YkxTHwCpILkykMRxSXX9SA4I2xAqlCwjVaTwBNOSpN64=
X-Gm-Gg: ASbGncuaQHVkDY1FbK7WtQ7bag+X+8xZUprEdVoM3f1fGinMCjshTsBGCzc4SCx9xjJ
 0Ez5ljaEnGnHEpXvr3DjvkD2XwHQLJxLQUdH1DdMmZ0VLI5sSPl0Va5+Qw4k1sLbgVBCG3446a0
 EF/sSnfIYTVZ9elxnYXQXieeJZaPgpPIoYSUn97HcYk5QyiysXptu/asB0hbSIh+HZwrAMgkpXG
 3ccvluiAyyNT5hqaBP39q4q3N781HuX9D55HLKPcrAf1tkdjGSl0sFHMuNWPaG0dZ6F0FVwtjsG
 NSMhARd9Y9AaFYxBN3s8vme5Ii4i3cS+JGo2bhUUITKOgqD++/IUzO3VasUygyXVSyHeUxo=
X-Google-Smtp-Source: AGHT+IHt5pLz1i1krdr/WS2YKInJnYFY0Hb8ZilJLpstOl1Z5M61lz+xkuBcGZbV8SgcJDj6fbYbgw==
X-Received: by 2002:a2e:910e:0:b0:309:2187:2cd9 with SMTP id
 38308e7fff4ca-309288c9a73mr10705571fa.7.1739633179478; 
 Sat, 15 Feb 2025 07:26:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309cec7e45asm914511fa.105.2025.02.15.07.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 07:26:18 -0800 (PST)
Date: Sat, 15 Feb 2025 17:26:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 06/14] drm/msm/dpu: Fail atomic_check if multiple
 outputs request CDM block
Message-ID: <wfhusui6qv6c4knns7ux6z7qnehzokoa6bj2ufanlnlkqpnvkj@qykctcbwizdn>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-6-a44c293cf422@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-concurrent-wb-v6-6-a44c293cf422@quicinc.com>
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

On Fri, Feb 14, 2025 at 04:14:29PM -0800, Jessica Zhang wrote:
> Currently, our hardware only supports a single output using CDM block at
> most. Because of this, we cannot support cases where both writeback and DP
> output request CDM simultaneously
> 
> To avoid this happening when CWB is enabled, change
> msm_display_topoloy.needs_cdm into a num_cdm counter to track how many
> outputs are requesting CDM block. Return EINVAL if multiple outputs are
> trying to reserve CDM.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v6:
> - cdm_requested -> num_cdm
> 
> Changes in v5:
> - Changed check to fail only if multiple outputs are requesting CDM
>   simultaneously
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 12 +++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  5 +++--
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ad969a5b9434..0e4f27da9534 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -692,10 +692,10 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>  		fb = conn_state->writeback_job->fb;
>  
>  		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> -			topology->needs_cdm = true;
> +			topology->num_cdm++;
>  	} else if (disp_info->intf_type == INTF_DP) {
>  		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> -			topology->needs_cdm = true;
> +			topology->num_cdm++;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 0fbb92021b18..4da2e47265d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -585,7 +585,8 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>  
>  static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  			       struct dpu_global_state *global_state,
> -			       uint32_t crtc_id)
> +			       uint32_t crtc_id,
> +			       int num_cdm)
>  {
>  	/* try allocating only one CDM block */
>  	if (!rm->cdm_blk) {
> @@ -593,6 +594,11 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  		return -EIO;
>  	}
>  
> +	if (num_cdm > 1) {
> +		DPU_ERROR("More than 1 INTF requesting CDM\n");

I think we should downgrade those to DPU_DEBUG or something like that,
but that can go separately, or when picking the patch up.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +		return -EINVAL;
> +	}
> +
>  	if (global_state->cdm_to_crtc_id) {
>  		DPU_ERROR("CDM_0 is already allocated\n");
>  		return -EIO;
-- 
With best wishes
Dmitry
