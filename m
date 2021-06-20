Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7F3ADDED
	for <lists+freedreno@lfdr.de>; Sun, 20 Jun 2021 12:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066AA6E0EE;
	Sun, 20 Jun 2021 10:01:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D006E0F1
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jun 2021 10:01:53 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 91aa8389-d1ae-11eb-960d-0050568c148b;
 Sun, 20 Jun 2021 10:02:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1BA2C194B1C;
 Sun, 20 Jun 2021 12:01:52 +0200 (CEST)
Date: Sun, 20 Jun 2021 12:01:47 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Message-ID: <20210620100147.GB703072@ravnborg.org>
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-6-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624099230-20899-6-git-send-email-rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v7 5/5] drm/panel-simple: Add Samsung ATNA33XC20
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 mkrishn@codeaurora.org, lyude@redhat.com, robh@kernel.org,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, a.hajda@samsung.com, robdclark@gmail.com,
 thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rajeev
On Sat, Jun 19, 2021 at 04:10:30PM +0530, Rajeev Nandan wrote:
> Add Samsung 13.3" FHD eDP AMOLED panel.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v4:
> - New
> 
> Changes in v5:
> - Remove "uses_dpcd_backlight" property, not required now. (Douglas)
> 
> Changes in v7:
> - Update disable_to_power_off and power_to_enable delays. (Douglas)
> 
>  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 86e5a45..4adc44a 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3562,6 +3562,36 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> +static const struct drm_display_mode samsung_atna33xc20_mode = {
> +	.clock = 138770,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 48,
> +	.hsync_end = 1920 + 48 + 32,
> +	.htotal = 1920 + 48 + 32 + 80,
> +	.vdisplay = 1080,
> +	.vsync_start = 1080 + 8,
> +	.vsync_end = 1080 + 8 + 8,
> +	.vtotal = 1080 + 8 + 8 + 16,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc samsung_atna33xc20 = {
> +	.modes = &samsung_atna33xc20_mode,
> +	.num_modes = 1,
> +	.bpc = 10,
> +	.size = {
> +		.width = 294,
> +		.height = 165,
> +	},
> +	.delay = {
> +		.disable_to_power_off = 200,
> +		.power_to_enable = 400,
> +		.hpd_absent_delay = 200,
> +		.unprepare = 500,
> +	},
> +	.connector_type = DRM_MODE_CONNECTOR_eDP,
> +};

bus_format is missing. There should be a warning about this when you
probe the display.

The bpc of 10 in unusual, the current code warns if bpc is neither 6 nor
8. If 10 is correct then update the code to accept bpc=10.

	Sam

> +
>  static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
>  	.clock = 271560,
>  	.hdisplay = 2560,
> @@ -4563,6 +4593,9 @@ static const struct of_device_id platform_of_match[] = {
>  		.compatible = "rocktech,rk101ii01d-ct",
>  		.data = &rocktech_rk101ii01d_ct,
>  	}, {
> +		.compatible = "samsung,atna33xc20",
> +		.data = &samsung_atna33xc20,
> +	}, {
>  		.compatible = "samsung,lsn122dl01-c01",
>  		.data = &samsung_lsn122dl01_c01,
>  	}, {
> -- 
> 2.7.4
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
