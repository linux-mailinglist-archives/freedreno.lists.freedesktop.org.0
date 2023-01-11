Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA6066598A
	for <lists+freedreno@lfdr.de>; Wed, 11 Jan 2023 11:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730E710E701;
	Wed, 11 Jan 2023 10:56:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D9610E701
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jan 2023 10:56:29 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l26so10800835wme.5
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jan 2023 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=b5rIbeE/vAf3GDKuf7UqIpCoPfBYXzoxfcnleSadSbw=;
 b=jSM/tEBfhLX0w2W809XbJjzc6uSUT7SfQnk8DiNmtAzr+XVZsOusfWL0sB2+8yTV9V
 3SXdlQLOUx95VKyU8pw7t2IE4b9oCWAe+F0BFxpNgFTdo9xGPLe+ljSpeZfizXQvO19t
 KaBZiboDWjzY4SiX3KV1uTgi7IWcC9XRBWkUmGOmee00tmCLJKjl8J+aCW0Cg4Aqw1e/
 8EVXpyfXA0xUiVNtsbQvoSrC9h3AOFWzJPPUZule4hwIQNqO1PZJfg+aKmvN73b1nuFr
 3PCJxpyiM6TUDmO7nI8JW9XgfLsjglTGz/53G/VzPIQqGvqNmCKh8kTX/HYR0q8MJabc
 7a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b5rIbeE/vAf3GDKuf7UqIpCoPfBYXzoxfcnleSadSbw=;
 b=stObvHneyKK1wa3PGQ6sVeA1tzO6v6yb5GmMZryaYspQ6LRfJgRp0MdMKCnASzoZYh
 vYACrZWj/hIgJQkYkegmo25TRtiNrYTYIMOeQVJnjohzycLdBAwhQ5ZymrZIE8GUCU10
 mVPXD2QvIia314BJ2eD2c/oRI1Pf8JIC5p1TVJGJ8a8frg+Kx+TJs9nAn9o+QqMasuxi
 1OVyG6p2ReJVSZ5EaXsTl4mdqEJK27eeCTu1PrCaWy+x/VGDUnjfN6lFcr1M2KX19wVW
 48acZbl8oxb1ZgitdDQ5LAnjpyN28Sv9KKspNCFnrVJmn1108IzH4Z5s5UhOlBApAVoh
 54EQ==
X-Gm-Message-State: AFqh2kqA6zEdwh9s4H0uRyHlfiqfKhrhWiDU1PjYUgOniPgDqtWoDESD
 n+WPeUPtPkSSlElv1CtVDkYED39A/MSZZcjb
