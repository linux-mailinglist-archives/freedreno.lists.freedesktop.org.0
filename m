Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5B1EEC90
	for <lists+freedreno@lfdr.de>; Thu,  4 Jun 2020 22:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF166E5D2;
	Thu,  4 Jun 2020 20:57:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4441F6E5D2
 for <freedreno@lists.freedesktop.org>; Thu,  4 Jun 2020 20:57:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591304260; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kwI9nFCS4dfmx/d3a/Nft429YjYk2J8jpbCay6YdWxE=;
 b=LipUMxYebtwNxvz+A+C5nf81Km2+pT2xzigEc2UWKUXWC+01L8DdB7/rMws7fdq4SezewF/A
 FCF88wD4YfthHXD9CjbFZj5P5odIZbFDq8giWpHnoP69WvWPkYlBjriCXCAkw62YWCTORCv+
 G4RBOk5pJM201W1xqQjWZEUFux4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ed960332dd9e15ae306f141 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 20:57:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4B374C433AD; Thu,  4 Jun 2020 20:57:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AE8AC433C6;
 Thu,  4 Jun 2020 20:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3AE8AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Date: Thu,  4 Jun 2020 14:57:07 -0600
Message-Id: <20200604205710.3167-4-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604205710.3167-1-jcrouse@codeaurora.org>
References: <20200604205710.3167-1-jcrouse@codeaurora.org>
Subject: [Freedreno] [PATCH v7 3/6] dt-bindings: arm-smmu: Add compatible
 string for Adreno GPU SMMU
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
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 freedreno@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Every Qcom Adreno GPU has an embedded SMMU for its own use. These
devices depend on unique features such as split pagetables,
different stall/halt requirements and other settings. Identify them
with a compatible string so that they can be identified in the
arm-smmu implementation specific code.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index d7ceb4c34423..e52a1b146c97 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,10 @@ properties:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
           - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
+        items:
+          - const: qcom,adreno-smmu
+          - const: qcom,smmu-v2
       - items:
           - const: arm,mmu-500
           - const: arm,smmu-v2
-- 
2.17.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
