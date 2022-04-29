Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCED515402
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 20:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0669610E507;
	Fri, 29 Apr 2022 18:52:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89C510E0E8
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x17so15566931lfa.10
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xwez25fKOJIvbl7FDqYv3cgN984+GGk1naedmnAxP4Y=;
 b=f6UQK3n7miUzxs2paCC6ywUzmEX+m7QGx0RlW8FVo/fkmsFewBjKlBMwNCesVufZuu
 4RbgPVHjkZP2+5rOxual28+DY3ujiTSbRTLt9LkUKLxJKMKlHF6fWTiS3gFjBE/uk7od
 CfVCFSm45qg11pesASMxdEnXqyQ2QSzvGtq10iuoBCe11ykoMJmTIrWeQ08yn+LG3Eq0
 qgev94VxC+Kabu3PrpwRpR3SNzjjz5JC7hVb7mzE6LG+wtYG0enwP/FrpwO/1IZcCgsk
 61t5FYvPPEQjhMDWLAh76uFYRJ1Wy6KtIdrZtZ0njK3jSWMY7MvfsGfEhhlYCUQjZB2B
 aD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xwez25fKOJIvbl7FDqYv3cgN984+GGk1naedmnAxP4Y=;
 b=FHH01n9OsuUdy9ClCFlHE9WytFSdqg67IteFZk1ws7NVtSQuXtVVJUa9RFpYgkoWao
 3gWzl42CQXj16H/kqpicmxNh2cRCOWI/vWCSQwVU+HrHw0mCyAJVERqRTeNneDUtf5xG
 fIR6gsoAOv22zyfWu6nKGcNPtrQdBw1x/Msbnj2lXR4SDgTTAd1WfhoG7rBx+Z/j6m3a
 n4fvaQK7qe38V4eDrl5Z4zPPVGJ7cnGtGPBK7GvRHnCjyzLdR0/ibhXHlqq41vTQRWM7
 6qrFWc9Bgo8O884ftiOV5mlFxp5tKHCrTuncuhQV8j1YfG0/56K59gX6LnuhjY6khMHA
 z1Ew==
X-Gm-Message-State: AOAM532Pd04TUIt3UpyLXq0u50F7UkklAHZqq1FWN8lHEtF8vaPP0civ
 995C3DudDGIxw/9WpZWF5uox5Q==
X-Google-Smtp-Source: ABdhPJyOpcUR4T0Pwv1R1szusK+QmnoIsr3FyUCxNx60L0+9tc1KiURMI8qpfG2pF8k5oYd/gJbjjQ==
X-Received: by 2002:a05:6512:6cb:b0:471:ce8a:cfaf with SMTP id
 u11-20020a05651206cb00b00471ce8acfafmr404904lff.635.1651258319965; 
 Fri, 29 Apr 2022 11:51:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:51:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Date: Fri, 29 Apr 2022 21:51:50 +0300
Message-Id: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 0/7] drm/bridge_connector: perform HPD
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

From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
DRM driver do a proper work of calling
drm_bridge_connector_en/disable_hpd() in right places. Rather than
teaching each and every driver how to properly handle
drm_bridge_connector's HPD, make that automatic.

Add two additional drm_connector helper funcs: enable_hpd() and
disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
is the time where the drm_bridge_connector's functions are called by the
drivers too).

Dmitry Baryshkov (7):
  drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
  drm/probe-helper: enable and disable HPD on connectors
  drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
  drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
  drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
  drm/omap: stop using drm_bridge_connector_en/disable_hpd()
  drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()

 drivers/gpu/drm/drm_bridge_connector.c   | 23 +++----------
 drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
 drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
 drivers/gpu/drm/imx/dcss/dcss-kms.c      |  4 ---
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
 drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
 include/drm/drm_bridge_connector.h       |  2 --
 include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
 8 files changed, 58 insertions(+), 80 deletions(-)

-- 
2.35.1

