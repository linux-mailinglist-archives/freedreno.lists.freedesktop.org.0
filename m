Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F329D05E
	for <lists+freedreno@lfdr.de>; Wed, 28 Oct 2020 15:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398E16E52F;
	Wed, 28 Oct 2020 14:35:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE96E52F
 for <freedreno@lists.freedesktop.org>; Wed, 28 Oct 2020 14:35:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603895739; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/ZGUMfp1A0aHVNO/vay/6ICqzhjKvdAharx01TPBxAI=;
 b=KoWn7nbNQ2lobXUgb8pGQqU4vs4Fbn/f+ofA0lmlcS8qxUMu/FUITTEMqqKH5po2ZqbQV1at
 5l/kWJdfOxNE0VzxUKYo8BP8hFDTuaslqyLAZUqsCkO2f+VLhtnq4Ppwm2iU48m/FID5ifQa
 GdXUkdj3rOW1bw/gMG4RIM49x4Y=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f9981a84e4fe7071da1f698 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 14:35:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 23C53C433F0; Wed, 28 Oct 2020 14:35:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E2770C433CB;
 Wed, 28 Oct 2020 14:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2770C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed, 28 Oct 2020 20:05:10 +0530
Message-Id: <1603895711-23755-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v2 1/2] drm/msm: Implement shutdown callback for
 adreno
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
Cc: dianders@chromium.org, linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org, mka@chromium.org,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implement the shutdown callback for adreno gpu platform device
to safely shutdown it before a system reboot. This helps to avoid
futher transactions from gpu after the smmu is moved to bypass mode.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 58e03b2..87c8b03 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -475,6 +475,11 @@ static int adreno_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void adreno_shutdown(struct platform_device *pdev)
+{
+	pm_runtime_force_suspend(&pdev->dev);
+}
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,adreno-3xx" },
@@ -509,6 +514,7 @@ static const struct dev_pm_ops adreno_pm_ops = {
 static struct platform_driver adreno_driver = {
 	.probe = adreno_probe,
 	.remove = adreno_remove,
+	.shutdown = adreno_shutdown,
 	.driver = {
 		.name = "adreno",
 		.of_match_table = dt_match,
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
