Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6958AA67
	for <lists+freedreno@lfdr.de>; Fri,  5 Aug 2022 13:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816EEB2E8C;
	Fri,  5 Aug 2022 11:56:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2E0AD696
 for <freedreno@lists.freedesktop.org>; Fri,  5 Aug 2022 11:56:33 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s9so2800595ljs.6
 for <freedreno@lists.freedesktop.org>; Fri, 05 Aug 2022 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=jrQF6AuV7Fvmua8dvICh/NLlPPWG4sQcBjqkZirl8oQ=;
 b=EMgoCiUPb5t17HriQFu8bNn3CZW1NJvNPb8bibP54YOSFltmgmVObYz4ccPxvBfTdo
 w+VLGhYbnAF+/E85EczcZ0Hw/l3hHgGgxnielOJMbYHjd/qG3PdiptZYw3rPQP86nafA
 fa5/8HU+2O0xV8b+G9bCp62/nyEQi2HVUELkBc+0DHTIMO9YVogwp1f3/7rIj5nkoMd5
 FdVa6d3yxa1upxG7AbfZyUy6EpJ0Gy8gBgRIAI5/qo/oCwPBEG8dshXEf6PVUsm5X/4h
 JpkZaa07NHEt02ZVcP+0AhSOxml8Xia00YmEH/vi9g2hGMjv2YoEHKq27sImc+LIg0Zp
 nJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=jrQF6AuV7Fvmua8dvICh/NLlPPWG4sQcBjqkZirl8oQ=;
 b=tas0W6n1QXkAI5T0CZRKqnRsYD+vzLXQcox/IKpQFnJza8hbR6b8/19340X+GzRwae
 CPdq6er6an6WYGG+8WdKjHccgyWuyVFLvH52e8JA+XWdHCh/tpg6w2Yd15+DqoeXrVeZ
 CCVaBz06orJEiptO4dz5HGu1bUM1f9sd+sVzxsLU+mmf+h4SNM6BmxZ2xNfYoNqKtJTk
 mWpRCXp8f7o5oYdLy3RyYcnbRBDHA8wFYL+VjgGs7m5dWnMPdOUsF+5izOpLH9Kt3dc0
 C99haktNuEosi/neXFmrhEVhckXaX2Urn6F5xzyJfng4O+mEgxeSPKrCTwtlrfoFlZ2W
 TOkQ==
X-Gm-Message-State: ACgBeo16dDqX9hvm5i0HvJxHDBvWo/iUnM0g4ll1l617ssLg/BBphE5e
 Zw72oSHGKJmhyy0OYaQ2+9g3hw==
X-Google-Smtp-Source: AA6agR6Y+9fhV1QUxGxZYMLDmELrriu3de+ZW69tZqRNV5C1bhGU1VOsiEkzPaLr9HxQG79R19olbw==
X-Received: by 2002:a2e:8749:0:b0:25e:4357:8ef7 with SMTP id
 q9-20020a2e8749000000b0025e43578ef7mr2060893ljj.319.1659700591529; 
 Fri, 05 Aug 2022 04:56:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05651c022700b0025d9552fcafsm449065ljn.97.2022.08.05.04.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 04:56:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  5 Aug 2022 14:56:30 +0300
Message-Id: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH] drm/msm: lookup the ICC paths in both
 mdp5/dpu and mdss devices
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
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
components") changed the MDP5 driver to look for the interconnect paths
in the MDSS device rather than in the MDP5 device itself. This was left
unnoticed since on my testing devices the interconnects probably didn't
reach the sync state.

Rather than just using the MDP5 device for ICC path lookups for the MDP5
devices, introduce an additional helper to check both MDP5/DPU and MDSS
nodes. This will be helpful for the MDP5->DPU conversion, since the
driver will have to check both nodes.

Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  7 ++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  9 +++------
 drivers/gpu/drm/msm/msm_drv.h            |  2 ++
 drivers/gpu/drm/msm/msm_io_utils.c       | 22 ++++++++++++++++++++++
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e23e2552e802..9eff6c2b1917 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -383,12 +383,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 	struct icc_path *path1;
 	struct drm_device *dev = dpu_kms->dev;
 	struct device *dpu_dev = dev->dev;
-	struct device *mdss_dev = dpu_dev->parent;
 
-	/* Interconnects are a part of MDSS device tree binding, not the
-	 * MDP/DPU device. */
-	path0 = of_icc_get(mdss_dev, "mdp0-mem");
-	path1 = of_icc_get(mdss_dev, "mdp1-mem");
+	path0 = msm_icc_get(dpu_dev, "mdp0-mem");
+	path1 = msm_icc_get(dpu_dev, "mdp1-mem");
 
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3d5621a68f85..b0c372fef5d5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -921,12 +921,9 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 static int mdp5_setup_interconnect(struct platform_device *pdev)
 {
-	/* Interconnects are a part of MDSS device tree binding, not the
-	 * MDP5 device. */
-	struct device *mdss_dev = pdev->dev.parent;
-	struct icc_path *path0 = of_icc_get(mdss_dev, "mdp0-mem");
-	struct icc_path *path1 = of_icc_get(mdss_dev, "mdp1-mem");
-	struct icc_path *path_rot = of_icc_get(mdss_dev, "rotator-mem");
+	struct icc_path *path0 = msm_icc_get(&pdev->dev, "mdp0-mem");
+	struct icc_path *path1 = msm_icc_get(&pdev->dev, "mdp1-mem");
+	struct icc_path *path_rot = msm_icc_get(&pdev->dev, "rotator-mem");
 
 	if (IS_ERR(path0))
 		return PTR_ERR(path0);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 08388d742d65..d38510f6dbf5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -441,6 +441,8 @@ void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 		phys_addr_t *size);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
 
+struct icc_path *msm_icc_get(struct device *dev, const char *name);
+
 #define msm_writel(data, addr) writel((data), (addr))
 #define msm_readl(addr) readl((addr))
 
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index 7b504617833a..d02cd29ce829 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -5,6 +5,8 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/interconnect.h>
+
 #include "msm_drv.h"
 
 /*
@@ -124,3 +126,23 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
 	work->worker = worker;
 	kthread_init_work(&work->work, fn);
 }
+
+struct icc_path *msm_icc_get(struct device *dev, const char *name)
+{
+	struct device *mdss_dev = dev->parent;
+	struct icc_path *path;
+
+	path = of_icc_get(dev, name);
+	if (path)
+		return path;
+
+	/*
+	 * If there are no interconnects attached to the corresponding device
+	 * node, of_icc_get() will return NULL.
+	 *
+	 * If the MDP5/DPU device node doesn't have interconnects, lookup the
+	 * path in the parent (MDSS) device.
+	 */
+	return of_icc_get(mdss_dev, name);
+
+}
-- 
2.35.1

