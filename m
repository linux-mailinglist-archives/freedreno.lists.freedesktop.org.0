Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7438829E5CA
	for <lists+freedreno@lfdr.de>; Thu, 29 Oct 2020 09:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2036E851;
	Thu, 29 Oct 2020 08:07:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0486E851
 for <freedreno@lists.freedesktop.org>; Thu, 29 Oct 2020 08:07:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603958865; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yT9r6DS8IrtGHY2lOH1ABaVyZ6eV5rSGZSw7YhC711o=;
 b=CoQeizYs7QV4DkhCQAMNVNRRVKrHPzxuk0Wu5KluQ7iLnnlXLuLZmzCQD4DIQIzvJRB4siNw
 xhDMuOBZO8paLx3ucOqIegJRWDOlvFjmmlN8AYe+8V1irs1r+XXI/axBxwxyrK7sXuVmbMwJ
 fqfZkA47AImTwvboktOwO17t2fU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f9a78461c07f3eed7851e65 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Oct 2020 08:07:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7C93DC43382; Thu, 29 Oct 2020 08:07:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E1E64C433FF;
 Thu, 29 Oct 2020 08:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1E64C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Thu, 29 Oct 2020 13:37:20 +0530
Message-Id: <1603958841-20233-2-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
References: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
Subject: [Freedreno] [PATCH v4 2/3] arm64: dts: qcom: sc7180: Add gpu
 cooling support
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

Add cooling-cells property and the cooling maps for the gpu tzones
to support GPU cooling.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b383..8e2000c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2,7 +2,7 @@
 /*
  * SC7180 SoC device tree source
  *
- * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
@@ -1886,6 +1886,8 @@
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
 
+			#cooling-cells = <2>;
+
 			interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
 			interconnect-names = "gfx-mem";
 
@@ -3825,16 +3827,16 @@
 		};
 
 		gpuss0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss0_crit: gpuss0_crit {
@@ -3843,19 +3845,26 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <95000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss1_crit: gpuss1_crit {
@@ -3864,6 +3873,13 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		aoss1-thermal {
-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
