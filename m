Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E910E5B5FEE
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 20:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CEC10E08A;
	Mon, 12 Sep 2022 18:10:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2002F10E08F
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 18:10:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id i26so16168784lfp.11
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=pNFaQgI/Wpk+RRqWm6LUGSleWuKJ6k1nYQ3l4ywMTD4=;
 b=bORY4LjZaSaDGxQoTcPmNSrz0G5bhG/Pe216SBbJdiI7Nc/07Ly/IUmtQBt7D7rBkK
 YqzT8lVcPnV15b03E6XKDAL8zJ4yHl5KvDaeswnqbiwK7qxNafhL2gRDzSMfIJEJ4EAp
 8E2gZpA8z467e5PI7zL8dRltZ2NjO7veaLISkIn569GetV3E4990u+4ftaYmR3mBZBk/
 CdzVeOIYmEtm2J8Go24MOL1BqF8/Z0juvLP8jmfJ8tBzEt5izeORdmqI6c+Eruz3ZNUJ
 eNSOEZ/Jjl4z/ytolF4M1rj7oh62Ey/ToeZhYwTd4E9ipiFYxvTD9V4Ye5Sjzme2EFyr
 1bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pNFaQgI/Wpk+RRqWm6LUGSleWuKJ6k1nYQ3l4ywMTD4=;
 b=H6goYvNHjJa2ckIuGMqokMckbb7kW+3PUKs6E1ZTnBCI79eF60GjfjrplNdLS3Okym
 ithCyCQ9/lZ9SVON/87ygA/ylHRGDH50qky19Ltsl5GFgq7R3ajv74+wlEWJ4Bst40Ho
 Jh4QBe0WwM44wjf/COEjXIFQL6R4Si7xV3SLINrkog1FoI6mydfB0dB+7sADbFk9HvIL
 4BxpjO34Bl5isqcHN9Qw8NpCosqUsnmq87Py945FJFKAXEWls1hFGPevDPudSrTcXHA0
 /Dzpx1+Lm2YGZ2mM5HRp4yx505zhNnr3RGaQOCkGCb5Ex0NXNL6nrnks9vFwpBI88Cv0
 ksKA==
X-Gm-Message-State: ACgBeo0AUVRXB40xp1ki72zeRXYywlnAhh3HBrU3ySxJL6/elhuI3NWp
 jE7tdQG99BSCcgov/4OF/e1hJA==
X-Google-Smtp-Source: AA6agR5nn0P4MDu8RVZ2eI1kzc3OQfQYodK0aWq3EVa9jnyZHQgpamGf0QZN86jHooMmqzYjjNgLrw==
X-Received: by 2002:ac2:5462:0:b0:49b:8aee:3535 with SMTP id
 e2-20020ac25462000000b0049b8aee3535mr542834lfn.410.1663006202087; 
 Mon, 12 Sep 2022 11:10:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05651221a400b00496693860dcsm1196546lft.232.2022.09.12.11.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:10:01 -0700 (PDT)
Message-ID: <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
Date: Mon, 12 Sep 2022 21:10:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Douglas Anderson <dianders@chromium.org>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-5-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220912154046.12900-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/dp: fix aux-bus EP lifetime
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/09/2022 18:40, Johan Hovold wrote:
> Device-managed resources allocated post component bind must be tied to
> the lifetime of the aggregate DRM device or they will not necessarily be
> released when binding of the aggregate device is deferred.
> 
> This can lead resource leaks or failure to bind the aggregate device
> when binding is later retried and a second attempt to allocate the
> resources is made.
> 
> For the DP aux-bus, an attempt to populate the bus a second time will
> simply fail ("DP AUX EP device already populated").
> 
> Fix this by amending the DP aux interface and tying the lifetime of the
> EP device to the DRM device rather than DP controller platform device.

Doug, could you please take a look?

For me this is another reminder/pressure point that we should populate 
the AUX BUS from the probe(), before binding the components together.

