Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EB1126326
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2019 14:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E566EB6B;
	Thu, 19 Dec 2019 13:15:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD2F6EB6A
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2019 13:15:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576761344; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=febedNDTPuxTPuxYsccv+MwSXlCSEFu8LCx+MnKu0DM=;
 b=EvzxPS9FI2V9jZm0TJ6yMG6BLlA2fIZ8mJUHKFcGHGOl6yZ2fzO+Xg02c0cMwiQUyrH9UbMd
 vb/b2zh+V4jJzA/1qm3sjOatuZ7LHjlWXSCuaNbfbLwgav9K8/LqV8OrNZXDyrUHOC9q7AIN
 VBa1FWTz/wwiV+XQKPP8klAFNR0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb77ff.7f8b1f5c91f0-smtp-out-n02;
 Thu, 19 Dec 2019 13:15:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DAA83C447AD; Thu, 19 Dec 2019 13:15:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AC2BAC447A9;
 Thu, 19 Dec 2019 13:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC2BAC447A9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Thu, 19 Dec 2019 18:44:44 +0530
Message-Id: <1576761286-20451-4-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
References: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
Subject: [Freedreno] [PATCH 3/5] drm/msm: rearrange the gpu_rmw() function
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
Cc: saiprakash.ranjan@codeaurora.org, jcrouse@codeaurora.org, will@kernel.org,
 linux-arm-msm@vger.kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dri-devel@freedesktop.org,
 robin.murphy@arm.com, Sharat Masetty <smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The register read-modify-write construct is generic enough
that it can be used by other subsystems as needed, create
a more generic rmw() function and have the gpu_rmw() use
this new function.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
 drivers/gpu/drm/msm/msm_drv.h | 1 +
 drivers/gpu/drm/msm/msm_gpu.h | 5 +----
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f50fefb..4c4559f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -165,6 +165,14 @@ u32 msm_readl(const void __iomem *addr)
 	return val;
 }
 
+void msm_rmw(void __iomem *addr, u32 mask, u32 or)
+{
+	u32 val = msm_readl(addr);
+
+	val &= ~mask;
+	msm_writel(val | or, addr);
+}
+
 struct msm_vblank_work {
 	struct work_struct work;
 	int crtc_id;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 71547e7..997729e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -409,6 +409,7 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 		const char *dbgname);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
+void msm_rmw(void __iomem *addr, u32 mask, u32 or);
 
 struct msm_gpu_submitqueue;
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c..a58ef16 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -223,10 +223,7 @@ static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
 
 static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
 {
-	uint32_t val = gpu_read(gpu, reg);
-
-	val &= ~mask;
-	gpu_write(gpu, reg, val | or);
+	msm_rmw(gpu->mmio + (reg << 2), mask, or);
 }
 
 static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
-- 
1.9.1
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
