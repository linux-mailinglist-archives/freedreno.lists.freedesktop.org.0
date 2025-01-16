Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4551FA13482
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 09:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAFC10E910;
	Thu, 16 Jan 2025 08:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pnwILAVR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D2010E8E5
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 08:00:08 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3003e203acaso6146781fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 00:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014407; x=1737619207; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lgyf5JiYt/UCif8qeLhgiYqdVOVIbRTpmNxirzt3IWw=;
 b=pnwILAVRguGz+cTq1sbf0cZ559CNZsxgJZFJKFJwv+DTii3Z6zG0PZRog/nFCYRTUj
 bdvBMONfmwcys7q870NJ3DyiKvmGDcBR9NZ1E/tP0Vl+XaBV6waw8KwXjPa5n4ZZT9/a
 N5TSyDhO/VGHeVX9DROUF2ofnL9BM/HafqcMvq3zpG4UCNsb85KYaV7XD3VNRrmiHJ9z
 t3LJkpfF+YS3F4W7yM35POO5dZKHVzzSxBufalEYl5lIA6zFk18wHnxDaAqJqpqb43oh
 wfmxs2eCLsavYv3tLqVl65LxB5tSSR3Upix6xJuLls+AQBkSCnieS1YcvxfxZ7TOJTHt
 moyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014407; x=1737619207;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lgyf5JiYt/UCif8qeLhgiYqdVOVIbRTpmNxirzt3IWw=;
 b=J1ip6Jv+T/KefSxEXLV4TsiwYhLMyptyHiI77KN/HmmRNjzgE9hmuNpwtkKhqLvuyY
 CcxBwwASxz5SMyBiS8N/NwKV2JFkszM7mgdkPPNeBuw8U7X0dGO8y14t/mrkxDr9lYXZ
 a/29a1pWp/c5FaaOl2i1JSWslsnIJe/WK1cTZmqcOgnR4bAqGt4QNLMjwtgHmsDNBYH6
 1DWunFTjrV5XvF6gANiwotTXV33EcDUP+4A/UJ/TeuyV26s8ImJIwJVJfU33pnMT2iCC
 zAERTJSGUSGQt7ACI+SDcEsDWkQUjf0rK1Z2kkKbzBljmZTzSlE62cdBg5NY7pXmIWgj
 a7Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDVc79FdPQZM4IAp6Cb2sGVK7PYn0fb0rqabDvU7+1uN7Il1zo2gChlGZgBThEZm/+AwtM730Hom0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTDHECu85Wr+8u6dmP9ku31dYo7/PDTekSvjujexsIJZGk2K/C
 iVjJ4wyshyH1MFcRtn3GjXt3rPs3oWxgQC329q0hNl/hoR/QSP0WX5KCJhbDQR4=
X-Gm-Gg: ASbGncuIcJcn7G27WptklwJmp/Rk2ogJfxp/xCEs1tQGzCFqXaVs2n5KDXbzJypkJBC
 Ut4c+YgaVOIpkNdJfV7s2lLwmdYtbjBrtHYqR47o11FqoduZhReUSy2y/VROX6189oiIRMoqK4O
 gGhpfV2weP+AKkH6Qbx/P4jUysIUbnosCy3lz+eDLdmbQ1shrjpkRJKgGVEYXUnzvUonEIAR8yG
 0Hg9/oV6P9qJCX22ANcQW+F9vfzpQlG1kukAtEAmQfS9yUSTGadzQHueGNMZprxjbuRdWC2KvKE
 CF09VuzupN0h3EW9B/SOvks4SjCpNrWbZOqb
X-Google-Smtp-Source: AGHT+IFOaFHKG3vmAlVkEzYZ24zEYUc38XEeNvhDkvKm3dmyy/fhphY/O3DbCvmhPom0YOhbVNmABQ==
X-Received: by 2002:a2e:bea3:0:b0:300:1dbd:b252 with SMTP id
 38308e7fff4ca-305f459a2aamr103241301fa.7.1737014406705; 
 Thu, 16 Jan 2025 00:00:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78c5sm24065041fa.93.2025.01.16.00.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:00:05 -0800 (PST)
Date: Thu, 16 Jan 2025 10:00:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
Message-ID: <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> Store pipes in array with removing dedicated r_pipe. There are
> 2 pipes in a drm plane at most currently, while 4 pipes are
> required for quad-pipe case. Generalize the handling to pipe pair
> and ease handling to another pipe pair later.

With the first sentence being moved to the end of the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor issues below, please address them in the next version.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
>  3 files changed, 112 insertions(+), 102 deletions(-)

> @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> +	/* move the assignment here, to ease handling to another pairs later */

Is it a TODO comment? It reads like an order.

> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
>  	/* state->src is 16.16, src_rect is not */
>  	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
>  

> @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>  {
>  	struct drm_plane_state *state = plane->state;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	struct dpu_sw_pipe *pipe;
> +	int i;
>  
> -	trace_dpu_plane_disable(DRMID(plane), false,
> -				pstate->pipe.multirect_mode);
> +	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> +		pipe = &pstate->pipe[i];
> +		if (!pipe->sspp)
> +			continue;
>  
> -	if (r_pipe->sspp) {
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		trace_dpu_plane_disable(DRMID(plane), false,
> +					pstate->pipe[i].multirect_mode);
>  
> -		if (r_pipe->sspp->ops.setup_multirect)
> -			r_pipe->sspp->ops.setup_multirect(r_pipe);
> +		/*
> +		 * clear multirect for the right pipe so that the SSPP
> +		 * can be further reused in the solo mode
> +		 */
> +		if (pipe->sspp && i == 1) {

Wouldn't it be better to `&& i % 2 != 0`? Then, I think, this condition
can stay even in quad-pipe case.

> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +			if (pipe->sspp->ops.setup_multirect)
> +				pipe->sspp->ops.setup_multirect(pipe);
> +		}
>  	}
>  
>  	pstate->pending = true;

-- 
With best wishes
Dmitry
