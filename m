Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3DB2A35E4
	for <lists+freedreno@lfdr.de>; Mon,  2 Nov 2020 22:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F4A6E3D2;
	Mon,  2 Nov 2020 21:18:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Mon, 02 Nov 2020 20:12:40 UTC
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFEE6E3B2
 for <freedreno@lists.freedesktop.org>; Mon,  2 Nov 2020 20:12:40 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E34CA3E7B1;
 Mon,  2 Nov 2020 21:02:41 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: robdclark@gmail.com
Date: Mon,  2 Nov 2020 21:02:25 +0100
Message-Id: <20201102200227.8876-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2020 21:18:32 +0000
Subject: [Freedreno] [PATCH] drm/msm: a5xx: Make preemption reset case
 reentrant
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
Cc: freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 konrad.dybcio@somainline.org, Konrad Dybcio <konradybcio@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, Jordan Crouse <jcrouse@codeaurora.org>,
 martin.botka@somainline.org, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

nr_rings is reset to 1, but when this function is called for a second
(and third!) time nr_rings > 1 is false, thus the else case is entered
to set up a buffer for the RPTR shadow and consequently written to
RB_RPTR_ADDR, hanging platforms without WHERE_AM_I firmware support.

Restructure the condition in such a way that shadow buffer setup only
ever happens when has_whereami is true; otherwise preemption is only
finalized when the number of ring buffers has not been reset to 1 yet.

Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index d6804a802355..9a202a7da131 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -755,12 +755,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_CP_RB_CNTL,
 		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
 
-	/* Disable preemption if WHERE_AM_I isn't available */
-	if (!a5xx_gpu->has_whereami && gpu->nr_rings > 1) {
-		a5xx_preempt_fini(gpu);
-		gpu->nr_rings = 1;
-	} else {
-		/* Create a privileged buffer for the RPTR shadow */
+	/* Create a privileged buffer for the RPTR shadow */
+	if (a5xx_gpu->has_whereami) {
 		if (!a5xx_gpu->shadow_bo) {
 			a5xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
 				sizeof(u32) * gpu->nr_rings,
@@ -774,6 +770,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
 			REG_A5XX_CP_RB_RPTR_ADDR_HI, shadowptr(a5xx_gpu, gpu->rb[0]));
+	} else if (gpu->nr_rings > 1) {
+		/* Disable preemption if WHERE_AM_I isn't available */
+		a5xx_preempt_fini(gpu);
+		gpu->nr_rings = 1;
 	}
 
 	a5xx_preempt_hw_init(gpu);
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
