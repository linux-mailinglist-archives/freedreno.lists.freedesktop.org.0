Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F29E84C4
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 12:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15FB10E32D;
	Sun,  8 Dec 2024 11:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y7W1sXk+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9674C10E322
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 11:48:19 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso287185e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 03:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733658498; x=1734263298; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z4tIIPwwjLUIIZDfXiBmmk0gEmVWRuTZ+xmFiDPryO4=;
 b=Y7W1sXk+6BusB9SpBNjTARb4cwasCVYPz/W2QOYvr8xXij4yZTO9UkF7wRK5zQRRQD
 GfUNRo0FfQImCd7csiqk6zYv88wQuhT4Fx4jnz3hZDMGcXCym5TX33BNwGTZo8HqmxFF
 hOqfPktJP11dGNKcf4HGTpbdpDVtdGEQAInKRC21GJ90J46fuGmkPw5iGn5iHa0wo09S
 QKXh9b/7wc9LPa+x6Q/bkZjVd5jZXqle5HfyTM+EIrzDsdX825zFlNMyczY/noWkVRqL
 sMTa654Okn0V06kcpNbyac3WbJ0XM4A4e2LzFhcY1BAFBDu/8Gj4/pOQtjtMwkjztvJm
 +RFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733658498; x=1734263298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4tIIPwwjLUIIZDfXiBmmk0gEmVWRuTZ+xmFiDPryO4=;
 b=mYjClxn7uG/wAZp/ghJxM3iUchR0KNF6Nqdj/lrZ763aKLCP9Pn9CFMmxsL//pGM2Q
 2hdLdm8dmU+YyIeCxBWd+o8ZwWRO8Rm0eYLo+EJ2tlm0T4qFsJo4CaAIQ3x9uXyKfdUg
 UMNjF7lCmywzHCK07MziQpKkc/juYWOMDIO91i0HQINBFKoWD+4Vn5AMeJrIcyLcSzGK
 EBB5KOkVqKsJmaIcwtEElZPxjJh0mr6e3BizJFYZHReD+MKdwc/ULQFmCnrszXrxp4TH
 LQ1QlAFdtskJttGnqjfFdUYFfpDUtDWIGvFdA/HJXoIhGZcDnh2Kf9N4+06N8vCoXv3+
 S5Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQDJkTFjK2SSUVG4RLsSuxY4hx4t0hJAAfHy1tSezejta5pXvvtBj2VoJFhjzdM2El3UzY3p+0X2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhQAiFEumXyOh/Y+QBAzGlAuccqjbCEaUcDxGbj59VomfZNalq
 4i2ZErVuIHa+VITofuua959yqv8SNmUz6UQeM+pY8tBHVDJMAjJ7MlFbWLPTjMg=
X-Gm-Gg: ASbGncvNlowKU2EiwltVC71OI6ZZjKWyP6t4Pe+2bhWHsmBy3341wioUd9T1N6VoDd6
 dm2Xk7xZ57MGg6pz6CtDgum1LmYOOapOEgZelN7E8GAXDaHLunKsPV9NGFxN/ylIIgapA/Rhvsg
 +XyCkfXUi0dmQxZRZLyUqbByq6MjhcuDAqTDB9lRfiqjzqA5wl/QKqVIqj3ka7x+binou6yeWgy
 tYphZ/sQw4//WQzKbqXOX1eJ7hWyLNxM0Skil8/qReYx5C9QstbJAT6zWu1EH4JkVRcElWrgdNv
 QfTLMutE6HJ4tI+b62KH6iMOTqzIMw==
X-Google-Smtp-Source: AGHT+IEN46zayJ+gfUNumRfAuI8PnT+wBoYszJhOUMz+jyYB4C2u+1pyFpm0Oxy50d1tBQR1hCi/vg==
X-Received: by 2002:a05:6512:4012:b0:540:1c67:fc2f with SMTP id
 2adb3069b0e04-5401c67fc5dmr432013e87.14.1733658497742; 
 Sun, 08 Dec 2024 03:48:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53fb80d6feesm365296e87.156.2024.12.08.03.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:48:16 -0800 (PST)