> 
> Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
> Cc: stable@vger.kernel.org      # 5.19
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/bridge/parade-ps8640.c   | 2 +-
>   drivers/gpu/drm/display/drm_dp_aux_bus.c | 5 +++--
>   drivers/gpu/drm/msm/dp/dp_display.c      | 3 ++-
>   include/drm/display/drm_dp_aux_bus.h     | 6 +++---
>   4 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index d7483c13c569..6127979370cb 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -719,7 +719,7 @@ static int ps8640_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> -	ret = devm_of_dp_aux_populate_bus(&ps_bridge->aux, ps8640_bridge_link_panel);
> +	ret = devm_of_dp_aux_populate_bus(dev, &ps_bridge->aux, ps8640_bridge_link_panel);
>   
>   	/*
>   	 * If devm_of_dp_aux_populate_bus() returns -ENODEV then it's up to
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> index f5741b45ca07..2706f2cf82f7 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -322,6 +322,7 @@ static void of_dp_aux_depopulate_bus_void(void *data)
>   
>   /**
>    * devm_of_dp_aux_populate_bus() - devm wrapper for of_dp_aux_populate_bus()
> + * @dev: Device to tie the lifetime of the EP devices to
>    * @aux: The AUX channel whose device we want to populate
>    * @done_probing: Callback functions to call after EP device finishes probing.
>    *                Will not be called if there are no EP devices and this
> @@ -333,7 +334,7 @@ static void of_dp_aux_depopulate_bus_void(void *data)
>    *         no children. The done_probing() function won't be called in that
>    *         case.
>    */
> -int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
> +int devm_of_dp_aux_populate_bus(struct device *dev, struct drm_dp_aux *aux,
>   				int (*done_probing)(struct drm_dp_aux *aux))
>   {
>   	int ret;
> @@ -342,7 +343,7 @@ int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>   	if (ret)
>   		return ret;
>   
> -	return devm_add_action_or_reset(aux->dev,
> +	return devm_add_action_or_reset(dev,
>   					of_dp_aux_depopulate_bus_void, aux);
>   }
>   EXPORT_SYMBOL_GPL(devm_of_dp_aux_populate_bus);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ba557328710a..e1aa6355bbf6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1559,7 +1559,8 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>   		 * panel driver is probed asynchronously but is the best we
>   		 * can do without a bigger driver reorganization.
>   		 */
> -		rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
> +		rc = devm_of_dp_aux_populate_ep_devices(dp->drm_dev->dev,
> +							dp_priv->aux);
>   		of_node_put(aux_bus);
>   		if (rc)
>   			goto error;
> diff --git a/include/drm/display/drm_dp_aux_bus.h b/include/drm/display/drm_dp_aux_bus.h
> index 8a0a486383c5..a4063aa7fc40 100644
> --- a/include/drm/display/drm_dp_aux_bus.h
> +++ b/include/drm/display/drm_dp_aux_bus.h
> @@ -47,7 +47,7 @@ static inline struct dp_aux_ep_driver *to_dp_aux_ep_drv(struct device_driver *dr
>   int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>   			   int (*done_probing)(struct drm_dp_aux *aux));
>   void of_dp_aux_depopulate_bus(struct drm_dp_aux *aux);
> -int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
> +int devm_of_dp_aux_populate_bus(struct device *dev, struct drm_dp_aux *aux,
>   				int (*done_probing)(struct drm_dp_aux *aux));
>   
>   /* Deprecated versions of the above functions. To be removed when no callers. */
> @@ -61,11 +61,11 @@ static inline int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
>   	return (ret != -ENODEV) ? ret : 0;
>   }
>   
> -static inline int devm_of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
> +static inline int devm_of_dp_aux_populate_ep_devices(struct device *dev, struct drm_dp_aux *aux)
>   {
>   	int ret;
>   
> -	ret = devm_of_dp_aux_populate_bus(aux, NULL);
> +	ret = devm_of_dp_aux_populate_bus(dev, aux, NULL);
>   
>   	/* New API returns -ENODEV for no child case; adapt to old assumption */
>   	return (ret != -ENODEV) ? ret : 0;

-- 
With best wishes
Dmitry

