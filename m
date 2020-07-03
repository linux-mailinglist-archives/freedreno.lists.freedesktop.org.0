Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD1B213B1E
	for <lists+freedreno@lfdr.de>; Fri,  3 Jul 2020 15:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A2F6E1B9;
	Fri,  3 Jul 2020 13:37:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7359A6E1B9;
 Fri,  3 Jul 2020 13:37:39 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EF09206A1;
 Fri,  3 Jul 2020 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593783459;
 bh=h4AWXK1OzAabGjzRp78Qq4E/Pvb4iF6SmMTMkbta69E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zsco0pFHiu8uFn++3g+2aWZOGtMeDwXe2RdiKWXSiB1NAwLZTkzuswi6E4rPfoFgc
 zQygwRBRrnKJMJ6YgutuQW39JaKYOgP2fttYqHsRZiFYssPejgjJ+6IYnBSkwhnVMp
 cs70jkYqgCEvqEZxEg9urRaC6/8frYrllSxaMCbY=
Date: Fri, 3 Jul 2020 14:37:33 +0100
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <20200703133732.GD18953@willie-the-truck>
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
 <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCHv3 7/7] drm/msm/a6xx: Add support for using
 system cache(LLC)
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Matthias Kaehlcke <mka@chromium.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Sharat Masetty <smasetty@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 09:22:50PM +0530, Sai Prakash Ranjan wrote:
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index f455c597f76d..bd1d58229cc2 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -218,6 +218,9 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
>  		iova |= GENMASK_ULL(63, 49);
>  
>  
> +	if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
> +		prot |= IOMMU_SYS_CACHE_ONLY;

Given that I think this is the only user of IOMMU_SYS_CACHE_ONLY, then it
looks like it should actually be a property on the domain because we never
need to configure it on a per-mapping basis within a domain, and therefore
it shouldn't be exposed by the IOMMU API as a prot flag.

Do you agree?

Will
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
