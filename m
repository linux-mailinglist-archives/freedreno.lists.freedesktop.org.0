Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A77148660
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2020 14:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BB772AB0;
	Fri, 24 Jan 2020 13:50:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4826E366
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2020 12:21:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579868508; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=F1LWU1oX1nibhhy7cGSDGcWE9ft9GXYa7Jl4DQRxQjA=;
 b=iDCZykkEVpyLv4oLAc6mQR0/DcDeXN0R7e2luJNMB8LiS6rL2leyna1liehEbxDdwzFb3iqF
 hLH7q4lfPBlOf4zzWO/fBbANw/RSFZaAYtfkLIiA19T/QVoEHB2MI3Yq1r3Fn+29NCcQq9Zi
 uLVdL9gQV8838HMsAYQkL6EER+c=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2ae159.7fdd7b5ae848-smtp-out-n01;
 Fri, 24 Jan 2020 12:21:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EBB76C433A2; Fri, 24 Jan 2020 12:21:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DF1CC433CB;
 Fri, 24 Jan 2020 12:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DF1CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Fri, 24 Jan 2020 17:50:11 +0530
Message-Id: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 24 Jan 2020 13:50:34 +0000
Subject: [Freedreno] [PATCH] drm/msm/a6xx: Correct the highestbank
 configuration
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
Cc: smasetty@codeaurora.org, linux-arm-msm@vger.kernel.org,
 jcrouse@codeaurora.org, dri-devel@freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Highest bank bit configuration is different for a618 gpu. Update
it with the correct configuration which is the reset value incidentally.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index daf0780..536d196 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -470,10 +470,12 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Select CP0 to always count cycles */
 	gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
 
-	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
-	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
-	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
-	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
+	if (adreno_is_a630(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
+		gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
+		gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
+		gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
+	}
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
-- 
2.7.4
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
