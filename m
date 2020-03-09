Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535EB17E54F
	for <lists+freedreno@lfdr.de>; Mon,  9 Mar 2020 18:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACECA6E086;
	Mon,  9 Mar 2020 17:05:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E7E6E067
 for <freedreno@lists.freedesktop.org>; Mon,  9 Mar 2020 17:05:36 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a23so1528112plm.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2020 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TBjaSzT2srnKrAudJf1OGvf6fJmlAuZnL+/SoFFDeQs=;
 b=kuoQUG9aYByCTvr8FqB2wYmH5ZWs0lLVdIavrZWbjHpil2umTLSDyRhoq5YaiSW7EJ
 YReXk56wyZmDIKCyFHGRFTLcey2OMhS+VLVsXxcZu9Jjf1oD4KAd2F2mpM0YZfbgascA
 TxkMxyE7t1M64pji+W/EOSRHinX2dNWBOt7Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TBjaSzT2srnKrAudJf1OGvf6fJmlAuZnL+/SoFFDeQs=;
 b=MF5WYqcvBgqQiJO20dfe5v/ikZ+wxaOqkiPj9tBWGctIWEuiuC8T0S84Evi7LRuPE6
 PFce1GVkjsdL8fzJbqbRPkEsac0zXyEuvsQe/eJVpbLvX4NZKKjASd3Tj/9lRRkR6gYm
 rDO2wBPQtBE39chEVN6dPi2seZJWT7Grnzbd3f4J0kwhuBXY9fSLcgOw7+KQ5wVyv26J
 zXuZipdBvI5W0SaoRrHRdzmmBGpll378gJKq/p4tjbokY1kvbV0yeeEJKcmPbYE2AV+/
 cw4XvrZqx2bMrHtNgseWgeoINSo4SAfoRnov/NN7aU0Q5sSx/q+CPokGYYyMex9zswn3
 047w==
X-Gm-Message-State: ANhLgQ2iTfhONKxa447zH4J/E0b7OWfcNLRNm4jgxbdyH96/DYM3OxAm
 eU1VYpqwpcLfT56L0XLCL2tUMw==
X-Google-Smtp-Source: ADFU+vs3ZXRlDpRJrpqXVwgbR3EMTeT2/174EW+zDgms5nXB95GCrTzl98LeDLcAvE3Fy/GQtfkY5g==
X-Received: by 2002:a17:902:401:: with SMTP id
 1mr16507578ple.177.1583773535780; 
 Mon, 09 Mar 2020 10:05:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id i187sm5032740pfg.33.2020.03.09.10.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 10:05:34 -0700 (PDT)
Date: Mon, 9 Mar 2020 10:05:32 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Message-ID: <20200309170532.GW24720@google.com>
References: <20200309052304.23427-1-harigovi@codeaurora.org>
 <20200309052304.23427-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309052304.23427-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH v5 2/2] drm/panel: add support for rm69299
 visionox panel driver
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 09, 2020 at 10:53:04AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Dropping redundant space in Kconfig(Sam Ravnborg).
> 	- Changing structure for include files(Sam Ravnborg).
> 	- Removing backlight related code and functions(Sam Ravnborg).
> 	- Removing repeated printing of error message(Sam Ravnborg).
> 	- Adding drm_connector as an argument for get_modes function.
> Changes in v3:
> 	- Adding arguments for drm_panel_init to support against mainline.
> Changes in v4:
> 	- Removing error messages from regulator_set_load.
> 	- Removing dev struct entry.
> 	- Removing checks.
> 	- Dropping empty comment lines.
> Changes in v5:
> 	- Removing unused struct member variables.
> 	- Removing blank lines.
> 	- Fixed indentation.
> 	- Invoking dsi_detach and panel_remove while early exiting from probe.
> 
>  drivers/gpu/drm/panel/Kconfig                 |   8 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-rm69299.c    | 315 ++++++++++++++++++
>  3 files changed, 324 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> ...
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..2bd3af46d933
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> ...
>
> +static int visionox_35597_power_on(struct visionox_rm69299 *ctx)
> +{

s/35597/rm69299/ ?

> +static const struct rm69299_config rm69299_dir = {
> +	.width_mm = 74,
> +	.height_mm = 131,
> +	.dm = &visionox_rm69299_1080x2248_60hz,
> +};

Are there actually variants of the panel with different sizes? So far the
driver supports a single type of panel, so I would say struct rm69299_config
is not needed. It can be added later if the driver ever gets support for
other panel variants. For now just assign the values directly in
'visionox_rm69299_get_modes'.

> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_rm69299 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->supplies[0].supply = "vdda";
> +	ctx->supplies[1].supply = "vdd3p3";
> +
> +	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
> +								ctx->supplies);

nit: alignment is odd, either align with a tab after 'devm_regulator_bulk_get'
or with 'ctx->panel.dev'.

> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +			PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.dev = dev;
> +	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
> +	drm_panel_add(&ctx->panel);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +		MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "dsi attach failed ret = %d\n", ret);
> +		goto err_dsi_attach;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		drm_panel_remove(&ctx->panel);

that's technically correct, but since you have the 'goto' above and do the
same unwinding for the other 'regulator_set_load' call below it would be
better to use a 'goto' here (and below) too. Actually the 'goto' above only
makes sense if 'goto' is also used for the other cases.

> +		return ret;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_dsi_attach:
> +	drm_panel_remove(&ctx->panel);
> +	return ret;
> +}
> +
> +static int visionox_rm69299_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(ctx->dsi);
> +	mipi_dsi_device_unregister(ctx->dsi);
> +
> +	drm_panel_remove(&ctx->panel);
> +	return 0;
> +}
> +
> +static const struct of_device_id visionox_rm69299_of_match[] = {
> +	{
> +		.compatible = "visionox,rm69299-1080p-display",
> +		.data = &rm69299_dir,
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
> +
> +static struct mipi_dsi_driver visionox_rm69299_driver = {
> +	.driver = {
> +		.name = "panel-visionox-rm69299",
> +		.of_match_table = visionox_rm69299_of_match,
> +	},
> +	.probe = visionox_rm69299_probe,
> +	.remove = visionox_rm69299_remove,
> +};
> +module_mipi_dsi_driver(visionox_rm69299_driver);
> +
> +MODULE_DESCRIPTION("VISIONOX RM69299 DSI Panel Driver");

As commented on v4, this should be 'Visionox'.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
