Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8530680C
	for <lists+freedreno@lfdr.de>; Thu, 28 Jan 2021 00:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFB789F08;
	Wed, 27 Jan 2021 23:39:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F73D89CA1
 for <freedreno@lists.freedesktop.org>; Wed, 27 Jan 2021 23:39:51 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id o63so2827784pgo.6
 for <freedreno@lists.freedesktop.org>; Wed, 27 Jan 2021 15:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v21tqpgjolQTw9HY0r2tj0ANjKrErbpBBTjA+9enZnA=;
 b=GSJN/wW2FLosUcOoaOOPX6pRLCpf1WGgRyuzL23NjZyHaXz1F2Lms6J8Txs907+HRd
 ynRTinENDoHcgXcOV50q/G28w0/F/Pm/FMe/SsNGhGlPjl7Pz4pCk4WCWDXg0MWkz27N
 gjBUw1AMQor+yWquWtv/ypkvU0lnRuy04CHOd+b29xOeK6yYPRmN98jhNct98ycmZ2pO
 ouAzM80cCw/ZmLvlzsA/nU2rHNMLj+qvnb9kPjgzd1e4JNFWpQvQyklStfCloaenmWlT
 +jR9qDLrcS4TpM7d1pY7xqU6H5+ifF8wDonv8yaIDesaEg0o8/svdnfHKkNLFvSA0FZK
 UkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v21tqpgjolQTw9HY0r2tj0ANjKrErbpBBTjA+9enZnA=;
 b=Lr4j3k9CIJnLsaYpvnsGXRJzBBH5SdX+rtsMP9if81BLIsfr2I19DrhGCI7ttvkiUz
 PSle1FSQlO3RIhBQ9IiYizoxxv7IIOM/zUIW00g7wfGNDP31VbqJpdT8nKfNx4lfrb74
 +Hk8AjazTXF+EJMFn94WAf5M+Z5g5CE83BzIqYBuDTMfcfOopF+o5ALEN1VaWhiPbEvT
 n3irt+zXZWCSWaewQwmpVLfBU2kTBhRuqOwwz4OtWtAuANcSY6wqNypAGGWE2ZjHDxBy
 ehmm/EK6DyxM2ND9dhheFUVJSjbbFTv/cXUAOJL8Tu7Jqq09a3WY9gcTuMuKHBRDiN8N
 CNuQ==
X-Gm-Message-State: AOAM53223WIj0uWbo1LeBhHA5ftwlopcOQN1xsgPFgownbazd6VJvHyn
 lCVFwOTWOpRH/DdCRI2pnyLQfw==
X-Google-Smtp-Source: ABdhPJzmIapKXviXijCoY/g+Uxn8nZp1kHCOJ+D3IrJvEwM1XcEejiCexzx+2M4N95x4UBfEan29fA==
X-Received: by 2002:a63:2cc5:: with SMTP id
 s188mr13948806pgs.233.1611790791019; 
 Wed, 27 Jan 2021 15:39:51 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
 by smtp.gmail.com with ESMTPSA id q2sm3282382pfj.32.2021.01.27.15.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:39:50 -0800 (PST)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>
Date: Wed, 27 Jan 2021 15:39:45 -0800
Message-Id: <20210127233946.1286386-2-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127233946.1286386-1-eric@anholt.net>
References: <20210127233946.1286386-1-eric@anholt.net>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/3] drm/msm: Fix races managing the OOB state
 for timestamp vs timestamps.
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
Cc: Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Now that we're not racing with GPU setup, also fix races of timestamps
against other timestamps.  In CI, we were seeing this path trigger
timeouts on setting the GMU bit, especially on the first set of tests
right after boot (it's probably easier to lose the race than one might
think, given that we start many tests in parallel, and waiting for NFS
to page in code probably means that lots of tests hit the same point
of screen init at the same time).

Signed-off-by: Eric Anholt <eric@anholt.net>
Cc: stable@vger.kernel.org # v5.9
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7424a70b9d35..e8f0b5325a7f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1175,6 +1175,9 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	static DEFINE_MUTEX(perfcounter_oob);
+
+	mutex_lock(&perfcounter_oob);
 
 	/* Force the GPU power on so we can read this register */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
@@ -1183,6 +1186,7 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
 
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+	mutex_unlock(&perfcounter_oob);
 	return 0;
 }
 
-- 
2.30.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
