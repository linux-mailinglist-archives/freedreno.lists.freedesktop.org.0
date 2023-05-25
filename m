Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06071146D
	for <lists+freedreno@lfdr.de>; Thu, 25 May 2023 20:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EDF10E0E6;
	Thu, 25 May 2023 18:38:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BC910E0CC;
 Thu, 25 May 2023 18:38:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B027D64948;
 Thu, 25 May 2023 18:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB45C4339B;
 Thu, 25 May 2023 18:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685039917;
 bh=M4V4JYAJb7JCpNDh95af6IswKlTV3u8pE33X7dJJco0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k2scfiwjPki2/GJ+OJdW23fjhKzpVNyNomysqMFNRgXfDQSRo/RcQvkv7i3e/RPFw
 94FQdy6RqfCABJe16vTPJwV59b/CM3QMFIOfXNUkzu/R1Jl49JZ2qUynIJlbo2CONm
 Z/DNiCsMCAwmGcraB2WEIOIdWWnv+fB5cmbZnwEcJphEGvq8h5pTbmR240zvibSoVL
 gvCWuNbbY4Zgpw2nc5cPYebU8STGCFIkMm+wZqvQPB2vgKIhdA3Q0GhKnV+dEkap6S
 LCcJVo0DOXHKs1oDgRhENFx25SIkrWRgRJ8hDjKxlkfHTT4skflpzX0oJWX6EXEw5v
 2QtH6W1hxj+Zw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 25 May 2023 14:36:00 -0400
Message-Id: <20230525183607.1793983-50-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183607.1793983-1-sashal@kernel.org>
References: <20230525183607.1793983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH AUTOSEL 6.1 50/57] drm/msm: Be more shouty if
 per-process pgtables aren't working
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit 5c054db54c43a5fcb5cc81012361f5e3fac37637 ]

Otherwise it is not always obvious if a dt or iommu change is causing us
to fall back to global pgtable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/537359/
Link: https://lore.kernel.org/r/20230516222039.907690-2-robdclark@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 5577cea7c0092..d12ba47b37c4f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -227,7 +227,12 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	/* Get the pagetable configuration from the domain */
 	if (adreno_smmu->cookie)
 		ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
-	if (!ttbr1_cfg)
+
+	/*
+	 * If you hit this WARN_ONCE() you are probably missing an entry in
+	 * qcom_smmu_impl_of_match[] in arm-smmu-qcom.c
+	 */
+	if (WARN_ONCE(!ttbr1_cfg, "No per-process page tables"))
 		return ERR_PTR(-ENODEV);
 
 	/*
-- 
2.39.2

