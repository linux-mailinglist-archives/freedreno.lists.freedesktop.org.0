Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBDD6B03EA
	for <lists+freedreno@lfdr.de>; Wed,  8 Mar 2023 11:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0155010E665;
	Wed,  8 Mar 2023 10:20:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1610E665;
 Wed,  8 Mar 2023 10:20:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5165616FD;
 Wed,  8 Mar 2023 10:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DF2C433D2;
 Wed,  8 Mar 2023 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678270847;
 bh=dYw3bdt8OjkT1450pHMtn1/VHR8mYUBh6b33Wlzd3XQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFEL2qBiZBurw4QDN9H95DGzJWDBWsf9UdBA2S/YKVnvXd0M7FCQgvFjGO69Dks6H
 EcRYmvLx1nCsWAErtohgslo3ST41Uy7bEwZS7rImsNYHWWf4l5Sn/3OSnfeP+xp9cV
 kGUt+e9jBgsWhF+c6NwwovRSEq49ioFeKAXjQ4z2kmwgamea630Ge2E0PZ7ZaJfNDf
 nEaZq4SOgWb1sB6iO7QIsxlw1XCF9Z0v+jDZPvVNCcJIXHrA/SoSRp/bO9qwz4j2qC
 FNLYRH8UiyMg8RHwuuPy3l/JFbpJPPuJnqm1a0QIhP3GS/z75Bl1HrudJOeUJqmvQ7
 zKxys6vO/s5IA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pZqvM-0005Xx-0H; Wed, 08 Mar 2023 11:21:32 +0100
Date: Wed, 8 Mar 2023 11:21:32 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ZAhhrG6CliC83Oxr@hovoldconsulting.com>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20221102180705.459294-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102180705.459294-6-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 5/7] drm/msm/hdmi: stop using
 drm_bridge_connector_en/disable_hpd()
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomba@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Clark <robdclark@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-msm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 09:07:03PM +0300, Dmitry Baryshkov wrote:
> The functionality of drm_bridge_connector_enable_hpd() and
> drm_bridge_connector_disable_hpd() is provided automatically by the
> drm_kms_poll helpers. Stop calling these functions manually.

I stumbled over this one when investigating a hotplug-related crash in
the MSM DRM driver which this series prevents by moving hotplug
notification enable to drm_kms_helper_poll_enable().

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 93fe61b86967..a540c45d4fd3 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>  		goto fail;
>  	}
>  
> -	drm_bridge_connector_enable_hpd(hdmi->connector);
> -
>  	ret = msm_hdmi_hpd_enable(hdmi->bridge);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);

It looks like you are now enabling hotplug events before the DRM driver
is ready to receive them (i.e. msm_hdmi_hpd_enable() is called before
drm_bridge_connector_enable_hpd()).

Could this not lead to missed events or is the state being setup
correctly somewhere else?

Shouldn't the call to msm_hdmi_hpd_enable() be moved to when HPD is
enabled either way (e.g. by being converted to a hpd_enable callback)?

Johan
