Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D59665968
	for <lists+freedreno@lfdr.de>; Wed, 11 Jan 2023 11:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52A189A86;
	Wed, 11 Jan 2023 10:53:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A60089A86
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jan 2023 10:53:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so12307493wms.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jan 2023 02:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oEARfl1xpNXNnlyTzuct91oct8bbc7rpBw3zDPeOoQA=;
 b=fr+oKTwkGn/sYB8fxNCbuv0jR98SWOheR8T9aOaZS9h+6sFfB+yTWXghHJ12ZnhoaK
 zxnf83F1ZPBz8RuMS/6716iTVyZMvw21y6GQclD/VeoF0g1gn18n8ckXW0w11F3z7jo4
 06mZdoqmdkH+YtCIsCFrcAgcpSTsOXdZAdCSkHRpwbZ5GQoXMokkV0Dkb3lzAZl4gNKd
 lvMdhlSoF5FeAmLFBqhiMjh3N+3WDGKJC7ZCIcZ69iU2xXVGbguyIvAP9hDf0wVfR5K9
 JHkq5KiIXm3UznwFKtDMH+GEMkERte/nTCUIcgoU98ncXkWHlgMTfzn6ftSA9HIvHM5m
 KDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oEARfl1xpNXNnlyTzuct91oct8bbc7rpBw3zDPeOoQA=;
 b=T2XsCt8EalGMphivwXgn7uxv/zJKMSXHCjVD+Os67xnebUThkgG9EroptPiazuiKEa
 3G0r7SFLw0avHo6aBD5ZGmP4vIf+lbJDOeSQuGDYXU9xY1pGy80lZ5qLPRRWAy1wwsTX
 yhBzeqyergADlqBi3HnnOc9zuWze6R7Ikgk75ickQBgl5GyPl125p/Cc3P5rJEzv1CvJ
 Ol2ry42aT1eOWCj4CMW4GQPdESQCUdBF1PsMMP4z7MJsuGyM7AEBCgFo/Ei7dxsxs53g
 adIZebPOzSXWndP1zQOQdssx19L2aFKQI505YuouaeIA7dHSpQBNGOEIKibdF7EOVard
 nFgQ==
X-Gm-Message-State: AFqh2kohIhd7rjNR99s2gRlaXC4Epy/Nv9LB3NZGtTN4Ihrzupl30mHC
 Fw44hhxfLKlfiXsNQuk/TKYHww==
X-Google-Smtp-Source: AMrXdXsCHUURC2DANH/T4dg723n3fwwzRwXdK9ISjRMbm+tjETBLbExCTH+sN9qCq9+w8hSyS7JLkw==
X-Received: by 2002:a05:600c:2844:b0:3da:4e:8dfe with SMTP id
 r4-20020a05600c284400b003da004e8dfemr2809580wmb.38.1673434397580; 
 Wed, 11 Jan 2023 02:53:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5?
 ([2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003b4fe03c881sm22093781wmi.48.2023.01.11.02.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:53:17 -0800 (PST)
Message-ID: <6f234a3d-5a59-ea47-225d-9360213427cd@linaro.org>
Date: Wed, 11 Jan 2023 11:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-8-dmitry.baryshkov@linaro.org>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 07/13] drm/bridge: lt9611: rework the
 mode_set function
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/01/2023 17:56, Dmitry Baryshkov wrote:
> The mode_set callback is deprectated for drm_bridges in favour of using
> atomic_enable callback. Move corresponding code into the function
> lt9611_bridge_atomic_enable() and turn lt9611_bridge_pre_enable() into
> the proper atomic_pre_enable callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 61 +++++++++++++++----------
>   1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 3b77238ca4af..1b65a573be27 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -713,6 +713,39 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
>   			    struct drm_bridge_state *old_bridge_state)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_display_mode *mode;
> +	struct hdmi_avi_infoframe avi_frame;
> +	unsigned int postdiv;
> +	int ret;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
> +	mode = &crtc_state->adjusted_mode;
> +
> +	lt9611_mipi_input_digital(lt9611, mode);
> +	lt9611_pll_setup(lt9611, mode, &postdiv);
> +	lt9611_mipi_video_setup(lt9611, mode);
> +	lt9611_pcr_setup(lt9611, mode, postdiv);
> +
> +	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
> +						       connector,
> +						       mode);
> +	if (!ret)
> +		lt9611->vic = avi_frame.video_code;
>   
>   	if (lt9611_power_on(lt9611)) {
>   		dev_err(lt9611->dev, "power on failed\n");
> @@ -856,7 +889,8 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>   		return MODE_OK;
>   }
>   
> -static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
> +static void lt9611_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *old_bridge_state)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>   	static const struct reg_sequence reg_cfg[] = {
> @@ -884,29 +918,6 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   	lt9611_sleep_setup(lt9611);
>   }
>   
> -static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
> -				   const struct drm_display_mode *mode,
> -				   const struct drm_display_mode *adj_mode)
> -{
> -	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> -	struct hdmi_avi_infoframe avi_frame;
> -	unsigned int postdiv;
> -	int ret;
> -
> -	lt9611_bridge_pre_enable(bridge);
> -
> -	lt9611_mipi_input_digital(lt9611, mode);
> -	lt9611_pll_setup(lt9611, mode, &postdiv);
> -	lt9611_mipi_video_setup(lt9611, mode);
> -	lt9611_pcr_setup(lt9611, mode, postdiv);
> -
> -	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
> -						       &lt9611->connector,
> -						       mode);
> -	if (!ret)
> -		lt9611->vic = avi_frame.video_code;
> -}
> -
>   static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
>   {
>   	return __lt9611_detect(bridge_to_lt9611(bridge));
> @@ -957,11 +968,11 @@ lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>   static const struct drm_bridge_funcs lt9611_bridge_funcs = {
>   	.attach = lt9611_bridge_attach,
>   	.mode_valid = lt9611_bridge_mode_valid,
> -	.mode_set = lt9611_bridge_mode_set,
>   	.detect = lt9611_bridge_detect,
>   	.get_edid = lt9611_bridge_get_edid,
>   	.hpd_enable = lt9611_bridge_hpd_enable,
>   
> +	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
>   	.atomic_enable = lt9611_bridge_atomic_enable,
>   	.atomic_disable = lt9611_bridge_atomic_disable,
>   	.atomic_post_disable = lt9611_bridge_atomic_post_disable,


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
