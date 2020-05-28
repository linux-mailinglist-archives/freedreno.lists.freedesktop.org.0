Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40801E6706
	for <lists+freedreno@lfdr.de>; Thu, 28 May 2020 18:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EE96E59F;
	Thu, 28 May 2020 16:04:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3146E526;
 Thu, 28 May 2020 13:09:23 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8E3D94FB3D2E0ABC5A60;
 Thu, 28 May 2020 21:09:17 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.173.222.27) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 28 May 2020 21:09:10 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 28 May 2020 21:08:16 +0800
Message-ID: <20200528130816.1670-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 28 May 2020 16:04:17 +0000
Subject: [Freedreno] [PATCH] drm/msm/dpu: Fix usage of ERR_PTR()
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
Cc: airlied@linux.ie, robdclark@gmail.com, daniel@ffwll.ch,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 jsanka@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

ERR_PTR() is used in the kernel to encode an usual *negative* errno code
into a pointer.  Passing a positive value (ENOMEM) to it will break the
following IS_ERR() check.

Though memory allocation is unlikely to fail, it's still worth fixing.
And grepping shows that this is the only misuse of ERR_PTR() in kernel.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a1b79ee2bd9d..a2f6b688a976 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2173,7 +2173,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 
 	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
 	if (!dpu_enc)
-		return ERR_PTR(ENOMEM);
+		return ERR_PTR(-ENOMEM);
 
 	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
 			drm_enc_mode, NULL);
-- 
2.19.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
