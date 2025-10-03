Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99295BB6CCA
	for <lists+freedreno@lfdr.de>; Fri, 03 Oct 2025 15:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D16810E909;
	Fri,  3 Oct 2025 13:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="1XfMc/+s";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2814C10E903
 for <freedreno@lists.freedesktop.org>; Fri,  3 Oct 2025 13:06:45 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-62fca216e4aso5238772a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 Oct 2025 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1759496804; x=1760101604; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rTsw8FQqrb2nqcQdlRq/vFC8jYXiw5cY+0H1krjWMx0=;
 b=1XfMc/+syk7Rvq2roOfs2cJUwxKsQcpeHY2jM6E7j1DolaSeR55vcIjhBKKBGCPjAT
 O5hKlIEwp44vfuJWOVDZzHpD1vVGg8TLlP/T/qnNGIedL7Ul3EnessBAaXeCnW2YEZWU
 PhZc2Dzf8GKWFuK2mZ3MIVD5P+JuldgcyecAavSXlwZMbl2lz0/gaSeT1mxh5iI7/BWY
 Sd4mNl5MQHSPhMmvnKtOVNqcMFsQx38iPL14LSj6AwEz+ZvpKq4OLM4lu4XUTTrKJ+BG
 WE/jDSR9MJ/WI9pOmuyc61QthOxgsSqAHe8dpsVa48ViDUV8eIi2VbMkM9NiydgBCwJn
 I78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759496804; x=1760101604;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rTsw8FQqrb2nqcQdlRq/vFC8jYXiw5cY+0H1krjWMx0=;
 b=cHwSfh+YDdE7muIcIdx46DPfvpChjFatm9Bntikdct+cUMNttKEAiy57IvPXXTnJAT
 Yr+N9C548c0Ngh17ffo4xxNW434+WUFObKIouUVMDveMU8vSDBtYJTYcp9u6IJUC8WN3
 U+IErbyG8UhmZh/M+TEXqmRK0K1CpmS7P6kQnIOIKF6E8tCM/w27/sRiZmljoMpa+kfh
 iHnzGhz1FOcuq42QLSaZsNAo/uNzlkjWQsMB3RG3pQSNNIGBsMT3uSVvIteKvOj5ATHp
 TlvuYZBFm+89IPqDX774GfS/ZwvjV8vVySDIrX0mYHq6bLj2lQxc56a5UwR/Vj4yrlp+
 1PCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJXyIuEKQe4M6LtWXSTAB2fGtn8wy/KEdcqmZnb1AuLyAKhIcHI9+qVgQa+V2439oKCcUEM5FB0w0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFHztz3OPrIiCjzOtg2UQgD+ccwr39R43sFef3NwOHzHP2vi+V
 MeF6qUhUTBrUEMPmEt7H8jq2bUDybM0d9ITAKB1fyXm++XyTd48GpQzqbgac0sXp/Is=
X-Gm-Gg: ASbGncscMcVCrskKZmfDRu8b416JjCSYf9z4G00bWfKSn7lNAzZbuqQLpJq4fTMl8gg
 SSTPTGC2uiVKOJ8P5SVFqgwcmleJc+JZA8BmuzQAHeq1Zkwh26+DOhOzzyiUSMXj75ANsdilvgd
 +1UKGYwy3zfw+WNG5JDZV/dixKJvG68UPVI/wD2EqjGkKSgKRVNzbd8hgFyLL57Qbp+lHdt6a0V
 iNjpf87hsUDTGVBDdc+SWrlGPzzmtcBX0wfYPq7VXeRaP4AlV5XDGGpTPaatzDVNrqXgE+LUgAi
 4DJXTCPkOyynRc5WBCvLPGr+hNGQcQcwxXsvSO9BSdoryHMD84fh+q7dRD3idSqMMq4csJIr8O2
 hM+YHnYyH9fLRqXcFctru+6ehNzVQuCMfIuAL3iPADS6dVUUlijpWrjpjM2e83QxW4Wsll9iVXU
 YP0Xiv4LHz0qiH1ia7
