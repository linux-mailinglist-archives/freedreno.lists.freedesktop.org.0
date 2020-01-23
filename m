Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87381147529
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2020 00:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A83B6FD72;
	Thu, 23 Jan 2020 23:59:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb61.google.com (mail-yb1-xb61.google.com
 [IPv6:2607:f8b0:4864:20::b61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42346FEA4
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2020 23:59:42 +0000 (UTC)
Received: by mail-yb1-xb61.google.com with SMTP id z15so63692ybm.8
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2020 15:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zvp91oDfTO5JEbLl+0vB/VWGoX6Fo09EsCttVL/w5so=;
 b=SDDE6p5Uv0saoG5w8al+BsZzuZhQZRkbj39+0ueJ6gRLYtLLRHuMi7/EE5OYsH+YtA
 d4aQvHCI+Kd7+ucIl9TW6RVMTjnemxZAl5zJumSYpiZ8meniokDffXmHsmee7aRvjzLD
 5G6eMaG5lDT9O3l0aWAdBjh8kQgoOE5tQ/7AMouPfHQhFdtStWzVlHADBtYyizomkne8
 t9q0j0mJLniJLEvM19Ikh9ywLmee4eNzvwqntVlZiL8Uap6KqjV5mEGE4ieaIs6cRwjP
 7MNIPEssZq8qpBYJ1Eqydj7SUjGSrHWZKTFTHYJ6VTHO3diohnzpmX5aB2HaMM/ayvlX
 lmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zvp91oDfTO5JEbLl+0vB/VWGoX6Fo09EsCttVL/w5so=;
 b=mIA4MpPYwGPhVIxKTi4HQb45w7BsMpY6r9N6IANDRMLyoW/TjkbIJN+ern6dWToFtS
 cndGQeumPyqJFdb3u42PhIWw4I0UTYWKJoD9FHbUCGE9pfk21qUEwWL2akWNGw4otl9K
 cKCedyBbD/IhlsDvCesmQq5w55ik8/g3ol2SDWhiLOzlMxttw3PZ3iDgPHoufCD/2eMI
 MyMbbvHKijyPButxHcFr4p2gJjVaw2kW3ZS5c6xslN47NIv8rZ1EOaF5ezKNHLd8PGSy
 trB6J3DuL6q3fdyd50j76mZPJ7ZoLRdFO75DSi02ykdODxVvHg+go1/o/3WzwH2GJa+w
 USXA==
X-Gm-Message-State: APjAAAW6m0ofWg+SU5gyDVKeDjlblcVxy0h9LSqc/7P5my0y6a7485Vt
 r/NGb8l424zODEGvd1JvAX67Y8+BYO9C5qOcRFRD1dK3AWmJbg==
X-Google-Smtp-Source: APXvYqwFRd5SEYNa4twj8KbvI5uBQGYGOmRAxdq9oHZ+fGUwIuMk48HZYtAsYd0J8WDqs8Vvx3SvxKiQnnq/
X-Received: by 2002:a25:cf08:: with SMTP id f8mr328295ybg.304.1579823981860;
 Thu, 23 Jan 2020 15:59:41 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id i82sm591239ywg.11.2020.01.23.15.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 15:59:41 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Thu, 23 Jan 2020 18:57:37 -0500
Message-Id: <20200123235738.48182-2-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200123235738.48182-1-brian@brkho.com>
References: <20200123235738.48182-1-brian@brkho.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 1/2] drm/msm: Add a GPU-wide wait queue
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 hoegsberg@chromium.org, Sean Paul <sean@poorly.run>
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
2.25.0.341.g760bfbb309-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
