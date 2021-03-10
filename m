Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2D23338A8
	for <lists+freedreno@lfdr.de>; Wed, 10 Mar 2021 10:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3039789D87;
	Wed, 10 Mar 2021 09:25:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CF189D87;
 Wed, 10 Mar 2021 09:25:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2657568B05; Wed, 10 Mar 2021 10:25:34 +0100 (CET)
Date: Wed, 10 Mar 2021 10:25:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20210310092533.GA6819@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310091501.GC5928@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Freedreno] [PATCH 14/17] iommu: remove
 DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
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
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 10:15:01AM +0100, Christoph Hellwig wrote:
> On Thu, Mar 04, 2021 at 03:25:27PM +0000, Robin Murphy wrote:
> > On 2021-03-01 08:42, Christoph Hellwig wrote:
> >> Use explicit methods for setting and querying the information instead.
> >
> > Now that everyone's using iommu-dma, is there any point in bouncing this 
> > through the drivers at all? Seems like it would make more sense for the x86 
> > drivers to reflect their private options back to iommu_dma_strict (and 
> > allow Intel's caching mode to override it as well), then have 
> > iommu_dma_init_domain just test !iommu_dma_strict && 
> > domain->ops->flush_iotlb_all.
> 
> Hmm.  I looked at this, and kill off ->dma_enable_flush_queue for
> the ARM drivers and just looking at iommu_dma_strict seems like a
> very clear win.
> 
> OTOH x86 is a little more complicated.  AMD and intel defaul to lazy
> mode, so we'd have to change the global iommu_dma_strict if they are
> initialized.  Also Intel has not only a "static" option to disable
> lazy mode, but also a "dynamic" one where it iterates structure.  So
> I think on the get side we're stuck with the method, but it still
> simplifies the whole thing.

Actually... Just mirroring the iommu_dma_strict value into
struct iommu_domain should solve all of that with very little
boilerplate code. 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
