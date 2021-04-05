Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49757354274
	for <lists+freedreno@lfdr.de>; Mon,  5 Apr 2021 15:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C759189F0B;
	Mon,  5 Apr 2021 13:47:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB4B89F0B
 for <freedreno@lists.freedesktop.org>; Mon,  5 Apr 2021 13:47:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617630457; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=LkXe1ru5QkypL7XJEXPXj4uLzUbzidHGT/01ds7D8L0=;
 b=gnraHQdRFPtikb5fUJ6RE+m2YQiUuwQKL12M7/dDrRlVdnl25Zp70z0EBseiQFo9n3ck4Jjo
 s7CoGgMU1OE0JaELa8nN8Wc2uK20Eya9lVJerEiIpBqcuGJhgF20S/LY/Z6SB7aIkU173CTH
 BI1uwpIXzpHOToReAk2dmQIHWGA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606b14ec8807bcde1d5d2683 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 13:47:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 54C07C433C6; Mon,  5 Apr 2021 13:47:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E747AC433CA;
 Mon,  5 Apr 2021 13:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E747AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Mon,  5 Apr 2021 19:17:12 +0530
Message-Id: <1617630433-36506-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH 1/2] drm/msm/a6xx: Fix perfcounter oob timeout
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
Cc: dianders@chromium.org, jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jordan@cosmicpenguin.net, eric@anholt.net,
 robdclark@gmail.com, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We were not programing the correct bit while clearing the perfcounter oob.
So, clear it correctly using the new 'clear' bit. This fixes the below
error:

[drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set PERFCOUNTER: 0x80000000

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 863047b..6a86cd0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -246,7 +246,7 @@ static int a6xx_gmu_hfi_start(struct a6xx_gmu *gmu)
 }
 
 struct a6xx_gmu_oob_bits {
-	int set, ack, set_new, ack_new;
+	int set, ack, set_new, ack_new, clear, clear_new;
 	const char *name;
 };
 
@@ -260,6 +260,8 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
 		.ack = 24,
 		.set_new = 30,
 		.ack_new = 31,
+		.clear = 24,
+		.clear_new = 31,
 	},
 
 	[GMU_OOB_PERFCOUNTER_SET] = {
@@ -268,18 +270,22 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
 		.ack = 25,
 		.set_new = 28,
 		.ack_new = 30,
+		.clear = 25,
+		.clear_new = 29,
 	},
 
 	[GMU_OOB_BOOT_SLUMBER] = {
 		.name = "BOOT_SLUMBER",
 		.set = 22,
 		.ack = 30,
+		.clear = 30,
 	},
 
 	[GMU_OOB_DCVS_SET] = {
 		.name = "GPU_DCVS",
 		.set = 23,
 		.ack = 31,
+		.clear = 31,
 	},
 };
 
@@ -335,9 +341,9 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 		return;
 
 	if (gmu->legacy)
-		bit = a6xx_gmu_oob_bits[state].ack;
+		bit = a6xx_gmu_oob_bits[state].clear;
 	else
-		bit = a6xx_gmu_oob_bits[state].ack_new;
+		bit = a6xx_gmu_oob_bits[state].clear_new;
 
 	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << bit);
 }
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
