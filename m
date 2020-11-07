Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72992AA24A
	for <lists+freedreno@lfdr.de>; Sat,  7 Nov 2020 04:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629DE893B9;
	Sat,  7 Nov 2020 03:19:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m176115.mail.qiye.163.com (m176115.mail.qiye.163.com
 [59.111.176.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8498D89321;
 Sat,  7 Nov 2020 03:19:21 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
 by m176115.mail.qiye.163.com (Hmail) with ESMTPA id 3BA786661BF;
 Sat,  7 Nov 2020 11:19:16 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Sat,  7 Nov 2020 11:19:09 +0800
Message-Id: <1604719151-28491-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSR8YSx4YSEsZTB4YVkpNS09MSkJKTk1MTExVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBA6Iyo4Nz8aARwhGg5WD1E#
 NCpPC0NVSlVKTUtPTEpCSk5MSUpIVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISllXWQgBWUFJT0xONwY+
X-HM-Tid: 0a75a0b71db99373kuws3ba786661bf
Subject: [Freedreno] [V2] drm: msm: adreno: use IS_ERR() instead of null
 pointer check
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
Cc: Wang Qing <wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

a6xx_gmu_get_mmio() never return null in case of error, but ERR_PTR(), so 
we should use IS_ERR() instead of null pointer check and IS_ERR_OR_NULL().

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 491fee4..82420f7
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -492,7 +492,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
 	uint32_t pdc_address_offset;
 
-	if (!pdcptr || !seqptr)
+	if (IS_ERR(pdcptr) || IS_ERR(seqptr))
 		goto err;
 
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
@@ -580,9 +580,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	wmb();
 
 err:
-	if (!IS_ERR_OR_NULL(pdcptr))
+	if (!IS_ERR(pdcptr))
 		iounmap(pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
+	if (!IS_ERR(seqptr))
 		iounmap(seqptr);
 }
 
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
