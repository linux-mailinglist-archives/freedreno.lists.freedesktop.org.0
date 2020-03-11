Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D251818FB
	for <lists+freedreno@lfdr.de>; Wed, 11 Mar 2020 14:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0916E429;
	Wed, 11 Mar 2020 13:00:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447A76E429
 for <freedreno@lists.freedesktop.org>; Wed, 11 Mar 2020 13:00:41 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d15so1793254iog.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Mar 2020 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ZEa/nMCWD+t7ib9776w9+LOW88a3JOxImBj1mi9OJWk=;
 b=f7g1jWMDgv1y0pT/u2ukE8zfZ6reXKlxrVkQOUBEaN8wmsZzImanT1IeCY2BRz8C4T
 +WPF5a2mcJNR/I87mBiVuo1UPX4c2fDvfiXf4NQFNYw7TKM2FrkMAij6DYjWy4angVMq
 gxe05duKjDgiFzr67UUmN+XZ5FGcewp5M0j8B4iDTDCyAM+wDP4BsF/Pi/VFeUVZAfw6
 214vvvfdOdBjeWvGho8vLHALV16LUyLOntfhobybp3O33z0h4CovmOcfPHKY2bK6FxHh
 csYsEdqzbjDx8MjA3dqFsgk9tdh6NWQAGcV1ESP1hps9d3xVfJLxgeN/fwyei4mVlB1M
 BO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ZEa/nMCWD+t7ib9776w9+LOW88a3JOxImBj1mi9OJWk=;
 b=XN5s+KOWIQEEs17awxJfvbIYtxjwYQ4Y/1lUtHu788+aiUdQJ5mYM1Ex/hVFZDd2Br
 /n64YDjRdXdvz47XDKb5R1VixXVGBk4xLTU4m18y1wfrEu9zP4nYDimDp+Ds2LJJuNEi
 iYL9lH0GQBv1yiTCIAcAs6NpVw7srrwSM4DjK4BU1GWRGZg9U14sf8pYgFozS8dOYoqp
 l9sj+Z8BJeQaaPeeCnL8ClRx/A0OZqlz+zkFD7gFN2OTGZoUTjor7hzACWXu8yvOWNa3
 kPkcwOgkKD2hiEfyWt5fHqy876iFZyjKnWm/TIhsgY5baVvKbBo+4WvqYKeqOrbnrngc
 y2OA==
X-Gm-Message-State: ANhLgQ2CtrdoGV/y9omfBLt+4Q6tWYMnGNgl1wMZzzzjopDksoKik+H4
 bP4gAgVBLeiCLmLjKJhT6jhzchu2TWmplOWHx7lBDjR/MiM=
X-Google-Smtp-Source: ADFU+vt7bx+L3/cw3bQkL/0D8vB0+9uzZY8UK3LWOOF2WQPEcTkDd6GAPNkgfROWwHjxGGoi0bNy0oZZYqT78NAoS4U=
X-Received: by 2002:a02:962e:: with SMTP id c43mr2966602jai.26.1583931639248; 
 Wed, 11 Mar 2020 06:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.5.1583928002.8150.freedreno@lists.freedesktop.org>
