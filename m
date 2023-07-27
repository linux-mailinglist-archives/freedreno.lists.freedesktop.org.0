Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6128D764483
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 05:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C9510E4D8;
	Thu, 27 Jul 2023 03:40:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 1030 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jul 2023 03:40:37 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266CC10E0D6
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 03:40:37 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RBGHh59x2zLns3;
 Thu, 27 Jul 2023 11:20:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 11:23:23 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <quic_jesszhan@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Jul 2023 11:24:07 +0000
Message-ID: <20230727112407.2916029-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Subject: [Freedreno] [PATCH -next] drm/msm: Remove redundant DRM_DEV_ERROR()
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
Cc: ruanjinjie@huawei.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There is no need to call the DRM_DEV_ERROR() function directly to print
a custom message when handling an error from platform_get_irq() function
as it is going to display an appropriate error message
in case of a failure.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 1 -
 drivers/gpu/drm/msm/msm_gpu.c            | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index b6201ae5b42e..700df4040e9a 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -417,7 +417,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
 		goto fail;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 52db90e34ead..8a9bacc920eb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -897,7 +897,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->irq = platform_get_irq(pdev, 0);
 	if (gpu->irq < 0) {
 		ret = gpu->irq;
-		DRM_DEV_ERROR(drm->dev, "failed to get irq: %d\n", ret);
 		goto fail;
 	}
 
-- 
2.34.1

