Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5EA336DBD
	for <lists+freedreno@lfdr.de>; Thu, 11 Mar 2021 09:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1316EB1E;
	Thu, 11 Mar 2021 08:26:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25CC6EB1E;
 Thu, 11 Mar 2021 08:26:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F3A2D68BEB; Thu, 11 Mar 2021 09:26:09 +0100 (CET)
Date: Thu, 11 Mar 2021 09:26:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20210311082609.GA6990@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
 <20210310092533.GA6819@lst.de> <fdacf87a-be14-c92c-4084-1d1dd4fc7766@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdacf87a-be14-c92c-4084-1d1dd4fc7766@arm.com>
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

On Wed, Mar 10, 2021 at 06:39:57PM +0000, Robin Murphy wrote:
>> Actually... Just mirroring the iommu_dma_strict value into
>> struct iommu_domain should solve all of that with very little
>> boilerplate code.
>
> Yes, my initial thought was to directly replace the attribute with a
> common flag at iommu_domain level, but since in all cases the behaviour
> is effectively global rather than actually per-domain, it seemed
> reasonable to take it a step further. This passes compile-testing for
> arm64 and x86, what do you think?

It seems to miss a few bits, and also generally seems to be not actually
apply to recent mainline or something like it due to different empty
lines in a few places.

Let me know what you think of the version here:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/iommu-cleanup

I'll happily switch the patch to you as the author if you're fine with
that as well.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
