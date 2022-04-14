Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C53501B54
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 20:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDC410E1E0;
	Thu, 14 Apr 2022 18:50:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Thu, 14 Apr 2022 18:50:55 UTC
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6108010E165
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 18:50:55 +0000 (UTC)
Received: from localhost.localdomain (abxj52.neoplus.adsl.tpnet.pl [83.9.3.52])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id 54EC13F779;
 Thu, 14 Apr 2022 20:45:11 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
Date: Thu, 14 Apr 2022 20:44:34 +0200
Message-Id: <20220414184442.375113-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220414184442.375113-1-konrad.dybcio@somainline.org>
References: <20220414184442.375113-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] drm/msm/a6xx: Add speedbin support for
 A619 GPU
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, Wang Qing <wangqing@vivo.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 martin.botka@somainline.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, angelogioacchino.delregno@somainline.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There are various SKUs of A619, ranging from 565 MHz to 850 MHz, depending
on the bin. Add support for distinguishing them, so that proper frequency
ranges can be applied, depending on the HW.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e8d4cca6cd46..2cd632fdd890 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1540,7 +1540,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			SZ_16M - SZ_16K, 0x04000, "icache");
 		if (ret)
 			goto err_memory;
-	} else {
+	} else if (adreno_is_a640_family(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
 			SZ_256K - SZ_16K, 0x04000, "icache");
 		if (ret)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ddeb04a77662..57d07ae86b2a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1836,6 +1836,22 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a619_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 120)
+		return 4;
+	else if (fuse == 138)
+		return 3;
+	else if (fuse == 169)
+		return 2;
+	else if (fuse == 180)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1855,6 +1871,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+		val = a619_get_speed_bin(fuse);
+
 	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-- 
2.35.2

