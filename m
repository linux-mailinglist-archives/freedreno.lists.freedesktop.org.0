Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CB4DD046
	for <lists+freedreno@lfdr.de>; Thu, 17 Mar 2022 22:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF52610E819;
	Thu, 17 Mar 2022 21:37:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3073A10E819
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 21:37:50 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id j83so7025645oih.6
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=mYahFg1u8AWNshIkG0ACNOEuY23IE74jTRUAFlXlZgs=;
 b=LzAlpuAIvhSFB57UMk4TIVaAFjG+yZiFO7gvk21cjYrKKivdM394ahnLTPM1TB1S8x
 V4Rek+owRzgElF1h34+BD/zJItn/bmK9nvLvYkifZusOqMQOwrDCfSKepPe+k4Wgq1sf
 6FamhJegmjo6xbuGqtZsF4IhIuI+2CtxU1p1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=mYahFg1u8AWNshIkG0ACNOEuY23IE74jTRUAFlXlZgs=;
 b=zb5nNvasocZatd5wywlSt7RtdQDIu9rStT7LU0xE89FaQQMvoe0v60zlLQlFYdePCA
 leQQKZe9zV2Vq64Oti698uT+gCB9nhbRp3STb3Em9lHIs9k+U4SNX/adTgfD7hOdmKTA
 VvWG/rBOaX89XAwm/tKhAbH06WOhgyA2unAXS3gqObEhrsuY50F2PZxvZXqv4d8GeqJw
 GXydHpCoDqspPMv86KAbrbet2388BR1m8Y6+s/4Td1YgcrdmUkQJW+fMRcC4qZp/kFLq
 X7XYf1YWXCnDc+J1FVg7ARoh1YnOYdmZDB/7OqfQE1nISCWC5WgkFl12hSF+qtjhUD/c
 iuyA==
X-Gm-Message-State: AOAM5311XWsUWAA+pWxXYxyAschXHjahXLxboxSO4n7fTZ3XVXppbLLQ
 LtWRhoSMx93GCmUFBymNB8/aWXEzBEIYRTam4TRQqA==
X-Google-Smtp-Source: ABdhPJyGHg7pzS0hejsylQTRq/KbshJeBY747RjvdABUqcwVlbZBxy0liBFxJXm6e5w3U9vj0KJv+6WpvTei0kthD/8=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2860328oie.193.1647553069283; Thu, 17
 Mar 2022 14:37:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:37:48 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-6-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-6-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:37:48 -0400
Message-ID: <CAE-0n50dmA0ETgNvaBGs+XmGu+r=6RbfbmnHqXAFqUBGjVGDvg@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 5/9] drm/msm/dp: Add eDP support via
 aux_bus
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, quic_khsieh@quicinc.com, robdclark@gmail.com,
 agross@kernel.org, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, thierry.reding@gmail.com, krzk+dt@kernel.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-03-16 10:35:50)
>         This patch adds support for generic eDP sink through aux_bus.

Please unindent commit text paragraphs. This isn't a book.

> The eDP/DP controller driver should support aux transactions originating
> from the panel-edp driver and hence should be initialized and ready.
>
>         The panel bridge supporting the panel should be ready before
> the bridge connector is initialized. The generic panel probe needs the
> controller resources to be enabled to support aux tractions originating

s/tractions/transactions/

> from it. So, the host_init and phy_init are moved to execute before the
> panel probe.
>
>         The host_init has to return early if the core is already
> initialized so that the regulator and clock votes for the controller
> resources are balanced.
>
>         EV_HPD_INIT_SETUP needs to execute immediately to enable the
> interrupts for the aux transactions from panel-edp to get the modes
> supported.

There are a lot of things going on in this patch. Can it be split up?

