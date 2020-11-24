Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD82C3347
	for <lists+freedreno@lfdr.de>; Tue, 24 Nov 2020 22:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6096E0DA;
	Tue, 24 Nov 2020 21:41:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E616E027;
 Tue, 24 Nov 2020 21:41:41 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D752206E5;
 Tue, 24 Nov 2020 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606254100;
 bh=+vMKUYxY6UzZeaMV4tTptbnuBH+pFcgBeuyebDSordU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e1tXba023wgparbkUVCIGkU3HbmnA9eF45ngTS19osHG77VEduKCx6HiAL08Bda/U
 nqZxU/eoBGzISqdFtjL51f5MJ2PelJepwzGefLkYqhCOvSrSayYxXnmsh9OzcqTZ32
 L8B5BYC9upY1CXE9lMQfGFIVQdLkCgd8LgX23fPE=
Date: Tue, 24 Nov 2020 21:41:35 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <20201124214134.GB14252@willie-the-truck>
References: <cover.1606150259.git.saiprakash.ranjan@codeaurora.org>
 <122e7b3050c51ee2e3637fca0b3967b4c3dc2bac.1606150259.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <122e7b3050c51ee2e3637fca0b3967b4c3dc2bac.1606150259.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCHv9 2/8] iommu/arm-smmu: Add domain attribute
 for pagetable configuration
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
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Nov 23, 2020 at 10:35:55PM +0530, Sai Prakash Ranjan wrote:
> Add iommu domain attribute for pagetable configuration which
> initially will be used to set quirks like for system cache aka
> last level cache to be used by client drivers like GPU to set
> right attributes for caching the hardware pagetables into the
> system cache and later can be extended to include other page
> table configuration data.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>  include/linux/io-pgtable.h            |  4 ++++
>  include/linux/iommu.h                 |  1 +
>  4 files changed, 26 insertions(+)

Given that we're heading for a v10 to address my comments on patch 3,
then I guess you may as well split this into two patches so that I can
share just the atttibute with Rob rather than the driver parts.

Please keep it all as one series though, with the common parts at the
beginning, and I'll figure it out.

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
