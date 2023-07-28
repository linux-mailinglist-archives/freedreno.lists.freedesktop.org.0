Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D976768D
	for <lists+freedreno@lfdr.de>; Fri, 28 Jul 2023 21:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4C210E78C;
	Fri, 28 Jul 2023 19:47:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DC610E789;
 Fri, 28 Jul 2023 19:44:03 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
 id 539692701FE; Fri, 28 Jul 2023 21:44:02 +0200 (CEST)
Date: Fri, 28 Jul 2023 21:44:02 +0200
From: Janne Grunau <janne@jannau.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ZMQaguWtUjYMxw7l@jannau.net>
References: <20230709202511.287794-1-dmitry.baryshkov@linaro.org>
 <20230709202511.287794-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709202511.287794-4-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Fri, 28 Jul 2023 19:47:40 +0000
Subject: Re: [Freedreno] [PATCH v6 3/3] drm/bridge_connector: implement
 oob_hotplug_event
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <sean@poorly.run>,
 linux-usb@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-07-09 23:25:11 +0300, Dmitry Baryshkov wrote:
> Implement the oob_hotplug_event() callback. Translate it to the HPD
> notification sent to the HPD bridge in the chain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 29 +++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 84d8d310ef04..364f6e37fbdc 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -5,6 +5,8 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  
>  #include <drm/drm_atomic_state_helper.h>
> @@ -107,10 +109,9 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
>  	}
>  }
>  
> -static void drm_bridge_connector_hpd_cb(void *cb_data,
> -					enum drm_connector_status status)
> +static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
> +					    enum drm_connector_status status)
>  {
> -	struct drm_bridge_connector *drm_bridge_connector = cb_data;
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
>  
> @@ -123,6 +124,21 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
>  	drm_kms_helper_hotplug_event(dev);
>  }
>  
> +static void drm_bridge_connector_hpd_cb(void *cb_data,
> +					enum drm_connector_status status)
> +{
> +	drm_bridge_connector_handle_hpd(cb_data, status);
> +}
> +
> +static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
> +						   enum drm_connector_status status)
> +{
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +
> +	drm_bridge_connector_handle_hpd(bridge_connector, status);
> +}
> +
>  static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
>  {
>  	struct drm_bridge_connector *bridge_connector =
> @@ -216,6 +232,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  	.debugfs_init = drm_bridge_connector_debugfs_init,
> +	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -351,6 +368,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type = bridge->type;
>  
> +#ifdef CONFIG_OF
> +		if (!drm_bridge_get_next_bridge(bridge) &&
> +		    bridge->of_node)
> +			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
> +#endif
> +
>  		if (bridge->ddc)
>  			ddc = bridge->ddc;
>  
> -- 
> 2.39.2
> 
