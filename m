Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4703D4B56
	for <lists+freedreno@lfdr.de>; Sun, 25 Jul 2021 06:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28CB737F2;
	Sun, 25 Jul 2021 04:06:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFBD737F2
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jul 2021 04:06:10 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 19-20020a9d08930000b02904b98d90c82cso6437115otf.5
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jul 2021 21:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BQy51dmcCPfskpFReMMd+iY0APHtV+mJ8PmnMSgL0Sc=;
 b=VjkzUfEZF33VWY3hAWXdwvjVkalQ4+qGnr5LB41s+9NpLxRjpgZEpGhjxmDN+gVcBc
 KaVhdLR4t+jmd2hyXALG9UpGzkTWuPByPoLCV2WU/JJH93OMX9vzKu9oXshXSgLXxtuU
 nfahrK1XqDJecyJU56OBzeOWfpIbjPgHVTVWORYkftcIYnwTXW4++Xxgi1UtETrHH93F
 h5VWcg5xBCaCfmc+Y6VGcBBM4QIDssA7saZluEzK3xVFrAn8Kab6XuX0X02kO0Mg0bFo
 p9n6qtAZgDf7JFqfqQTu+ASoVxM3mLC/AS1KkvqdqkEVPkES1Np5Jw6xA5fy7C2tBJPp
 dDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BQy51dmcCPfskpFReMMd+iY0APHtV+mJ8PmnMSgL0Sc=;
 b=lozlEvqvy7xjkoEg9cxC4HJtgXGPLv2Nq/rIeQIqcjZFYQes+1NJQ55uivPG+Fh/MB
 inE/qIBtGaqFLBGycdhiiAQiqVGwD2SmkOopHA3C5GdLe2f8K2+tW9FifqmV9vU5kfYo
 bEPljVwx9dfjVHWBP/o+8ycpUeAgESI3/jPwuH8KaVRpuMp1vxprfFUoIt+HY+sScZHX
 no53HXV7udTOBqpBxhcDmB6rlZgkCxjJB4Q/zR59VeKsidrkBmBTpvZZU9RGAddaw4uT
 v51z5gD1fTYlITaLRxKPsSs8+LkQRqBd4ePQ/LItb8pdmDH5qg4A4HE8hBtbT+5+ESJh
 2faw==
X-Gm-Message-State: AOAM5310DfsizN4GwIlyukWU6GaLeiLWOtQOAMNg0XNTJcLpd2BCcrm8
 BOlg3mE2YrpXJaLmI4BkH8wY1A==
X-Google-Smtp-Source: ABdhPJyMs5iTUOBhdlyTJ60z6OLpQf+glf2PtWFLOCqVIzCMRaFxAhsYaxyQEtCEbZoWH7N+lUH1fQ==
X-Received: by 2002:a05:6830:19c2:: with SMTP id
 p2mr8072669otp.49.1627185969411; 
 Sat, 24 Jul 2021 21:06:09 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g66sm6360391oob.27.2021.07.24.21.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:06:09 -0700 (PDT)
