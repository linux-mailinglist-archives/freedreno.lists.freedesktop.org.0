Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39DA22618
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2025 23:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB02A10E18E;
	Wed, 29 Jan 2025 22:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NPZ4ZNkX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A1F10E18E
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 22:11:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so91994e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 14:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738188676; x=1738793476; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nXpSGmZqdrxR2mf+Cq+PPVpjoF74+fYp1Gw0/gpocpU=;
 b=NPZ4ZNkX+UiPJRGRSU/wij4uClgqQeiK69MuPxJBawdTNAth1PowEuOBbem66b57qW
 KJA9dwbbDxhms5iAsk/jbR3zQ0Y07aX+plAtm0nyw4II1oW7MmQgB8ONz7+a+IrvjERI
 64rmRDWP56vbC7C+VDB51gQLyXF0H2P1IGgRedbZ/C7Wl5Dsm7Ly1M67uyIS9k5jvwek
 6gV4ahDMAny5dYblSODRUzuzpGGlpKnZRMzxK9nD9B36B5bN1uD2I7ISYrao6pKknPSd
 Soo+D9/TDxxscszQi2tM2mGBL1TOXQyQI2qraKqmn2lLn5gbKSli3+5/zwmmm9XBQStp
 wacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738188676; x=1738793476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXpSGmZqdrxR2mf+Cq+PPVpjoF74+fYp1Gw0/gpocpU=;
 b=Ml1vQS8+2CnsnZD8FVo8TeASH0hjlGNf3DgN0i6SDe+9Bvm7cNsTrKeVlO2TLBGp9h
 eH8j10zI54UfW52+epCFYMc0wefr3qHBgKUJQIfAR0BkadolMHydlB0hdvpN0AQtXy1B
 oixu8Lj6HlTJzR4KzRXV6L1wj0B4A4dA30PXieDjG8lWzF1DdCkMqziF9NxbPC058jus
 rM8OV9hxELqOhJqzyV5HQjTmDN9gDOFkPsqdjSmbZUfnmPTMYc1C+bl/GQ/kpLWi9K3E
 q8zVK97nVmg4QPI920HXhWhuCrbZ2X0Ek0weDzN1Vzmz8gVNh/V1hbt3rfyOc1lmrBcr
 QEKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNKYNDsLt+ndhuYH/ibHgOMWQao3gIvHMYFrFqLh3V6jcbNycIXya1h/azH3XYdv+kszIgoJQo0+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfZOiPiWWykiPXSHEIsJ4WHItHQH0GRqnAQGPSNn9BIgxyIWfQ
 RgYzkPZrIPLuin1fpUcgD16uPOo+cpDdVyUP2aYvj6MMXHHvberO5GZpcWWNM44=
X-Gm-Gg: ASbGncsBoR951mwcVWJXEeC8qVoio0GHcPrPi9x9aMQW8FWIGo9qAsDik3QnUNX5964
 qp1GF6yS7Xtyfc1HrLum4BbeO9ug7umCsXFS4Y9auGl6YeVC8HCKfAixFLlT1LhI011PZz4Hpkd
 r4zx4NQMB7g77dLKXuJAsztXfMN/+TPPmhArP1SU9iQDMOAH+54erJLrYMPhATKwCvzkkdIFl28
 xe2gBdG7jBPlxFOvFebIdc4+No0c8xTVUdYWw4+q/v6hwxscf5C4vKqvoKxjdkzx4Z4ZxuiCzhD
 +zpiGvDveSy4n0o2hlwigT9oGm36/bNKJdT2PRonRhWiAYI/QldvOuXao8JifAGWIWkGXGo=
X-Google-Smtp-Source: AGHT+IGdOAEDAizJGYIO55hx/Yk1UUb1jz3aFRH4OQMGFpi3NzygJafXnmgMg2GQRCq3ATNZ+g9kUQ==
X-Received: by 2002:a05:6512:2809:b0:542:8ca5:8248 with SMTP id
 2adb3069b0e04-543ea3c8993mr274727e87.8.1738188675518; 
 Wed, 29 Jan 2025 14:11:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c822f8cdsm2109505e87.78.2025.01.29.14.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 14:11:14 -0800 (PST)
Date: Thu, 30 Jan 2025 00:11:11 +0200
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
Subject: Re: [PATCH v5 07/14] drm/msm/dpu: Reserve resources for CWB
Message-ID: <2cc6pp6okhanqv5ndzm32aomgbhidgmvukc4lptrapgpl4utp4@gornklf5hhzp>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-7-6464ca5360df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-concurrent-wb-v5-7-6464ca5360df@quicinc.com>
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