Date: Sun, 8 Dec 2024 13:48:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 25/45] drm/msm/dp: move link related operations to
 dp_display_unprepare()
Message-ID: <s7aprnu3zrxm6ocisakeiresxnuf34qw5kqtip233gzx72h27p@wmveskystjl4>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-25-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-25-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:56PM -0800, Abhinav Kumar wrote:
> Move the link related operations to dp_display_unprepare() and keep
> only stream related operations in dp_display_disable().

Why, no what

> 
> Make dp_display_unprepare() available to other clients such as DP MST.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 31 ++++++++++++++++---------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  2 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e169cd22db960c0c30707ddbe6a79999dc2a273d..d5b8fd1d4d736ffa7929b9798601dcef0dea5211 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -936,20 +936,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>  
>  	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, msm_dp_panel);
>  
> -	/* dongle is still connected but sinks are disconnected */
> -	if (dp->link->sink_count == 0)
> -		msm_dp_ctrl_psm_config(dp->ctrl);
> -
>  	msm_dp_ctrl_stream_clk_off(dp->ctrl, msm_dp_panel);
>  
> -	msm_dp_ctrl_off_link(dp->ctrl);
> -
> -	/* re-init the PHY so that we can listen to Dongle disconnect */
> -	if (dp->link->sink_count == 0)
> -		msm_dp_ctrl_reinit_phy(dp->ctrl);
> -	else
> -		msm_dp_display_host_phy_exit(dp);
> -

This changes the meaning of msm_dp_display->power_on. I'll have to
review corresponding code carefully. Please note it in the commit
message.

>  	msm_dp_display->power_on = false;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
> @@ -1678,15 +1666,28 @@ void msm_dp_display_atomic_disable(struct msm_dp *msm_dp)
>  	msm_dp_display_disable_helper(msm_dp, msm_dp_display->panel);
>  }
>  
> -static void msm_dp_display_unprepare(struct msm_dp_display_private *msm_dp_display_priv)
> +void msm_dp_display_unprepare(struct msm_dp *msm_dp)
>  {
> -	struct msm_dp *msm_dp = &msm_dp_display_priv->msm_dp_display;
> +	struct msm_dp_display_private *msm_dp_display;
>  
> +	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);

Set it it at the assignment time, please. Or at least add an empty line
afterwards.

>  	if (!msm_dp->prepared) {
>  		drm_dbg_dp(msm_dp->drm_dev, "Link already setup, return\n");
>  		return;
>  	}
>  
> +	/* dongle is still connected but sinks are disconnected */
> +	if (msm_dp_display->link->sink_count == 0)
> +		msm_dp_ctrl_psm_config(msm_dp_display->ctrl);
> +
> +	msm_dp_ctrl_off_link(msm_dp_display->ctrl);
> +
> +	/* re-init the PHY so that we can listen to Dongle disconnect */
> +	if (msm_dp_display->link->sink_count == 0)
> +		msm_dp_ctrl_reinit_phy(msm_dp_display->ctrl);
> +	else
> +		msm_dp_display_host_phy_exit(msm_dp_display);
> +
>  	pm_runtime_put_sync(&msm_dp->pdev->dev);
>  
>  	msm_dp->prepared = false;
> @@ -1732,7 +1733,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp)
>  
>  	msm_dp_display_atomic_post_disable_helper(msm_dp, msm_dp_display->panel);
>  
> -	msm_dp_display_unprepare(msm_dp_display);
> +	msm_dp_display_unprepare(msm_dp);
>  }
>  
>  void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 2b23f2bf7535d3fd513d40a8411a1903fcd560b0..82eb1c6ed1467b21742bda8eaae9c51d3207e997 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -65,4 +65,6 @@ void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
>  void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp,
>  					       struct msm_dp_panel *msm_dp_panel);
>  
> +void msm_dp_display_unprepare(struct msm_dp *dp);
> +
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
