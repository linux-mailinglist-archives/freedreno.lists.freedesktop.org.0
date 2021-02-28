Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E011327243
	for <lists+freedreno@lfdr.de>; Sun, 28 Feb 2021 13:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2BB6E212;
	Sun, 28 Feb 2021 12:43:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6487D6E214
 for <freedreno@lists.freedesktop.org>; Sun, 28 Feb 2021 12:43:39 +0000 (UTC)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl
 [83.6.165.236])
 by m-r1.th.seeweb.it (Postfix) with ESMTPA id B46401F49E;
 Sun, 28 Feb 2021 13:43:34 +0100 (CET)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: phone-devel@vger.kernel.org
Date: Sun, 28 Feb 2021 13:43:26 +0100
Message-Id: <20210228124328.136397-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi: Uncomment core_mmss clock for
 MSM8996
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 Daniel Vetter <daniel@ffwll.ch>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The MSM8996 core_mmss clock was commented out due to some
strange issues that others were experiencing.

At least SONY Tone family is working perfectly fine with this clock
declared and gets it up and running without any error.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index b2ff68a15791..f3f1c03c7db9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -106,12 +106,8 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.num_dsi = 2,
 };
 
-/*
- * TODO: core_mmss_clk fails to enable for some reason, but things work fine
- * without it too. Figure out why it doesn't enable and uncomment below
- */
 static const char * const dsi_8996_bus_clk_names[] = {
-	"mdp_core", "iface", "bus", /* "core_mmss", */
+	"mdp_core", "iface", "bus", "core_mmss",
 };
 
 static const struct msm_dsi_config msm8996_dsi_cfg = {
-- 
2.30.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
