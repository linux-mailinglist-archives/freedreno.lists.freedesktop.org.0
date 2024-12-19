Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BDD9F7A67
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 12:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85B710ECE9;
	Thu, 19 Dec 2024 11:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GenVSOh3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3810ECEF
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 11:30:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A06C45C5DB7;
 Thu, 19 Dec 2024 11:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DE0C4CECE;
 Thu, 19 Dec 2024 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734607825;
 bh=WZy77EM6Jp2nJGwMoUPBoqtGUEr8RfDUcV/Dtjbg0I8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GenVSOh3XU2e5AJnorSRRSioUtijToJOsGApMyITwDhvgZ4Y4EzR31hUh2NONg9Rw
 Eqz3EUsbX6qb+azS7mGCxt5h1iaVKWzB+95c1Mwk6ZgmBP8x0ayOqIL6MFbbMkhDcL
 lbamqngDPhxrUjnsUoeZjwAVjeQOPIqkXxQhZ/LC1f4G00ve8AMeF3q4LoUt+p/SS2
 OERqcx8zxSWh/ez35wO+SJFPDIYgtmRX7PW84+/udhueRPSrPysLaaZBM7Jz6MYQOE
 r9y0oHXrycr7RVDQBN0uA1xAlVt6645p0qVtsY3KE2DsL0Uk6jO4KC6UHu3//Us+wE
 ICW5uOqkwoalw==
Date: Thu, 19 Dec 2024 11:30:20 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <20241219113019.GA23640@willie-the-truck>
References: <20241216171017.4881-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216171017.4881-1-robdclark@gmail.com>
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

On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On mmu-500, stall-on-fault seems to stall all context banks, causing the
> GMU to misbehave.  So limit this feature to smmu-v2 for now.

MMU-500 has public documentation so please can you dig up what the
actual behaviour is rather than guess?

> This fixes an issue with an older mesa bug taking outo the system
> because of GMU going off into the year.

Sorry, but I don't understand this sentence.

Will
