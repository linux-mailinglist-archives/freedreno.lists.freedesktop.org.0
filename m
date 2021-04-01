Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF3351661
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 17:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA416ECD7;
	Thu,  1 Apr 2021 15:53:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BFA6ECD4;
 Thu,  1 Apr 2021 15:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3htM5/PYXZME0l2i9pFdDx0WBGWJiRf3+eQvo7P2pnc=; b=nPSHNV2elgH6I2xYzqYwIEdgEm
 +P+30/xffa6snPVkDvxr9MRQU7FEG5jH2N+sjQzMUWyfmPvnjygMOV2HNmvjnx3koHR8urzIvNg+9
 HMKoNGJTnmBHx49di3qjpyU2TrXWYQ3zLaG4Gi6oq8XXFYL0/lrj/uGTbjTD8Jl4rpOeDjwtuy0x2
 OzIilhJYLUuhwRNYC7iRL+YPbAWFfvT8O8XtzRqB8eKUSdvzwNgmKc0psQ9r46azGDvM8hDHthLfD
 TC1D61/qri8bi+w90aDw3rWS+R0d8Ukj3MBcUjOPAbnfxMqWSdcstyA+Ig4papei9JbztPeIVpua2
 S3oXmTww==;
Received: from [2001:4bb8:180:7517:83e4:a809:b0aa:ca74] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzdV-00Cibk-GJ; Thu, 01 Apr 2021 15:53:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Date: Thu,  1 Apr 2021 17:52:45 +0200
Message-Id: <20210401155256.298656-10-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401155256.298656-1-hch@lst.de>
References: <20210401155256.298656-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Freedreno] [PATCH 09/20] iommu/fsl_pamu: merge
 handle_attach_device into fsl_pamu_attach_device
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

No good reason to split this functionality over two functions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/iommu/fsl_pamu_domain.c | 59 +++++++++++----------------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 198725ef27954f..41927c3c417751 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -240,45 +240,13 @@ static int update_domain_stash(struct fsl_dma_domain *dma_domain, u32 val)
 	return ret;
 }
 
-/*
- * Attach the LIODN to the DMA domain and configure the geometry
- * and window mappings.
- */
-static int handle_attach_device(struct fsl_dma_domain *dma_domain,
-				struct device *dev, const u32 *liodn,
-				int num)
-{
-	unsigned long flags;
-	int ret = 0;
-	int i;
-
-	spin_lock_irqsave(&dma_domain->domain_lock, flags);
-	for (i = 0; i < num; i++) {
-		/* Ensure that LIODN value is valid */
-		if (liodn[i] >= PAACE_NUMBER_ENTRIES) {
-			pr_debug("Invalid liodn %d, attach device failed for %pOF\n",
-				 liodn[i], dev->of_node);
-			ret = -EINVAL;
-			break;
-		}
-
-		attach_device(dma_domain, liodn[i], dev);
-		ret = pamu_set_liodn(dma_domain, dev, liodn[i]);
-		if (ret)
-			break;
-	}
-	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
-
-	return ret;
-}
-
 static int fsl_pamu_attach_device(struct iommu_domain *domain,
 				  struct device *dev)
 {
 	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
+	unsigned long flags;
+	int len, ret = 0, i;
 	const u32 *liodn;
-	u32 liodn_cnt;
-	int len, ret = 0;
 	struct pci_dev *pdev = NULL;
 	struct pci_controller *pci_ctl;
 
@@ -298,14 +266,27 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 	}
 
 	liodn = of_get_property(dev->of_node, "fsl,liodn", &len);
-	if (liodn) {
-		liodn_cnt = len / sizeof(u32);
-		ret = handle_attach_device(dma_domain, dev, liodn, liodn_cnt);
-	} else {
+	if (!liodn) {
 		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
-		ret = -EINVAL;
+		return -EINVAL;
 	}
 
+	spin_lock_irqsave(&dma_domain->domain_lock, flags);
+	for (i = 0; i < len / sizeof(u32); i++) {
+		/* Ensure that LIODN value is valid */
+		if (liodn[i] >= PAACE_NUMBER_ENTRIES) {
+			pr_debug("Invalid liodn %d, attach device failed for %pOF\n",
+				 liodn[i], dev->of_node);
+			ret = -EINVAL;
+			break;
+		}
+
+		attach_device(dma_domain, liodn[i], dev);
+		ret = pamu_set_liodn(dma_domain, dev, liodn[i]);
+		if (ret)
+			break;
+	}
+	spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
 	return ret;
 }
 
-- 
2.30.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