>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 65 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 10 +++---
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 21 +-----------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
>  4 files changed, 70 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 382b3aa..688bbed 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -10,6 +10,7 @@
>  #include <linux/component.h>
>  #include <linux/of_irq.h>
>  #include <linux/delay.h>
> +#include <drm/drm_dp_aux_bus.h>
>
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> @@ -265,8 +266,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>                 goto end;
>         }
>
> -       dp->dp_display.next_bridge = dp->parser->next_bridge;
> -
>         dp->aux->drm_dev = drm;
>         rc = dp_aux_register(dp->aux);
>         if (rc) {
> @@ -421,6 +420,11 @@ static void dp_display_host_init(struct dp_display_private *dp)
>                 dp->dp_display.connector_type, dp->core_initialized,
>                 dp->phy_initialized);
>
> +       if (dp->core_initialized) {
> +               DRM_DEBUG_DP("DP core already initialized\n");
> +               return;
> +       }
> +
>         dp_power_init(dp->power, false);
>         dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>         dp_aux_init(dp->aux);
> @@ -433,6 +437,11 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>                 dp->dp_display.connector_type, dp->core_initialized,
>                 dp->phy_initialized);
>
> +       if (!dp->core_initialized) {
> +               DRM_DEBUG_DP("DP core not initialized\n");
> +               return;
> +       }
> +
>         dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>         dp_aux_deinit(dp->aux);
>         dp_power_deinit(dp->power);
> @@ -1502,7 +1511,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp_hpd_event_setup(dp);
>
> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>  }
>
>  void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
> @@ -1524,6 +1533,52 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>         }
>  }
>
> +static int dp_display_get_next_bridge(struct msm_dp *dp)
> +{
> +       int rc = 0;

Drop initialization.

> +       struct dp_display_private *dp_priv;
> +       struct device_node *aux_bus;
> +       struct device *dev;
> +
> +       dp_priv = container_of(dp, struct dp_display_private, dp_display);
> +       dev = &dp_priv->pdev->dev;
> +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +
> +       if (aux_bus) {
> +               dp_display_host_init(dp_priv);
> +               dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +               enable_irq(dp_priv->irq);
> +               dp_display_host_phy_init(dp_priv);
> +
> +               devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
> +
> +               disable_irq(dp_priv->irq);

Why do we disable irq?

> +       }

The aux_bus node leaked.

> +
> +       /*
> +        * External bridges are mandatory for eDP interfaces: one has to
> +        * provide at least an eDP panel (which gets wrapped into panel-bridge).
> +        *
> +        * For DisplayPort interfaces external bridges are optional, so
> +        * silently ignore an error if one is not present (-ENODEV).
> +        */
> +       rc = dp_parser_find_next_bridge(dp_priv->parser);
> +       if (rc == -ENODEV) {
> +               if (dp->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +                       DRM_ERROR("eDP: next bridge is not present\n");
> +                       return rc;
> +               }
> +       } else if (rc) {
> +               if (rc != -EPROBE_DEFER)
> +                       DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> +               return rc;
> +       }
> +
> +       dp->next_bridge = dp_priv->parser->next_bridge;
> +
> +       return 0;
> +}
> +
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder)
>  {
> @@ -1547,6 +1602,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>
>         dp_display->encoder = encoder;
>
> +       ret = dp_display_get_next_bridge(dp_display);

Didn't we just move bridge attachment out of modeset? Why is it being
done here?

> +       if (ret)
> +               return ret;
> +
>         dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
>         if (IS_ERR(dp_display->bridge)) {
>                 ret = PTR_ERR(dp_display->bridge);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 7ce1aca..5254bd6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>         bridge->funcs = &dp_bridge_ops;
>         bridge->type = dp_display->connector_type;
>
> -       bridge->ops =
> -               DRM_BRIDGE_OP_DETECT |
> -               DRM_BRIDGE_OP_HPD |
> -               DRM_BRIDGE_OP_MODES;
> +       if (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {

Why can't eDP have bridge ops that are the same?

> +               bridge->ops =
> +                       DRM_BRIDGE_OP_DETECT |
> +                       DRM_BRIDGE_OP_HPD |
> +                       DRM_BRIDGE_OP_MODES;
> +       }
>
>         rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>         if (rc) {
