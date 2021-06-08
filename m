Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A94F39F54E
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 13:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EB96E150;
	Tue,  8 Jun 2021 11:42:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03B36E150;
 Tue,  8 Jun 2021 11:42:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1666561351;
 Tue,  8 Jun 2021 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623152563;
 bh=pOzoKPtk0XS1kxkNA7PWuBAkl2UNNnQrdZwUcp7dwwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FbmTRSwDXkDzelC64LEQowqRTdlVawzUifOUIiPjivItS4VFLBhnMuzDthSBs5w8n
 1Ac3OzetZzhKnJa+9L5rgvmzvqfZiPQTbR4vypcNGn8GMbsOVmLSFVac1hZvjhDodb
 bsqKgEfi3lk2FLt4al/EdPrQFOaTafzxjY4c3xaiXiXtMuL6JdpxV7QTU8NNLkygUk
 3AOhdNHCUOSgTEV4CwcuAiK/ay1itPbGVKI/1JQH2hMB+sG78dhQxWLK/vuT+VEtHo
 FYrB2K/Du0x8Yi+6rWvFbZAGkOhuVbyj+JYibwJDgwqHUWkCevC1MjTpxGhTCnR3eT
 9JLycmZVXRaqA==
From: Will Deacon <will@kernel.org>
To: Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org,
 Jordan Crouse <jcrouse@codeaurora.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Joerg Roedel <joro@8bytes.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Date: Tue,  8 Jun 2021 12:42:32 +0100
Message-Id: <162314684999.3707477.2160007647178776134.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
References: <20210326231303.3071950-1-eric@anholt.net>
MIME-Version: 1.0
Subject: Re: [Freedreno] [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1
 quirk for db820c.
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
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 26 Mar 2021 16:13:02 -0700, Eric Anholt wrote:
> db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> the GPU from wedging and then sometimes wedging the kernel after a
> page fault), but it doesn't have separate pagetables support yet in
> drm/msm so we can't go all the way to the TTBR1 path.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
      https://git.kernel.org/will/c/a242f4297cfe
[2/2] arm64: dts: msm8996: Mark the GPU's SMMU as an adreno one.
      https://git.kernel.org/will/c/19c07b91f85d

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
