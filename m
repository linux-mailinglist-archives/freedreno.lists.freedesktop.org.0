Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C05D1B0DCA
	for <lists+freedreno@lfdr.de>; Mon, 20 Apr 2020 16:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE586E58B;
	Mon, 20 Apr 2020 14:04:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F646E58B
 for <freedreno@lists.freedesktop.org>; Mon, 20 Apr 2020 14:04:09 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x8so7286949qtp.13
 for <freedreno@lists.freedesktop.org>; Mon, 20 Apr 2020 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dzXoe8MRBMXE8PvmYjCZbxKjAgY1cHixeMzN7z8P8Js=;
 b=1syIqn1ftSMUwzMqfNYLRFgC8QlOb+qFSiHn7uE8u9LZ/cK+nIOWqVav+cXFCm4QYq
 lm1TifYtjy+i+2RI7403FF/F29xV1sxJN8FJihF+Il4sjJ8xOEYd2CJHyWFTfauwCgTk
 I8RMpp3O0i/NXwNBXzY09ZQP+3eV8lbaW5pNUPU4peSLoWwLP1hukqf8Y0dJxnqeglh6
 AvlMSP0k5WfAGxD5eVb6l1zgil4bYet7+Wfg+UMWTL94EreKc2bFTNxg0v8luICqSXpm
 9/6hTpRKNcAD7uhC1CRT9lpsma6iytWee6NuJ1Pt7pp1vasjDCJlacFKLClPnj3wl7+K
 7+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dzXoe8MRBMXE8PvmYjCZbxKjAgY1cHixeMzN7z8P8Js=;
 b=ooVejYIjVmiY7YgTlKhDhfDZL/OgUxb01hFzSnB8rr9f5nFKsWEwNuUUAMa1wgWQvN
 G1Yr5wiP63m5sVpJCgV57Ggs7LUE3hhOXPkylrTEf7CExTZlYufzk5K227FED4T79SuL
 WGmiRDcOzK1X2DRUXBASpvYHFvKF1+aAfF6kvgQbC3o79fAfAo7XUc5UEKuNmUFtjuIk
 aVulhuz8VrxyOpMo8+sMjOOY6jASf5a8sxwXNXMHInUxCFXlgJC/VJ376aDjPBOEWmGQ
 OOYlVQgNV6aUg0tuacBUT/JTbERm/AbHwtl8jsIpOxlRqyrvGMd54XW3LmAWxZpeUxl2
 kBmA==
X-Gm-Message-State: AGi0PuYBxn5AIutKQtQEtUAMgln1S6cJ49WVFbn6S/pH6vISnRQYyvQu
 q1NPYwOqrer2+eg0xeBdFb3OOY+99jqT4w==
X-Google-Smtp-Source: APiQypIwj9fQ3EqvpOYtWuUmbu/u4rWEzWryFT+ev+AfD+FSuHGqIH8abAhakF2m1ce4M7/fAFxQ+Q==
X-Received: by 2002:ac8:19dd:: with SMTP id s29mr16421043qtk.164.1587391447612; 
 Mon, 20 Apr 2020 07:04:07 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:04:06 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 20 Apr 2020 10:03:12 -0400
Message-Id: <20200420140313.7263-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 8/9] drm/msm/a6xx: enable GMU log
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is required for a650 to work.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 16 ++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  4 ++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b583bf6e293b..1cdb7c832b87 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -198,6 +198,12 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	u32 val;
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
+
+	/* Set the log wptr index
+	 * note: downstream saves the value in poweroff and restores it here
+	 */
+	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
+
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
@@ -739,6 +745,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 
 	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
 
+	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG,
+		  gmu->log->iova | (gmu->log->size / SZ_4K - 1));
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
@@ -1416,6 +1425,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	a6xx_gmu_memory_free(gmu, gmu->dcache);
 	a6xx_gmu_memory_free(gmu, gmu->dummy);
 	a6xx_gmu_memory_free(gmu, gmu->debug);
+	a6xx_gmu_memory_free(gmu, gmu->log);
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	iommu_detach_device(gmu->domain, gmu->dev);
@@ -1495,6 +1505,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (IS_ERR(gmu->hfi))
 		goto err_memory;
 
+	/* Allocate memory for the GMU log region */
+	gmu->log = a6xx_gmu_memory_alloc(gmu, SZ_4K, 0);
+	if (IS_ERR(gmu->log))
+		goto err_memory;
+
 	/* Map the GMU registers */
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio))
@@ -1542,6 +1557,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	a6xx_gmu_memory_free(gmu, gmu->dcache);
 	a6xx_gmu_memory_free(gmu, gmu->dummy);
 	a6xx_gmu_memory_free(gmu, gmu->debug);
+	a6xx_gmu_memory_free(gmu, gmu->log);
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	if (gmu->domain) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index abd425ca6682..589b9b0c348e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -59,6 +59,7 @@ struct a6xx_gmu {
 
 	struct a6xx_gmu_bo *hfi;
 	struct a6xx_gmu_bo *debug;
+	struct a6xx_gmu_bo *log;
 	struct a6xx_gmu_bo *icache;
 	struct a6xx_gmu_bo *dcache;
 	struct a6xx_gmu_bo *dummy;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index b4357ea550ec..176ae94d9fe6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -205,6 +205,10 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
 
+#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
+
+#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
+
 #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
 
 #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
