Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565D7137A4A
	for <lists+freedreno@lfdr.de>; Sat, 11 Jan 2020 00:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894F46E153;
	Fri, 10 Jan 2020 23:39:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x764.google.com (mail-qk1-x764.google.com
 [IPv6:2607:f8b0:4864:20::764])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31E66E0F7
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2020 23:34:27 +0000 (UTC)
Received: by mail-qk1-x764.google.com with SMTP id z14so3586695qkg.9
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2020 15:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
 b=QxcYeNMk/Vpw36jPRT/rLJhifIOAK4/tITTymFuarV0TscM8D2LU/Dt/qgJ5Cha3sG
 KH1TnzoO4dIrZOZa/uUFFToVss2MV007W+rKlohjfg9cp2SAhWE33i14XVEzrSxeL094
 fnRFQukPtGu7n5+3ymSQWd4XDwaTa9hdLqF0x1Pc7Kf24dZZOHDpyGru5tUxgn+qLH3K
 rDwdPW8PBTLBnMVPHz5Ire5VddRBqrcEGK4uHMXEzhRRAza+ds4i9zhKT9c7KR8rK45f
 MyuiiIX9Vvgr2OzB2kqpgyGUrHgsdMKYrmu9/b/JvKt9jR4tLcZgqfDd5Gg/Mod7MUGr
 iIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAq6TrEVx22C9NeXV+u5E8p8eBKHJtE8qNPoQl4adsE=;
 b=hLw5PjpXTLw1CJF0yarTBXKAzAzt/MkVeY98wrkl/nvFM7lHmiTtGHcUgMc1w/o54c
 Wwb7i8ze0QvDN3qqvFRxyzostkj0wYQJ06t+TG6HK24dOWVuWVrSLPokGZKH2acfIiYN
 1ZywP1308AIJpt/hwOetri5lU+Z2LxObAxb0QjkWKcCsCaf5hzJbp5D6YJP5JW0qiZoq
 Mk+XDdWyjjfkthDal0mYtGyITz6LGIpRwp8DCpHN3rBbYmFER4mjyuAOikRxAEOCbjSe
 L+nPS4VAbrdYvKBp0sH11LqRTK9+rFjxLtTYy2VvORmP/baTHgq9egIFIn922v+szaof
 3ecg==
X-Gm-Message-State: APjAAAWN2DW1OIInP/h18HVAQ+KV4/z/QljFtkUGBTNaJ+D8X1vKH/C6
 MuqwHRN34kE9vbZ91N2vSBh94nwDS7yjxugI2lg9qkKsWSZezQ==
X-Google-Smtp-Source: APXvYqwsGci5zc8hHG5eKCsUkVcqZ9SDtw8szeWQ0DkzpFBjasxIveh6D3sh9OQw4bEiI0W2hEAHRKiMq2rN
X-Received: by 2002:a37:8d3:: with SMTP id 202mr5773007qki.415.1578699267040; 
 Fri, 10 Jan 2020 15:34:27 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id h26sm433007qkj.2.2020.01.10.15.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:34:27 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Fri, 10 Jan 2020 18:33:49 -0500
Message-Id: <20200110233350.138471-2-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200110233350.138471-1-brian@brkho.com>
References: <20200110233350.138471-1-brian@brkho.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jan 2020 23:39:11 +0000
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
Cc: robdclark@chromium.org, hoegsberg@chromium.org, Brian Ho <brian@brkho.com>
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
