Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC22F3A29
	for <lists+freedreno@lfdr.de>; Tue, 12 Jan 2021 20:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE8989F27;
	Tue, 12 Jan 2021 19:26:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EF989F07
 for <freedreno@lists.freedesktop.org>; Tue, 12 Jan 2021 19:26:50 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 63EC03E7CC;
 Tue, 12 Jan 2021 20:26:47 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Date: Tue, 12 Jan 2021 20:26:26 +0100
Message-Id: <20210112192632.502897-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 1/7] drm/msm/dpu: Fix
 VBIF_XINL_QOS_LVL_REMAP_000 register offset
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
Cc: freedreno@lists.freedesktop.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On DPUs prior to version 4 the VBIF_XINL_QOS_LVL_REMAP_000 register
is at 0x570 offset from vbif base instead of 0x590, due to the
VBIF_XINL_QOS_RP_REMAP_000 having less instances (less possible XINs).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index cf867f3f7c36..b757054e1c23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -30,7 +30,7 @@
 #define VBIF_XIN_HALT_CTRL0		0x0200
 #define VBIF_XIN_HALT_CTRL1		0x0204
 #define VBIF_XINL_QOS_RP_REMAP_000	0x0550
-#define VBIF_XINL_QOS_LVL_REMAP_000	0x0590
+#define VBIF_XINL_QOS_LVL_REMAP_000(v)	(v < DPU_HW_VER_400 ? 0x570 : 0x0590)
 
 static void dpu_hw_clear_errors(struct dpu_hw_vbif *vbif,
 		u32 *pnd_errors, u32 *src_errors)
@@ -156,18 +156,19 @@ static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
 		u32 xin_id, u32 level, u32 remap_level)
 {
 	struct dpu_hw_blk_reg_map *c;
-	u32 reg_val, reg_val_lvl, mask, reg_high, reg_shift;
+	u32 reg_lvl, reg_val, reg_val_lvl, mask, reg_high, reg_shift;
 
 	if (!vbif)
 		return;
 
 	c = &vbif->hw;
 
+	reg_lvl = VBIF_XINL_QOS_LVL_REMAP_000(c->hwversion);
 	reg_high = ((xin_id & 0x8) >> 3) * 4 + (level * 8);
 	reg_shift = (xin_id & 0x7) * 4;
 
 	reg_val = DPU_REG_READ(c, VBIF_XINL_QOS_RP_REMAP_000 + reg_high);
-	reg_val_lvl = DPU_REG_READ(c, VBIF_XINL_QOS_LVL_REMAP_000 + reg_high);
+	reg_val_lvl = DPU_REG_READ(c, reg_lvl + reg_high);
 
 	mask = 0x7 << reg_shift;
 
@@ -178,7 +179,7 @@ static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
 	reg_val_lvl |= (remap_level << reg_shift) & mask;
 
 	DPU_REG_WRITE(c, VBIF_XINL_QOS_RP_REMAP_000 + reg_high, reg_val);
-	DPU_REG_WRITE(c, VBIF_XINL_QOS_LVL_REMAP_000 + reg_high, reg_val_lvl);
+	DPU_REG_WRITE(c, reg_lvl + reg_high, reg_val_lvl);
 }
 
 static void dpu_hw_set_write_gather_en(struct dpu_hw_vbif *vbif, u32 xin_id)
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
