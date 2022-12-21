Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269846539C1
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 00:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D191010E4FD;
	Wed, 21 Dec 2022 23:20:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D333810E137
 for <freedreno@lists.freedesktop.org>; Wed, 21 Dec 2022 23:20:18 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 91F522044B;
 Thu, 22 Dec 2022 00:20:16 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Date: Thu, 22 Dec 2022 00:19:43 +0100
Message-Id: <20221221231943.1961117-9-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221231943.1961117-1-marijn.suijten@somainline.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 8/8] drm/msm/dpu: Add DSC configuration for
 SM8150 and SM8250
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These DSC blocks on CTL V1 need to set its corresponding PINGPONG block
index in a hardware register to configure where to send pixel output to,
via the newly-added DPU_DSC_OUTPUT_CTRL feature flag.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 318f0b4dbf6e..114ad8ca4554 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1566,18 +1566,25 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-#define DSC_BLK(_name, _id, _base) \
+#define DSC_BLK(_name, _id, _base, _features) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x140, \
-	.features = 0, \
+	.features = _features, \
 	}
 
 static struct dpu_dsc_cfg sdm845_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000),
-	DSC_BLK("dsc_1", DSC_1, 0x80400),
-	DSC_BLK("dsc_2", DSC_2, 0x80800),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00),
+	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
+	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
+};
+
+static struct dpu_dsc_cfg sm8150_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
 };
 
 /*************************************************************
@@ -2474,6 +2481,8 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.mixer = sm8150_lm,
 	.dspp_count = ARRAY_SIZE(sm8150_dspp),
 	.dspp = sm8150_dspp,
+	.dsc_count = ARRAY_SIZE(sm8150_dsc),
+	.dsc = sm8150_dsc,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
@@ -2524,6 +2533,8 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.mixer = sm8150_lm,
 	.dspp_count = ARRAY_SIZE(sm8150_dspp),
 	.dspp = sm8150_dspp,
+	.dsc_count = ARRAY_SIZE(sm8150_dsc),
+	.dsc = sm8150_dsc,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-- 
2.39.0

