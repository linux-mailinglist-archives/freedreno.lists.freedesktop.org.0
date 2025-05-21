Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52CFABF244
	for <lists+freedreno@lfdr.de>; Wed, 21 May 2025 13:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF61112BF5;
	Wed, 21 May 2025 11:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HR//G+ay";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50D7112BF2
 for <freedreno@lists.freedesktop.org>; Wed, 21 May 2025 11:01:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 26EA66111C;
 Wed, 21 May 2025 11:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11329C4CEED;
 Wed, 21 May 2025 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747825285;
 bh=r1/Lj3aBtMU6yVgyPDJKVl5vYOZFzl7ANqCIVliCoFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HR//G+ayZ/fHI/yyn+TC97knjRgGdaWgs2GwNlgfKquYDDWWlZhTTV8iY0N7Cxe+G
 6QElKLXLuBsarxEA/oySb5opjI0WecLjavgxq9JJIJyj2En6GBv52sQruOndlTejp9
 94VU4S18850jDs0DS6h/TNqMmLgGyFbszooWqxw4F2AuV+tCsDhsEWJAw1AkUdqrIX
 M98rMv1WFVyMP5FMkF7E4nUamyww/ocajjGDXjT+X+U9sImU1rovrGeokTE7D7Hu3T
 Tg9ppgkwFpx7dukynX06w/MTqCoT5t+vNX+kj4v5gUnmm89aYjozedQ5IcCckbOQoV
 X+519zbizVaqQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Wed, 21 May 2025 12:01:17 +0100
Message-Id: <174782058731.37848.9736429299251401095.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 20 May 2025 15:08:53 -0400, Connor Abbott wrote:
> drm/msm uses the stall-on-fault model to record the GPU state on the
> first GPU page fault to help debugging. On systems where the GPU is
> paired with a MMU-500, there were two problems:
> 
> 1. The MMU-500 doesn't de-assert its interrupt line until the fault is
>    resumed, which led to a storm of interrupts until the fault handler
>    was called. If we got unlucky and the fault handler was on the same
>    CPU as the interrupt, there was a deadlock.
> 2. The GPU is capable of generating page faults much faster than we can
>    resume them. GMU (GPU Management Unit) shares the same context bank
>    as the GPU, so if there was a sudden spurt of page faults it would be
>    effectively starved and would trigger a watchdog reset, made even
>    worse because the GPU cannot be reset while there's a pending
>    transaction leaving the GPU permanently wedged.
> 
> [...]

Applied first three SMMU driver changes to iommu (arm/smmu/updates), thanks!

[1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno SMMUv2/MMU500
      https://git.kernel.org/iommu/c/1650620774fa
[2/7] iommu/arm-smmu: Move handing of RESUME to the context fault handler
      https://git.kernel.org/iommu/c/3053a2c5086d
[3/7] iommu/arm-smmu-qcom: Make set_stall work when the device is on
      https://git.kernel.org/iommu/c/70892277ca2d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
