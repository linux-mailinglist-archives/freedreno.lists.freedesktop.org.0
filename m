Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D127658725
	for <lists+freedreno@lfdr.de>; Wed, 28 Dec 2022 22:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31FA10E223;
	Wed, 28 Dec 2022 21:58:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8935B10E227
 for <freedreno@lists.freedesktop.org>; Wed, 28 Dec 2022 21:58:55 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bt23so8602710lfb.5
 for <freedreno@lists.freedesktop.org>; Wed, 28 Dec 2022 13:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4i2OUrYGicd45djd8WHUjr0awuDx+Vi8cN8n+luSWuQ=;
 b=WaHwXEdOw5J3MVhkCQzvNb3Iz8NoTr4Mto0jpNVoYJr4bOhLlkelPfVM6leBdGnBqJ
 Pfbir4GjjVshApNuDzdgfjq8MaMpl6Fsmg4UU50UiOKuWAlFUOC8//sITd21uA1+dBpe
 ALF1xY34aWR6bvXCaCxbn/BNINLhAtgGQ+isKLESPM97lDfU/2KPPi3SeY9GUVIBkBkB
 usQ7WQTSh0mbs6PAPxKCT/j+6QaC4nUi7pUUABTvOMBm71t5aSyj7R/f4efXMXs1p5VK
 7lysOINqyM3ZjMc0fVHahgMk2QgSU6ivoFFsOe6tnm9cY1EjVxTzUxihnYI4v926liI1
 K25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4i2OUrYGicd45djd8WHUjr0awuDx+Vi8cN8n+luSWuQ=;
 b=1DiIWzjjoFHne7RkYjrd5L36Fy2TBUWYEW6JXHehv6NPM6JvARV87yvKUyRL5CrkZe
 4FzVX9yGNBNtV03I/EJuXJsWLi2y7z2rAwIVIK7k1r2mz0cNAuCSl3rDOmYQnfIqpYOS
 HD+C0SZzNyfLDuWvt39RdP7CoVG4uAjb77tmWDGbYTF7D3USg9+Mhzs9jXS0wv8c2UIx
 8L9Ll4y12hzUHlylw50f0zcr1/qccDBmHwopy92C3VYli5gxDRM1Trpj5ha3QdB0DSMv
 NXW5BfEWH2MBVeI8a6J+SA3rH5aXWL1oZ3h6ISkSWrWvTaaII/SEu5UG6UQVgvWRP4IP
 t2Bg==
X-Gm-Message-State: AFqh2kp4+y+kuVvwaq0SCmwXDbkf7TAKelqmRt4/m5SmBdL2OnYv0wOY
 28sPWPIiymOWs1H8+lsrj5coOQ==
X-Google-Smtp-Source: AMrXdXvcWCyozsXfzyTq8I+9vYY2eFgsAjMdE5qWx6Sdm7GkxCkWaaXicvGoFAx4zCOWIxxx2t9/kw==
X-Received: by 2002:a19:7114:0:b0:4b5:96e1:31e9 with SMTP id
 m20-20020a197114000000b004b596e131e9mr8011114lfc.19.1672264733682; 
 Wed, 28 Dec 2022 13:58:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p18-20020ac24ed2000000b0048b365176d9sm2825679lfr.286.2022.12.28.13.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 13:58:53 -0800 (PST)
Message-ID: <362452c5-8858-9ac5-e0ca-8ff993e966b7@linaro.org>
Date: Wed, 28 Dec 2022 23:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Tomi Valkeinen <tomba@kernel.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 0/7] drm/bridge_connector: perform HPD
 enablement automatically
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/11/2022 20:06, Dmitry Baryshkov wrote:
>  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
> DRM driver do a proper work of calling
> drm_bridge_connector_en/disable_hpd() in right places. Rather than
> teaching each and every driver how to properly handle
> drm_bridge_connector's HPD, make that automatic.
> 
> Add two additional drm_connector helper funcs: enable_hpd() and
> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
> is the time where the drm_bridge_connector's functions are called by the
> drivers too).

Since we are at the beginning of the development window, gracious ping 
for this patchset.

It would be nice to finally handle the bridge_connector's hpd properly. 
Calling drm_bridge_connector_enable_hpd() from 
drm_bridge_connector_init() is not a proper way to do this. It results 
in calling bridge->funcs->hpd_enable() before the rest of the pipeline 
was set up properly.

> 
> Changes since v2:
>   - Fixed a typo in the commit message of the second patch.
> 
> Changes since v1:
>   - Rebased on top of v6.1-rc1
>   - Removed the drm_bridge_connector_enable_hpd() from
>     drm_bridge_connector_init()
>   - Removed extra underscore prefix from
>     drm_bridge_connector_en/disable_hpd() helpers
> 
> Dmitry Baryshkov (7):
>    drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
>    drm/probe-helper: enable and disable HPD on connectors
>    drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
>    drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
>    drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
>    drm/omap: stop using drm_bridge_connector_en/disable_hpd()
>    drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
> 
>   drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
>   drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
>   drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
>   drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
>   drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
>   drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
>   include/drm/drm_bridge_connector.h       |  2 --
>   include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
>   8 files changed, 59 insertions(+), 81 deletions(-)
> 

-- 
With best wishes
Dmitry

