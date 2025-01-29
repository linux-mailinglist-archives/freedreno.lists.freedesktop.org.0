Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDAA22613
	for <lists+freedreno@lfdr.de>; Wed, 29 Jan 2025 23:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086FE10E8C7;
	Wed, 29 Jan 2025 22:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P8ijQkKd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2A710E8C5
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 22:07:42 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so128299e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 14:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738188460; x=1738793260; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w8b9LinkIXkdHYsmqasFCr8qLnSUCnJw2wVia4tFFuo=;
 b=P8ijQkKdIgGhSI2aR3cbEHnT7LTpr5NlXPlr00rY3PdVyslnPynbUrvQXpohhq1V8A
 Xs+iCCl/oS0mBiACnUhAJc9kfX4E8qMrWRTgOvUKdhNVCQJp0e3UoHtk8Tprgj3C7IUt
 gEsikM64XvLUOvubIDVO79S4/9ZwLg3re/eheIkI7d3tqZ0IXJyTnm2TyoVs1jO+Yczj
 R+IUGnUfWBTMnsRO/kRhqPm8BwgqjhR8kkjCknGkp+/MGlomXCfZwiFAGOGSejzDKcuy
 i8A3cWd7jZMfOPpZjShna3Ddye9iuvdf6AcIG/vtYNsk+MUjNfYkfrSvOAOF8jc/rAKo
 rsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738188460; x=1738793260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8b9LinkIXkdHYsmqasFCr8qLnSUCnJw2wVia4tFFuo=;
 b=jLw6IxWPh6FyDEX6Xj+DzeNJvBIJf3LENEFLkH/1gawFw2URzTWHZXQtnnWBoe8tf5
 CBUUc8jyfjgtLA/A2ihhbVwqoaE7shH+hHXE4rBRFQFAEO51n4qF3RBtq/JuccWe7ASU
 3NxyORVM4Dxi2DVR6R9gupw5Zmk1YbPuqXGsk+uQkTTRAf915ZDCAchhhFbm3pJAWypZ
 paFZVMP7K85rBsbonJXxMAKO2ydfhKy91EKdY2UpJILfa1o0XtcuJ+oIOerBt13Kau8D
 pWnqO23ulcKwG/nkfQ7a0adF4C07XortJlTDnt6z+PjKJTyu9m+V1YrjMWnp/Rc1Uotd
 +ghg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4OAcbO8+NtjPhDpmm96ujOc7Sva5nXxj/WPcIjH+E/sIFNcUJ+t2xdCnSd9FxZyGTW6NeDCtTUDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrBf6ZhnSja7iAQsLr2rqUTCXVHjJt51X9zPheJa4BuQioOlsZ
 d7HcPTrr1qo/jEMpPdr5EMHXmi7XDjtut0HZmOAv1jxLlRla2vzFvnVv4CfVU3Y=
X-Gm-Gg: ASbGncsjDjhpmGn0Ei3qv+ya+OQQ2txkN4ZKerkz3fvtIr9y+pcYj6Uab3/0IrG9gAg
 M+ImBqFM+QjREStLMtDuJHs0M/X0PNQJMK7n5U5QWLv+f5LEPO4vAbtgqc+CzVni55j9hGXMgHq
 jZv7sxxqMbSFTXZzyqit+hegu8m8Ov5tJyF1QFPJd7WI0qX9PgdypeHY9LXwGUK4xIpR3MU+Uyq
 64CB0umKD65ex6PooKXPdhQWlOYG0UTGHLf+01vJ6PFO84qa46J/lUVUeXiDm9cG43F4t7jP9ff
 r+36TZEOiOBQCxHdzmqKbuG3uPrrYJGc0RjuH4ZIDDT4Wfanau/8EWRwT35s3g5ngUDwjLM=
