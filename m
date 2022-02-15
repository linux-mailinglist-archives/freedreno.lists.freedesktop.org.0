Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB24B6FDB
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 16:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321A10E63C;
	Tue, 15 Feb 2022 15:38:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A7410E63B
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 15:38:38 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 p3-20020a0568301d4300b005a7a702f921so14035461oth.9
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=79WoF2L7ukRve2muk/tu/qHceOSi7bzysI2aa/CMOXA=;
 b=u+qiAmMOMV006XAEAVy3+E51xvWwpbl/M44DS9AVHJQYZ//BkQvjVaCX2SED2bSXRa
 FZYV3PLwmtaF7OXCdmRAtrXZFnVZfWtxrMfv8hvMpT8038Hec3Tv4OZ4cIhVCBa/4SkQ
 yswmsguvYLWFlJGabBCCfIG2axLhmtPaTA5tevam0QWEP3PE06ZAntBv0NFkVfYNuDMN
 nFezDI1R4ZkuoZ1rOV8AKY4cMKh2BPDm/loCi+o+YAHzOf/l4bf3cj5BmR8LCuvBtN3Z
 IrC4iu1ZMOVqk/AdYbUgcHrEe3rVQCR3ILiGQv9LzIlCDtWo5PG3RVWBbiVDPhDwUqRD
 fkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=79WoF2L7ukRve2muk/tu/qHceOSi7bzysI2aa/CMOXA=;
 b=7txMXcSwADSuG1pmIb1LrrtOuhoAEahWoTiqm/Mgp8kJA7lwG0WDkJKSUvyw9QMlYF
 gtb+4otaKPYMhPJmsCXxbUsQLemh0pD3eTk34soFyZDdlSH5DiInwFLI7R38dVN8Rnow
 9v7W9GdB3HGIKqSdZz6PNSlsYhfzlGEd2qamK9551rxuf52agQLqkCB0bLPdzGc9qCLG
 P8LYY6qHzfWeGvYlpNNbSnDp1lGXiyiI8VxINEfHrGoYkql0EGg9a2aZS8qa/VbnbKpv
 oqFLVSuVllOSOW9uffziJRXqc3WOJ6557vDo3R7+G59C6ZwUamk3nQCZGlvHRbVhGpJZ
 behQ==
X-Gm-Message-State: AOAM532qRRZYbUCr9DGUwzidtg+Y4GlGIR8+vc6OGnrpTvSuKtIRrciC
 tagm1n04zZOJSX7GTYeEevPiOXjlNhzK9A==
X-Google-Smtp-Source: ABdhPJyL8e6CearK0+dFt9ezcISvk12UqF5WTlFgl2h6Btw5pZx1UfT+UVx6fy6p8BwzPrP8YAqiig==
X-Received: by 2002:a9d:7017:: with SMTP id k23mr1508338otj.63.1644939517851; 
 Tue, 15 Feb 2022 07:38:37 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id t31sm16069416oaa.9.2022.02.15.07.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:38:37 -0800 (PST)
Date: Tue, 15 Feb 2022 09:38:35 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YgvI+0vqMp5ZPDU0@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/8] drm/msm/dpu: remove msm_dp cached in
 dpu_encoder_virt
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

> Stop caching msm_dp instance in dpu_encoder_virt since it's not used
> now.
> 
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c59976deb1cb..401e37f50d54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -168,7 +168,6 @@ enum dpu_enc_rc_states {
>   * @vsync_event_work:		worker to handle vsync event for autorefresh
>   * @topology:                   topology of the display
>   * @idle_timeout:		idle timeout duration in milliseconds
> - * @dp:				msm_dp pointer, for DP encoders
>   */
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
> @@ -207,8 +206,6 @@ struct dpu_encoder_virt {
>  	struct msm_display_topology topology;
>  
>  	u32 idle_timeout;
> -
> -	struct msm_dp *dp;
>  };
>  
>  #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
> @@ -2123,8 +2120,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>  		timer_setup(&dpu_enc->vsync_event_timer,
>  				dpu_encoder_vsync_event_handler,
>  				0);
> -	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> -		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
>  
>  	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>  			dpu_encoder_off_work);
> -- 
> 2.34.1
> 
