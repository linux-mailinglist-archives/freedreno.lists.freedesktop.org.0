Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D91D2D92
	for <lists+freedreno@lfdr.de>; Thu, 14 May 2020 12:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298DB6E323;
	Thu, 14 May 2020 10:54:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2336E321
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 10:54:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589453686; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=a2TxXvMLOnzy/p6Es7kPbLs0G7YlAQN0tnzG1S0LZKs=;
 b=u17ttGn2G6oHJtAK1poKhBPZfMoLGDwtXGTJXEZwG2+1ZozvJiR+aRnjIK/K9WTa3Nz6W85s
 61/mMGEreLVkPjQ2ZHoS5NoS/ykkARIK85GQ8EWzH051ZY4TalToyJHdj8jSI+p6anrVn7NW
 f5tnO4YXLme8ZSHNlm/bHGM70Sk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd236d.7fbb80bdc998-smtp-out-n04;
 Thu, 14 May 2020 10:54:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6BD95C433BA; Thu, 14 May 2020 10:54:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EE696C433D2;
 Thu, 14 May 2020 10:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE696C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Thu, 14 May 2020 16:24:15 +0530
Message-Id: <1589453659-27581-3-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
Subject: [Freedreno] [PATCH 2/6] arm64: dts: qcom: sc7180: Add opp-peak-kBps
 to GPU opp
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
Cc: linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org, mka@chromium.org,
 dri-devel@freedesktop.org, georgi.djakov@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add opp-peak-kBps bindings to the GPU opp table, listing the peak
GPU -> DDR bandwidth requirement for each opp level. This will be
used to scale the DDR bandwidth along with the GPU frequency dynamically.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 0ce9921..89f7767 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1392,36 +1392,43 @@
 				opp-800000000 {
 					opp-hz = /bits/ 64 <800000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <8532000>;
 				};

 				opp-650000000 {
 					opp-hz = /bits/ 64 <650000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <7216000>;
 				};

 				opp-565000000 {
 					opp-hz = /bits/ 64 <565000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <5412000>;
 				};

 				opp-430000000 {
 					opp-hz = /bits/ 64 <430000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5412000>;
 				};

 				opp-355000000 {
 					opp-hz = /bits/ 64 <355000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <3072000>;
 				};

 				opp-267000000 {
 					opp-hz = /bits/ 64 <267000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <3072000>;
 				};

 				opp-180000000 {
 					opp-hz = /bits/ 64 <180000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					opp-peak-kBps = <1804000>;
 				};
 			};
 		};
--
2.7.4
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