In-Reply-To: <mailman.5.1583928002.8150.freedreno@lists.freedesktop.org>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Wed, 11 Mar 2020 18:30:27 +0530
Message-ID: <CAGWqDJ431+77PXvwvUfKvzMU+6zFwEQc1cmbro6wFcP030dz2g@mail.gmail.com>
To: "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] Freedreno Digest, Vol 73, Issue 27
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 5:30 PM <freedreno-request@lists.freedesktop.org> wrote:
>
> Send Freedreno mailing list submissions to
>         freedreno@lists.freedesktop.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.freedesktop.org/mailman/listinfo/freedreno
> or, via email, send a message with subject or body 'help' to
>         freedreno-request@lists.freedesktop.org
>
> You can reach the person managing the list at
>         freedreno-owner@lists.freedesktop.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Freedreno digest..."
>
>
> Today's Topics:
>
>    1. [PATCH v6 0/2] Add support for rm69299 Visionox panel driver
>       and add devicetree bindings for visionox panel (Harigovindan P)
>    2. [PATCH v6 2/2] drm/panel: add support for rm69299 visionox
>       panel driver (Harigovindan P)
>    3. [PATCH v6 1/2] dt-bindings: display: add visionox rm69299
>       panel variant (Harigovindan P)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Wed, 11 Mar 2020 14:28:05 +0530
> From: Harigovindan P <harigovi@codeaurora.org>
> To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
>         freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
> Cc: Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
>         seanpaul@chromium.org, sean@poorly.run
> Subject: [Freedreno] [PATCH v6 0/2] Add support for rm69299 Visionox
>         panel driver and add devicetree bindings for visionox panel
> Message-ID: <20200311085807.21984-1-harigovi@codeaurora.org>
>
> Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
>
> Harigovindan P (2):
>   dt-bindings: display: add visionox rm69299 panel variant
>   drm/panel: add support for rm69299 visionox panel driver
>
>  .../display/panel/visionox,rm69299.yaml       |  77 +++++
>  drivers/gpu/drm/panel/Kconfig                 |   8 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-rm69299.c    | 295 ++++++++++++++++++
>  4 files changed, 381 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 2
> Date: Wed, 11 Mar 2020 14:28:07 +0530
> From: Harigovindan P <harigovi@codeaurora.org>
> To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
>         freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
> Cc: Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
>         seanpaul@chromium.org, sean@poorly.run
> Subject: [Freedreno] [PATCH v6 2/2] drm/panel: add support for rm69299
>         visionox panel driver
> Message-ID: <20200311085807.21984-3-harigovi@codeaurora.org>
>
> Add support for Visionox panel driver.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v2:
>         - Dropping redundant space in Kconfig(Sam Ravnborg).
>         - Changing structure for include files(Sam Ravnborg).
>         - Removing backlight related code and functions(Sam Ravnborg).
>         - Removing repeated printing of error message(Sam Ravnborg).
>         - Adding drm_connector as an argument for get_modes function.
> Changes in v3:
>         - Adding arguments for drm_panel_init to support against mainline.
> Changes in v4:
>         - Removing error messages from regulator_set_load.
>         - Removing dev struct entry.
>         - Removing checks.
>         - Dropping empty comment lines.
> Changes in v5:
>         - Removing unused struct member variables.
>         - Removing blank lines.
>         - Fixed indentation.
>         - Invoking dsi_detach and panel_remove while early exiting from probe.
> Changes in v6:
>         - Changed "35597" to "rm69299" for power_on function.
>         - Removing rm69299_config since it supports single type of panel for now.
>         - Fixed alignment.
>         - Using goto statements when regulator_set_load fails.
>
>  drivers/gpu/drm/panel/Kconfig                 |   8 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-rm69299.c    | 295 ++++++++++++++++++
>  3 files changed, 304 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ae44ac2ec106..7b696f304a99 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -389,6 +389,14 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
>           Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
>           Video Mode panel
>
> +config DRM_PANEL_VISIONOX_RM69299
> +       tristate "Visionox RM69299"
> +       depends on OF
> +       depends on DRM_MIPI_DSI
> +       help
> +         Say Y here if you want to enable support for Visionox
> +         RM69299  DSI Video Mode panel.
> +
>  config DRM_PANEL_XINPENG_XPP055C272
>         tristate "Xinpeng XPP055C272 panel driver"
>         depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 7c4d3c581fd4..9f11d067a6b2 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -41,4 +41,5 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..b226723a7543
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
2020
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
This should be in Alphabetic order.
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +struct visionox_rm69299 {
> +       struct drm_panel panel;
> +       struct regulator_bulk_data supplies[2];
> +       struct gpio_desc *reset_gpio;
> +       struct mipi_dsi_device *dsi;
> +       bool prepared;
> +       bool enabled;
> +};
> +
> +static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
> +{
> +       return container_of(panel, struct visionox_rm69299, panel);
> +}
> +
> +static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
> +{
> +       int ret;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * Reset sequence of visionox panel requires the panel to be
> +        * out of reset for 10ms, followed by being held in reset
> +        * for 10ms and then out again
> +        */
> +       gpiod_set_value(ctx->reset_gpio, 1);
> +       usleep_range(10000, 20000);
> +       gpiod_set_value(ctx->reset_gpio, 0);
> +       usleep_range(10000, 20000);
> +       gpiod_set_value(ctx->reset_gpio, 1);
> +       usleep_range(10000, 20000);
> +
> +       return 0;
> +}
> +
> +static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
> +{
> +       gpiod_set_value(ctx->reset_gpio, 0);
> +
> +       return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +}
> +
> +static int visionox_rm69299_unprepare(struct drm_panel *panel)
> +{
> +       struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +       int ret;
> +
> +       ctx->dsi->mode_flags = 0;
> +
> +       ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(ctx->panel.dev,
> +                       "set_display_off cmd failed ret = %d\n", ret);
> +
> +       /* 120ms delay required here as per DCS spec */
> +       msleep(120);
> +
> +       ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->panel.dev,
> +                       "enter_sleep cmd failed ret = %d\n", ret);
> +       }
> +
> +       ret = visionox_rm69299_power_off(ctx);
> +
> +       ctx->prepared = false;
> +       return ret;
> +}
> +
> +static int visionox_rm69299_prepare(struct drm_panel *panel)
> +{
> +       struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +       int ret;
> +
> +       if (ctx->prepared)
> +               return 0;
> +
> +       ret = visionox_rm69299_power_on(ctx);
> +       if (ret < 0)
> +               return ret;
> +
> +       ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +       ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 }, 2);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->panel.dev,
> +                       "cmd set tx 0 failed, ret = %d\n", ret);
> +               goto power_off;
> +       }
> +
> +       ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 }, 2);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->panel.dev,
> +                       "cmd set tx 1 failed, ret = %d\n", ret);
> +               goto power_off;
> +       }
> +
> +       ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 }, 2);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->panel.dev,
> +                       "cmd set tx 2 failed, ret = %d\n", ret);
> +               goto power_off;
> +       }
> +
> +       ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff }, 2);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->panel.dev,
> +                       "cmd set tx 3 failed, ret = %d\n", ret);
> +               goto power_off;
> +       }
> +
> +       ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->panel.dev,
> +                       "exit_sleep_mode cmd failed ret = %d\n", ret);
> +               goto power_off;
> +       }
> +
> +       /* Per DSI spec wait 120ms after sending exit sleep DCS command */
> +       msleep(120);
> +
> +       ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(ctx->panel.dev,
> +                       "set_display_on cmd failed ret = %d\n", ret);
> +               goto power_off;
> +       }
> +
> +       /* Per DSI spec wait 120ms after sending set_display_on DCS command */
> +       msleep(120);
> +
> +       ctx->prepared = true;
> +
> +       return 0;
> +
> +power_off:
> +       return ret;
> +}
> +
> +static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
> +        .name = "1080x2248",
> +        .clock = 158695,
> +        .hdisplay = 1080,
> +        .hsync_start = 1080 + 26,
> +        .hsync_end = 1080 + 26 + 2,
> +        .htotal = 1080 + 26 + 2 + 36,
> +        .vdisplay = 2248,
> +        .vsync_start = 2248 + 56,
> +        .vsync_end = 2248 + 56 + 4,
> +        .vtotal = 2248 + 56 + 4 + 4,
> +        .vrefresh = 60,
> +        .flags = 0,
> +};
> +
> +static int visionox_rm69299_get_modes(struct drm_panel *panel,
> +                                      struct drm_connector *connector)
> +{
> +       struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +       struct drm_display_mode *mode;
> +
> +       mode = drm_mode_create(connector->dev);
> +       if (!mode) {
> +               DRM_DEV_ERROR(ctx->dev,
> +                       "failed to create a new display mode\n");
> +               return 0;
> +       }
> +
> +       connector->display_info.width_mm = 74;
> +       connector->display_info.height_mm = 131;
> +       drm_mode_copy(mode, &visionox_rm69299_1080x2248_60hz);
> +       mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +       drm_mode_probed_add(connector, mode);
> +
> +       return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_rm69299_drm_funcs = {
> +       .unprepare = visionox_rm69299_unprepare,
> +       .prepare = visionox_rm69299_prepare,
> +       .get_modes = visionox_rm69299_get_modes,
> +};
> +
> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct device *dev = &dsi->dev;
> +       struct visionox_rm69299 *ctx;
> +       int ret;
> +
> +       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       mipi_dsi_set_drvdata(dsi, ctx);
> +
> +       ctx->supplies[0].supply = "vdda";
> +       ctx->supplies[1].supply = "vdd3p3";
rather than hadcoding here, static const char * constregulator_names
> +
> +       ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
> +                                     ctx->supplies);
> +       if (ret < 0)
> +               return ret;
> +
> +       ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(ctx->reset_gpio)) {
> +               DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +                       PTR_ERR(ctx->reset_gpio));
ret = PTR_ERR(ctx->reset_gpio);
return ret;
> +               return PTR_ERR(ctx->reset_gpio);
> +       }
> +
> +       drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
> +                      DRM_MODE_CONNECTOR_DSI);
> +       ctx->panel.dev = dev;
> +       ctx->panel.funcs = &visionox_rm69299_drm_funcs;
> +       drm_panel_add(&ctx->panel);
> +
> +       dsi->lanes = 4;
> +       dsi->format = MIPI_DSI_FMT_RGB888;
> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +               MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +       ret = mipi_dsi_attach(dsi);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "dsi attach failed ret = %d\n", ret);
> +               goto err_dsi_attach;
> +       }
> +
> +       ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> +       if (ret) {
> +               mipi_dsi_detach(dsi);
> +               goto err_dsi_attach;
> +       }
> +
> +       ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +       if (ret) {
> +               mipi_dsi_detach(dsi);
> +               goto err_dsi_attach;
> +       }
> +
> +       return 0;
> +
> +err_dsi_attach:
> +       drm_panel_remove(&ctx->panel);
> +       return ret;
> +}
> +
> +static int visionox_rm69299_remove(struct mipi_dsi_device *dsi)
> +{
> +       struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +       mipi_dsi_detach(ctx->dsi);
> +       mipi_dsi_device_unregister(ctx->dsi);
> +
> +       drm_panel_remove(&ctx->panel);
> +       return 0;
> +}
> +
> +static const struct of_device_id visionox_rm69299_of_match[] = {
> +       {
> +               .compatible = "visionox,rm69299-1080p-display",
> +       },
> +};
> +MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
> +
> +static struct mipi_dsi_driver visionox_rm69299_driver = {
> +       .driver = {
> +               .name = "panel-visionox-rm69299",
> +               .of_match_table = visionox_rm69299_of_match,
> +       },
> +       .probe = visionox_rm69299_probe,
> +       .remove = visionox_rm69299_remove,
> +};
> +module_mipi_dsi_driver(visionox_rm69299_driver);
> +
> +MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
> +MODULE_LICENSE("GPL v2");
> +
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 3
> Date: Wed, 11 Mar 2020 14:28:06 +0530
> From: Harigovindan P <harigovi@codeaurora.org>
> To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
>         freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
> Cc: Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
>         seanpaul@chromium.org, sean@poorly.run
> Subject: [Freedreno] [PATCH v6 1/2] dt-bindings: display: add visionox
>         rm69299 panel variant
> Message-ID: <20200311085807.21984-2-harigovi@codeaurora.org>
>
> Add bindings for visionox rm69299 panel.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v2:
>         - Removed unwanted properties from description.
>         - Creating source files without execute permissions(Rob Herring).
> Changes in v3:
>         - Changing txt file into yaml
> Changes in v4:
>         - Updating license identifier.
>         - Moving yaml file inside panel directory.
>         - Removing pinctrl entries.
>         - Adding documentation for reset-gpios.
> Changes in v5:
>         - No changes. Updated 2/2 Patch.
> Changes in v6:
>         - Removing patternProperties.
>         - Added " |" after description.
>         - Setting port and reset-gpios to true.
>         - Removing @ae94000 for dsi node.
>
>  .../display/panel/visionox,rm69299.yaml       | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100644
> index 000000000000..18854cc7d99e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Visionox model RM69299 Panels Device Tree Bindings.
> +
> +maintainers:
> + - Harigovindan P <harigovi@codeaurora.org>
> +
> +description: |
> + This binding is for display panels using a Visionox RM692999 panel.
> +
> +allOf:
> + - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: visionox,rm69299-1080p-display
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdda supply voltage.
> +
> +  vdd3p3-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdd3p3 supply voltage.
> +
> +  ports:
> +    type: object
> +    description: |
> +      A node containing DSI input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +      properties:
> +        port: true
> +
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +- |
> +    dsi {
> +        panel@0 {
> +            compatible = "visionox,rm69299-1080p-display";
> +
> +            vdda-supply = <&src_pp1800_l8c>;
> +            vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +            reset-gpios = <&pm6150l_gpio 3 0>;
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                            reg = <0>;
> +                            panel0_in: endpoint {
> +                                remote-endpoint = <&dsi0_out>;
> +                            };
> +                    };
> +            };
> +        };
> +    };
> +...
> +
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
>
>
> ------------------------------
>
> End of Freedreno Digest, Vol 73, Issue 27
> *****************************************



-- 
regards,
vinaysimha
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
