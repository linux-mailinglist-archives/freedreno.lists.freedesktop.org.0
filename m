Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E833D9C23
	for <lists+freedreno@lfdr.de>; Thu, 29 Jul 2021 05:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6066EA95;
	Thu, 29 Jul 2021 03:19:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 29 Jul 2021 03:09:01 UTC
Received: from mail-m121142.qiye.163.com (mail-m121142.qiye.163.com
 [115.236.121.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD0A6E105;
 Thu, 29 Jul 2021 03:09:01 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121142.qiye.163.com (Hmail) with ESMTPA id 046D88013B;
 Thu, 29 Jul 2021 11:01:50 +0800 (CST)
From: Guo Zhengkui <guozhengkui@vivo.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Date: Thu, 29 Jul 2021 11:01:40 +0800
Message-Id: <20210729030140.99500-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUIdSEhWSEIZHh8aQxgfHk
 lLVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OUk6MTo*AT9MLTkODBkJOi4r
 FRIaCVZVSlVKTUlMTklMTEpKQ0pPVTMWGhIXVRwOFAETHhUcEA4SOw0SDRRVGBQWRVlXWRILWUFZ
 SE1VSk5JVUpPTlVKQ0pZV1kIAVlBSkNKSjcG
X-HM-Tid: 0a7af0360a6fb037kuuu046d88013b
X-Mailman-Approved-At: Thu, 29 Jul 2021 03:19:27 +0000
Subject: [Freedreno] [PATCH] drm/msm: remove a repeated including of
 <linux/debugfs.h>
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
Cc: trivial@kernel.org, guozhengkui@vivo.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel@vivo.com,
 abhinavk@codeaurora.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Remove a repeated "#include <linux/debugfs.h>" in line 19 of the original
file.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index c92a9508c8d3..c22b07f68670 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -16,7 +16,6 @@
 #include <linux/delay.h>
 #include <linux/spinlock.h>
 #include <linux/ktime.h>
-#include <linux/debugfs.h>
 #include <linux/uaccess.h>
 #include <linux/dma-buf.h>
 #include <linux/slab.h>
-- 
2.17.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
