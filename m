Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA0A80F46C
	for <lists+freedreno@lfdr.de>; Tue, 12 Dec 2023 18:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D61A10E64F;
	Tue, 12 Dec 2023 17:21:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A3810E64F
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 17:21:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0CD01618E2;
 Tue, 12 Dec 2023 17:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F012AC433C8;
 Tue, 12 Dec 2023 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702401706;
 bh=ycMr8MM5ftWs8zYQIf6QMOdO2N+q3aTQBI93SqgK/d0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sg+6t1As+Ksr5VxeJvEvdiiiTLI1ak5JqD++Q2iMDZhhJLoBe1W/aSYz28Gxk5nUb
 Q63YaHJgpn9vV3Ovd5HDucifW5ZpcFeCZqFISTOq/qNPgXU7M9foPkwnHDHocOkGug
 N/Wo2v9HwGNyPSUzVURcAQwHk3ntFaJYh3Z4YGXbPNcfEFh9/8bzSSSZk2yMvrr42E
 /vZMFkE6O1qirpjyUiTFA8USm3zON92CUHKPwd3h6xNeNWVA6TjZ0+PdRGzF/gMdWe
 GwD0OCZ1iQdFkdX9FWk4RZLVKua3a3qTqFLmd1VPRl8jvGInPacmSZGcuNa5HSjdbz
 Qbi+vYX9fiv4A==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	iommu@lists.linux-foundation.org
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Add missing GMU entry to match
 table
Date: Tue, 12 Dec 2023 17:21:00 +0000
Message-Id: <170238423845.3097390.5149753894021729752.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231210180655.75542-1-robdclark@gmail.com>
References: <20231210180655.75542-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Elliot Berman <quic_eberman@quicinc.com>, Will Deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, catalin.marinas@arm.com,
 Joerg Roedel <joro@8bytes.org>, open list <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, kernel-team@android.com,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 10 Dec 2023 10:06:53 -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In some cases the firmware expects cbndx 1 to be assigned to the GMU,
> so we also want the default domain for the GMU to be an identy domain.
> This way it does not get a context bank assigned.  Without this, both
> of_dma_configure() and drm/msm's iommu_domain_attach() will trigger
> allocating and configuring a context bank.  So GMU ends up attached to
> both cbndx 1 and later cbndx 2.  This arrangement seemingly confounds
> and surprises the firmware if the GPU later triggers a translation
> fault, resulting (on sc8280xp / lenovo x13s, at least) in the SMMU
> getting wedged and the GPU stuck without memory access.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Add missing GMU entry to match table
      https://git.kernel.org/will/c/afc95681c306

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
