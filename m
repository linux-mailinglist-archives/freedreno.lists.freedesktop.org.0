Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003B9243F00
	for <lists+freedreno@lfdr.de>; Thu, 13 Aug 2020 20:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B827C6EA8F;
	Thu, 13 Aug 2020 18:44:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B89D6EA8F
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 18:44:27 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so5121390qtp.11
 for <freedreno@lists.freedesktop.org>; Thu, 13 Aug 2020 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i08DjFarJSioJFF+3BzXlzJrV3znYAwGrEz9J75FiX4=;
 b=Zey1i9YKtQygbzUDBlnW/AKCXPLBGNuzu5QshFKXWVoQGiehGBZWCktZt7P3kmrpyp
 etLXXJqJYrSLasI6L4DL57cfA+jq+WuaWJ/dPEgm2kOqm3bplNfFZIpdLzM7qO2fNPq7
 SI5LUPLrMuHlHu1uf/aInNBO05dHYBMtKk/hlVAFeX3t786TTYiuZEzAx4LXnEkK7I0e
 1p8k2gLsGsdxA6VIzuicHGDlI6A8b4Epw4DAlh/QfTuf/VfScE0xJyabJHg11CBxZeHE
 H0gbHy7e4Q3PbTQZ4meSA/pFmvsFfvHNyNKZ3BFuZp2OZnw9nKiJwvbWyHbdD+hYFFnb
 6FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i08DjFarJSioJFF+3BzXlzJrV3znYAwGrEz9J75FiX4=;
 b=CtDDVcx7m5NJMeI8r7ovy0RVC8tTv2NOOytTrq2Z19DauQdRGkyTAs7rzrEDrVxz8+
 wR86ao1Sq7VeBk84HLeaiWkQORw1VLGTVUKdu5dOghXPTjY5RgbaNxrk4HfeF7r4Stsa
 5JqUB9pD3rNMHQvmNw3VZZeOd8ppe7c8sego/XDUtLAqCxQgErBjciD/9dsLUQFvyl3L
 xfasVadZDSIiQITqpSgzhM1uK/SPPw59/5NqH3IMDIKsKebxCVR6WXiNX+Irh4+J0GZ0
 JpMWXgAhIbfa4+pmKOBvLE7iI6psxenIbhGSVBrNi7hn3aUNMTpXySh5qdymFCEseL4V
 yw5g==
X-Gm-Message-State: AOAM530dJ/wGWPtwgMUURKqrwU1UqMnAQ/FW3pFmrKR6R61cXrnurioL
 A0biKq4wa74dLRt+nRNhA8kjL7P2qfE=
X-Google-Smtp-Source: ABdhPJyZpBHtFpCwUCN1Y5bRe8UUWA5ZmNxEvgqLYBigYpnTpeGmXkwoWEtaaNHcAVUMDbL7wZ6m1A==
X-Received: by 2002:aed:2946:: with SMTP id s64mr6816571qtd.204.1597344266044; 
 Thu, 13 Aug 2020 11:44:26 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k5sm6415227qke.18.2020.08.13.11.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 11:44:25 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Thu, 13 Aug 2020 14:44:18 -0400
Message-Id: <20200813184420.18448-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/a6xx: fix frequency not always being
 restored on GMU resume
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The patch reorganizing the set_freq function made it so the gmu resume
doesn't always set the frequency, because a6xx_gmu_set_freq() exits early
when the frequency hasn't been changed. Note this always happens when
resuming GMU after recovering from a hang.

Use a simple workaround to prevent this from happening.

Fixes: 1f60d11423db ("drm: msm: a6xx: send opp instead of a frequency")
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b67b38c8fadf..bbbd00020f92 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -845,6 +845,7 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	if (IS_ERR_OR_NULL(gpu_opp))
 		return;
 
+	gmu->freq = 0; /* so a6xx_gmu_set_freq() doesn't exit early */
 	a6xx_gmu_set_freq(gpu, gpu_opp);
 	dev_pm_opp_put(gpu_opp);
 }
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
