Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF290351241
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 11:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D43C6EC81;
	Thu,  1 Apr 2021 09:32:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86506EC81;
 Thu,  1 Apr 2021 09:32:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F161068B05; Thu,  1 Apr 2021 11:32:01 +0200 (CEST)
Date: Thu, 1 Apr 2021 11:32:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Message-ID: <20210401093201.GC2934@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-7-hch@lst.de> <20210330124009.GF5908@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330124009.GF5908@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Freedreno] [PATCH 06/18] iommu/fsl_pamu: remove
 ->domain_window_enable
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
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 01:40:09PM +0100, Will Deacon wrote:
> > +	ret = pamu_config_ppaace(liodn, geom->aperture_start,
> > +				 geom->aperture_end - 1, ~(u32)0,
> 
> You're passing 'geom->aperture_end - 1' as the size here, but the old code
> seemed to _add_ 1:
> 

> > -	win_size = (domain->geometry.aperture_end + 1) >> ilog2(1);
> 
> here ^^ when calculating the exclusive upper bound. In other words, I think
> '1ULL << 36' used to get passed to pamu_config_ppaace(). Is that an
> intentional change?

No, I've fixed it up.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
