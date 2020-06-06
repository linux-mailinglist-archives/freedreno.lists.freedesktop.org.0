Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028AA1F04D4
	for <lists+freedreno@lfdr.de>; Sat,  6 Jun 2020 06:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE216E986;
	Sat,  6 Jun 2020 04:26:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357C86E986
 for <freedreno@lists.freedesktop.org>; Sat,  6 Jun 2020 04:26:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591417582; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=I8DTy0+J0lw/p2a0JP3pdcvQksGaqfQghz8FqkcM+Z0=;
 b=Jt3uGGh1tDYZ+gMc5jiJaE79Rtc1Uj/alYM9COcEyWM7srRGAF4djRfj+rtGtVziAUe8AVre
 5wJJYfjzsXbCeTutGOasW3OgucFVPFg47bzBMuLO/L7otkBDPZJw+E6G7Koarc4RRIs1vKtn
 8gZ61p13VU9klnq+Pc9In/VKd2U=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5edb1ae3583b2d42d5f17529 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 06 Jun 2020 04:26:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E629C433AD; Sat,  6 Jun 2020 04:26:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C133DC433CA;
 Sat,  6 Jun 2020 04:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C133DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Sat,  6 Jun 2020 09:55:46 +0530
Message-Id: <1591417551-38051-2-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
References: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
Subject: [Freedreno] [PATCH v3 1/6] dt-bindings: drm/msm/gpu: Document gpu
 opp table
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
Cc: robdclark@gmail.com, saravanak@google.com, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 jcrouse@codeaurora.org, mka@chromium.org, sibis@codeaurora.org,
 viresh.kumar@linaro.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Update documentation to list the gpu opp table bindings including the
newly added "opp-peak-kBps" needed for GPU-DDR bandwidth scaling.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/msm/gpu.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 70025cb..48bd4ab 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -79,6 +79,34 @@ Example a6xx (with GMU):

 		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;

+		gpu_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-430000000 {
+				opp-hz = /bits/ 64 <430000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				opp-peak-kBps = <5412000>;
+			};
+
+			opp-355000000 {
+				opp-hz = /bits/ 64 <355000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				opp-peak-kBps = <3072000>;
+			};
+
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				opp-peak-kBps = <3072000>;
+			};
+
+			opp-180000000 {
+				opp-hz = /bits/ 64 <180000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				opp-peak-kBps = <1804000>;
+			};
+		};
+
 		qcom,gmu = <&gmu>;

 		zap-shader {
--
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
