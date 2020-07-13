Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9057121E341
	for <lists+freedreno@lfdr.de>; Tue, 14 Jul 2020 00:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0236E82B;
	Mon, 13 Jul 2020 22:55:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910086E82B
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 22:55:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r22so13912757qke.13
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=New9UmLqwAEZ7YVR5w884jDB8P12ia0wbeaOMNqWR50=;
 b=NpuYUeVRDRTXdO3EHACL8xTWzqkqyTLGgKUmKInSBZrQyCqqJxUjcm46yIpObgFD8w
 1olATxpFlcAKhNuAPT1AHSDrCKmwE+Su5hN0RxTEZi4t4B071EJ8SmzUh0MWWMs5Qeah
 LWTPs9g/luhs3MFYiGywu8ulMJ3YwLmvRjaNOg7LZcaKWlGWI0vc8V/zNlEN5azBTuKf
 uOUzltcAp8/mjJJRH+GZJwVbWQX/aiezLPb2crOxf3XUJHkeEKiOfuQbF80SRs2xZAgV
 Kw98JuN6XjH8izK2N/qpTN8/y7PsaDEyfmZnx2y9g2dsPZ6WT+DLZo8LDwaAtIbOvDVq
 mg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=New9UmLqwAEZ7YVR5w884jDB8P12ia0wbeaOMNqWR50=;
 b=pShfSH5GJFPMgL8Us47ReWzfnDFeALpyhI4euqJJoSgka4OkgM3HFbvm+Zo/4dw5Ci
 MrQyXT6q1hrFO3USEHrAxvTzn59oJEd33aZDMqKDMndBJzUaXGGK29DpDxMpY+Thl3EE
 fLpXkUrPNRVwe9+0T/FdTJA54RzkTuBCo63cGCFSf7l74Np40Waxp5ZBvlZhFRe+D1Gc
 UXX1oQDh2C3J9vHsaF8jm8N7sew5ueDAhrwI56oTWfEaFLcUNzIHuvqBnGNFCu/mdxeR
 AwDNOujrXqAbpXwD/bwO514C0+eEtVQvxzeOp1b8xC+2iVP1WPvFKei89kpKNAAViMpZ
 r61w==
X-Gm-Message-State: AOAM531huHoAUaXbi03V8ZBUvrgNWqWsxUkMeVGVCOjLIizOO/xETXcy
 J5yLnQ8UOAKSrQ9FQGHA+rcKMI0sAcaoWA==
X-Google-Smtp-Source: ABdhPJwPhMQAQGKtHB2AxxPSDzaZIttG7vUs6x4x2pNtdoh23c7sQy9Cmx61GQ6sVuYVowXuaGif5A==
X-Received: by 2002:a05:620a:1649:: with SMTP id
 c9mr1886192qko.330.1594680914570; 
 Mon, 13 Jul 2020 15:55:14 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 15:55:14 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 13 Jul 2020 18:53:40 -0400
Message-Id: <20200713225345.20556-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200713225345.20556-1-jonathan@marek.ca>
References: <20200713225345.20556-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 1/3] drm/msm: fix unbalanced
 pm_runtime_enable in adreno_gpu_{init, cleanup}
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
Cc: Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

adreno_gpu_init calls pm_runtime_enable, so adreno_gpu_cleanup needs to
call pm_runtime_disable.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..ad64d4b7e8d7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1021,11 +1021,14 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);
 
+	pm_runtime_disable(&priv->gpu_pdev->dev);
+
 	icc_put(gpu->icc_path);
 	icc_put(gpu->ocmem_icc_path);
 
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
