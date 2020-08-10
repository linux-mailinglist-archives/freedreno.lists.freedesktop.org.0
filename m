Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EDD240DC2
	for <lists+freedreno@lfdr.de>; Mon, 10 Aug 2020 21:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9790F6E186;
	Mon, 10 Aug 2020 19:11:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256916E17E;
 Mon, 10 Aug 2020 19:11:03 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4903221E2;
 Mon, 10 Aug 2020 19:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086663;
 bh=USN0Q1T9sE6yZpQz7cHcvRFMEmyBPpCpKUSkznsy/i4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GhvfWsGotGIOrLRtQyYSHxjIMt/F6e2z7mKzmjTuyPSSe7pcW8MfMj7B7bnQNuPAV
 cC/OLbmkgZl46sgcbBF1R7jtwkmyJOlGAxu1xPuEuPW4ATURLEv316NCwOGa2BV5GS
 j0ZZ/99VHjncm0no6Azsbz/xzubDl9QO7cvlble0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 10 Aug 2020 15:09:53 -0400
Message-Id: <20200810191028.3793884-25-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191028.3793884-1-sashal@kernel.org>
References: <20200810191028.3793884-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Freedreno] [PATCH AUTOSEL 5.7 25/60] drm: msm: a6xx: fix gpu
 failure after system resume
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
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jcrouse@codeaurora.org>,
 Matthias Kaehlcke <mka@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Akhil P Oommen <akhilpo@codeaurora.org>

[ Upstream commit 57c0bd517c06b088106b0236ed604056c8e06da5 ]

On targets where GMU is available, GMU takes over the ownership of GX GDSC
during its initialization. So, move the refcount-get on GX PD before we
initialize the GMU. This ensures that nobody can collapse the GX GDSC
once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
during GPU wake up during a system resume.

Reported-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 34607a98cc7c8..9a7a18951dc2b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -732,10 +732,19 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Turn on the resources */
 	pm_runtime_get_sync(gmu->dev);
 
+	/*
+	 * "enable" the GX power domain which won't actually do anything but it
+	 * will make sure that the refcounting is correct in case we need to
+	 * bring down the GX after a GMU failure
+	 */
+	if (!IS_ERR_OR_NULL(gmu->gxpd))
+		pm_runtime_get_sync(gmu->gxpd);
+
 	/* Use a known rate to bring up the GMU */
 	clk_set_rate(gmu->core_clk, 200000000);
 	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
 	if (ret) {
+		pm_runtime_put(gmu->gxpd);
 		pm_runtime_put(gmu->dev);
 		return ret;
 	}
@@ -771,19 +780,12 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the current freq */
 	__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
 
-	/*
-	 * "enable" the GX power domain which won't actually do anything but it
-	 * will make sure that the refcounting is correct in case we need to
-	 * bring down the GX after a GMU failure
-	 */
-	if (!IS_ERR_OR_NULL(gmu->gxpd))
-		pm_runtime_get(gmu->gxpd);
-
 out:
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
 		disable_irq(gmu->gmu_irq);
 		a6xx_rpmh_stop(gmu);
+		pm_runtime_put(gmu->gxpd);
 		pm_runtime_put(gmu->dev);
 	}
 
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
