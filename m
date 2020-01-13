Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331EE1394ED
	for <lists+freedreno@lfdr.de>; Mon, 13 Jan 2020 16:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86F96E0CC;
	Mon, 13 Jan 2020 15:37:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc64.google.com (mail-yw1-xc64.google.com
 [IPv6:2607:f8b0:4864:20::c64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F136E0E3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2020 15:37:21 +0000 (UTC)
Received: by mail-yw1-xc64.google.com with SMTP id h126so6329050ywc.6
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2020 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
 b=Qlt2JrtxXffRVq9WBDU89WEUScfSt5bAr4nawTezguWtOz2UrnbkFTnmJhBhndv75o
 MUYHSbpZPlkXQgjoxuAJTTfbyZVac1cyRTtpQEgrXqmzbYFtHxAlVax6ogB1d9En28jq
 a1oKICSwZpEwqXmwcsuSIQE44bZHgkNz4twckgnGcC3f9xh68blQ51sGaNJr2Lfhqw7L
 zc73yl6oiVrpCpkUbSl9kzL/gxijXiFYWfGOKnGoAhcRxbsXoJVsar924b9aBb5qK0x1
 uST7IMadkwfISnpzlEPxYX4R4I8pHIEPe2lVcnxD+wy68F8pMI/icsLsFBgHsdwm4p57
 ESrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
 b=p2yE3HA7lm4Ar5rbcGzDQNFGnOcwchN9a1gxx/gp131tu4py4rf9q+clHLJT3v5CeW
 PrQHBwqnFzEFMLx4mT4k751eZ4SraOWKasz79IHYj5DPWrTmwHwjWuqt0G7njvYY3Mj1
 GBllSMdBeM+okLd1SAzNeg2sUXNALJv93o4S9PU8HUVWLfyaw10dCI422h0occ4zwubH
 H5oU9YnFmDITTUSVC/l92nGR9ObabBlEvu12bCqWqQseSHGPwryVMtyKZLLAaYjXwVch
 BmXSX0qXq4f+bHeUtmcX6zV/uRtQRvPF+pU2S7IjPUpkrmgi7krYYRfjcGPQCV4YRiEU
 Tmyg==
X-Gm-Message-State: APjAAAVRTTV2ibZZsKqJV1HqTmpwdapgzDOpUZ02LyQcbyFZeYnOe7vu
 X5KgFsLGEgwv+EJVKfxfoJbQuhXrolDU47hBSXKykNf3LEQHYg==
X-Google-Smtp-Source: APXvYqzQmLBNNT0a1aEnDqzSaVursng0om65Vx4mgRanu6nthloLlNoHL5C/UNEtGCLK6Btwv8oweeewjFGS
X-Received: by 2002:a81:980e:: with SMTP id p14mr14497442ywg.24.1578929840530; 
 Mon, 13 Jan 2020 07:37:20 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id m193sm1672393ywd.0.2020.01.13.07.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 07:37:20 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Mon, 13 Jan 2020 10:36:04 -0500
Message-Id: <20200113153605.52350-2-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200113153605.52350-1-brian@brkho.com>
References: <20200113153605.52350-1-brian@brkho.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/2] drm/msm: Add a GPU-wide wait queue
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
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
