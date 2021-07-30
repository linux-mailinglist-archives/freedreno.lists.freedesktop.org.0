Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CEA3DCED9
	for <lists+freedreno@lfdr.de>; Mon,  2 Aug 2021 05:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553A26E3AE;
	Mon,  2 Aug 2021 03:11:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Fri, 30 Jul 2021 06:20:56 UTC
Received: from qq.com (smtpbg562.qq.com [183.3.255.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC6B6F3E2
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jul 2021 06:20:55 +0000 (UTC)
X-QQ-mid: bizesmtp35t1627625584tl3ok1bc
Received: from localhost.localdomain (unknown [111.207.172.18])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 30 Jul 2021 14:13:03 +0800 (CST)
X-QQ-SSF: 0140000000200020B000B00C0000000
X-QQ-FEAT: mAJfWfDYrJMFKo/smnihNzXYVpGbb8bW+e935fclzJ2KY6EBRKw7JkDbpyZRm
 VwqvqvQj2mecuSB8MgH5l0E1Vx+CG969aCl7N6AW0xYw0Cscns66xVLv10mEMfDX9k7H9mE
 x1ozpXglwIt6lcaaHmdSvL56aYLxby/cNg7miouF/LfNr5bJ28b7r2GQyGabPD+jv2pCKSn
 MKvMbnFo9t/Ggt5/28JNhkoH4ERA5NQ3Ht7hPvtztmeUBGtjEjshT5+sKZcnDGZlHod8HKk
 gHjU5Raq+HbjzhUHO8UHIA3zZYsBFzSvGAcwBjiiS0veBszl2hLlXuZq/WVTZR0dQ3LmebD
 xgdTYP+bVxedfzAH/g=
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhaoxiao <zhaoxiao@uniontech.com>
Date: Fri, 30 Jul 2021 14:13:01 +0800
Message-Id: <20210730061301.32492-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 02 Aug 2021 03:11:07 +0000
Subject: [Freedreno] [PATCH] drm:This patch fixes the checkpatch.pl error to
 msm_drv.c
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

ERROR: do not initialise statics to false

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..d9ca4bc9620b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,7 +59,7 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 };
 
 #ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
-static bool reglog = false;
+static bool reglog;
 MODULE_PARM_DESC(reglog, "Enable register read/write logging");
 module_param(reglog, bool, 0600);
 #else
@@ -76,7 +76,7 @@ static char *vram = "16m";
 MODULE_PARM_DESC(vram, "Configure VRAM size (for devices without IOMMU/GPUMMU)");
 module_param(vram, charp, 0);
 
-bool dumpstate = false;
+bool dumpstate;
 MODULE_PARM_DESC(dumpstate, "Dump KMS state on errors");
 module_param(dumpstate, bool, 0600);
 
-- 
2.20.1



