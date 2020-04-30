Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A2F1BEED7
	for <lists+freedreno@lfdr.de>; Thu, 30 Apr 2020 06:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D596EA80;
	Thu, 30 Apr 2020 04:00:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653B26EA80
 for <freedreno@lists.freedesktop.org>; Thu, 30 Apr 2020 04:00:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588219223; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=h4kCJNETn7m8Ad7wR1nijxpoOjZhXlKIL1/i8b1sVbg=;
 b=XLXsdfoffACq/Ap5Nh1FSx0V9BHUKuMMhz64/8idxewYACEDN6nJCch2XUFOL3/bqqkDmXLw
 I53+FuOmJlOUKKX+mmKZSsU6zOlhrkNKpWly8uOB0W/7VMlKrgaTrgXu1od2VKR9OhGFNJxy
 xPbPYdnxEudwkg4xzCznCefThGs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eaa4d44.7f104dc16068-smtp-out-n01;
 Thu, 30 Apr 2020 04:00:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 417C5C43636; Thu, 30 Apr 2020 04:00:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B895DC433D2;
 Thu, 30 Apr 2020 03:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B895DC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Thu, 30 Apr 2020 09:29:47 +0530
Message-Id: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Subject: [Freedreno] [PATCH v2] dt-bindings: arm-smmu: Add sc7180 compatible
 string and mem_iface clock
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
Cc: robh@kernel.org, saiprakash.ranjan@codeaurora.org,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 dianders@chromium.org, linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
 mka@chromium.org, dri-devel@freedesktop.org, robin.murphy@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch adds a new compatible string for sc7180 and also an
additional clock listing needed to power the TBUs and the TCU.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
v2: Addressed review comments from Doug

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6515dbe..ba5dba4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,msm8996-smmu-v2
               - qcom,msm8998-smmu-v2
+              - qcom,sc7180-smmu-v2
               - qcom,sdm845-smmu-v2
           - const: qcom,smmu-v2

@@ -113,16 +114,23 @@ properties:
       present in such cases.

   clock-names:
+    minItems: 2
+    maxItems: 3
     items:
       - const: bus
       - const: iface
+      - const: mem_iface

   clocks:
+    minItems: 2
+    maxItems: 3
     items:
       - description: bus clock required for downstream bus access and for the
           smmu ptw
       - description: interface clock required to access smmu's registers
           through the TCU's programming interface.
+      - description: clock required for the inner working of SMMU TBUs and the
+          TCU like the pagetable walks and the TLB flushes.

   power-domains:
     maxItems: 1
--
1.9.1
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
