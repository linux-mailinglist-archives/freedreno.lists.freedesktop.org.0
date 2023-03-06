Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C316D6ABB0D
	for <lists+freedreno@lfdr.de>; Mon,  6 Mar 2023 11:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A596310E227;
	Mon,  6 Mar 2023 10:09:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542B910E1EE;
 Mon,  6 Mar 2023 10:09:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B88B660DC5;
 Mon,  6 Mar 2023 10:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06C2C433A8;
 Mon,  6 Mar 2023 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678097358;
 bh=5WWc/IA6KEuvk5qRgQkziyYcmpqaQV99Q299DA5bkuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XmLuhUwNoWU4IVC3iCrUwuhv3eh0i+kq4h5bW1w33pSFpe+CwK2HxoWKZsKTByNBf
 6yzugc3HGaFj9ddQ/D8SdZPYuyGO/747QGtagRaWE15638eUSXetb085HvdJ0tb0yD
 k9d59zOGwVE4RqTl7E/wLxO/u8ETt3gibWI5EZEMPxl87z9qhmqYQhRWoA4wc5mfdE
 Gv+F6VLJAZF1brS+mhjVTpfD0+/8ZFNkL1Wu/rtA6BWzzole3ogicanzUKDc6evCDS
 uAEGNwIz8xUAj8quEXrn4ZKxOwK7LJnsIiUt9LWN9jh4b+def2ILb+fso6oGj75De0
 rxU1+j1HjZ8yQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pZ7n5-0007Qq-HN; Mon, 06 Mar 2023 11:09:59 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon,  6 Mar 2023 11:07:19 +0100
Message-Id: <20230306100722.28485-8-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306100722.28485-1-johan+linaro@kernel.org>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 07/10] drm/msm: fix missing wq allocation error
 handling
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the missing sanity check to handle workqueue allocation failures.

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Cc: stable@vger.kernel.org      # 3.12
Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 41cc6cd690cd..ac3b77dbfacc 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -432,6 +432,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	priv->dev = ddev;
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
+	if (!priv->wq) {
+		ret = -ENOMEM;
+		goto err_put_dev;
+	}
 
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
-- 
2.39.2

