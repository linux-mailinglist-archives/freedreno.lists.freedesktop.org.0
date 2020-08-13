Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C34243A77
	for <lists+freedreno@lfdr.de>; Thu, 13 Aug 2020 15:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABC96E145;
	Thu, 13 Aug 2020 13:03:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCA96E145
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 13:03:49 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B4782078D;
 Thu, 13 Aug 2020 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597323828;
 bh=uosX7oOdedb0KLor00/iyCHrh6G2Bj9rDNwIyKdLSuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofnbcP1AZ2+YJJLcKWRijpgnzeIiafm4To7Gyd88zHqHIDGq563wKxZSeFKH1XSVt
 4iEW8OQVCuMRKUIatVJ4TvM9Gw0lAC/iXmvZl1uZvoGn6qP+NToQdG5gxNgW9zIX8F
 zhyR5nrx8aHQ9Zer6aGrWmXCJBmZ/x8oX5l/9I1Q=
Date: Thu, 13 Aug 2020 14:03:43 +0100
From: Will Deacon <will@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200813130342.GA10256@willie-the-truck>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-14-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810222657.1841322-14-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [RFC v12 13/13] iommu/arm-smmu: Add a
 init_context_bank implementation hook
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, iommu@lists.linux-foundation.org,
 Krishna Reddy <vdumpa@nvidia.com>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pritesh Raithatha <praithatha@nvidia.com>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 04:26:57PM -0600, Jordan Crouse wrote:
> Add a new implementation hook to allow the implementation specific code
> to tweek the context bank configuration just before it gets written.
> The first user will be the Adreno GPU implementation to turn on
> SCTLR.HUPCF to ensure that a page fault doesn't terminating pending
> transactions. Doing so could hang the GPU if one of the terminated
> transactions is a CP read.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 16 ++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 21 +++++++++++++--------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++++
>  3 files changed, 34 insertions(+), 8 deletions(-)

We already have ->init_context(), so I'd prefer to use that instead of
adding another callback. Could we stick a couple of fields in
smmu_domain->cfg (e.g. sctlr_set, sctlr_clr) and handle those a bit like
we do for the asid/vmid on cavium implementations?

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
