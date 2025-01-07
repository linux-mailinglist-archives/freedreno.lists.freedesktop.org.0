Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CCAA0400E
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 13:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFEF10E235;
	Tue,  7 Jan 2025 12:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SlxkHKkZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4213010E235
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 12:57:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AC415A412B6;
 Tue,  7 Jan 2025 12:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69313C4CED6;
 Tue,  7 Jan 2025 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736254665;
 bh=zvplV8B3BpnXVADmocgfgHIqHLcNMsgpQiKMncNel+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SlxkHKkZx8Ab4eWY7YLwa6PjymcKGOZYfiYIn/PJPSbJbGuekhDAHf7qAdldVBokC
 QYc9asuyrlvFmfi8edcliRf1RcW0x5B2s3iIUYYZ6mxVyL6FsQykZb3jfbQ5v1SnVV
 a/iSJzEr2VJIoaY6rKY0TTUUwM6Kk6Tf8l0Fo0tMlnTc9CPYb8wOs5QXzA9ndOKxi+
 xl3ii2AFiLPBTs9xXjqnlRhrdqGteh74iLiE7NWemiZoqb1uRrM04thDe7RRnugqXx
 VQaSnVxwl6Ypuy0ZWfq3Ym8CktsGfBVgWZJm9G8KMnROBmZJ5vQthEqFTe9rwIqIhA
 5Uj/wBxgKkWMw==
Date: Tue, 7 Jan 2025 12:57:39 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <20250107125738.GA6991@willie-the-truck>
References: <20250102183232.115279-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102183232.115279-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On mmu-500, stall-on-fault seems to stall all context banks, causing the
> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> 
> This fixes an issue with an older mesa bug taking outo the system
> because of GMU going off into the weeds.
> 
> What we _think_ is happening is that, if the GPU generates 1000's of
> faults at ~once (which is something that GPUs can be good at), it can
> result in a sufficient number of stalled translations preventing other
> transactions from entering the same TBU.

MMU-500 is an implementation of the SMMUv2 architecture, so this feels
upside-down to me. That is, it should always be valid to probe with
the less specific "SMMUv2" compatible string (modulo hardware errata)
and be limited to the architectural behaviour.

So what is about MMU-500 that means stalling doesn't work when compared
to any other SMMUv2 implementation?

Will
