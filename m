Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C19C223CA5
	for <lists+freedreno@lfdr.de>; Fri, 17 Jul 2020 15:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B124A6EDAA;
	Fri, 17 Jul 2020 13:30:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752556EDAA
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jul 2020 13:30:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594992610; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=SpcJU7bfgUisz7PA0By3lJJltu7lpz4rCNZjdk5HjcE=;
 b=XUArZY1lcu4WBtE1NiVihuE/MRo2A1WSnEQjBTu1h70ki5sqxPFX8ex1WWCiyDk7deSh4oPC
 M9CNIOuv9L6wTAcmRO9haVZv9dXIuLifs2n9OU4Kb7DxAkA9in4IxhmuHSZnYQZ8WMt2CFNx
 38RFOB/F+d9ow907AwASKPfJNyc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5f11a7e21012768490b8635a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 13:30:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 99574C433CA; Fri, 17 Jul 2020 13:30:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A72CC433CB;
 Fri, 17 Jul 2020 13:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A72CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Fri, 17 Jul 2020 18:59:37 +0530
Message-Id: <1594992579-20662-5-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594992579-20662-1-git-send-email-akhilpo@codeaurora.org>
References: <1594992579-20662-1-git-send-email-akhilpo@codeaurora.org>
Subject: [Freedreno] [PATCH v6 4/6] arm64: dts: qcom: SDM845: Enable GPU DDR
 bw scaling
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
Cc: devicetree@vger.kernel.org, jonathan@marek.ca, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 jcrouse@codeaurora.org, mka@chromium.org, robdclark@gmail.com,
 dri-devel@freedesktop.org, viresh.kumar@linaro.org, sibis@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sharat Masetty <smasetty@codeaurora.org>

This patch adds the interconnects property for the gpu node and the
opp-peak-kBps property to the opps of the gpu opp table. This should
help enable DDR bandwidth scaling dynamically and proportionally to the
GPU frequency.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8eb5a31..1cd2dae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3515,42 +3515,52 @@
 
 			qcom,gmu = <&gmu>;
 
+			interconnects = <&mem_noc MASTER_GFX3D &mem_noc SLAVE_EBI1>;
+			interconnect-names = "gfx-mem";
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				opp-710000000 {
 					opp-hz = /bits/ 64 <710000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <7216000>;
 				};
 
 				opp-675000000 {
 					opp-hz = /bits/ 64 <675000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <7216000>;
 				};
 
 				opp-596000000 {
 					opp-hz = /bits/ 64 <596000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <6220000>;
 				};
 
 				opp-520000000 {
 					opp-hz = /bits/ 64 <520000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <6220000>;
 				};
 
 				opp-414000000 {
 					opp-hz = /bits/ 64 <414000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <4068000>;
 				};
 
 				opp-342000000 {
 					opp-hz = /bits/ 64 <342000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <2724000>;
 				};
 
 				opp-257000000 {
 					opp-hz = /bits/ 64 <257000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <1648000>;
 				};
 			};
 		};
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