X-Google-Smtp-Source: AGHT+IGU58t9XSUJxpA7hMdaRg2MqAeK33LGZgrgQVW4xaH8bZpNt4BF9puhCwLIYjLLNRPDcZjUUA==
X-Received: by 2002:a05:6512:1114:b0:541:d287:a53b with SMTP id
 2adb3069b0e04-543e4beac2amr1757535e87.19.1738188460355; 
 Wed, 29 Jan 2025 14:07:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8379979sm2097867e87.179.2025.01.29.14.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 14:07:39 -0800 (PST)
Date: Thu, 30 Jan 2025 00:07:37 +0200
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
Subject: Re: [PATCH v5 06/14] drm/msm/dpu: Fail atomic_check if multiple
 outputs request CDM block
Message-ID: <yxvmnrpa7r55n6l3jf5wpkikd5iqtwjm5n56mqnxw65nboi5js@svaj72pzsevn>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-6-6464ca5360df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-concurrent-wb-v5-6-6464ca5360df@quicinc.com>
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

On Tue, Jan 28, 2025 at 07:20:38PM -0800, Jessica Zhang wrote:
> Currently, our hardware only supports a single output using CDM block at
> most. Because of this, we cannot support cases where both writeback and DP
> output request CDM simultaneously
> 
> To avoid this happening when CWB is enabled, change
> msm_display_topoloy.needs_cdm into a cdm_requested counter to track how
> many outputs are requesting CDM block. Return EINVAL if multiple outputs
> are trying to reserve CDM.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
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
> index bd6fef8eb8f267cde4ebe1155be39ce69e786967..99db194f5d095e83ac72f2830814e649a25918ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -692,10 +692,10 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>  		fb = conn_state->writeback_job->fb;
>  
>  		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> -			topology->needs_cdm = true;
> +			topology->cdm_requested++;
>  	} else if (disp_info->intf_type == INTF_DP) {
>  		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> -			topology->needs_cdm = true;
> +			topology->cdm_requested++;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 0fbb92021b184c4792ddfe059e98b3acf7bc7cc6..dca3107d1e8265a864ac62d6b845d6cb966965ed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -585,7 +585,8 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>  
>  static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  			       struct dpu_global_state *global_state,
> -			       uint32_t crtc_id)
> +			       uint32_t crtc_id,
> +			       const struct msm_display_topology *top)

I think it's enough to pass num_cdm.

>  {
>  	/* try allocating only one CDM block */
>  	if (!rm->cdm_blk) {
> @@ -593,6 +594,11 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  		return -EIO;
>  	}
>  
> +	if (top->cdm_requested > 1) {
> +		DPU_ERROR("More than 1 INTF requesting CDM\n");
> +		return -EINVAL;
> +	}
> +
>  	if (global_state->cdm_to_crtc_id) {
>  		DPU_ERROR("CDM_0 is already allocated\n");
>  		return -EIO;
> @@ -629,8 +635,8 @@ static int _dpu_rm_make_reservation(
>  	if (ret)
>  		return ret;
>  
> -	if (topology->needs_cdm) {
> -		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id);
> +	if (topology->cdm_requested > 0) {
> +		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id, topology);
>  		if (ret) {
>  			DPU_ERROR("unable to find CDM blk\n");
>  			return ret;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index b854e42d319d2c482e4e1732239754979f6950dd..7716c226cd7a270a1bac052dc085f5ed84cb9c26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -51,7 +51,8 @@ struct dpu_rm_sspp_requirements {
>   * @num_intf:     number of interfaces the panel is mounted on
>   * @num_dspp:     number of dspp blocks used
>   * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> - * @needs_cdm:    indicates whether cdm block is needed for this display topology
> + * @cdm_requested:    indicates how many outputs are requesting cdm block for
> + *                    this display topology
>   * @cwb_enabled:  indicates whether CWB is enabled for this display topology
>   */
>  struct msm_display_topology {
> @@ -59,7 +60,7 @@ struct msm_display_topology {
>  	u32 num_intf;
>  	u32 num_dspp;
>  	u32 num_dsc;
> -	bool needs_cdm;
> +	int cdm_requested;

u32 num_cdm, please.

>  	bool cwb_enabled;
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
