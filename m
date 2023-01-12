Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472FE6669BF
	for <lists+freedreno@lfdr.de>; Thu, 12 Jan 2023 04:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93710E863;
	Thu, 12 Jan 2023 03:44:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Thu, 12 Jan 2023 03:44:55 UTC
Received: from out199-18.us.a.mail.aliyun.com (out199-18.us.a.mail.aliyun.com
 [47.90.199.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747CE10E863
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 03:44:54 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VZPJ0sv_1673494772; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VZPJ0sv_1673494772) by smtp.aliyun-inc.com;
 Thu, 12 Jan 2023 11:39:40 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: robdclark@gmail.com
Date: Thu, 12 Jan 2023 11:38:23 +0800
Message-Id: <20230112033823.24901-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: Remove some unused variables
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
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, sean@poorly.run,
 Abaci Robot <abaci@linux.alibaba.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Variables 'sc8280xp_regdma' and 'sm8350_regdma' are defined in the
dpu_hw_catalog.c file, but not used elsewhere, so remove these unused
variables.

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2029:37: warning: unused variable 'sc8280xp_regdma'.
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2053:37: warning: unused variable 'sm8350_regdma'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3722
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0f3da480b066..79bbef93948f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2026,14 +2026,6 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	},
 };
 
-static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
-	.base = 0x0,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
 static const struct dpu_reg_dma_cfg sdm845_regdma = {
 	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
 };
@@ -2050,14 +2042,6 @@ static const struct dpu_reg_dma_cfg sm8250_regdma = {
 	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
 };
 
-static const struct dpu_reg_dma_cfg sm8350_regdma = {
-	.base = 0x400,
-	.version = 0x00020000,
-	.trigger_sel_off = 0x119c,
-	.xin_id = 7,
-	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
-};
-
 static const struct dpu_reg_dma_cfg sm8450_regdma = {
 	.base = 0x0,
 	.version = 0x00020000,
-- 
2.20.1.7.g153144c

