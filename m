Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3346198DC8
	for <lists+freedreno@lfdr.de>; Tue, 31 Mar 2020 09:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D5D6E5B0;
	Tue, 31 Mar 2020 07:57:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37286E5C1
 for <freedreno@lists.freedesktop.org>; Tue, 31 Mar 2020 07:57:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585641429; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VT9/ErTi2g1chyk6bUNJTnT/qqr1194jK5RfTnp8tS4=;
 b=RoLZD2JG2b9VIdUap0k/t5ZXrTLz0j2jWQILM9l8/ZASjEFoLqj+8CNq0rxKivHTeZNaeeMd
 e7TZJG8H0qnC6j88Xxm5+FTSQ3qi+sIg23vX2ZxBg/m99TSStapBM8IPt/umomcl8rnras5v
 nrd9pFZrDjTLNgDc9BmNZg0UyvI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7c8.7fd9472f7378-smtp-out-n01;
 Tue, 31 Mar 2020 07:56:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9CB0BC4478F; Tue, 31 Mar 2020 07:56:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 39EB0C44795;
 Tue, 31 Mar 2020 07:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 39EB0C44795
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Tue, 31 Mar 2020 13:25:53 +0530
Message-Id: <1585641353-23229-6-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
Subject: [Freedreno] [PATCH 5/5] dt-bindings: drm/msm/gpu: Document OPP
 phandle list for the GPU
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
Cc: saravanak@google.com, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 jcrouse@codeaurora.org, mka@chromium.org, sibis@codeaurora.org,
 viresh.kumar@linaro.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Update the documentation for listing the multiple optional GPU and the
DDR OPP tables to help enable DDR scaling.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 .../devicetree/bindings/display/msm/gpu.txt        | 63 +++++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 70025cb..ff3ae1b 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -21,7 +21,10 @@ Required properties:
   following devices should not list clocks:
    - qcom,adreno-630.2
 - iommus: optional phandle to an adreno iommu instance
-- operating-points-v2: optional phandle to the OPP operating points
+- operating-points-v2: optional phandles to the OPP operating point tables
+  one for the GPU OPPs and the other for the GPU->DDR OPPs. Note that if
+  multiple OPP tables are specified, the GPU OPP table(considered primary)
+  should be the first in the phandle list.
 - interconnects: optional phandle to an interconnect provider.  See
   ../interconnect/interconnect.txt for details.
 - qcom,gmu: For GMU attached devices a phandle to the GMU device that will
@@ -75,7 +78,7 @@ Example a6xx (with GMU):

 		iommus = <&adreno_smmu 0>;

-		operating-points-v2 = <&gpu_opp_table>;
+		operating-points-v2 = <&gpu_opp_table>, <&gpu_ddr_bw_opp_table>;

 		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;

@@ -85,5 +88,61 @@ Example a6xx (with GMU):
 			memory-region = <&zap_shader_region>;
 			firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
 		};
+
+		gpu_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-430000000 {
+				opp-hz = /bits/ 64 <430000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				required-opps = <&gpu_ddr_bw_opp6>;
+			};
+
+			opp-355000000 {
+				opp-hz = /bits/ 64 <355000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				required-opps = <&gpu_ddr_bw_opp4>;
+			};
+
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				required-opps = <&gpu_ddr_bw_opp4>;
+			};
+
+			opp-180000000 {
+				opp-hz = /bits/ 64 <180000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				required-opps = <&gpu_ddr_bw_opp2>;
+			};
+		};
+
+		gpu_ddr_bw_opp_table: gpu-ddr-bw-opp-table {
+			compatible = "operating-points-v2";
+
+			gpu_ddr_bw_opp1: opp-300000000  {
+				opp-peak-kBps =/bits/ 32 <1200000>;
+			};
+
+			gpu_ddr_bw_opp2: opp-451000000  {
+				opp-peak-kBps =/bits/ 32 <1804000>;
+			};
+
+			gpu_ddr_bw_opp3: opp-547000000  {
+				opp-peak-kBps =/bits/ 32 <2188000>;
+			};
+
+			gpu_ddr_bw_opp4: opp-768000000  {
+				opp-peak-kBps =/bits/ 32 <3072000>;
+			};
+
+			gpu_ddr_bw_opp5: opp-1017000000  {
+				opp-peak-kBps =/bits/ 32 <4068000>;
+			};
+
+			gpu_ddr_bw_opp6: opp-1353000000  {
+				opp-peak-kBps =/bits/ 32 <5412000>;
+			};
+		};
 	};
 };
--
2.7.4
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
