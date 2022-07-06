Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B1568FA5
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 18:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7FC10F84A;
	Wed,  6 Jul 2022 16:50:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CCC10F5D6;
 Wed,  6 Jul 2022 16:50:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 65CC0CE2140;
 Wed,  6 Jul 2022 16:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C588C3411C;
 Wed,  6 Jul 2022 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657126242;
 bh=0pOVIbCNmcN/nm8RoI711i6Sp2Cnnc7ILx8PHcMjOhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iuBzYQOx/x119o/XKj4ad95UQ07vgkKRljfmsnYkmmrirzmMQjHuby+c86rVqRooj
 e62NitvEEgbRi/AkzT7cg7TPO5SEkCwOZhTG7qYwx9ou9gdEYHoqM7GHTxceb5Z/h0
 umIFpmDdt4evqfV+29PgG+EcUn3IfZqFDGD/sIoHZaLdcOTBCGKDbHcPwi54S2RqpB
 aXx9RrWGAtvmFF3iPDr7aaQfWbAYYGqMazIZgoSiRZEh1pgfK4M8g8OOlQ8fXf38YE
 VIXsvv+bqBqh/aL0z7bhbqJtvVoEYVcl4U3sRSY1zUXsLWJFf2MCnW9ZgAGMpF69bi
 bS877EsNGSq2Q==
From: Will Deacon <will@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Date: Wed,  6 Jul 2022 17:50:30 +0100
Message-Id: <165710831607.931151.17780533895560931345.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220614230136.3726047-1-emma@anholt.net>
References: <20220614230136.3726047-1-emma@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/2] iommu: arm-smmu-impl: Add 8250 display
 compatible to the client list.
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
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022 16:01:35 -0700, Emma Anholt wrote:
> Required for turning on per-process page tables for the GPU.
> 
> 

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu: arm-smmu-impl: Add 8250 display compatible to the client list.
      https://git.kernel.org/will/c/3482c0b73073
[2/2] arm64: dts: qcom: sm8250: Enable per-process page tables.
      (no commit info)

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