Date: Sat, 24 Jul 2021 23:06:06 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YPzjLg66TOoBNv3I@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-4-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 3/7] drm/msm/dpu: support setting up two
 independent DSI connectors
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> Move setting up encoders from set_encoder_mode to
> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
> allows us to support not only "single DSI" and "bonded DSI" but also "two
> independent DSI" configurations. In future this would also help adding
> support for multiple DP connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 102 +++++++++++++-----------
>  1 file changed, 57 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1d3a4f395e74..3cd2011e18d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -471,30 +471,68 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  				    struct dpu_kms *dpu_kms)
>  {
>  	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
>  	int i, rc = 0;
>  
>  	if (!(priv->dsi[0] || priv->dsi[1]))
>  		return rc;
>  
> -	/*TODO: Support two independent DSI connectors */
> -	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
> -	if (IS_ERR(encoder)) {
> -		DPU_ERROR("encoder init failed for dsi display\n");
> -		return PTR_ERR(encoder);
> -	}
> -
> -	priv->encoders[priv->num_encoders++] = encoder;
> -
> +	/*
> +	 * We support following confiurations:
> +	 * - Single DSI host (dsi0 or dsi1)
> +	 * - Two independent DSI hosts
> +	 * - Bonded DSI0 and DSI1 hosts
> +	 *
> +	 * TODO: Support swapping DSI0 and DSI1 in the bonded setup.
> +	 */
>  	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +		int other = (i + 1) % 2;
> +
>  		if (!priv->dsi[i])
>  			continue;
>  
> +		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) &&
> +		    !msm_dsi_is_master_dsi(priv->dsi[i]))
> +			continue;
> +
> +		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
> +		if (IS_ERR(encoder)) {
> +			DPU_ERROR("encoder init failed for dsi display\n");
> +			return PTR_ERR(encoder);
> +		}
> +
> +		priv->encoders[priv->num_encoders++] = encoder;
> +
> +		memset(&info, 0, sizeof(info));
> +		info.intf_type = encoder->encoder_type;
> +
>  		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>  		if (rc) {
>  			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>  				i, rc);
>  			break;
>  		}
> +
> +		info.h_tile_instance[info.num_of_h_tiles++] = i;
> +		info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
> +			MSM_DISPLAY_CAP_CMD_MODE :
> +			MSM_DISPLAY_CAP_VID_MODE;
> +
> +		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
> +			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
> +			if (rc) {
> +				DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
> +					other, rc);
> +				break;
> +			}
> +
> +			info.h_tile_instance[info.num_of_h_tiles++] = other;
> +		}
> +
> +		rc = dpu_encoder_setup(dev, encoder, &info);
> +		if (rc)
> +			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +				  encoder->base.id, rc);
>  	}
>  
>  	return rc;
> @@ -505,6 +543,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  					    struct dpu_kms *dpu_kms)
>  {
>  	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
>  	int rc = 0;
>  
>  	if (!priv->dp)
> @@ -516,6 +555,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		return PTR_ERR(encoder);
>  	}
>  
> +	memset(&info, 0, sizeof(info));
>  	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>  	if (rc) {
>  		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> @@ -524,6 +564,14 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	}
>  
>  	priv->encoders[priv->num_encoders++] = encoder;
> +
> +	info.num_of_h_tiles = 1;
> +	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> +	info.intf_type = encoder->encoder_type;
> +	rc = dpu_encoder_setup(dev, encoder, &info);
> +	if (rc)
> +		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +			  encoder->base.id, rc);
>  	return rc;
>  }
>  
> @@ -726,41 +774,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>  	msm_kms_destroy(&dpu_kms->base);
>  }
>  
> -static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
> -				 struct drm_encoder *encoder,
> -				 bool cmd_mode)
> -{
> -	struct msm_display_info info;
> -	struct msm_drm_private *priv = encoder->dev->dev_private;
> -	int i, rc = 0;
> -
> -	memset(&info, 0, sizeof(info));
> -
> -	info.intf_type = encoder->encoder_type;
> -	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
> -			MSM_DISPLAY_CAP_VID_MODE;
> -
> -	switch (info.intf_type) {
> -	case DRM_MODE_ENCODER_DSI:
> -		/* TODO: No support for DSI swap */
> -		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> -			if (priv->dsi[i]) {
> -				info.h_tile_instance[info.num_of_h_tiles] = i;
> -				info.num_of_h_tiles++;
> -			}
> -		}
> -		break;
> -	case DRM_MODE_ENCODER_TMDS:
> -		info.num_of_h_tiles = 1;
> -		break;
> -	}
> -
> -	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
> -	if (rc)
> -		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> -			encoder->base.id, rc);
> -}
> -
>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> @@ -863,7 +876,6 @@ static const struct msm_kms_funcs kms_funcs = {
>  	.get_format      = dpu_get_msm_format,
>  	.round_pixclk    = dpu_kms_round_pixclk,
>  	.destroy         = dpu_kms_destroy,
> -	.set_encoder_mode = _dpu_kms_set_encoder_mode,
>  	.snapshot        = dpu_kms_mdp_snapshot,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init    = dpu_kms_debugfs_init,
> -- 
> 2.30.2
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
