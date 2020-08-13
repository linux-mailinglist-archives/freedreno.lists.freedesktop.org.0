Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24397243C5A
	for <lists+freedreno@lfdr.de>; Thu, 13 Aug 2020 17:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDCB6EA34;
	Thu, 13 Aug 2020 15:19:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C066EA34
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 15:19:40 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 026FC2078D;
 Thu, 13 Aug 2020 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597331980;
 bh=GUc3HeAnqqqqlsdI+PNr6Cgi6V9dzbFIkHuID4DZjzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DIiIBqmnUPBmVeIvv4yjwhCDacHmHrEQHVUbgeg0ZB6vwx9bcaF4avc9PMhdS9tg4
 wmCpHDJVgeI8xWGlbAsKPNVAc5v0lwU9azqZ/Cj7xf41op7j3POQ+qqgoptGJcOgzS
 EkqphfYghJlApnHGgR4tE/oV7hq+0yoT9qJoTrJI=
Date: Thu, 13 Aug 2020 16:19:35 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200813151934.GA10534@willie-the-truck>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-5-jcrouse@codeaurora.org>
 <20200813131412.GB10256@willie-the-truck>
 <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH v12 04/13] iommu: Add a domain attribute to
 get/set a pagetable configuration
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 08:11:02AM -0700, Rob Clark wrote:
> On Thu, Aug 13, 2020 at 6:14 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Aug 10, 2020 at 04:26:48PM -0600, Jordan Crouse wrote:
> > > Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
> > > arm-smmu to share the current pagetable configuration with the
> > > leaf driver and to allow the leaf driver to set up a new pagetable
> > > configuration under certain circumstances.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > ---
> > >
> > >  include/linux/iommu.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > index fee209efb756..995ab8c47ef2 100644
> > > --- a/include/linux/iommu.h
> > > +++ b/include/linux/iommu.h
> > > @@ -118,6 +118,7 @@ enum iommu_attr {
> > >       DOMAIN_ATTR_FSL_PAMUV1,
> > >       DOMAIN_ATTR_NESTING,    /* two stages of translation */
> > >       DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> > > +     DOMAIN_ATTR_PGTABLE_CFG,
> > >       DOMAIN_ATTR_MAX,
> > >  };
> >
> > Nobody other than the adreno gpu uses this, so can we avoid exposing it
> > in the IOMMU API, please? Given that you have a reference to the adreno
> > GPU device in the SMMU implementation code thanks to .alloc_context_bank(),
> > can you squirrel some function pointers away in the driver data (i.e. with
> > dev_set_drvdata()) instead?
> >
> 
> Hmm, we are already using drvdata on the gpu side, and it looks like
> arm-smmu is also using it.  Could we get away with stashing an extra
> 'void *' in iommu_domain itself?

What I meant was, expose the type of whatever you put in there on the GPU
side so that the SMMU impl can install its function pointers into a field of
that structure. As far as I'm concerned, the SMMU impl code and the GPU
driver are the same entity and we should keep their communication private,
rather than expose it up the stack. After all, the GPU writes to the SMMU
registers!

If you really don't want to expose all of your gubbins, I suppose you
could have a structure just for the SMMU view and container_of() out of
that on the GPU side.

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
