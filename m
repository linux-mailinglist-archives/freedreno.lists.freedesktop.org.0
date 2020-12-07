Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8452D0E5C
	for <lists+freedreno@lfdr.de>; Mon,  7 Dec 2020 11:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F566E7D4;
	Mon,  7 Dec 2020 10:47:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Mon, 07 Dec 2020 10:47:29 UTC
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EE36E5A4
 for <freedreno@lists.freedesktop.org>; Mon,  7 Dec 2020 10:47:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1607338049; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BGNdc2vD2EMhLU2qHKPdKYLk6stKVPG2SBXK5CBPJB4=;
 b=o2E+cy6ymwhXJzO4ucJKCqpPQIzoelG4v0fB77jFMgBmJCtS+2NdE8fpViRvpxFudUdVUJNq
 3tnSdTB/gBZ91F/6nqoc127KisAoWrVxNn4afl9ZjgBo54EKAu/8Uzkit38a6i1Tm85eKkE0
 WtNF7djncZyLUknjtuNtjoHIYuo=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fce070baac945509759d2a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Dec 2020 10:42:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3B961C43465; Mon,  7 Dec 2020 10:42:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D6F4C433CA;
 Mon,  7 Dec 2020 10:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D6F4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Mon,  7 Dec 2020 16:12:07 +0530
Message-Id: <1607337728-11398-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v3 1/2] drm/msm: Add speed-bin support to a618
 gpu
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
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org, jcrouse@codeaurora.org,
 mka@chromium.org, robdclark@gmail.com, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some GPUs support different max frequencies depending on the platform.
To identify the correct variant, we should check the gpu speedbin
fuse value. Add support for this speedbin detection to a6xx family
along with the required fuse details for a618 gpu.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
Changes from v2:
	1. Made the changes a6xx specific to save space.
Changes from v1:
	1. Added the changes to support a618 sku to the series.
	2. Avoid failing probe in case of an unsupported sku. (Rob)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 74 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1306618..6304578 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,10 +10,13 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
 
+const u32 a618_speedbins[] = {0, 169, 174};
+
 static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -1208,6 +1211,10 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 	a6xx_gmu_remove(a6xx_gpu);
 
 	adreno_gpu_cleanup(adreno_gpu);
+
+	if (a6xx_gpu->opp_table)
+		dev_pm_opp_put_supported_hw(a6xx_gpu->opp_table);
+
 	kfree(a6xx_gpu);
 }
 
@@ -1264,6 +1271,67 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
 }
 
+static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
+{
+	int i;
+
+	if (revn == 618) {
+		for (i = 0; i < ARRAY_SIZE(a618_speedbins); i++) {
+			if (fuse == a618_speedbins[i])
+				return  (1 << i);
+		}
+	}
+
+	DRM_DEV_ERROR(dev,
+			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
+			fuse);
+	return ~0U;
+}
+
+static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
+		u32 revn)
+{
+
+	struct opp_table *opp_table;
+	struct nvmem_cell *cell;
+	u32 supp_hw = ~0U;
+	void *buf;
+
+	cell = nvmem_cell_get(dev, "speed_bin");
+	/*
+	 * -ENOENT means that the platform doesn't support speedbin which is
+	 * fine
+	 */
+	if (PTR_ERR(cell) == -ENOENT)
+		return 0;
+	else if (IS_ERR(cell)) {
+		DRM_DEV_ERROR(dev,
+				"failed to read speed-bin. Some OPPs may not be supported by hardware");
+		goto done;
+	}
+
+	buf = nvmem_cell_read(cell, NULL);
+	if (IS_ERR(buf)) {
+		nvmem_cell_put(cell);
+		DRM_DEV_ERROR(dev,
+				"failed to read speed-bin. Some OPPs may not be supported by hardware");
+		goto done;
+	}
+
+	supp_hw = fuse_to_supp_hw(dev, revn, *((u32 *) buf));
+
+	kfree(buf);
+	nvmem_cell_put(cell);
+
+done:
+	opp_table = dev_pm_opp_set_supported_hw(dev, &supp_hw, 1);
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
+
+	a6xx_gpu->opp_table = opp_table;
+	return 0;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -1325,6 +1393,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
+	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
+	if (ret) {
+		a6xx_destroy(&(a6xx_gpu->base.base));
+		return ERR_PTR(ret);
+	}
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e793d32..ce0610c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -33,6 +33,8 @@ struct a6xx_gpu {
 	void *llc_slice;
 	void *htw_llc_slice;
 	bool have_mmu500;
+
+	struct opp_table *opp_table;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
