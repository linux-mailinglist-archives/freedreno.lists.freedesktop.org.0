Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCAC34E8A7
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 15:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2046E8E3;
	Tue, 30 Mar 2021 13:14:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03576E8E2;
 Tue, 30 Mar 2021 13:14:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CC5561969;
 Tue, 30 Mar 2021 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617110094;
 bh=/N2/wqR7fHjSlaXvMJl1cBMXpKNT/xsesoTMSv6L4kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H6MULnqd9QB+NK7wZgljGNSyugWhqntzuA7hl6JZlcXm+z2v3zoJChkrFgo2shzTp
 7kWpdutfdv00Me8uRq6k4CXKfRgdJaXG0FfA9YbsG7wlg+Z7r07gTIgQWxT1LkYSkp
 DWVbOk8SbfrQM2yIud8rcAqs2GuTEOcAwOUAIWj8VuZr3tlHjGMQxciGj89GTcsI+6
 wA3QIpJx15k5zaCAI2i0QTwhK5h7hVXzLMWRdWcVoJrrjF7aHn1fmW9gVtnH0wdl2V
 3tX5hH0qrjR/RU13f5CzrPtpxHRIDR3ndCSVxdrE0CM6hBMj0APadZ/nh/M/gdHzKH
 JgeNVk/teVZHA==
Date: Tue, 30 Mar 2021 14:14:49 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210330131448.GQ5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-18-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-18-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH 17/18] iommu: remove
 DOMAIN_ATTR_IO_PGTABLE_CFG
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

On Tue, Mar 16, 2021 at 04:38:23PM +0100, Christoph Hellwig wrote:
> Use an explicit set_pgtable_quirks method instead that just passes
> the actual quirk bitmask instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c   | 64 +++++--------------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h   |  2 +-
>  drivers/iommu/iommu.c                   | 11 +++++
>  include/linux/io-pgtable.h              |  4 --
>  include/linux/iommu.h                   | 12 ++++-
>  6 files changed, 35 insertions(+), 63 deletions(-)

I'm fine with this for now, although there has been talk about passing
things other than boolean flags as page-table quirks. We can cross that
bridge when we get there, so:

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
