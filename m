Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642386041C
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 21:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F76F10EA7B;
	Thu, 22 Feb 2024 20:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aVb7FvfS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFCD10EA39
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 20:57:19 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-607f94d0b7cso2187137b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 12:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708635438; x=1709240238; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OlJfxZ2HGOqHH+yFuLajdP34OkZJP17T5eZUptvz6hk=;
 b=aVb7FvfSQr+13lW1UztWi2+PWm91ex7cogM35Hz2dZbFD33l9JRumpSa6oLO9bl6tg
 Lj3fT1tPO8YOEsFXXhn7jLWQ2c4ZJNC6QDQKITrX7eSz7EHkDrAsqiIjV6OzEB3f84s9
 uEQKGM/udDckddd7fawK0zXeYAhW7dZBF2/wN3VoMtTR0BH7rOqykVOk5NB8IQ/WTI0S
 lNOdgA1yeZ1bFfe1lxsGaNZ1SItAx7lwqB+xIuo3lIZFkz7UFLSlO3qnI/5aaY7MzM+m
 4jZAGYvzJCZERmVlR43LVASOrU4w2KW7VH3d2ySSQlPYkLmGoJLAHPkGjaJ3ZDWkZ58j
 27Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708635438; x=1709240238;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OlJfxZ2HGOqHH+yFuLajdP34OkZJP17T5eZUptvz6hk=;
 b=juSBlmDFqSAv7Tmga6KP1cEJ61H7JfFeoD6YQWZ/fhWHAQwswtmi5XLIhLjvqfQoSi
 HoTevjtMcTp8Sz8cixzlyKbHeEiQcCXZ1B90VDQjO3DqPg7qgUojEHSHSdBmXGDIqEiz
 V8RO2/Rt1a8zRVLWhYYlfzy4TLgwHp9nYVG8V9vChHavyJcwvS2kq2JPoht9meh1xTdM
 9zfmJ1IYl6WHv6fQjLe/prBdfybzXszM73fBiXYpyl6ld6yD2+2PTvtXiSvsuOE4nx0r
 QYdDTrikloSb39pP4chnUNO15yF24NPMJFyOT0HMYLVmmBTvvMrq/l9xIq9hKDZvlm+z
 Scvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF6U0JYqiU1XhzFU4PP66tGSk+O0J7iJLLHV2ysJmcJsgi7wBqFUD2E4n9sqIVhKkZs2fVdGcA498XLhBUh+IBBFGbKwsioE9L9tD9QoOv
X-Gm-Message-State: AOJu0Ywelc+KvoANfWOrm0Xie0v/oXteVL8LHqRDkNL+ZJOVdm+Df+ez
 B5ew9fvTQTZhXcqmK8cSGvXjjSDQh6BG+gknYGExNkQIAuxQQUCiHr6Vzx2P4zeLovAzvsqWJzZ
 5E+YV3n9IxpCibeDg5mUO2HOv8EtJiM6uDp1PSw==
X-Google-Smtp-Source: AGHT+IF9m9jtm1VhqusuJFTiM5ycZ++n/P7+1F1EuJXuTvXHhKSiWFPXHEQ5HDRo4FRo3P5x6Rtq6q/o2h0aRnvCjLo=
X-Received: by 2002:a25:1589:0:b0:dcd:b624:3e55 with SMTP id
 131-20020a251589000000b00dcdb6243e55mr261141ybv.54.1708635438473; Thu, 22 Feb
 2024 12:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-3-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-3-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 22:57:07 +0200
