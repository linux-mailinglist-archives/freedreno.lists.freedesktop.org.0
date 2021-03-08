Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E1330F3D
	for <lists+freedreno@lfdr.de>; Mon,  8 Mar 2021 14:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25D489B66;
	Mon,  8 Mar 2021 13:33:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50A089B66
 for <freedreno@lists.freedesktop.org>; Mon,  8 Mar 2021 13:33:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w11so11457463wrr.10
 for <freedreno@lists.freedesktop.org>; Mon, 08 Mar 2021 05:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
 b=lWgaqsU8BQOwg9ws+DhQ/BWpAGGUh8wAnGaIk1lwDEofYiLOAhnUDvwTgdcltFd/Uf
 YsZHPTY6e6kNXalk/rmRj1JzpwNfZBxiP6yn6cwPmGg0Dph1wbF4d3Ul5NSoB4s8GwYD
 nlH4qfp6V1l53JUThiQx/V0USq4Gt1khL5dGlV8juzFC9xCtxFPTHoTRadWc7zznJ8qw
 s+gy9jH9Xoq/gFjjgsSjZvcFBW1f1akBVwlFUVL2FLsro5Kb7d78Np120TBRReONbPnQ
 fZlJimyI9CR1S0CynZOBmLY9R54Zyoa3bAPsezbfw/RyxXar3+qr6KMWSKS7m523eMAW
 OgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
 b=mbhUljRQ7/7Kpi/Uo2YVJpB3N+b59hgGYCqCQuNCNZyu37szV/nTjonrN/hsLsKV/B
 xVrHrVgjL0jdVAVqIIZfYFTbPLTMxxpAhzNyp6GxJXfjkAWVsnG/nsk78DvnmCH/2uaF
 sVxYOpQOqqmibZPhM+IAwgO+6HSMFZkrrBa319uYnWKfsKB5zYCTnI5PrQQRPC6QVcpA
 z5iXrdLUEEsol0wIPUn66YukFAVg1JkvUBPuO1rpH0bzs5hfzj0wbLAGhSMJkDULYh4B
 dr6Vnz4gP5SrmUutsAyqFBMiXdNrBeZgcSn/wVirha5uWlwiDdxkqeXubXmU53R/S+hE
 LXiA==
X-Gm-Message-State: AOAM530+uMa9Q1Cx8U4/GBhC625wIdVcrCTqg7CEZkhuzKf+hgUhUtmb
 l6GnndrLJ3gXnRfoWq0s5u9LPg==
X-Google-Smtp-Source: ABdhPJw3x/ONzAujdJQrvrdWPrHpTxgLjwa+71+eZDx0LcFQ+0Bvu7wMMD+q/fjcOPEFvjgfd2vEMw==
X-Received: by 2002:adf:b609:: with SMTP id f9mr22017714wre.223.1615210386308; 
 Mon, 08 Mar 2021 05:33:06 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
 by smtp.gmail.com with ESMTPSA id m11sm18942665wrz.40.2021.03.08.05.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:33:05 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: cwchoi00@gmail.com
Date: Mon,  8 Mar 2021 14:30:38 +0100
Message-Id: <20210308133041.10516-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210308133041.10516-1-daniel.lezcano@linaro.org>
References: <20210308133041.10516-1-daniel.lezcano@linaro.org>
Subject: [Freedreno] [PATCH v6 2/4] PM / devfreq: msm: Use devfreq cooling
 device registration
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The devfreq core code is able to register the devfreq device as a
cooling device if the 'is_cooling_device' flag is set in the profile.

Use this flag and remove the cooling device registering code.

Tested on dragonboard 845c

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 12 +-----------
 drivers/gpu/drm/msm/msm_gpu.h |  2 --
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ab7c167b0623..eade94271a60 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -14,7 +14,6 @@
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
 #include <linux/devfreq.h>
-#include <linux/devfreq_cooling.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
 
@@ -82,6 +81,7 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
 	.target = msm_devfreq_target,
 	.get_dev_status = msm_devfreq_get_dev_status,
 	.get_cur_freq = msm_devfreq_get_cur_freq,
+	.is_cooling_device = true,
 };
 
 static void msm_devfreq_init(struct msm_gpu *gpu)
@@ -112,14 +112,6 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	}
 
 	devfreq_suspend_device(gpu->devfreq.devfreq);
-
-	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
-			gpu->devfreq.devfreq);
-	if (IS_ERR(gpu->cooling)) {
-		DRM_DEV_ERROR(&gpu->pdev->dev,
-				"Couldn't register GPU cooling device\n");
-		gpu->cooling = NULL;
-	}
 }
 
 static int enable_pwrrail(struct msm_gpu *gpu)
@@ -1056,6 +1048,4 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 	if (gpu->worker) {
 		kthread_destroy_worker(gpu->worker);
 	}
-
-	devfreq_cooling_unregister(gpu->cooling);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d7cd02cd2109..93419368bac8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -155,8 +155,6 @@ struct msm_gpu {
 	struct msm_gpu_state *crashstate;
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
-
-	struct thermal_cooling_device *cooling;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
-- 
2.17.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
