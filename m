Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD503628973
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 20:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65B10E314;
	Mon, 14 Nov 2022 19:34:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2940410E314
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 19:34:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9350461403;
 Mon, 14 Nov 2022 19:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA63DC43470;
 Mon, 14 Nov 2022 19:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668454487;
 bh=CuwMs99TjE78c+mlY/tZXo+Tx3njBz0189Z4KS2uvJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WfsPRb5Nlg3BFIKxuwy3xXMIzTFF02DLRVEs54IDuI0lh22oI0K2eABmORJuYksHa
 SH8gT8hLULyh54ZLT1hYq2k0mEhJ3khuDhcY0zM6kb2gVU2OhC/xpaFvt1ge9BDLie
 N4Pg0akBOS34NMSgFzzXaHayPzEI+TCKwr/BuesxWEVVHLw8s8PKBZxfu2ig5D4Usf
 e7Yoee2QQIS5HGaFsK8zLbEH7Z01gFWM3dCh7JjuuNPI8fFHNrQl75OXaSZzddLG5O
 VRzZxOINDA6ppmHWiK44xmWu5b7FiH0Tp2GjenBofw9hZOYdTNMaI8rfLxo/DaZSKQ
 lyLrfpceNUH+g==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>
Date: Mon, 14 Nov 2022 19:34:31 +0000
Message-Id: <166844937986.3420632.1434919868977710080.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v1 00/10] iommu/arm-smmu-qcom: Rework
 Qualcomm SMMU bindings and implementation
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, catalin.marinas@arm.com, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 14 Nov 2022 20:06:25 +0300, Dmitry Baryshkov wrote:
> The main goal of this patchset is to define a generic qcom,smmu-500
> binding to be used by newer Qualcomm platforms instead of defining each
> and every SoC line with no actual differences between the compats.
> 
> While preparing this change it was required to cleanup the existing
> bindings and to rework the way the arm-smmu-qcom implementation handles
> binding to IOMMU devices.
> 
> [...]

Applied to arm64 (for-joerg/arm-smmu/bindings), thanks!

Note that I removed the 'qcom_smmu_data' structure completely as it was
no longer referenced after patch 9.

[01/10] dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
        https://git.kernel.org/arm64/c/dbf88f743583
[02/10] dt-bindings: arm-smmu: fix clocks/clock-names schema
        https://git.kernel.org/arm64/c/982295bfe369
[03/10] dt-bindings: arm-smmu: add special case for Google Cheza platform
        https://git.kernel.org/arm64/c/3a12e8c06536
[04/10] dt-bindings: arm-smmu: Add generic qcom,smmu-500 bindings
        https://git.kernel.org/arm64/c/6c84bbd103d8
[05/10] iommu/arm-smmu-qcom: Move implementation data into match data
        https://git.kernel.org/arm64/c/4c1d0ad153f8
[06/10] iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create
        https://git.kernel.org/arm64/c/30b912a03d91
[07/10] iommu/arm-smmu-qcom: provide separate implementation for SDM845-smmu-500
        https://git.kernel.org/arm64/c/417b76adcf1d
[08/10] iommu/arm-smmu-qcom: Merge table from arm-smmu-qcom-debug into match data
        https://git.kernel.org/arm64/c/4172dda2b30a
[09/10] iommu/arm-smmu-qcom: Stop using mmu500 reset for v2 MMUs
        https://git.kernel.org/arm64/c/b4c6ee515c42
[10/10] iommu/arm-smmu-qcom: Add generic qcom,smmu-500 match entry
        https://git.kernel.org/arm64/c/80b71080720e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
