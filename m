Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2136832797B
	for <lists+freedreno@lfdr.de>; Mon,  1 Mar 2021 09:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7246E50D;
	Mon,  1 Mar 2021 08:43:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE136E509;
 Mon,  1 Mar 2021 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=2S2dpm3j+8nQ8g4Gj/vnAijhzgbe6eZTPcAjrxrTsuQ=; b=IPOK1jAADmdx2ouDRT4Qr1T8hM
 skgg2AsaN9DHAOZgQMYnTYEjd1rlFDNc33LnoT3LNxq9ifHW6yGn4sMdJjWlMjipdZVfSAIimXq1A
 xN63wQ1ttRja3Alw5aW8iAiuEwuREbrCJzItECb0JITADMAKtkqrCr3wGILUqZ/Fti2EXu8gyMGeY
 9pnTq2G6YTq20oL0QGUoZkI8g5qpO6scsBefxMIwNVYNkhfs6I8G+vvL8FPoL+uJzemRn+eUHniMU
 KEDp4JXCCCp5U9Z1m5YyNNCb5tGUJ68ybNuQ4Vwf7OEWW8TeO9jJGcqAeEStnnfxxyONZPfMwda4S
 wEqH2VEw==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGe8x-00FUVo-Fc; Mon, 01 Mar 2021 08:43:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Date: Mon,  1 Mar 2021 09:42:42 +0100
Message-Id: <20210301084257.945454-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301084257.945454-1-hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Freedreno] [PATCH 02/17] iommu/fsl_pamu: remove
 fsl_pamu_get_domain_attr
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

None of the values returned by this function are ever queried.  Also
remove the DOMAIN_ATTR_FSL_PAMUV1 enum value that is not otherwise used.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/fsl_pamu_domain.c | 30 ------------------------------
 include/linux/iommu.h           |  4 ----
 2 files changed, 34 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 53380cf1fa452f..e587ec43f7e750 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -832,35 +832,6 @@ static int fsl_pamu_set_domain_attr(struct iommu_domain *domain,
 	return ret;
 }
 
-static int fsl_pamu_get_domain_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr_type, void *data)
-{
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
-	int ret = 0;
-
-	switch (attr_type) {
-	case DOMAIN_ATTR_FSL_PAMU_STASH:
-		memcpy(data, &dma_domain->dma_stash,
-		       sizeof(struct pamu_stash_attribute));
-		break;
-	case DOMAIN_ATTR_FSL_PAMU_ENABLE:
-		*(int *)data = dma_domain->enabled;
-		break;
-	case DOMAIN_ATTR_FSL_PAMUV1:
-		*(int *)data = DOMAIN_ATTR_FSL_PAMUV1;
-		break;
-	case DOMAIN_ATTR_WINDOWS:
-		*(u32 *)data = dma_domain->win_cnt;
-		break;
-	default:
-		pr_debug("Unsupported attribute type\n");
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
 static struct iommu_group *get_device_iommu_group(struct device *dev)
 {
 	struct iommu_group *group;
@@ -987,7 +958,6 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.domain_window_enable = fsl_pamu_window_enable,
 	.iova_to_phys	= fsl_pamu_iova_to_phys,
 	.domain_set_attr = fsl_pamu_set_domain_attr,
-	.domain_get_attr = fsl_pamu_get_domain_attr,
 	.probe_device	= fsl_pamu_probe_device,
 	.release_device	= fsl_pamu_release_device,
 	.device_group   = fsl_pamu_device_group,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 47c8b318d8f523..52874ae164dd60 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -104,9 +104,6 @@ enum iommu_cap {
  *  -the actual size of the mapped region of a window must be power
  *   of 2 starting with 4KB and physical address must be naturally
  *   aligned.
- * DOMAIN_ATTR_FSL_PAMUV1 corresponds to the above mentioned contraints.
- * The caller can invoke iommu_domain_get_attr to check if the underlying
- * iommu implementation supports these constraints.
  */
 
 enum iommu_attr {
@@ -115,7 +112,6 @@ enum iommu_attr {
 	DOMAIN_ATTR_WINDOWS,
 	DOMAIN_ATTR_FSL_PAMU_STASH,
 	DOMAIN_ATTR_FSL_PAMU_ENABLE,
-	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 	DOMAIN_ATTR_IO_PGTABLE_CFG,
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