X-Google-Smtp-Source: AGHT+IHplfvenYzfVbg4nETjibYU1v1kIZ5DIKmlShg8BgN5nxW8TNolAQJsUmMvh6EVjKRsfMVbIQ==
X-Received: by 2002:a05:6402:944:b0:62f:453c:7235 with SMTP id
 4fb4d7f45d1cf-63787eb584bmr5330486a12.15.1759496803420; 
 Fri, 03 Oct 2025 06:06:43 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637881000c9sm4036203a12.31.2025.10.03.06.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 06:06:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 15:06:42 +0200
Message-Id: <DD8PK8AI24P7.YK0OGVYC0QFM@fairphone.com>
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robdclark@gmail.com>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Sean
 Paul" <sean@poorly.run>, "Marijn Suijten" <marijn.suijten@somainline.org>,
 "Hermes Wu" <Hermes.wu@ite.com.tw>, "Dmitry Baryshkov" <lumag@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
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

Hi Dmitry,

On Wed Apr 23, 2025 at 7:52 PM CEST, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
>
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.

A bit late, but it appears that since 6.16 kernel (incl. 6.17) DP audio
is broken on qcm6490-fairphone-fp5 (which is using the Elite audio
architecture, not Audioreach).

Git bisect is pointing to this patch:

  98a8920e7b07641eb1996b3c39b9ce27fc05dbb9 is the first bad commit
  commit 98a8920e7b07641eb1996b3c39b9ce27fc05dbb9
  Author: Dmitry Baryshkov <lumag@kernel.org>
  Date:   Fri May 2 01:41:42 2025 +0300

      drm/msm/dp: reuse generic HDMI codec implementation

It's specifically failing with these errors:

[  177.380809] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 fa=
iled -110
[  177.380851] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
fail to start AFE port 68
[  177.380865] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[  177.437004] qcom-q6afe aprsvc:service:4:4: cmd =3D 0x100e5 returned erro=
r =3D 0x9
[  177.437294] qcom-q6afe aprsvc:service:4:4: DSP returned error[9]
[  177.437312] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 fa=
iled -22
[  177.437332] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
fail to start AFE port 68
[  177.437343] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0

Do you have an idea?