X-Google-Smtp-Source: AMrXdXvdyUV9aCKW6YBikN5TZ7z9CKf6SwIfporWIxWRM8KO9SnyGPvvwdv1wpUx/DvloWSzAL9YJA==
X-Received: by 2002:a05:600c:248:b0:3d3:5d47:271c with SMTP id
 8-20020a05600c024800b003d35d47271cmr50934979wmj.12.1673434587691; 
 Wed, 11 Jan 2023 02:56:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5?
 ([2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b003cf894dbc4fsm19361065wmq.25.2023.01.11.02.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:56:27 -0800 (PST)
Message-ID: <4f36d584-d1de-e697-7db7-57066bc14cec@linaro.org>
Date: Wed, 11 Jan 2023 11:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-9-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 08/13] drm/bridge: lt9611: attach to the
 next bridge
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
> The bindings require that there is a next bridge after the lt9611. If
> nothing else it can be the hdmi-connector (as used on the RB3 platform,
> see sdm845-db845c.dts).
> 
> Bring in the next bridge into the drm bridges chain and attach to it.
> 
> Since lt9611 is not anymore the last bridge in the chain, this also
> allows us to drop all the !DRM_BRIDGE_ATTACH_NO_CONNECTOR functionality.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 99 ++-----------------------
>   1 file changed, 7 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 1b65a573be27..773d7a56f86f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -19,6 +19,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -33,7 +34,7 @@
>   struct lt9611 {
>   	struct device *dev;
>   	struct drm_bridge bridge;
> -	struct drm_connector connector;
> +	struct drm_bridge *next_bridge;
>   
>   	struct regmap *regmap;
>   
> @@ -107,11 +108,6 @@ static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
>   	return container_of(bridge, struct lt9611, bridge);
>   }
>   
> -static struct lt9611 *connector_to_lt9611(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct lt9611, connector);
> -}
> -
>   static int lt9611_mipi_input_analog(struct lt9611 *lt9611)
>   {
>   	const struct reg_sequence reg_cfg[] = {
> @@ -581,9 +577,9 @@ static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
>   	return NULL;
>   }
>   
> -/* connector funcs */
> -static enum drm_connector_status __lt9611_detect(struct lt9611 *lt9611)
> +static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
>   {
> +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>   	unsigned int reg_val = 0;
>   	int connected = 0;
>   
> @@ -596,12 +592,6 @@ static enum drm_connector_status __lt9611_detect(struct lt9611 *lt9611)
>   	return lt9611->status;
>   }
>   
> -static enum drm_connector_status
> -lt9611_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	return __lt9611_detect(connector_to_lt9611(connector));
> -}
> -
>   static int lt9611_read_edid(struct lt9611 *lt9611)
>   {
>   	unsigned int temp;
> @@ -683,30 +673,6 @@ lt9611_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>   	return 0;
>   }
>   
> -static int lt9611_connector_get_modes(struct drm_connector *connector)
> -{
> -	struct lt9611 *lt9611 = connector_to_lt9611(connector);
> -	unsigned int count;
> -	struct edid *edid;
> -
> -	lt9611_power_on(lt9611);
> -	edid = drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> -	kfree(edid);
> -
> -	return count;
> -}
> -
> -static enum drm_mode_status
> -lt9611_connector_mode_valid(struct drm_connector *connector,
> -			    struct drm_display_mode *mode)
> -{
> -	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
> -
> -	return lt9611_mode ? MODE_OK : MODE_BAD;
> -}
> -
>   /* bridge funcs */
>   static void
>   lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
> @@ -784,21 +750,6 @@ lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
>   	}
>   }
>   
> -static struct
> -drm_connector_helper_funcs lt9611_bridge_connector_helper_funcs = {
> -	.get_modes = lt9611_connector_get_modes,
> -	.mode_valid = lt9611_connector_mode_valid,
> -};
> -
> -static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.detect = lt9611_connector_detect,
> -	.destroy = drm_connector_cleanup,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
>   static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>   						 struct device_node *dsi_node)
>   {
> @@ -834,44 +785,13 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>   	return dsi;
>   }
>   
> -static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt9611)
> -{
> -	int ret;
> -
> -	ret = drm_connector_init(bridge->dev, &lt9611->connector,
> -				 &lt9611_bridge_connector_funcs,
> -				 DRM_MODE_CONNECTOR_HDMIA);
> -	if (ret) {
> -		DRM_ERROR("Failed to initialize connector with drm\n");
> -		return ret;
> -	}
> -
> -	drm_connector_helper_add(&lt9611->connector,
> -				 &lt9611_bridge_connector_helper_funcs);
> -
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
> -	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
> -
> -	return 0;
> -}
> -
>   static int lt9611_bridge_attach(struct drm_bridge *bridge,
>   				enum drm_bridge_attach_flags flags)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> -	int ret;
> -
> -	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> -		ret = lt9611_connector_init(bridge, lt9611);
> -		if (ret < 0)
> -			return ret;
> -	}
>   
> -	return 0;
> +	return drm_bridge_attach(bridge->encoder, lt9611->next_bridge,
> +				 bridge, flags);
>   }
>   
>   static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
> @@ -918,11 +838,6 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   	lt9611_sleep_setup(lt9611);
>   }
>   
> -static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
> -{
> -	return __lt9611_detect(bridge_to_lt9611(bridge));
> -}
> -
>   static struct edid *lt9611_bridge_get_edid(struct drm_bridge *bridge,
>   					   struct drm_connector *connector)
>   {
> @@ -995,7 +910,7 @@ static int lt9611_parse_dt(struct device *dev,
>   
>   	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
>   
> -	return 0;
> +	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
>   }
>   
>   static int lt9611_gpio_init(struct lt9611 *lt9611)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
