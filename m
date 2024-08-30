Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C665F9667DC
	for <lists+freedreno@lfdr.de>; Fri, 30 Aug 2024 19:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1D110E0EC;
	Fri, 30 Aug 2024 17:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rk+CQz2r";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E7910EA9D
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 17:21:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53349ee42a9so2852678e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725038512; x=1725643312; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iKvLUae2xB3S1jTpjyPhws243myNsfzJ9gMn+BzbGFc=;
 b=Rk+CQz2rAn4U3D7pQ+zj19mJYcee5LNkzME+2U5iZ+A/TN6JGHElwMq57XyIofQZw4
 Dy7fjT6ImaokyxGl7m1rueBUNy/gW/3uOeT17aHvhjApOKkF+5KeKAPxmHlOzCjQPp/z
 0RJ2ppBy6JqskWQASjcFaD8/WTkt3daGYVINKTj4QLFqovADFTPD+eo85fFx5Z3gvKno
 cP1HdQ78LBZoVDHxz/r7EkpiAokh13MfzUamx8d78TPxBeReI0+r3CFmXwY4Pp+Jypfw
 08zYzqJno3ln8dJiqtfClEz4vRtLQEevwYP4JMPAQnr3CryAW+EdNsSCOh9QiFQur4ge
 9mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725038512; x=1725643312;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKvLUae2xB3S1jTpjyPhws243myNsfzJ9gMn+BzbGFc=;
 b=wk44LecMTz8SUCN6iSPDU6u+ZByC4Tdm4jdYmXX/Wo/OW5RP35+b/dBpQKhf45vW+v
 SqzxwWMrbzGKk6ydNJFNoCoxsTK73DII2z0AMvpxdu4eyafTfqxoUr1iremMaDn6/Yv8
 +V8CQFzNFMyBdGViNGgS8yGxuqLXVS2FjRDGL05c9+fJWGNRyoyrb6Xv6K1oiYvUYtGr
 K3u6iUixJ1PbJVmcrgjszkIMvUhDcMn0Yn/bzbokIqVkcJoER7/jcW+mk705k+pUj3uU
 pG+ErrI1Szh1RD6Bcnw1DfiZzBeb5GD6Pv2ilduXTl+ApXagd6p3EkWRDdLMMRyOmjML
 8ksg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6o3O9RBeDX9VqioWAW7bWp/+uGrh0wG6XkaecHfT0tYeLOik2wG5VNZkO+zMJiHU/yEzz6rv1MY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFNGS9Zn0J2ErI47BdUhGLaLD8dP8QXZwnrcA44yZ8xT0v9+/W
 NrBp2n2u97m0zCWzqiki+nwaIwR6wk8MoCKfteJcS0lDDzMZb8kWu9wUjmBmbuc=
X-Google-Smtp-Source: AGHT+IGQmODpu1GQhb9jQykvQPuBtYL1ZQZyZuIet71ZlcXlfEWqjUwFaVnHI4wGv7pyRo0vvIcGxg==
X-Received: by 2002:a05:6512:2804:b0:52c:d905:9645 with SMTP id
 2adb3069b0e04-53546b32d3dmr2187319e87.13.1725038511271; 
 Fri, 30 Aug 2024 10:21:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084edb6sm697900e87.283.2024.08.30.10.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:21:50 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:21:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 12/21] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <f5xu7qvlkcghu4lxwhwsihljjzvy33rte3dtskcqpo7dl75pk4@gehpioc43lue>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-12-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-12-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:33PM GMT, Jessica Zhang wrote:
> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> to account for concurrent writeback
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 11 +++++++++--
>  drivers/gpu/drm/msm/msm_drv.h            |  2 ++
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index bebae365c036..1b0cc899e8c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1176,6 +1176,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>  					    &crtc_state->adjusted_mode);
>  
> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> +
>  	/*
>  	 * Datapath topology selection
>  	 *
> @@ -1189,9 +1191,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
>  
> -	if (topology.num_intf == 2)
> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
> -	else if (topology.num_dsc == 2)
> +	else if (topology.num_dsc == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
>  	else if (dpu_kms->catalog->caps->has_3d_merge)
>  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 738e9a081b10..13f84375e15d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -384,8 +384,15 @@ static int _dpu_rm_reserve_ctls(
>  	int i = 0, j, num_ctls;
>  	bool needs_split_display;
>  
> -	/* each hw_intf needs its own hw_ctrl to program its control path */
> -	num_ctls = top->num_intf;
> +	/*
> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> +	 * control path. Since only one CWB session can run at a time, hardcode
> +	 * num_ctls to 1 if CWB is enabled

I don't think that havign one session is relevant here. Just specify
that we need to use a single CTL if CWB is in play.

> +	 */
> +	if (top->cwb_enabled)
> +		num_ctls = 1;
> +	else
> +		num_ctls = top->num_intf;
>  
>  	needs_split_display = _dpu_rm_needs_split_display(top);
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index be016d7b4ef1..315895937832 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -88,6 +89,7 @@ struct msm_display_topology {
>  	u32 num_dspp;
>  	u32 num_dsc;
>  	bool needs_cdm;
> +	bool cwb_enabled;
>  };
>  
>  /* Commit/Event thread specific structure */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
