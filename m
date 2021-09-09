Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF6405DC2
	for <lists+freedreno@lfdr.de>; Thu,  9 Sep 2021 21:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6C96E90B;
	Thu,  9 Sep 2021 19:50:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406CD6E907
 for <freedreno@lists.freedesktop.org>; Thu,  9 Sep 2021 19:50:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631217033; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8k0CvjX0/8JIXqcWEeh28GQhLgUnSZY1azZrJAw1D+s=;
 b=pn4eprAgkSLfJDeMMqVnm0a85B70xNlOpEb990EP6PByOXc9Ztnqw3RjMQc88STNr8e8Ux6M
 cWz5oaHqdw3c/AqOUoSpeoljFIoD7olql7nH9jWzj7vLnbqemq1fo6Q6WmXPT7eXpZx3i++5
 UAX2IwD3jr4ti/r9pLfW6dHMIwQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 613a65702843f361a5faf333 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 19:50:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F0B4CC4361B; Thu,  9 Sep 2021 19:50:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 478CAC43616;
 Thu,  9 Sep 2021 19:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 478CAC43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org, kalyan_t@codeaurora.org, rajeevny@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu,  9 Sep 2021 12:49:58 -0700
Message-Id: <1631216998-10049-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v2] arm64: dts: qcom: sc7280: fix display port
 phy reg property
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Existing display port phy reg property is derived from usb phy which
map display port phy pcs to wrong address which cause aux init
with wrong address and prevent both dpcd read and write from working.
Fix this problem by assigning correct pcs address to display port
phy reg property.

Changes in V2:
-- rewording the commit text

Fixes: 9886e8fd8438 ("arm64: dts: qcom: sc7280: Add USB related nodes")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index fa1353f..cdaff5f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2881,15 +2881,11 @@
 			dp_phy: dp-phy@88ea200 {
 				reg = <0 0x088ea200 0 0x200>,
 				      <0 0x088ea400 0 0x200>,
-				      <0 0x088eac00 0 0x400>,
+				      <0 0x088eaa00 0 0x200>,
 				      <0 0x088ea600 0 0x200>,
-				      <0 0x088ea800 0 0x200>,
-				      <0 0x088eaa00 0 0x100>;
+				      <0 0x088ea800 0 0x200>;
 				#phy-cells = <0>;
 				#clock-cells = <1>;
-				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_phy_pipe_clk_src";
 			};
 		};
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

