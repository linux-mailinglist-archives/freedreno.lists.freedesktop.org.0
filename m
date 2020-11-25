Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE942C41BB
	for <lists+freedreno@lfdr.de>; Wed, 25 Nov 2020 15:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A6E6E8B0;
	Wed, 25 Nov 2020 14:05:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936B46E8B0;
 Wed, 25 Nov 2020 14:05:37 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CB2A206E5;
 Wed, 25 Nov 2020 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606313137;
 bh=V88pL5dlNClg3Rp8IlVW2fGZVgMNsnMnyslRAsAM0/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IKW4E7dLWXrWphU+1depwI0HysOt8xUnw1zycj1/GiAbqFrqnwZIpebwqZANKTBQG
 zMYtxnOpSvrzyIVc5vWcZhvjf0B+1UXybyI3H61bSs7fklfGgin3EEmIhmzeCMvb+P
 Onqnwz5eSRSV4zLPcE5iBzz27cyKD8hNX4zv1Dzg=
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>
Date: Wed, 25 Nov 2020 14:05:19 +0000
Message-Id: <160630994849.3550201.9456322529162111327.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [Freedreno] [PATCHv10 0/9] System Cache support for GPU and
 required SMMU support
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
Cc: freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org, Kristian H Kristensen <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 25 Nov 2020 12:30:09 +0530, Sai Prakash Ranjan wrote:
> Some hardware variants contain a system cache or the last level
> cache(llc). This cache is typically a large block which is shared
> by multiple clients on the SOC. GPU uses the system cache to cache
> both the GPU data buffers(like textures) as well the SMMU pagetables.
> This helps with improved render performance as well as lower power
> consumption by reducing the bus traffic to the system memory.
> 
> [...]

Applied the SMMU bits to arm64 (for-next/iommu/arm-smmu), thanks!

[3/9] iommu/arm-smmu: Add support for pagetable config domain attribute
      https://git.kernel.org/arm64/c/c99110a865a3
[4/9] iommu/arm-smmu: Move non-strict mode to use io_pgtable_domain_attr
      https://git.kernel.org/arm64/c/12bc36793fd6

[8/9] iommu: arm-smmu-impl: Use table to list QCOM implementations
      https://git.kernel.org/arm64/c/00597f9ff5ec
[9/9] iommu: arm-smmu-impl: Add a space before open parenthesis
      https://git.kernel.org/arm64/c/7f575a6087f4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
