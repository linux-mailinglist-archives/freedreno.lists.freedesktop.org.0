Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E064B6FDF
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 16:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6595510E571;
	Tue, 15 Feb 2022 15:39:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FC510E571
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 15:39:24 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so23545858ooq.10
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 07:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ct2CVk6dUJW6dVZvAitEWHitS32Y2YFZk5FB7uFmIkA=;
 b=Wbr4Z8oY9Wk174KQbQfXQmjU3nl9K/c77mQlOg0xxlaCLv3PRvl8y/y7QDDJL6Iaat
 ci7Osr0N2e20RQt8UeGWh8V1AuyHVbloc6K+KMVFch0gxjQHUza+fdPka9LTZ1r7Eg3H
 v0JruiSEVTAeabclJQkoNVS3z4SNHOoneJ1zHfTomTA3rf5spL3GvW0bs/kkUqDGFRPD
 zG5d+lXwUwKj4cn+sRR6Qr1m1qnMOoRE/rLOu2cZGOt45fvBhp0eCrVK3N+vOtEXYjm9
 FhT8X1xshi+v5iWD0QZhmCY1RpddpiGi21Rdc1AmYeH4ndISxQvYBv/eKXC4F1AYAipX
 5XMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ct2CVk6dUJW6dVZvAitEWHitS32Y2YFZk5FB7uFmIkA=;
 b=dJDWaYh8NlwTZUiG1/wBZ5kYW2lVBlPdYbSGIxWnFuViOb4iCd+vCdVl7Cyc43MfAD
 yWwMJMPiNb5ziIL2OQud2q/lS+KLxRdfDJtEN8FRTigIMdMzBUEFvq/aaV1C1iCJf6Mw
 KOi9CoeG23Zq35Q2RZ9vtAwnKRoXR+azmBeMigpw9AcKWMElOxOi2labtRpXZtkrvoto
 9guEjR145pAy7r8rWWF3VQhwy8x6TT+5HhmPZm7Am6LJiHP/5lKsfHZnmUJrq4h1EB2V
 XYBYuVYVOQ0n7LUSwP8odIQMOdQrAHOX16yE+0TE1tBE9veXFrDzTfh3YtFNah0Ir8gx
 WTzA==
X-Gm-Message-State: AOAM5327eEL3ygdOTdPmNCuOeWpYNRgYBusjZd97d+hwDgeArS5gjubT
 bxyS+5gSM5f/Gq6W6zNL66bQsQ==
X-Google-Smtp-Source: ABdhPJx99EY0s2c9a0LXYT8GJQ4ktSsFxhDi1MKrSF0rWNSksyFko+sP7QeJGy50N9kHKTagjworsg==
X-Received: by 2002:a05:6870:1147:: with SMTP id
 7mr1556476oag.252.1644939564237; 
 Tue, 15 Feb 2022 07:39:24 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id y2sm11710607oao.10.2022.02.15.07.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:39:23 -0800 (PST)
Date: Tue, 15 Feb 2022 09:39:21 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YgvJKZxp/K8YKCHk@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 5/8] drm/msm/dpu: encoder: drop unused
 mode_fixup callback
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 15 Feb 08:16 CST 2022, Dmitry Baryshkov wrote:

> Both cmd and vid backends provide useless mode_fixup() callback. Drop
> it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  4 ----
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 10 ----------
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 --------------
>  4 files changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 480d02ccff8c..394916e8fe08 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -602,10 +602,6 @@ static int dpu_encoder_virt_atomic_check(
>  		if (phys->ops.atomic_check)
>  			ret = phys->ops.atomic_check(phys, crtc_state,
>  					conn_state);
> -		else if (phys->ops.mode_fixup)
> -			if (!phys->ops.mode_fixup(phys, mode, adj_mode))
> -				ret = -EINVAL;
> -
>  		if (ret) {
>  			DPU_ERROR_ENC(dpu_enc,
>  					"mode unsupported, phys idx %d\n", i);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..7b14948c4c87 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -84,7 +84,6 @@ struct dpu_encoder_virt_ops {
>   * @is_master:			Whether this phys_enc is the current master
>   *				encoder. Can be switched at enable time. Based
>   *				on split_role and current mode (CMD/VID).
> - * @mode_fixup:			DRM Call. Fixup a DRM mode.
>   * @mode_set:			DRM Call. Set a DRM mode.
>   *				This likely caches the mode, for use at enable.
>   * @enable:			DRM Call. Enable a DRM mode.
> @@ -117,9 +116,6 @@ struct dpu_encoder_phys_ops {
>  			struct dentry *debugfs_root);
>  	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>  	bool (*is_master)(struct dpu_encoder_phys *encoder);
> -	bool (*mode_fixup)(struct dpu_encoder_phys *encoder,
> -			const struct drm_display_mode *mode,
> -			struct drm_display_mode *adjusted_mode);
>  	void (*mode_set)(struct dpu_encoder_phys *encoder,
>  			struct drm_display_mode *mode,
>  			struct drm_display_mode *adjusted_mode);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 35071964d0f6..1796f83b47ae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -45,15 +45,6 @@ static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
>  	return (phys_enc->split_role != ENC_ROLE_SLAVE);
>  }
>  
> -static bool dpu_encoder_phys_cmd_mode_fixup(
> -		struct dpu_encoder_phys *phys_enc,
> -		const struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> -{
> -	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
> -	return true;
> -}
> -
>  static void _dpu_encoder_phys_cmd_update_intf_cfg(
>  		struct dpu_encoder_phys *phys_enc)
>  {
> @@ -756,7 +747,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>  	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>  	ops->is_master = dpu_encoder_phys_cmd_is_master;
>  	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
> -	ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
>  	ops->enable = dpu_encoder_phys_cmd_enable;
>  	ops->disable = dpu_encoder_phys_cmd_disable;
>  	ops->destroy = dpu_encoder_phys_cmd_destroy;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89cd456..1831fe37c88c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -225,19 +225,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
>  	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
>  }
>  
> -static bool dpu_encoder_phys_vid_mode_fixup(
> -		struct dpu_encoder_phys *phys_enc,
> -		const struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> -{
> -	DPU_DEBUG_VIDENC(phys_enc, "\n");
> -
> -	/*
> -	 * Modifying mode has consequences when the mode comes back to us
> -	 */
> -	return true;
> -}
> -
>  static void dpu_encoder_phys_vid_setup_timing_engine(
>  		struct dpu_encoder_phys *phys_enc)
>  {
> @@ -676,7 +663,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>  {
>  	ops->is_master = dpu_encoder_phys_vid_is_master;
>  	ops->mode_set = dpu_encoder_phys_vid_mode_set;
> -	ops->mode_fixup = dpu_encoder_phys_vid_mode_fixup;
>  	ops->enable = dpu_encoder_phys_vid_enable;
>  	ops->disable = dpu_encoder_phys_vid_disable;
>  	ops->destroy = dpu_encoder_phys_vid_destroy;
> -- 
> 2.34.1
> 
