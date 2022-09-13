Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5975B6A16
	for <lists+freedreno@lfdr.de>; Tue, 13 Sep 2022 10:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605BB10E668;
	Tue, 13 Sep 2022 08:58:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BD710E65E;
 Tue, 13 Sep 2022 08:58:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAD10B80D87;
 Tue, 13 Sep 2022 08:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED99C433C1;
 Tue, 13 Sep 2022 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663059499;
 bh=Oc6WoDRTsN2YXtrJHeii3slQl1T1Cqsqme8eYe4nODc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RSs6PLSgaXtiUrS+7L3CAiMNRarG7ovHpUdoaMrDyOxfuEhuJq4IvZaJxSG0VA8wP
 LF8Av6IYbPm4fcPfmgyfKm+UyZ/1MU5qQ7hPBykZgCvzA/urBF/MGeIJ2yznpuZp3f
 2AwPXnyDGxht13kbECWivAeNYPUEwJQ5hzTMyMoUB//KIw3dhzxAsR3pfB42+XAVFM
 qPF4UUS+nYU0u1n+ZlSX54aR7g5PhBq2O976DLAb2lntuNWzImI677R4m5Rjp+MJ4r
 58WxVskC9wWrbzDO2hJFZAfv/r6xtwzxVkVhVm7KN1e5WVUz+HECgZemuef7b73qYg
 N8v0uiKWhSKEg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oY1kI-0002H2-Cp; Tue, 13 Sep 2022 10:58:18 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 13 Sep 2022 10:53:11 +0200
Message-Id: <20220913085320.8577-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913085320.8577-1-johan+linaro@kernel.org>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 01/10] drm/msm: fix use-after-free on probe
 deferral
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Johan Hovold <johan+linaro@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@kali.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The bridge counter was never reset when tearing down the DRM device so
that stale pointers to deallocated structures would be accessed on the
next tear down (e.g. after a second late bind deferral).

Given enough bridges and a few probe deferrals this could currently also
lead to data beyond the bridge array being corrupted.

Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
Fixes: a3376e3ec81c ("drm/msm: convert to drm_bridge")
Cc: stable@vger.kernel.org      # 3.12
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 391d86b54ded..d254fe2507ec 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -241,6 +241,7 @@ static int msm_drm_uninit(struct device *dev)
 
 	for (i = 0; i < priv->num_bridges; i++)
 		drm_bridge_remove(priv->bridges[i]);
+	priv->num_bridges = 0;
 
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
-- 
2.35.1

