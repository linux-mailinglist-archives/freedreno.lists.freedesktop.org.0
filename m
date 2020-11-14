Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198492B2E65
	for <lists+freedreno@lfdr.de>; Sat, 14 Nov 2020 17:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648A889A9B;
	Sat, 14 Nov 2020 16:21:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30D489A9B
 for <freedreno@lists.freedesktop.org>; Sat, 14 Nov 2020 16:21:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5B36B67373; Sat, 14 Nov 2020 17:21:10 +0100 (CET)
Date: Sat, 14 Nov 2020 17:21:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20201114162109.GA24411@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114151717.5369-3-jonathan@marek.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Freedreno] [RESEND PATCH v2 2/5] dma-direct: add
 dma_direct_bypass() to force direct ops
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
Cc: freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, hch@lst.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 10:17:10AM -0500, Jonathan Marek wrote:
> Add a function to force direct ops and disable swiotlb for a deivce.

s/deivce/device/

> +#if IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && !IS_ENABLED(CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED)

overly long line.

> +#if IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && !IS_ENABLED(CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED)

Again.

> +int dma_direct_bypass(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return ret;
> +
> +	dev->bus_dma_limit = DMA_BIT_MASK(64);
> +	dev->dma_ops_bypass = true;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(dma_direct_bypass);

But more importantly ARCH_HAS_FORCE_DMA_UNENCRYPTED is just a compile
time flag.  With this you disable the functionality for all the usual
x86, s390 and powerpc configs, while only a tiny number of systems
for bounce buffering.  But I think you can just trivialy check
force_dma_unencrypted instead.  We do not need an extra Kconfig symbol
symbol for this trivial helper.

Also the helper is misnamed and misplaced.  The semantics have nothing
to do with dma-direct, the fact that is uses the ops bypass is an
implementation detail.   It really fits into the iommu code, as it
allows the driver to use the IOMMU API for IOVA management, while using
the DMA API for cache management.  So it should be named to reflect
that, and also grow a kerneldoc comment explaining how it will be used.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
