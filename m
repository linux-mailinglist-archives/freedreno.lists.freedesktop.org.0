Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0CA33A5D3
	for <lists+freedreno@lfdr.de>; Sun, 14 Mar 2021 16:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A31E89EB8;
	Sun, 14 Mar 2021 15:58:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB0589EB8;
 Sun, 14 Mar 2021 15:58:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7C42968B05; Sun, 14 Mar 2021 16:58:13 +0100 (CET)
Date: Sun, 14 Mar 2021 16:58:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20210314155813.GA788@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-16-hch@lst.de>
 <3e8f1078-9222-0017-3fa8-4d884dbc848e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e8f1078-9222-0017-3fa8-4d884dbc848e@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Freedreno] [PATCH 15/17] iommu: remove DOMAIN_ATTR_NESTING
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

On Sun, Mar 14, 2021 at 11:44:52AM +0100, Auger Eric wrote:
> As mentionned by Robin, there are series planning to use
> DOMAIN_ATTR_NESTING to get info about the nested caps of the iommu (ARM
> and Intel):
> 
> [Patch v8 00/10] vfio: expose virtual Shared Virtual Addressing to VMs
> patches 1, 2, 3
> 
> Is the plan to introduce a new domain_get_nesting_info ops then?

The plan as usual would be to add it the series adding that support.
Not sure what the merge plans are - if the series is ready to be
merged I could rebase on top of it, otherwise that series will need
to add the method.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