Regards
Luca

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> support. Present DRM HDMI Audio support has been written with the HDMI
> and in particular DRM HDMI Connector framework support, however those
> audio helpers can be easily reused for DisplayPort drivers too.
>
> Patches by Hermes Wu that targeted implementing HDMI Audio support in
> the iTE IT6506 driver pointed out the necessity of allowing one to use
> generic audio helpers for DisplayPort drivers, as otherwise each driver
> has to manually (and correctly) implement the get_eld() and plugged_cb
> support.
>
> Implement necessary integration in drm_bridge_connector and provide an
> example implementation in the msm/dp driver.
> ---
> Changes in v7:
> - Dropped applied patches
> - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd22=
8fa73d7@oss.qualcomm.com
>
> Changes in v6:
> - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
>   callbacks to the drm_bridge interface (Maxime)
> - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be2=
15fdb78@linaro.org
>
> Changes in v5:
> - Rebased on top of linux-next, also handling HDMI audio piece of the
>   MSM HDMI driver.
> - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739=
daf28cc@linaro.org
>
> Changes in v4:
> - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
>   HDMI driver.
> - Drop outdated comment regarding subconnector from the commit message.
> - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900=
f034b40@linaro.org
>
> Changes in v3:
> - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
>   (Laurent, Maxime)
> - Dropped the subconnector patch (again)
> - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6=
ebf22ff@linaro.org
>
> Changes in v2:
> - Added drm_connector_attach_dp_subconnector_property() patches
> - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14=
a8c0d4d@linaro.org
> ---
>  drivers/gpu/drm/msm/Kconfig         |   1 +
>  drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------=
------
>  drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
>  drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
>  drivers/gpu/drm/msm/dp/dp_display.h |   6 --
>  drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
>  6 files changed, 31 insertions(+), 170 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 974bc7c0ea761147d3326bdce9039d6f26f290d0..7f127e2ae44292f8f5c7ff6a9=
251c3d7ec8c9f58 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -104,6 +104,7 @@ config DRM_MSM_DPU
>  config DRM_MSM_DP
>  	bool "Enable DisplayPort support in MSM DRM driver"
>  	depends on DRM_MSM
> +	select DRM_DISPLAY_HDMI_AUDIO_HELPER
>  	select RATIONAL
>  	default y
>  	help
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/d=
p_audio.c
> index 70fdc9fe228a7149546accd8479a9e4397f3d5dd..f8bfb908f9b4bf93ad5480f07=
85e3aed23dde160 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -13,13 +13,13 @@
> =20
>  #include "dp_catalog.h"
>  #include "dp_audio.h"
> +#include "dp_drm.h"
>  #include "dp_panel.h"
>  #include "dp_reg.h"
>  #include "dp_display.h"
>  #include "dp_utils.h"
> =20
>  struct msm_dp_audio_private {
> -	struct platform_device *audio_pdev;
>  	struct platform_device *pdev;
>  	struct drm_device *drm_dev;
>  	struct msm_dp_catalog *catalog;
> @@ -160,24 +160,11 @@ static void msm_dp_audio_enable(struct msm_dp_audio=
_private *audio, bool enable)
>  	msm_dp_catalog_audio_enable(catalog, enable);
>  }
> =20
> -static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platfor=
m_device *pdev)
> +static struct msm_dp_audio_private *msm_dp_audio_get_data(struct msm_dp =
*msm_dp_display)
>  {
>  	struct msm_dp_audio *msm_dp_audio;
> -	struct msm_dp *msm_dp_display;
> -
> -	if (!pdev) {
> -		DRM_ERROR("invalid input\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> -	if (!msm_dp_display) {
> -		DRM_ERROR("invalid input\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> =20
>  	msm_dp_audio =3D msm_dp_display->msm_dp_audio;
> -
>  	if (!msm_dp_audio) {
>  		DRM_ERROR("invalid msm_dp_audio data\n");
>  		return ERR_PTR(-EINVAL);
> @@ -186,68 +173,16 @@ static struct msm_dp_audio_private *msm_dp_audio_ge=
t_data(struct platform_device
>  	return container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_a=
udio);
>  }
> =20
> -static int msm_dp_audio_hook_plugged_cb(struct device *dev, void *data,
> -		hdmi_codec_plugged_cb fn,
> -		struct device *codec_dev)
> -{
> -
> -	struct platform_device *pdev;
> -	struct msm_dp *msm_dp_display;
> -
> -	pdev =3D to_platform_device(dev);
> -	if (!pdev) {
> -		pr_err("invalid input\n");
> -		return -ENODEV;
> -	}
> -
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> -	if (!msm_dp_display) {
> -		pr_err("invalid input\n");
> -		return -ENODEV;
> -	}
> -
> -	return msm_dp_display_set_plugged_cb(msm_dp_display, fn, codec_dev);
> -}
> -
> -static int msm_dp_audio_get_eld(struct device *dev,
> -	void *data, uint8_t *buf, size_t len)
> -{
> -	struct platform_device *pdev;
> -	struct msm_dp *msm_dp_display;
> -
> -	pdev =3D to_platform_device(dev);
> -
> -	if (!pdev) {
> -		DRM_ERROR("invalid input\n");
> -		return -ENODEV;
> -	}
> -
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> -	if (!msm_dp_display) {
> -		DRM_ERROR("invalid input\n");
> -		return -ENODEV;
> -	}
> -
> -	mutex_lock(&msm_dp_display->connector->eld_mutex);
> -	memcpy(buf, msm_dp_display->connector->eld,
> -		min(sizeof(msm_dp_display->connector->eld), len));
> -	mutex_unlock(&msm_dp_display->connector->eld_mutex);
> -
> -	return 0;
> -}
> -
> -int msm_dp_audio_hw_params(struct device *dev,
> -	void *data,
> -	struct hdmi_codec_daifmt *daifmt,
> -	struct hdmi_codec_params *params)
> +int msm_dp_audio_prepare(struct drm_connector *connector,
> +			 struct drm_bridge *bridge,
> +			 struct hdmi_codec_daifmt *daifmt,
> +			 struct hdmi_codec_params *params)
>  {
>  	int rc =3D 0;
>  	struct msm_dp_audio_private *audio;
> -	struct platform_device *pdev;
>  	struct msm_dp *msm_dp_display;
> =20
> -	pdev =3D to_platform_device(dev);
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> +	msm_dp_display =3D to_dp_bridge(bridge)->msm_dp_display;
> =20
>  	/*
>  	 * there could be cases where sound card can be opened even
> @@ -262,7 +197,7 @@ int msm_dp_audio_hw_params(struct device *dev,
>  		goto end;
>  	}
> =20
> -	audio =3D msm_dp_audio_get_data(pdev);
> +	audio =3D msm_dp_audio_get_data(msm_dp_display);
>  	if (IS_ERR(audio)) {
>  		rc =3D PTR_ERR(audio);
>  		goto end;
> @@ -281,15 +216,14 @@ int msm_dp_audio_hw_params(struct device *dev,
>  	return rc;
>  }
> =20
> -static void msm_dp_audio_shutdown(struct device *dev, void *data)
> +void msm_dp_audio_shutdown(struct drm_connector *connector,
> +			   struct drm_bridge *bridge)
>  {
>  	struct msm_dp_audio_private *audio;
> -	struct platform_device *pdev;
>  	struct msm_dp *msm_dp_display;
> =20
> -	pdev =3D to_platform_device(dev);
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> -	audio =3D msm_dp_audio_get_data(pdev);
> +	msm_dp_display =3D to_dp_bridge(bridge)->msm_dp_display;
> +	audio =3D msm_dp_audio_get_data(msm_dp_display);
>  	if (IS_ERR(audio)) {
>  		DRM_ERROR("failed to get audio data\n");
>  		return;
> @@ -311,47 +245,6 @@ static void msm_dp_audio_shutdown(struct device *dev=
, void *data)
>  	msm_dp_display_signal_audio_complete(msm_dp_display);
>  }
> =20
> -static const struct hdmi_codec_ops msm_dp_audio_codec_ops =3D {
> -	.hw_params =3D msm_dp_audio_hw_params,
> -	.audio_shutdown =3D msm_dp_audio_shutdown,
> -	.get_eld =3D msm_dp_audio_get_eld,
> -	.hook_plugged_cb =3D msm_dp_audio_hook_plugged_cb,
> -};
> -
> -static struct hdmi_codec_pdata codec_data =3D {
> -	.ops =3D &msm_dp_audio_codec_ops,
> -	.max_i2s_channels =3D 8,
> -	.i2s =3D 1,
> -};
> -
> -void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_au=
dio *msm_dp_audio)
> -{
> -	struct msm_dp_audio_private *audio_priv;
> -
> -	audio_priv =3D container_of(msm_dp_audio, struct msm_dp_audio_private, =
msm_dp_audio);
> -
> -	if (audio_priv->audio_pdev) {
> -		platform_device_unregister(audio_priv->audio_pdev);
> -		audio_priv->audio_pdev =3D NULL;
> -	}
> -}
> -
> -int msm_dp_register_audio_driver(struct device *dev,
> -		struct msm_dp_audio *msm_dp_audio)
> -{
> -	struct msm_dp_audio_private *audio_priv;
> -
> -	audio_priv =3D container_of(msm_dp_audio,
> -			struct msm_dp_audio_private, msm_dp_audio);
> -
> -	audio_priv->audio_pdev =3D platform_device_register_data(dev,
> -						HDMI_CODEC_DRV_NAME,
> -						PLATFORM_DEVID_AUTO,
> -						&codec_data,
> -						sizeof(codec_data));
> -	return PTR_ERR_OR_ZERO(audio_priv->audio_pdev);
> -}
> -
>  struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
>  			struct msm_dp_catalog *catalog)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/d=
p_audio.h
> index beea34cbab77f31b33873297dc454a9cee446240..58fc14693e48bff2b57ef7278=
983e5f21ee80ac7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.h
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.h
> @@ -35,23 +35,6 @@ struct msm_dp_audio {
>  struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
>  			struct msm_dp_catalog *catalog);
> =20
> -/**
> - * msm_dp_register_audio_driver()
> - *
> - * Registers DP device with hdmi_codec interface.
> - *
> - * @dev: DP device instance.
> - * @msm_dp_audio: an instance of msm_dp_audio module.
> - *
> - *
> - * Returns the error code in case of failure, otherwise
> - * zero on success.
> - */
> -int msm_dp_register_audio_driver(struct device *dev,
> -		struct msm_dp_audio *msm_dp_audio);
> -
> -void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_au=
dio *msm_dp_audio);
> -
>  /**
>   * msm_dp_audio_put()
>   *
> @@ -61,10 +44,12 @@ void msm_dp_unregister_audio_driver(struct device *de=
v, struct msm_dp_audio *msm
>   */
>  void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio);
> =20
> -int msm_dp_audio_hw_params(struct device *dev,
> -	void *data,
> -	struct hdmi_codec_daifmt *daifmt,
> -	struct hdmi_codec_params *params);
> +int msm_dp_audio_prepare(struct drm_connector *connector,
> +			 struct drm_bridge *bridge,
> +			 struct hdmi_codec_daifmt *daifmt,
> +			 struct hdmi_codec_params *params);
> +void msm_dp_audio_shutdown(struct drm_connector *connector,
> +			   struct drm_bridge *bridge);
> =20
>  #endif /* _DP_AUDIO_H_ */
> =20
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index bbc47d86ae9e67245c87a8365df366cce0dc529e..ece184d20c0f8bffa3c2a4821=
6015185d6cbc99e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/string_choices.h>
>  #include <drm/display/drm_dp_aux_bus.h>
> +#include <drm/display/drm_hdmi_audio_helper.h>
>  #include <drm/drm_edid.h>
> =20
>  #include "msm_drv.h"
> @@ -288,13 +289,6 @@ static int msm_dp_display_bind(struct device *dev, s=
truct device *master,
>  		goto end;
>  	}
> =20
> -
> -	rc =3D msm_dp_register_audio_driver(dev, dp->audio);
> -	if (rc) {
> -		DRM_ERROR("Audio registration Dp failed\n");
> -		goto end;
> -	}
> -
>  	rc =3D msm_dp_hpd_event_thread_start(dp);
>  	if (rc) {
>  		DRM_ERROR("Event thread create failed\n");
> @@ -316,7 +310,6 @@ static void msm_dp_display_unbind(struct device *dev,=
 struct device *master,
> =20
>  	of_dp_aux_depopulate_bus(dp->aux);
> =20
> -	msm_dp_unregister_audio_driver(dev, dp->audio);
>  	msm_dp_aux_unregister(dp->aux);
>  	dp->drm_dev =3D NULL;
>  	dp->aux->drm_dev =3D NULL;
> @@ -626,9 +619,9 @@ static void msm_dp_display_handle_plugged_change(stru=
ct msm_dp *msm_dp_display,
>  			struct msm_dp_display_private, msm_dp_display);
> =20
>  	/* notify audio subsystem only if sink supports audio */
> -	if (msm_dp_display->plugged_cb && msm_dp_display->codec_dev &&
> -			dp->audio_supported)
> -		msm_dp_display->plugged_cb(msm_dp_display->codec_dev, plugged);
> +	if (dp->audio_supported)
> +		drm_connector_hdmi_audio_plugged_notify(msm_dp_display->connector,
> +							plugged);
>  }
> =20
>  static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u=
32 data)
> @@ -907,19 +900,6 @@ static int msm_dp_display_disable(struct msm_dp_disp=
lay_private *dp)
>  	return 0;
>  }
> =20
> -int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
> -		hdmi_codec_plugged_cb fn, struct device *codec_dev)
> -{
> -	bool plugged;
> -
> -	msm_dp_display->plugged_cb =3D fn;
> -	msm_dp_display->codec_dev =3D codec_dev;
> -	plugged =3D msm_dp_display->link_ready;
> -	msm_dp_display_handle_plugged_change(msm_dp_display, plugged);
> -
> -	return 0;
> -}
> -
>  /**
>   * msm_dp_bridge_mode_valid - callback to determine if specified mode is=
 valid
>   * @bridge: Pointer to drm bridge structure
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp=
/dp_display.h
> index ecbc2d92f546a346ee53adcf1b060933e4f54317..cc6e2cab36e9c0b1527ff292e=
547cbb4d69fd95c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -7,7 +7,6 @@
>  #define _DP_DISPLAY_H_
> =20
>  #include "dp_panel.h"
> -#include <sound/hdmi-codec.h>
>  #include "disp/msm_disp_snapshot.h"
> =20
>  #define DP_MAX_PIXEL_CLK_KHZ	675000
> @@ -15,7 +14,6 @@
>  struct msm_dp {
>  	struct drm_device *drm_dev;
>  	struct platform_device *pdev;
> -	struct device *codec_dev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
>  	bool link_ready;
> @@ -25,14 +23,10 @@ struct msm_dp {
>  	bool is_edp;
>  	bool internal_hpd;
> =20
> -	hdmi_codec_plugged_cb plugged_cb;
> -
>  	struct msm_dp_audio *msm_dp_audio;
>  	bool psr_supported;
>  };
> =20
> -int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
> -		hdmi_codec_plugged_cb fn, struct device *codec_dev);
>  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_=
drm.c
> index cca57e56c906255a315e759e85a5af5982c80e9c..838bc7d052c5cfa31572f7e23=
a6b1d09c4c63b5f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -12,6 +12,7 @@
> =20
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> +#include "dp_audio.h"
>  #include "dp_drm.h"
> =20
>  /**
> @@ -114,6 +115,9 @@ static const struct drm_bridge_funcs msm_dp_bridge_op=
s =3D {
>  	.hpd_disable  =3D msm_dp_bridge_hpd_disable,
>  	.hpd_notify   =3D msm_dp_bridge_hpd_notify,
>  	.debugfs_init =3D msm_dp_bridge_debugfs_init,
> +
> +	.dp_audio_prepare =3D msm_dp_audio_prepare,
> +	.dp_audio_shutdown =3D msm_dp_audio_shutdown,
>  };
> =20
>  static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> @@ -320,9 +324,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display=
, struct drm_device *dev,
>  	 */
>  	if (!msm_dp_display->is_edp) {
>  		bridge->ops =3D
> +			DRM_BRIDGE_OP_DP_AUDIO |
>  			DRM_BRIDGE_OP_DETECT |
>  			DRM_BRIDGE_OP_HPD |
>  			DRM_BRIDGE_OP_MODES;
> +		bridge->hdmi_audio_dev =3D &msm_dp_display->pdev->dev;
> +		bridge->hdmi_audio_max_i2s_playback_channels =3D 8;
> +		bridge->hdmi_audio_dai_port =3D -1;
>  	}
> =20
>  	rc =3D devm_drm_bridge_add(dev->dev, bridge);
>
> ---
> base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
> change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f
>
> Best regards,

