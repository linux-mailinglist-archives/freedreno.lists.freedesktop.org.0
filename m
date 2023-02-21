Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E869DDB0
	for <lists+freedreno@lfdr.de>; Tue, 21 Feb 2023 11:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6744010E185;
	Tue, 21 Feb 2023 10:16:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0192B10E159;
 Tue, 21 Feb 2023 10:16:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81F7A60FC5;
 Tue, 21 Feb 2023 10:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0A2C4339E;
 Tue, 21 Feb 2023 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676974605;
 bh=CLnGEscqosrMeLtUFrN4NYlf8E7ksq4zdFj/Jlggmh0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y+V1fdK1GKXHbxmqrbV9e4k/+EMq/lPTAGIm5msOM6r2++cH9mTlLG7UGkLSIKmai
 68WtQLbR5MsoTCjy8rG+jOhcTXI3e60RRUZLbISeYQv7/6Z+xZ9G7ywThRzMT0b0q6
 +ZE0O17llIV3WzZrlYA4eiwOQg59FYn5Xn6TCuyymUNOTRbA0waFR5ml0kdld0WZJr
 6B+2RdncNDKvzgS9a3tS9aEevT9gmg+cWRnJHsz8Bxu/Thbyv1COe9SifpLyizvcfW
 U710lcZLepraPrQN8tTmx9p2ekPaYqdh5jS9q6MgryyNM9MZLpLB9DYlTF+i7ETzXW
 M0ebwVGhTpnrw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pUPhY-0003oJ-5w; Tue, 21 Feb 2023 11:16:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Feb 2023 11:14:29 +0100
Message-Id: <20230221101430.14546-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221101430.14546-1-johan+linaro@kernel.org>
References: <20230221101430.14546-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/4] drm/msm/adreno: drop redundant
 pm_runtime_disable()
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since commit 4b18299b3365 ("drm/msm/adreno: Defer enabling runpm until
hw_init()") runtime PM is no longer enabled at adreno_gpu_init(), which
means that there are no longer any bind() error paths for which
adreno_gpu_cleanup() is called with runtime PM enabled.

As the runtime PM enable on first open() is balanced by the
pm_runtime_force_suspend() call at unbind(), adreno_gpu_cleanup() is now
always called with runtime PM disabled so that its pm_runtime_disable()
call can be removed.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ce6b76c45b6f..1101b8234b49 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1082,15 +1082,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 {
-	struct msm_gpu *gpu = &adreno_gpu->base;
-	struct msm_drm_private *priv = gpu->dev ? gpu->dev->dev_private : NULL;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);
 
-	if (priv && pm_runtime_enabled(&priv->gpu_pdev->dev))
-		pm_runtime_disable(&priv->gpu_pdev->dev);
-
 	msm_gpu_cleanup(&adreno_gpu->base);
 }
-- 
2.39.2

