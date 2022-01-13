Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E535F48DB9D
	for <lists+freedreno@lfdr.de>; Thu, 13 Jan 2022 17:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DACE10E46D;
	Thu, 13 Jan 2022 16:21:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 554 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jan 2022 15:04:52 UTC
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97A310E159
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jan 2022 15:04:52 +0000 (UTC)
Received: from localhost.localdomain (89-166-24-184.bb.dnainternet.fi
 [89.166.24.184])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id ECBE63F43A;
 Thu, 13 Jan 2022 15:55:31 +0100 (CET)
From: Jami Kettunen <jami.kettunen@somainline.org>
To: linux-arm-msm@vger.kernel.org
Date: Thu, 13 Jan 2022 16:51:09 +0200
Message-Id: <20220113145111.29984-2-jami.kettunen@somainline.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113145111.29984-1-jami.kettunen@somainline.org>
References: <20220113145111.29984-1-jami.kettunen@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jan 2022 16:21:40 +0000
Subject: [Freedreno] [PATCH 1/3] drm/msm/dpu1: Add DMA2,
 DMA3 clock control to enum
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The enum dpu_clk_ctrl_type misses DPU_CLK_CTRL_DMA{2,3} even though
this driver does actually handle both, if present: add the two in
preparation for adding support for SoCs having them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Jami Kettunen <jami.kettunen@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 31af04afda7d..736f52c742fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -435,6 +435,8 @@ enum dpu_clk_ctrl_type {
 	DPU_CLK_CTRL_RGB3,
 	DPU_CLK_CTRL_DMA0,
 	DPU_CLK_CTRL_DMA1,
+	DPU_CLK_CTRL_DMA2,
+	DPU_CLK_CTRL_DMA3,
 	DPU_CLK_CTRL_CURSOR0,
 	DPU_CLK_CTRL_CURSOR1,
 	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
-- 
2.34.1

