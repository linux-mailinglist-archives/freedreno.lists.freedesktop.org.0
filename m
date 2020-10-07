Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57858285899
	for <lists+freedreno@lfdr.de>; Wed,  7 Oct 2020 08:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CF46E88D;
	Wed,  7 Oct 2020 06:25:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4F96E88D;
 Wed,  7 Oct 2020 06:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hGY4fKBH3lXrbLnK7loOw4AUvRukRocZITr25lF2ycI=; b=PNf5g8627c2NOMQqhvL0eUPUY9
 pG18AoTA0MELpyOL/b9ay/ykTBDatHDGS3jlfCwIic9g3kmcO8E6ny88Ao5zGscnjagnX/WHNFZM5
 eZ2NTCUXNprEyCfiCQ/EGzyj6MxRlkn48EyhjY9cX/mqtGmGzUcF/05YoWWqOT3az/7lCzZyLl22/
 JnPVX/l/zI1jAPk8897xZBq8Pfmxbi5IX6xg+uZiAsB6ckYTKIB56aoRVnPqszsGMjoVPJQUTNCy1
 9FlS3lHhBHqvrySZFyfKyRFMIWGkyvr72addRKiyZPfjxgqJLXANCq04HlVz81s002Ig6I9P5Ekbx
 glO7NLFQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kQ2t5-0006Rp-Uy; Wed, 07 Oct 2020 06:25:19 +0000
Date: Wed, 7 Oct 2020 07:25:19 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jonathan Marek <jonathan@marek.ca>
Message-ID: <20201007062519.GA23519@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Joerg Roedel <joro@8bytes.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Rob Clark <robdclark@gmail.com>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 09:19:32AM -0400, Jonathan Marek wrote:
> One example why drm/msm can't use DMA API is multiple page table support
> (that is landing in 5.10), which is something that definitely couldn't work
> with DMA API.
> 
> Another one is being able to choose the address for mappings, which AFAIK
> DMA API can't do (somewhat related to this: qcom hardware often has ranges
> of allowed addresses, which the dma_mask mechanism fails to represent, what
> I see is drivers using dma_mask as a "maximum address", and since addresses
> are allocated from the top it generally works)

That sounds like a good enough rason to use the IOMMU API.  I just
wanted to make sure this really makes sense.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
