Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997960AF32
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 17:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89F910E881;
	Mon, 24 Oct 2022 15:39:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B147610E22A
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:29 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bs14so13307555ljb.9
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4iRQ1ZLI8K+KKo3Mi3lCacL/2gYfLmhjW+eZ+G5VxR0=;
 b=DK03fHAgU4BsXGUew2FzyG3+wVE1aU4jA6ElvQnlho0LEO32GQFcBY4dd/LkCacBJ2
 jPIwbDMb2KnH0lLk1oaf7f2CmWkfUlIO1bnPfDHSgSmzMrI8sNmCR7B37cRbVo3Xb0qW
 Dk4xPSNWnfO6MqLUqU0BwiV5QT7qiki/jvUIMYxU33HgObQCtr5I/qWByuNiyiQf7wyv
 y0jFQqxx37K5dKOOaXLzRfVS5Uk5IOWF7L/jw3uXSTx5iFH2VfQzEKNAZHjY9kmLDE4E
 LaHw9E2HVZl2VkJ5z3LuMkaH3FxatPfoF70MaFt456vIuB3oCBztawgsnK/cu0BcbnSj
 EE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4iRQ1ZLI8K+KKo3Mi3lCacL/2gYfLmhjW+eZ+G5VxR0=;
 b=zFoW+h58YrVM7cweM1mU6iWXHsQKlL7NHskp+L6ReKqKJ2djmr6oTa+1njxn0ZeGEA
 1uHfw9rvgBSxRnSFu8FTt9R6/y+VrZ2Ifo/nsnSdcaGacNdq+6uqF+NZEwlraF0aLHYe
 YqzU+1sbsXObp+krtOPC8/1eLIRr8srMYydJbx0Mu/Nbd3byFoy7Gn9jGDETeWkcmicd
 hWgRWRJ6RIimdPwlmewdQZhiZalx5nU2vHnTmYc8hGQmo5RAVhE0dWauxKDYc7BhZhu2
 +W4QOyYyy9cgUNBOoB4V9y2VC2Y8yasEiWltUKHx0si6JzuGQZ25FEpF+WC9JghOTBg6
 DE2g==
X-Gm-Message-State: ACrzQf2R/iuZXmw3OtlhOlOVqzjSup/GwkTrV1RPEsuFyuApRVgipZ5Q
 ftN4m+LA1TnQe+dUoZrFaZGQoA==
X-Google-Smtp-Source: AMsMyM6aZgyFcF24FEeW+Du1bHiLYldBNuRLnhbLGjWtlua2WDhhdBQOeIt39dXfHwX+IO0gs5LU4w==
X-Received: by 2002:a05:651c:169a:b0:277:2ee:5e77 with SMTP id
 bd26-20020a05651c169a00b0027702ee5e77mr4629293ljb.455.1666625968011; 
 Mon, 24 Oct 2022 08:39:28 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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
Date: Mon, 24 Oct 2022 18:39:19 +0300
Message-Id: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/7] drm/bridge_connector: perform HPD
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

Changes since v1:
 - Rebased on top of v6.1-rc1
 - Removed the drm_bridge_connector_enable_hpd() from
   drm_bridge_connector_init()
 - Removed extra underscore prefix from
   drm_bridge_connector_en/disable_hpd() helpers

Dmitry Baryshkov (7):
  drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
  drm/probe-helper: enable and disable HPD on connectors
  drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
  drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
  drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
  drm/omap: stop using drm_bridge_connector_en/disable_hpd()
  drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()

 drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
 drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
 drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
 drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
 drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
 include/drm/drm_bridge_connector.h       |  2 --
 include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
 8 files changed, 59 insertions(+), 81 deletions(-)

-- 
2.35.1