Message-ID: <CAA8EJpoxe8BmyFqMC5yrqdx-Sx2VR_2gT3x6WT9MyhdLuw+xmA@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/bridge: aux-hpd: separate allocation and
 registration
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Combining allocation and registration is an anti-pattern that should be
> avoided. Add two new functions for allocating and registering an dp-hpd
> bridge with a proper 'devm' prefix so that it is clear that these are
> device managed interfaces.
>
>         devm_drm_dp_hpd_bridge_alloc()
>         devm_drm_dp_hpd_bridge_add()
>
> The new interface will be used to fix a use-after-free bug in the
> Qualcomm PMIC GLINK driver and may prevent similar issues from being
> introduced elsewhere.
>
> The existing drm_dp_hpd_bridge_register() is reimplemented using the
> above and left in place for now.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> ---
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c | 67 +++++++++++++++++++------
>  include/drm/bridge/aux-bridge.h         | 15 ++++++
>  2 files changed, 67 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index 9e71daf95bde..6886db2d9e00 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -30,16 +30,13 @@ static void drm_aux_hpd_bridge_release(struct device *dev)
>         kfree(adev);
>  }
>
> -static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
> +static void drm_aux_hpd_bridge_free_adev(void *_adev)
>  {
> -       struct auxiliary_device *adev = _adev;
> -
> -       auxiliary_device_delete(adev);
> -       auxiliary_device_uninit(adev);
> +       auxiliary_device_uninit(_adev);
>  }
>
>  /**
> - * drm_dp_hpd_bridge_register - Create a simple HPD DisplayPort bridge
> + * devm_drm_dp_hpd_bridge_alloc - allocate a HPD DisplayPort bridge
>   * @parent: device instance providing this bridge
>   * @np: device node pointer corresponding to this bridge instance
>   *
> @@ -47,11 +44,9 @@ static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
>   * DRM_MODE_CONNECTOR_DisplayPort, which terminates the bridge chain and is
>   * able to send the HPD events.
>   *
> - * Return: device instance that will handle created bridge or an error code
> - * encoded into the pointer.
> + * Return: bridge auxiliary device pointer or an error pointer
>   */
> -struct device *drm_dp_hpd_bridge_register(struct device *parent,
> -                                         struct device_node *np)
> +struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np)
>  {
>         struct auxiliary_device *adev;
>         int ret;
> @@ -82,13 +77,55 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
>                 return ERR_PTR(ret);
>         }
>
> -       ret = auxiliary_device_add(adev);
> -       if (ret) {
> -               auxiliary_device_uninit(adev);
> +       ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_free_adev, adev);
> +       if (ret)
>                 return ERR_PTR(ret);
> -       }
>
> -       ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_unregister_adev, adev);
> +       return adev;
> +}
> +EXPORT_SYMBOL_GPL(devm_drm_dp_hpd_bridge_alloc);
> +
> +static void drm_aux_hpd_bridge_del_adev(void *_adev)
> +{
> +       auxiliary_device_delete(_adev);
> +}
> +
> +/**
> + * devm_drm_dp_hpd_bridge_add - register a HDP DisplayPort bridge
> + * @dev: struct device to tie registration lifetime to
> + * @adev: bridge auxiliary device to be registered
> + *
> + * Returns: zero on success or a negative errno
> + */
> +int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev)
> +{
> +       int ret;
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret)
> +               return ret;
> +
> +       return devm_add_action_or_reset(dev, drm_aux_hpd_bridge_del_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(devm_drm_dp_hpd_bridge_add);
> +
> +/**
> + * drm_dp_hpd_bridge_register - allocate and register a HDP DisplayPort bridge
> + * @parent: device instance providing this bridge
> + * @np: device node pointer corresponding to this bridge instance
> + *
> + * Return: device instance that will handle created bridge or an error pointer
> + */
> +struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_node *np)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = devm_drm_dp_hpd_bridge_alloc(parent, np);
> +       if (IS_ERR(adev))
> +               return ERR_CAST(adev);
> +
> +       ret = devm_drm_dp_hpd_bridge_add(parent, adev);
>         if (ret)
>                 return ERR_PTR(ret);
>
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> index c4c423e97f06..4453906105ca 100644
> --- a/include/drm/bridge/aux-bridge.h
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -9,6 +9,8 @@
>
>  #include <drm/drm_connector.h>
>
> +struct auxiliary_device;
> +
>  #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
>  int drm_aux_bridge_register(struct device *parent);
>  #else
> @@ -19,10 +21,23 @@ static inline int drm_aux_bridge_register(struct device *parent)
>  #endif
>
>  #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
> +struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np);
> +int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);

I had a pretty close idea during prototyping, but I ended up doing it
as a single function for the following reasons:

First, this exports the implementation detail that internally the code
uses an aux device.
Also, by exporting the aux device the code becomes less type-safe. By
mistake one can call devm_drm_dp_hpd_bridge_add() on any aux device,
which is not necessarily the HPD bridge.
I'd prefer to see an opaque device-specific structure instead. WDYT?

>  struct device *drm_dp_hpd_bridge_register(struct device *parent,
>                                           struct device_node *np);
>  void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
>  #else
> +static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
> +                                                                   struct device_node *np)
> +{
> +       return NULL;
> +}
> +
> +static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
> +{
> +       return 0;
> +}
> +
>  static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
>                                                         struct device_node *np)
>  {
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
