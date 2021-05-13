Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8DF37F07D
	for <lists+freedreno@lfdr.de>; Thu, 13 May 2021 02:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195556E5C3;
	Thu, 13 May 2021 00:39:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED036E5C3
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 00:39:04 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id v8so6166193qkv.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 May 2021 17:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWZAMSO2hYSW16tUIYHpicH/GLn/3fYypp5Jz9VSm00=;
 b=U4o7cwX2QQVVTuDryXGCKWLw0coEb16npVBu/jFofLo4GTjmsF8dA6MYmsiPfPhL6k
 7aMlrAqXx/H6Pa4kuBluRMbfC247VwlqE0yooUKjYvApRKrTskwNrJBHYywJUAG2X7ZA
 VQXOMtLtIOPk3tDvIg5SVdRe9RAwpOkkNNNFBVO9EHxnkLiovJXusp6fgipw2FGdIazc
 cjmJd/iLu+KsJIxKRLXf4zI1sOEvxLypncNuNAUbrYar2eBfztYVQSj/RZ2iqy5QXSXb
 2xhLZY6lyGwAnZZBDNeBnBzMFx55muQBXIO7309s7AB4U2TuElmMFmNEZQZL0Ogeze8S
 WZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWZAMSO2hYSW16tUIYHpicH/GLn/3fYypp5Jz9VSm00=;
 b=UafQxVYB1xMvgFW30Y/A6YRQJ5RCfEM/SosC1emUIyA03CBz5vw0QZVPmIMNXzBViv
 qMyDS1lNPL+4ZZ/kWXIdvcw4Sml8IIKRFk6fGP+ru1bquIX/ol9usD4wN/EuSNvWyAE5
 QGr4MNqnxKvrWw5ewnLZuEf7Elqj9vjBp0WVS8ZWDL1RynjP7U6uQH5QC0NGLAjRYCBX
 8neRajMceaWINQL8Z5bUxvEgP+wXA3LbogxuSqKjhvrMb7KzASTqRSjZ7gvKNNS37fXU
 FyAZujd1HGyRk0GclsRIqy5vN8GUsMoMKSZDAjx8GunGENOTFoFEqN6w6CXgRVYGghZV
 qp2g==
X-Gm-Message-State: AOAM532S8b2SkBhKHI+pwYaSp2twPR+dMAyWNitXUOfzJzUnphy2JsBJ
 ViUp+WW75LWd7nHIKBfmuLBjCrIbTDf0/kj/
X-Google-Smtp-Source: ABdhPJyDGD9edTt/pecm2J2HYiTGtCLsMV1PL5FrxPOMfc9PT5J5phKcxKXCTRi/AnZO7jbXTmddog==
X-Received: by 2002:a37:4017:: with SMTP id n23mr34108146qka.338.1620866343100; 
 Wed, 12 May 2021 17:39:03 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 17:39:02 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Wed, 12 May 2021 20:37:45 -0400
Message-Id: <20210513003811.29578-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513003811.29578-1-jonathan@marek.ca>
References: <20210513003811.29578-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/5] drm/msm: remove unused
 icc_path/ocmem_icc_path
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These aren't used by anything anymore.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ---
 drivers/gpu/drm/msm/msm_gpu.h           | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 8fd0777f2dc9..009f4c560f16 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -946,7 +946,4 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
-
-	icc_put(gpu->icc_path);
-	icc_put(gpu->ocmem_icc_path);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 18baf935e143..c302ab7ffb06 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -118,15 +118,6 @@ struct msm_gpu {
 	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
 	uint32_t fast_rate;
 
-	/* The gfx-mem interconnect path that's used by all GPU types. */
-	struct icc_path *icc_path;
-
-	/*
-	 * Second interconnect path for some A3xx and all A4xx GPUs to the
-	 * On Chip MEMory (OCMEM).
-	 */
-	struct icc_path *ocmem_icc_path;
-
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
