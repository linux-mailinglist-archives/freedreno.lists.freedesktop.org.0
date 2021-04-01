Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB1351664
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 17:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA86E2EF;
	Thu,  1 Apr 2021 15:53:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6220F6ECA1;
 Thu,  1 Apr 2021 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Z9JPy9TPg1G6vRAErbmN4dHQgiCuv74xNNZwb3XvOzc=; b=z9dfmxVC+AkYI7A3FhvuGUicXf
 WsoEPdEBOr+mzC8jJKT9D43IWxD08C6UN9gP6Ng4MFLpHmmOK/CaiM+Kj8DAhByTQGNSZnoKEF9+y
 2Rs0dYWfh0Z8jr5K8/Eyyi2JziQCArZaQo30OIrvsewrAgQ0huTTx0kHtqju6eTI1uSgCbrZiUQc9
 4HDViC6rLsC62o8HMxHELgdcrVhxuR6TqKCMUlRCPGi4fNvZxAOMIpWTR1OEyU4LN6LNCAeyiOii1
 7FkldJGkzOokyuTL3g131A2VtwTYvp4sN7duB59mWrFNH3kHEwrIRmYWub3Vv4NX+o2+kciSwQZWr
 NJ/psRCg==;
Received: from [2001:4bb8:180:7517:83e4:a809:b0aa:ca74] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzdd-00Cicd-Dp; Thu, 01 Apr 2021 15:53:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Date: Thu,  1 Apr 2021 17:52:48 +0200
Message-Id: <20210401155256.298656-13-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401155256.298656-1-hch@lst.de>
References: <20210401155256.298656-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Freedreno] [PATCH 12/20] iommu/fsl_pamu: remove the rpn and
 snoop_id arguments to pamu_config_ppaac
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

These are always wired to fixed values, so don't bother passing them as
arguments.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/fsl_pamu.c        | 14 +++-----------
 drivers/iommu/fsl_pamu.h        |  3 +--
 drivers/iommu/fsl_pamu_domain.c |  6 +++---
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index 3e1647cd5ad47a..742fa0e8c45b88 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -181,18 +181,14 @@ int pamu_update_paace_stash(int liodn, u32 value)
  * @win_addr: starting address of DSA window
  * @win-size: size of DSA window
  * @omi: Operation mapping index -- if ~omi == 0 then omi not defined
- * @rpn: real (true physical) page number
  * @stashid: cache stash id for associated cpu -- if ~stashid == 0 then
  *	     stashid not defined
- * @snoopid: snoop id for hardware coherency -- if ~snoopid == 0 then
- *	     snoopid not defined
  * @prot: window permissions
  *
  * Returns 0 upon success else error code < 0 returned
  */
 int pamu_config_ppaace(int liodn, phys_addr_t win_addr, phys_addr_t win_size,
-		       u32 omi, unsigned long rpn, u32 snoopid, u32 stashid,
-		       int prot)
+		       u32 omi, u32 stashid, int prot)
 {
 	struct paace *ppaace;
 
@@ -234,13 +230,9 @@ int pamu_config_ppaace(int liodn, phys_addr_t win_addr, phys_addr_t win_size,
 	if (~stashid != 0)
 		set_bf(ppaace->impl_attr, PAACE_IA_CID, stashid);
 
-	/* configure snoop id */
-	if (~snoopid != 0)
-		ppaace->domain_attr.to_host.snpid = snoopid;
-
 	set_bf(ppaace->impl_attr, PAACE_IA_ATM, PAACE_ATM_WINDOW_XLATE);
-	ppaace->twbah = rpn >> 20;
-	set_bf(ppaace->win_bitfields, PAACE_WIN_TWBAL, rpn);
+	ppaace->twbah = 0;
+	set_bf(ppaace->win_bitfields, PAACE_WIN_TWBAL, 0);
 	set_bf(ppaace->addr_bitfields, PAACE_AF_AP, prot);
 	set_bf(ppaace->impl_attr, PAACE_IA_WCE, 0);
 	set_bf(ppaace->addr_bitfields, PPAACE_AF_MW, 0);
diff --git a/drivers/iommu/fsl_pamu.h b/drivers/iommu/fsl_pamu.h
index 04fd843d718dd1..c96b29f0c7077f 100644
--- a/drivers/iommu/fsl_pamu.h
+++ b/drivers/iommu/fsl_pamu.h
@@ -384,8 +384,7 @@ int pamu_domain_init(void);
 int pamu_enable_liodn(int liodn);
 int pamu_disable_liodn(int liodn);
 int pamu_config_ppaace(int liodn, phys_addr_t win_addr, phys_addr_t win_size,
-		       u32 omi, unsigned long rpn, u32 snoopid, uint32_t stashid,
-		       int prot);
+		       u32 omi, uint32_t stashid, int prot);
 
 u32 get_stash_id(u32 stash_dest_hint, u32 vcpu);
 void get_ome_index(u32 *omi_index, struct device *dev);
diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index e9c1e0dd68f084..c83f1e7c2cb0c9 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -96,13 +96,13 @@ static int pamu_set_liodn(struct fsl_dma_domain *dma_domain, struct device *dev,
 	if (ret)
 		goto out_unlock;
 	ret = pamu_config_ppaace(liodn, geom->aperture_start,
-				 geom->aperture_end + 1, omi_index, 0,
-				 ~(u32)0, dma_domain->stash_id, 0);
+				 geom->aperture_end + 1, omi_index,
+				 dma_domain->stash_id, 0);
 	if (ret)
 		goto out_unlock;
 	ret = pamu_config_ppaace(liodn, geom->aperture_start,
 				 geom->aperture_end + 1, ~(u32)0,
-				 0, ~(u32)0, dma_domain->stash_id,
+				 dma_domain->stash_id,
 				 PAACE_AP_PERMS_QUERY | PAACE_AP_PERMS_UPDATE);
 out_unlock:
 	spin_unlock_irqrestore(&iommu_lock, flags);
-- 
2.30.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
