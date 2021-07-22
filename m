Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8B23D1C47
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 05:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A186EEAB;
	Thu, 22 Jul 2021 03:12:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806436EEAB
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 03:12:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626923541; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HnDQSjnqATFUjsxDTN+Uk7sSSMjVsRxKGexb0MYwBv0=;
 b=SO8C7HDn+KXZDhIZBw1S9xU8+7vHu68oogpeNAR6qr420AZ8Fvw+4OYvwW73F4VYhbpffy0G
 2gjeRrwA124s9lP1LTc/kM7tjdJN+Eh8e4+J+DqJmNXzYEaESSNaSJEAd5lEEvwMAYarcoBn
 pdDZdEIYXubOsQum6UAi5zRhA34=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60f8e212fcf9fe7b785f7588 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 03:12:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7667DC4338A; Thu, 22 Jul 2021 03:12:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D79A3C433D3;
 Thu, 22 Jul 2021 03:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D79A3C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed, 21 Jul 2021 20:12:10 -0700
Message-Id: <1626923530-1468-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH] freedreno/registers: update dsi registers to
 support tpg
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
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, swboyd@chromium.org,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, aravindh@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Update the DSI registers to support TPG.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 src/freedreno/registers/dsi/dsi.xml | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/src/freedreno/registers/dsi/dsi.xml b/src/freedreno/registers/dsi/dsi.xml
index bd773ef..90f1a29 100644
--- a/src/freedreno/registers/dsi/dsi.xml
+++ b/src/freedreno/registers/dsi/dsi.xml
@@ -50,6 +50,28 @@ xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
 		<value name="LANE_SWAP_2103" value="6"/>
 		<value name="LANE_SWAP_3210" value="7"/>
 	</enum>
+		<enum name="video_config_bpp">
+		<value name="VIDEO_CONFIG_18BPP" value="0"/>
+		<value name="VIDEO_CONFIG_24BPP" value="1"/>
+	</enum>
+	<enum name="video_pattern_sel">
+		<value name="VID_PRBS" value="0"/>
+		<value name="VID_INCREMENTAL" value="1"/>
+		<value name="VID_FIXED" value="2"/>
+		<value name="VID_MDSS_GENERAL_PATTERN" value="3"/>
+	</enum>
+	<enum name="cmd_mdp_stream0_pattern_sel">
+		<value name="CMD_MDP_PRBS" value="0"/>
+		<value name="CMD_MDP_INCREMENTAL" value="1"/>
+		<value name="CMD_MDP_FIXED" value="2"/>
+		<value name="CMD_MDP_MDSS_GENERAL_PATTERN" value="3"/>
+	</enum>
+	<enum name="cmd_dma_pattern_sel">
+		<value name="CMD_DMA_PRBS" value="0"/>
+		<value name="CMD_DMA_INCREMENTAL" value="1"/>
+		<value name="CMD_DMA_FIXED" value="2"/>
+		<value name="CMD_DMA_CUSTOM_PATTERN_DMA_FIFO" value="3"/>
+	</enum>
 	<bitset name="DSI_IRQ">
 		<bitfield name="CMD_DMA_DONE" pos="0" type="boolean"/>
 		<bitfield name="MASK_CMD_DMA_DONE" pos="1" type="boolean"/>
@@ -287,6 +309,31 @@ xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
 	<reg32 offset="0x00128" name="PHY_RESET">
 		<bitfield name="RESET" pos="0" type="boolean"/>
 	</reg32>
+	<reg32 offset="0x00160" name="TEST_PATTERN_GEN_VIDEO_INIT_VAL"/>
+	<reg32 offset="0x00198" name="TPG_MAIN_CONTROL">
+		<bitfield name="CHECKERED_RECTANGLE_PATTERN" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x001a0" name="TPG_VIDEO_CONFIG">
+		<bitfield name="BPP" low="0" high="1" type="video_config_bpp"/>
+		<bitfield name="RGB" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00158" name="TEST_PATTERN_GEN_CTRL">
+		<bitfield name="CMD_DMA_PATTERN_SEL" low="16" high="17" type="cmd_dma_pattern_sel"/>
+		<bitfield name="CMD_MDP_STREAM0_PATTERN_SEL" low="8" high="9" type="cmd_mdp_stream0_pattern_sel"/>
+		<bitfield name="VIDEO_PATTERN_SEL" low="4" high="5" type="video_pattern_sel"/>
+		<bitfield name="TPG_DMA_FIFO_MODE" pos="2" type="boolean"/>
+		<bitfield name="CMD_DMA_TPG_EN" pos="1" type="boolean"/>
+		<bitfield name="EN" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00168" name="TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0"/>
+	<reg32 offset="0x00180" name="TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER">
+		<bitfield name="SW_TRIGGER" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0019c" name="TPG_MAIN_CONTROL2">
+		<bitfield name="CMD_MDP0_CHECKERED_RECTANGLE_PATTERN" pos="7" type="boolean"/>
+		<bitfield name="CMD_MDP1_CHECKERED_RECTANGLE_PATTERN" pos="16" type="boolean"/>
+		<bitfield name="CMD_MDP2_CHECKERED_RECTANGLE_PATTERN" pos="25" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x0017c" name="T_CLK_PRE_EXTEND">
 		<bitfield name="INC_BY_2_BYTECLK" pos="0" type="boolean"/>
 	</reg32>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
