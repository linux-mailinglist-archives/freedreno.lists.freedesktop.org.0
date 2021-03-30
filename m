Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9834E755
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 14:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BA06E8C0;
	Tue, 30 Mar 2021 12:17:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B506E8BD;
 Tue, 30 Mar 2021 12:17:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCFD861613;
 Tue, 30 Mar 2021 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617106632;
 bh=R1A+HSQkC8e4xAjjBa78+nl1HCzgHqTXI4btq91BvAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c25S81BmNCVGy2OObw4tONoA0BojMCxtSOklHDKSIj3LBTHzA1/vu4ULOtdwrhaKd
 WDRfAnsEctJcADLUnZE7e4rCMh20iy3euLeexNN3WbVyaj2Jtsudf1lTE+dAEff4Na
 EbBkVoLWPCMK4kXmg1lZUi472g/zewPckNo6IUv1xppwSMzqP67IcdaAjBBbbJIPdj
 bAU/Cefcsji1sn251Az9hG84M4pKR8GSzh27H1MZGWktXOEdnAXajGUbYVkL8ZQkNK
 2pHZBINx71bFOqfhE2/GG/OPglg0+vCFbhdOxQ2PvsQfLAlsrPgsJIVJGbkCeEVtuv
 jx7d9GgoKNuyg==
Date: Tue, 30 Mar 2021 13:17:06 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210330121706.GD5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH 04/18] iommu/fsl_pamu: merge
 iommu_alloc_dma_domain into fsl_pamu_domain_alloc
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
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 04:38:10PM +0100, Christoph Hellwig wrote:
> Keep the functionality to allocate the domain together.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 34 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 24 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