On Tue, Jan 28, 2025 at 07:20:39PM -0800, Jessica Zhang wrote:
> Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> 
> For concurrent writeback, even-indexed CWB muxes must be assigned to
> even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> even/odd rule applies for dedicated CWB PINGPONGs.
> 
> Track the CWB muxes in the global state and add a CWB-specific helper to
> reserve the correct CWB muxes and dedicated PINGPONGs following the
> even/odd rule.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> ---
> Changes in v5:
> - Allocate CWB muxes first then allocate PINGPONG block based on CWB mux
>   index
> - Corrected comment doc on odd/even rule
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 82 +++++++++++++++++++++++++++++
>  4 files changed, 115 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 99db194f5d095e83ac72f2830814e649a25918ef..17bd9762f56a392e8e9e8d7c897dcb6e06bccbb3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 Red Hat
>   * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   *
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
> @@ -28,6 +28,7 @@
>  #include "dpu_hw_dsc.h"
>  #include "dpu_hw_merge3d.h"
>  #include "dpu_hw_cdm.h"
> +#include "dpu_hw_cwb.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
> @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
>   * @cur_slave:		As above but for the slave encoder.
>   * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>   *			pingpong blocks can be different than num_phys_encs.
> + * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
> + *			display. Number of CWB muxes can be different than
> + *			num_phys_encs.
>   * @hw_dsc:		Handle to the DSC blocks used for the display.
>   * @dsc_mask:		Bitmask of used DSC blocks.
>   * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
>  	struct dpu_encoder_phys *cur_master;
>  	struct dpu_encoder_phys *cur_slave;
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>  
>  	unsigned int dsc_mask;
> @@ -1137,7 +1142,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
>  	int num_ctl, num_pp, num_dsc;
> +	int num_cwb = 0;
> +	bool is_cwb_encoder;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1151,6 +1159,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  
>  	priv = drm_enc->dev->dev_private;
>  	dpu_kms = to_dpu_kms(priv->kms);
> +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> +			dpu_enc->disp_info.intf_type == INTF_WB;
>  
>  	global_state = dpu_kms_get_existing_global_state(dpu_kms);
>  	if (IS_ERR_OR_NULL(global_state)) {
> @@ -1161,9 +1171,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	trace_dpu_enc_mode_set(DRMID(drm_enc));
>  
>  	/* Query resource that have been reserved in atomic check step. */
> -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> -		ARRAY_SIZE(hw_pp));
> +	if (is_cwb_encoder) {
> +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						       drm_enc->crtc,
> +						       DPU_HW_BLK_DCWB_PINGPONG,
> +						       hw_pp, ARRAY_SIZE(hw_pp));
> +		num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						       drm_enc->crtc,
> +						       DPU_HW_BLK_CWB,
> +						       hw_cwb, ARRAY_SIZE(hw_cwb));
> +	} else {
> +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						       drm_enc->crtc,
> +						       DPU_HW_BLK_PINGPONG, hw_pp,
> +						       ARRAY_SIZE(hw_pp));
> +	}
> +
> +	for (i = 0; i < num_cwb; i++)
> +		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> +
>  	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
>  	DPU_HW_BLK_LM,
>  	DPU_HW_BLK_CTL,
>  	DPU_HW_BLK_PINGPONG,
> +	DPU_HW_BLK_DCWB_PINGPONG,
>  	DPU_HW_BLK_INTF,
>  	DPU_HW_BLK_WB,
>  	DPU_HW_BLK_DSPP,
>  	DPU_HW_BLK_MERGE_3D,
>  	DPU_HW_BLK_DSC,
>  	DPU_HW_BLK_CDM,
> +	DPU_HW_BLK_CWB,
>  	DPU_HW_BLK_MAX,
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 54ef6cfa2485a8a3886bd26b7ec3692d037dc35e..a57ec2ec106083e8f93578e4307e8b13ae549c08 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -132,6 +132,7 @@ struct dpu_global_state {
>  	uint32_t cdm_to_crtc_id;
>  
>  	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
> +	uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
>  };
>  
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index dca3107d1e8265a864ac62d6b845d6cb966965ed..2d5cf97a75913d51b2568ce85ec0c79a4a34deb4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -233,6 +233,54 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>  	return -EINVAL;
>  }
>  
> +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
> +						 struct dpu_global_state *global_state,
> +						 uint32_t crtc_id,
> +						 struct msm_display_topology *topology)
> +{
> +	int num_cwb_mux = topology->num_lm, cwb_mux_count = 0;
> +	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
> +	int cwb_pp_idx[MAX_BLOCKS];
> +	int cwb_mux_idx[MAX_BLOCKS];
> +
> +	/*
> +	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
> +	 * mixer
> +	 *
> +	 * TODO: add support reserving resources for platforms with no
> +	 *       PINGPONG_CWB
> +	 */
> +	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> +	     cwb_mux_count < num_cwb_mux; i++) {
> +		for (int j = 0; j < ARRAY_SIZE(rm->cwb_blks); j++) {
> +			/*
> +			 * Odd LMs must be assigned to odd CWB muxes and even
> +			 * LMs with even CWB muxes
> +			 */
> +			if (reserved_by_other(global_state->cwb_to_crtc_id, j, crtc_id) ||
> +			    i % 2 != j % 2)

Should't it be a loop over allocated LMs with the check that
lm[i]->idx % 2 != j % 2 ?
Otherwise you are looping over some random LMs and trying to match CWB
indices against them.

> +				continue;
> +
> +			cwb_mux_idx[cwb_mux_count] = j;
> +			cwb_pp_idx[cwb_mux_count] = j + cwb_pp_start_idx;
> +			cwb_mux_count++;
> +			break;
> +		}
> +	}
> +
> +	if (cwb_mux_count != num_cwb_mux) {
> +		DPU_ERROR("Unable to reserve all CWB PINGPONGs\n");
> +		return -ENAVAIL;
> +	}
> +
> +	for (int i = 0; i < cwb_mux_count; i++) {
> +		global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
> +		global_state->cwb_to_crtc_id[cwb_mux_idx[i]] = crtc_id;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
>   *	proposed use case requirements, incl. hardwired dependent blocks like
> @@ -623,6 +671,12 @@ static int _dpu_rm_make_reservation(
>  		return ret;
>  	}
>  
> +	if (topology->cwb_enabled) {
> +		ret = _dpu_rm_reserve_cwb_mux_and_pingpongs(rm, global_state,
> +							    crtc_id, topology);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
>  			topology);
> @@ -680,6 +734,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>  	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
>  			ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
>  	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
> +	_dpu_rm_clear_mapping(global_state->cwb_to_crtc_id,
> +			ARRAY_SIZE(global_state->cwb_to_crtc_id), crtc_id);
>  }
>  
>  /**
> @@ -824,6 +880,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  
>  	switch (type) {
>  	case DPU_HW_BLK_PINGPONG:
> +	case DPU_HW_BLK_DCWB_PINGPONG:
>  		hw_blks = rm->pingpong_blks;
>  		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
>  		max_blks = ARRAY_SIZE(rm->pingpong_blks);
> @@ -853,6 +910,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  		hw_to_crtc_id = &global_state->cdm_to_crtc_id;
>  		max_blks = 1;
>  		break;
> +	case DPU_HW_BLK_CWB:
> +		hw_blks = rm->cwb_blks;
> +		hw_to_crtc_id = global_state->cwb_to_crtc_id;
> +		max_blks = ARRAY_SIZE(rm->cwb_blks);
> +		break;
>  	default:
>  		DPU_ERROR("blk type %d not managed by rm\n", type);
>  		return 0;
> @@ -863,6 +925,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  		if (hw_to_crtc_id[i] != crtc_id)
>  			continue;
>  
> +		if (type == DPU_HW_BLK_PINGPONG) {
> +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> +
> +			if (pp->idx >= PINGPONG_CWB_0)
> +				continue;
> +		}
> +
> +		if (type == DPU_HW_BLK_DCWB_PINGPONG) {
> +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> +
> +			if (pp->idx < PINGPONG_CWB_0)
> +				continue;
> +		}
> +
>  		if (num_blks == blks_size) {
>  			DPU_ERROR("More than %d resources assigned to crtc %d\n",
>  				  blks_size, crtc_id);
> @@ -945,4 +1021,10 @@ void dpu_rm_print_state(struct drm_printer *p,
>  		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
>  					  global_state->sspp_to_crtc_id[i]);
>  	drm_puts(p, "\n");
> +
> +	drm_puts(p, "\tcwb=");
> +	for (i = 0; i < ARRAY_SIZE(global_state->cwb_to_crtc_id); i++)
> +		dpu_rm_print_state_helper(p, rm->cwb_blks[i],
> +					  global_state->cwb_to_crtc_id[i]);
> +	drm_puts(p, "\n");
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
