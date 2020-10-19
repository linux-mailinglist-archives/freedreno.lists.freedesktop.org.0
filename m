Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C0292254
	for <lists+freedreno@lfdr.de>; Mon, 19 Oct 2020 08:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40D88924C;
	Mon, 19 Oct 2020 06:03:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F8F8924C;
 Mon, 19 Oct 2020 06:03:45 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7427091F64E8CB318596;
 Mon, 19 Oct 2020 14:03:41 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 14:03:37 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Date: Mon, 19 Oct 2020 14:04:22 +0800
Message-ID: <1603087462-37505-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Subject: [Freedreno] [PATCH] drm/msm: Remove redundant null check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

clk_prepare_enable() and clk_disable_unprepare() will check
NULL clock parameter, so It is not necessary to add additional checks.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 57ddc94..25bc654 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -175,15 +175,12 @@ static int disable_clk(struct msm_gpu *gpu)
 
 static int enable_axi(struct msm_gpu *gpu)
 {
-	if (gpu->ebi1_clk)
-		clk_prepare_enable(gpu->ebi1_clk);
-	return 0;
+	return clk_prepare_enable(gpu->ebi1_clk);
 }
 
 static int disable_axi(struct msm_gpu *gpu)
 {
-	if (gpu->ebi1_clk)
-		clk_disable_unprepare(gpu->ebi1_clk);
+	clk_disable_unprepare(gpu->ebi1_clk);
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
