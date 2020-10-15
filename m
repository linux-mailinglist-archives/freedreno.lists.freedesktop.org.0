Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9628ED44
	for <lists+freedreno@lfdr.de>; Thu, 15 Oct 2020 08:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4276EC1B;
	Thu, 15 Oct 2020 06:55:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2856EC1B;
 Thu, 15 Oct 2020 06:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1vZhw/JrbB2T8GVpb8VuLYmLoPDb9JW5DiEoY3ZRNZg=; b=Fycf1JgekT0YbewfwlGQNRxEiq
 pJjRTzJhLS2LSjjnsUqAEHFvAs/UjhL1lG9jsBd3BRTuTCNFToaNXo2Jz84l6buTUGtzQU8nrm/eS
 CzQz4jTRPnPfl6blS+u/Oj+MCPFeCSsHgXEXjatO5/9CZiNqsLLyVUT9J8ASYh/VhLRkC5XOs/XhU
 VZVovGpVYzsa6HeIWVSq3wwywNKJXx4TCv86aLhltul6lPWtqHfE3yGQGewNXjPK9o4VGbk6tZaVk
 qnOgou5uPSrnmd8aow5y9SZoBcJEqRePqY2hkKbPUtKsr1abESVw4BjKI+PENYB37As7agZTH6gkH
 /Tfpr9xg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSxAi-0004Aa-6Z; Thu, 15 Oct 2020 06:55:32 +0000
Date: Thu, 15 Oct 2020 07:55:32 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20201015065532.GA15371@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 02:42:38PM +0100, Robin Murphy wrote:
> I still think this situation would be best handled with a variant of
> dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set
> automatically when attaching to an unmanaged IOMMU domain.

dma_ops_bypass should mostly do the right thing as-is.  swiotlb bouncing
is triggered of two things:

 1) the dma_mask.  This is under control of the driver, and obviously
    if it is too small for a legit reason we can't just proceed
 2) force_dma_unencrypted() - we'd need to do an opt-out here, either
    by a flag or by being smart and looking for an attached iommu on
    the device

> That way the
> device driver can make DMA API calls in the appropriate places that do the
> right thing either way, and only needs logic to decide whether to use the
> returned DMA addresses directly or ignore them if it knows they're
> overridden by its own IOMMU mapping.

I'd be happy to review patches for this.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
