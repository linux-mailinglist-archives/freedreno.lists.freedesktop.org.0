Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5F34E701
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 14:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854766E8B8;
	Tue, 30 Mar 2021 12:04:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EA56E8B7;
 Tue, 30 Mar 2021 12:04:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0CD06195B;
 Tue, 30 Mar 2021 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617105871;
 bh=6lm/PXN71Uir/6tazMMJc+s4JuYrI2y+JzG4+8YAJhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=toQXrnSU6/gZu+6PPauuicGLb94pd7n0XyLk8JnR+r5R5rWdj54O3RYy7OJvZL4ZY
 bPxVP2yvzMMPMyUjXZxD4XCBRh7f29x45knN6+nXtorlREyk/7vAgv9iUqmSh4TlS2
 vdsfHS+S/57xjYj2m3B+qviRK8SdN+qUPgYXpwI3f0mcadVAhUxMOsadYcv4eDmtcJ
 5UciMBlATzimYaHgy85EsBEoLrkxghxZx+4SPSMGbCcNHmMR9YmbXG57ovKw1sbrWR
 YSQbAWHgq61gFUNkL+lrjGPFPns4GrbiDAIse2dIZrcaJq2SMG6xACemPJOmutKdyt
 m+UBVbGX7BjqQ==
Date: Tue, 30 Mar 2021 13:04:25 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210330120418.GA5864@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-2-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH 01/18] iommu: remove the unused
 domain_window_disable method
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

On Tue, Mar 16, 2021 at 04:38:07PM +0100, Christoph Hellwig wrote:
> domain_window_disable is wired up by fsl_pamu, but never actually called.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 48 ---------------------------------
>  include/linux/iommu.h           |  2 --
>  2 files changed, 50 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
