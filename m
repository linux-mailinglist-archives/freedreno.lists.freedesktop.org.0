Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2292A9990
	for <lists+freedreno@lfdr.de>; Fri,  6 Nov 2020 17:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031E6EAA4;
	Fri,  6 Nov 2020 16:38:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE0E6EAA4
 for <freedreno@lists.freedesktop.org>; Fri,  6 Nov 2020 16:38:43 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m65so1151791qte.11
 for <freedreno@lists.freedesktop.org>; Fri, 06 Nov 2020 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyihr231RMubay4CbLM0CzqsU3IYdDyAVzI9nCSyEmQ=;
 b=vHCavlMIMWmTuEUT0yxIsRbmc3sMvKm2aBri2RwZ6oE/GDXkz7hTUjiLHbXrcsfoMd
 RlHO0frzFd2LFmbdtXV3vfgG4LAEZFxnGIskOG9V9XKiGx4lk7swqpr/ccY/NPFANj7u
 JSIs8GMc0zlvGmhSDOEqX0S25vyOyNKB4taMWMxoWHBAtNARa4OtflgaoKAkBnwvtz2D
 APQisBElBumw5H7yXPRlMNv27+9cEQAgiejTnkgS8xylNFUsg1OyWiSdw2TY2t/cGCvY
 tS7DpLFSr/zAyY6GljpfZJsVNzI7v0ak7ctsb9fF4tmCKEGam1/Pf6igvEgzEVGqGU3Z
 pQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hyihr231RMubay4CbLM0CzqsU3IYdDyAVzI9nCSyEmQ=;
 b=TzewzYtWSlPWUx+LJb1qORY86CXuqPAJMlqcMkMbXgoE8Z9v723iC18sexUlhXMI48
 LlMOY+szqVRoCaiT1WNKNcDYuRa/bh9e0dT74uwwokc6/yJyxDjxp3ZO7r+DN1Z2h2We
 +CIPDTYhWM2bwWdMkiiPOLGa8mWD+Zte+hfKCmxqmEg56UA0bEXvZ80jOrlnGhDFyF9t
 POQKZWmS2yglxrIclvYik0LALoaELjS9MXBqlhuWyKwthaEsLRTEnxiucK8J2ZFsUd46
 4IphLKgMX4HLc8/zmcObALmMZ58+XpJun5bOQ1M8PcJ4lJ3XTRFwWE03B8VPelEuFmk9
 TEJg==
X-Gm-Message-State: AOAM531VhwKgPAs8UPiP5O1c3AS4zs2o0EzlnBb0dlcSTp1ncSDHzAFf
 QGHTFInGXih1kjUhbXVFUK9JpMJBDlh5682tyrc=
X-Google-Smtp-Source: ABdhPJwgCQaAOheDbfxhjKZU9u5PewuDo9BCJMn8VuvpPdms0lhHgg1qpm4Bf2NcUZeh3os13+vPKQ==
X-Received: by 2002:ac8:5ccc:: with SMTP id s12mr2339675qta.179.1604680722605; 
 Fri, 06 Nov 2020 08:38:42 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:38:41 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri,  6 Nov 2020 11:34:31 -0500
Message-Id: <20201106163437.30836-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201106163437.30836-1-jonathan@marek.ca>
References: <20201106163437.30836-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 2/5] dma-direct: add dma_direct_bypass() to
 force direct ops
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add a function to force direct ops and disable swiotlb for a deivce.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 include/linux/dma-direct.h |  9 +++++++++
 kernel/dma/direct.c        | 23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 18aade195884..41f57e1b7aa5 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -124,4 +124,13 @@ int dma_direct_supported(struct device *dev, u64 mask);
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
 
+#if IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && !IS_ENABLED(CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED)
+int dma_direct_bypass(struct device *dev);
+#else
+static inline int dma_direct_bypass(struct device *dev)
+{
+	return -EIO;
+}
+#endif
+
 #endif /* _LINUX_DMA_DIRECT_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 06c111544f61..304a5a77cccb 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -548,3 +548,26 @@ int dma_direct_set_offset(struct device *dev, phys_addr_t cpu_start,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_direct_set_offset);
+
+/**
+ * dma_direct_bypass - always use direct mapping path for device
+ * @dev:	device pointer
+ *
+ * Note: this also bypasses swiotlb. Not available for arch with
+ * force_dma_unencrypted(), since this doesn't deal with that.
+ */
+#if IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && !IS_ENABLED(CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED)
+int dma_direct_bypass(struct device *dev)
+{
+	int ret;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return ret;
+
+	dev->bus_dma_limit = DMA_BIT_MASK(64);
+	dev->dma_ops_bypass = true;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_direct_bypass);
+#endif
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
