Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B8E698878
	for <lists+freedreno@lfdr.de>; Thu, 16 Feb 2023 00:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5A210EC7D;
	Wed, 15 Feb 2023 23:02:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990610EC80
 for <freedreno@lists.freedesktop.org>; Wed, 15 Feb 2023 23:02:32 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 29EE420206;
 Thu, 16 Feb 2023 00:02:30 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 16 Feb 2023 00:02:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-sspp-scaler-version-v1-1-416b1500b85b@somainline.org>
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
X-Mailer: b4 0.12.1
Subject: [Freedreno] [PATCH 1/3] drm/msm/dpu: Read previously-uninitialized
 SSPP scaler version from hw
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DPU's catalog never assigned dpu_scaler_blk::version leading to
initialization code in dpu_hw_setup_scaler3 to wander the wrong
codepaths.  Instead of hardcoding the correct QSEED algorithm version,
read it back from a hardware register.

Note that this register is only available starting with QSEED3, where
0x1002 corresponds to QSEED3, 0x2004 to QSEED3LITE and 0x3000 to QSEED4.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 8 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 3 +++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ddab9caebb18..96ce1766f4a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -324,11 +324,9 @@ struct dpu_src_blk {
 /**
  * struct dpu_scaler_blk: Scaler information
  * @info:   HW register and features supported by this sub-blk
- * @version: qseed block revision
  */
 struct dpu_scaler_blk {
 	DPU_HW_SUBBLK_INFO;
-	u32 version;
 };
 
 struct dpu_csc_blk {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 4246ab0b3bee..d4e181e1378c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -430,7 +430,7 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
 		return;
 
 	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
-			ctx->cap->sblk->scaler_blk.version,
+			ctx->version,
 			sspp->layout.format);
 }
 
@@ -807,6 +807,12 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 	hw_pipe->mdp = &catalog->mdp[0];
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
+
+	if (test_bit(DPU_SSPP_SCALER_QSEED3, &cfg->features) ||
+			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &cfg->features) ||
+			test_bit(DPU_SSPP_SCALER_QSEED4, &cfg->features))
+		hw_pipe->version = _dpu_hw_sspp_get_scaler3_ver(hw_pipe);
+
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
 
 	return hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 0c95b7e64f6c..eeaf16c6af15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -352,6 +352,7 @@ struct dpu_hw_sspp_ops {
  * @hw: block hardware details
  * @catalog: back pointer to catalog
  * @mdp: pointer to associated mdp portion of the catalog
+ * @version: qseed block revision
  * @idx: pipe index
  * @cap: pointer to layer_cfg
  * @ops: pointer to operations possible for this pipe
@@ -362,6 +363,8 @@ struct dpu_hw_pipe {
 	const struct dpu_mdss_cfg *catalog;
 	const struct dpu_mdp_cfg *mdp;
 
+	u32 version;
+
 	/* Pipe */
 	enum dpu_sspp idx;
 	const struct dpu_sspp_cfg *cap;

-- 
2.39.2

