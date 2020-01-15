Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43B13CE65
	for <lists+freedreno@lfdr.de>; Wed, 15 Jan 2020 21:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8A86EA9D;
	Wed, 15 Jan 2020 20:57:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x961.google.com (mail-ua1-x961.google.com
 [IPv6:2607:f8b0:4864:20::961])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096726EA9E
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2020 20:57:35 +0000 (UTC)
Received: by mail-ua1-x961.google.com with SMTP id h32so6823978uah.4
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2020 12:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
 b=JYjuVTSotuEa5LKchq1QwLvMiC0miS12YXda9sHdZclwC92lt8XOByu06EK7yqK9r4
 WCBYRHBwJdaS94EIh7jMaUWTVZZYvUhWL9XBklNDK6A8QC9DqQEpnz8v45Z9wC3EflW+
 gwoDaiKJbd4DfyNMo7Bq7JUudOlO+KZVDKdDCjnvAPhSHqmKfD/+2NvMg6rYunAXunQq
 iVwQl8EuDAxN9kmFZjdQhkRqyLfeN8m5DEHs2R9Y8iQmkfWay48vJc1Oa5KrF3tTeDLc
 dhDkGUXfDcG5x4C9tviRSMV0IbElyaH1E/d9I0UdlhbH1f9wRnYLlwq2fZylhxEr/IsU
 Fgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
 b=HNkxxDOPTGIOFHrrId/9r+8PqH4dDOerZB5EB/pqiATuKBeR7X6eyF1CMgwaL5Qaip
 fd0vmpblgCjBr63ELb3bd4ZNawTrpnW9cn5ZVl40/2d1X98Km3K1IYHY3rXq9cul2XXW
 zjZO49QOkk6DeoNlA90fvDG9pknWXa1VeylSA2WpYShvpEpNo/zgXEsfYbCQ5Adb9QKq
 ws979IL07MOzNvRGk1P1V4/JVOEfy9+eIDOYhkmB1/HtPtEFwPyPVKKpYrQmTKjzjMoH
 JuK6lBE+gvZeMzfhuRm3bS85qRDoir0WUvuhXU2dlxvbzwEYCwYg1mOKJecfQoxNBGok
 WRzw==
X-Gm-Message-State: APjAAAX4AYvcEhtPro9ZfY9Arb8PwZvHEjUBlmCC/W9qDnhFmxo0NW3m
 zEY9YP7D/supo8Ql2Gq8HcY11FBUieRoNhTqrqxyNkoR8Mxs1A==
X-Google-Smtp-Source: APXvYqxjXDMjnFKkSryidbYnjPMiySJ2xbqbi1okq9jcW8s3Bi6lp++0JgkqqYp9Bkjvkqtrqnlfvge183NV
X-Received: by 2002:ab0:422:: with SMTP id 31mr17816176uav.98.1579121855091;
 Wed, 15 Jan 2020 12:57:35 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id j26sm1472756uak.1.2020.01.15.12.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 12:57:35 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Wed, 15 Jan 2020 15:56:48 -0500
Message-Id: <20200115205649.12971-2-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200115205649.12971-1-brian@brkho.com>
References: <20200115205649.12971-1-brian@brkho.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 1/2] drm/msm: Add a GPU-wide wait queue
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
Cc: robdclark@chromium.org, Brian Ho <brian@brkho.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 jcrouse@codeaurora.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, hoegsberg@chromium.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This wait queue is signaled on all IRQs for a given GPU and will be
used as part of the new MSM_WAIT_IOVA ioctl so userspace can sleep
until the value at a given iova reaches a certain condition.

Signed-off-by: Brian Ho <brian@brkho.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a052364a5d74..d7310c1336e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -779,6 +779,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 static irqreturn_t irq_handler(int irq, void *data)
 {
 	struct msm_gpu *gpu = data;
+	wake_up_all(&gpu->event);
+
 	return gpu->funcs->irq(gpu);
 }
 
@@ -871,6 +873,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	spin_lock_init(&gpu->perf_lock);
 
+	init_waitqueue_head(&gpu->event);
+
 
 	/* Map registers: */
 	gpu->mmio = msm_ioremap(pdev, config->ioname, name);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c9dc8..60562f065dbc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -104,6 +104,9 @@ struct msm_gpu {
 
 	struct msm_gem_address_space *aspace;
 
+	/* GPU-wide wait queue that is signaled on all IRQs */
+	wait_queue_head_t event;
+
 	/* Power Control: */
 	struct regulator *gpu_reg, *gpu_cx;
 	struct clk_bulk_data *grp_clks;
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
