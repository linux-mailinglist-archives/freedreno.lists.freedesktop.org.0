Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14E65EC86
	for <lists+freedreno@lfdr.de>; Thu,  5 Jan 2023 14:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2241310E719;
	Thu,  5 Jan 2023 13:11:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F372B10E713
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jan 2023 13:11:16 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so1289808wms.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jan 2023 05:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epo4NuCr+R0WCc3ZS+TmM2VQF2a+mloAFRnhMBihugE=;
 b=duzWfuiaiDnHSzdqXc0CHu1JETDMs23u6PwEyxrReeZ2pcHD7wg36yyPob3yPiqF79
 p54dRd8VgvKhNpXBOqzbFJi/g/7LyHax6lWVK1NSkr/W7Ij8PDWdyUJy/MzUqA5quR/p
 C2lyEJ1rIOxvNJHCw636pxMWbETY1v5kfnHM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=epo4NuCr+R0WCc3ZS+TmM2VQF2a+mloAFRnhMBihugE=;
 b=LtoxoDGERILdiCevzKQra4yLl0LWMIoVi3t6+88VLK2bp1jQhA2ozotc2uRUjTcBiE
 L579RXRgOgMfXgC6shnuZNXBqhEhxfQsjbj2/3SaVMgq+0r5T4EUgYtB5QuZff7aWEpD
 i3RZfYsgxhotJheRCgr/gVe/ZNwtPpAfl3R97da3XpPBqW7V76OueS45Unnp8d0spuBC
 wtRt30UA24NOdXHDgB3Hkdv+22FqncosYjU7+41PYvrx0z3Dbdyio8Y7eRyqJzyLCC4M
 9pUP1zZZy1BW3cdGd1/xZgIy94KMRrYep+YuMGN9KGYYEZ4gj1aOOotqb+QNCc1AE5my
 9B0Q==
X-Gm-Message-State: AFqh2krX4bj4m5JDVCYQpiUD85JFuRrMBVAw/GB0s3dvVk2JruT9tUtJ
 8lqNzBprfQsfTcRhnAFyIcED0w==
X-Google-Smtp-Source: AMrXdXv/jh051xUt17UFK3vfd0Ya/xZZjvYng3OETahVuoWkb274Fuqt6WI0eN29vKK3LjAETkh/8g==
X-Received: by 2002:a05:600c:1f0e:b0:3cf:497c:c59e with SMTP id
 bd14-20020a05600c1f0e00b003cf497cc59emr37030168wmb.6.1672924275463; 
 Thu, 05 Jan 2023 05:11:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm2634955wmq.33.2023.01.05.05.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:11:14 -0800 (PST)
Date: Thu, 5 Jan 2023 14:11:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Message-ID: <Y7bMcLHr79uhfJv2@phenom.ffwll.local>
Mail-Followup-To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com,
 swboyd@chromium.org
References: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
 <1671012352-1825-9-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1671012352-1825-9-git-send-email-quic_vpolimer@quicinc.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
Subject: Re: [Freedreno] [PATCH v9 08/15] drm/bridge: add psr support for
 panel bridge callbacks
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, dianders@chromium.org, quic_bjorande@quicinc.com,
 quic_vproddut@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 03:35:45PM +0530, Vinod Polimera wrote:
> This change will handle the psr entry exit cases in the panel
> bridge atomic callback functions. For example, the panel power
> should not turn off if the panel is entering psr.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

I think this is all a nice integration of the sr helpers and bridge stuff
and makes sense to me. For the 2 bridge patches and the drm core atomic
patch:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/bridge/panel.c | 48 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 3558cbf..5e77e38 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -113,6 +113,18 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
> +	if (!crtc)
> +		return;
> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
> +		return;
>  
>  	drm_panel_prepare(panel_bridge->panel);
>  }
> @@ -121,6 +133,18 @@ static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
> +	if (!crtc)
> +		return;
> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
> +		return;
>  
>  	drm_panel_enable(panel_bridge->panel);
>  }
> @@ -129,6 +153,18 @@ static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
> +	if (!crtc)
> +		return;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
> +		return;
>  
>  	drm_panel_disable(panel_bridge->panel);
>  }
> @@ -137,6 +173,18 @@ static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
> +	if (!crtc)
> +		return;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
> +		return;
>  
>  	drm_panel_unprepare(panel_bridge->panel);
>  }
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
