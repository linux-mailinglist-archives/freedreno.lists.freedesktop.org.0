Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5AA4906B
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 05:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951C710EBF5;
	Fri, 28 Feb 2025 04:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L28HmBxs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10910EBF7
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 04:36:31 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5494cb8c2e7so530416e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 20:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740717390; x=1741322190; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tIRTgNdswGDhbNbRHETd6FrKEXOOj6YkPcm/rw/JxR8=;
 b=L28HmBxsSG1EwLV505TcacsaSFalniPPaiIiCSkuEbOzzpkNHWKS29snq/H1CuIP+5
 UtAEu35SUlF3OxRfi75Xs2p6ZsFr5CY2BLLEP3l7IetkYbn+MeytbaN5uGjlIXp+0BoW
 p62RNz0Ejv6/IPrkeYLfa064SIc+wbNN2QMmnVVwuyzkVo+k0iZ1CvopACfZNPCaBm6n
 eXEqq59SLyvFbXp6uM9KOseI6xAp7gWq3se4mDz9c1MjaQh2XucH5a7ni68Alr0BlarZ
 UA9jOBGrnCAESy8PIlZn9QgIjjt7rLjlmrgwOf0o5kUP94Xy+1PfCC4UIUwEbm/VHAPB
 ft4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740717390; x=1741322190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tIRTgNdswGDhbNbRHETd6FrKEXOOj6YkPcm/rw/JxR8=;
 b=QOD2AZpN4gZR7R5Q+OnjBBACPEan9Yb+416UdyGHVbD7Kseo3s72Nz6aYIw150fp6c
 TgcCiFUBgLcqWRxCn8Vj9Ilj5aH4ij4bf9k1wTRxXlAh5SgXKLpjJ+PgvsxRz7EAqY9F
 rPPOScIfidZAjeRKCYQE+xx7bEH0fhe9BaVpRfuVbZ0ZQ4qzJVxP1BAZ24/thNHMYGwW
 DbQJ+8RCJUzj3szLvGe8fD75qSbkHWH9wM+OMUkZ/X5Oq84JolOkUfEaLIrSNP5AucP5
 dpoTCXbkB14hQC2Go/WQNLk26lg9fsuW7JlYL716w2zMyVJm7KbSEVYwM3+XYIzHk+ef
 C8/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXErlZV1WXkzE7bb7fPNp7IpvN7OATPIDWWA3ls5+pioAd8tuy0pzU7NzTdfFFAVJgdO0Q5QgLrXRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBkYzwv3b1eiM4geuaz9mZkKVOkl+JbYsSgR7A6/hUqoLuhuyk
 +NxHULO75atjAwoYOEcwZSOzwtNyEURsZTdKmxekvh5y7WuPr3NQhReffCf9C8k=
X-Gm-Gg: ASbGncuofOmqi6Ny4Zm5xifi+yosqEoAbYcpGBxYtmRcPwkz2LkfQcbTqpZqcGFaVRK
 PMhpVYQhqnCHk9VbtHIGcP9fuge1v1L8pcHTjdLDzJADtg3h80cjIQRSpTGkDYZu5AeIfyLsEVX
 EbI85JuiV6OGY+ZwDDhSqqVHmgBDj1esDuRyW45FYbBL8pIVoVm5sOi4QQGiqbbRu+g0sWMspnj
 JncM0loXhbkAxcD6r8LAONyx2fYz1P61jcvuNNF6tX8ZBdunz8eT8keylWUZR5Ra0IvgVc8RS3L
 BFopRVAgFHnDiopwrOmq3ZPTeEVzm1ACmsbMW85CHF6V6W6OqvFe5QihhWxB8hhKiisC35ak3O7
 7v6UQig==
X-Google-Smtp-Source: AGHT+IGHdROVsAiv4I0ViQ1CiojRZcJgPBqIJ5QDNvWA3K8bpxYgEX8MrL0nwpc0aa81lDswmCSX0A==
X-Received: by 2002:a05:6512:281d:b0:545:2950:5361 with SMTP id
 2adb3069b0e04-5494c129f93mr754571e87.5.1740717389644; 
 Thu, 27 Feb 2025 20:36:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54951f50e37sm29273e87.38.2025.02.27.20.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:36:28 -0800 (PST)
Date: Fri, 28 Feb 2025 06:36:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/15] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <56fcpdrg6lonf7trasxurwpoausfv4lahtlggab7vcsxmxrnwz@jseugb2oidwt>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
 <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-12-8d5f5f426eb2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-12-8d5f5f426eb2@linaro.org>
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

On Wed, Feb 26, 2025 at 08:31:01PM +0800, Jun Nie wrote:
> Currently, only 2 pipes are used at most for a plane. A stage structure
> describes the configuration for a mixer pair. So only one stage is needed
> for current usage cases. The quad-pipe case will be added in future and 2
> stages are used in the case. So extend the stage to an array with array
> size STAGES_PER_PLANE and blend pipes per mixer pair with configuration
> in the stage structure.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 +-
>  2 files changed, 31 insertions(+), 17 deletions(-)
> 
> @@ -463,15 +463,24 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>  			bg_alpha_enable = true;
>  
> -		for (i = 0; i < PIPES_PER_PLANE; i++) {
> -			if (!pstate->pipe[i].sspp)
> -				continue;
> -			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> -			_dpu_crtc_blend_setup_pipe(crtc, plane,
> -						   mixer, cstate->num_mixers,
> -						   pstate->stage,
> -						   format, fb ? fb->modifier : 0,
> -						   &pstate->pipe[i], i, stage_cfg);
> +		/* loop pipe per mixer pair with config in stage structure */
> +		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
> +			head_pipe_in_stage = stage * PIPES_PER_STAGE;
> +			for (i = 0; i < PIPES_PER_STAGE; i++) {
> +				pipe_idx = i + head_pipe_in_stage;
> +				if (!pstate->pipe[pipe_idx].sspp)
> +					continue;

empty line

> +				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
> +						  PIPES_PER_STAGE);
> +				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
> +				_dpu_crtc_blend_setup_pipe(crtc, plane,
> +							   &mixer[head_pipe_in_stage],
> +							   lms_in_pair,
> +							   pstate->stage,
> +							   format, fb ? fb->modifier : 0,
> +							   &pstate->pipe[pipe_idx], i,
> +							   &stage_cfg[stage]);
> +			}
>  		}
>  
>  		/* blend config update */

[...]

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 5f010d36672cc6440c69779908b315aab285eaf0..74bf3ab9d6cfb8152b32d89a6c66e4d92d5cee1d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,8 +34,9 @@
>  #define DPU_MAX_PLANES			4
>  #endif
>  
> -#define PIPES_PER_PLANE			2
> +#define STAGES_PER_PLANE		1
>  #define PIPES_PER_STAGE			2
> +#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)

PLease move this to the previous patch.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  #ifndef DPU_MAX_DE_CURVES
>  #define DPU_MAX_DE_CURVES		3
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
