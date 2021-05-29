Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D339498D
	for <lists+freedreno@lfdr.de>; Sat, 29 May 2021 02:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6346F3FE;
	Sat, 29 May 2021 00:25:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FF66F3FE
 for <freedreno@lists.freedesktop.org>; Sat, 29 May 2021 00:25:23 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id s25so7325082ljo.11
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 17:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ykno5ScqHISl5MvpMMbNruwqmEFF7aFVt3CW4PsTnD0=;
 b=QLjrGFMtKLfQ7blal/P4aEXB9sZBj0Q1nPFAMnGTYPRPIjqTaL64EJ07xkwIHtnFGT
 CxCldIIBoBiK5R9Ime+szoKeM1QmFcUxf4/rqkDABkqSBlRHW1beCwjnyeI+DLQR224n
 6tlZmnEvdb6V+k6MeqaEVK6VJD03yNCGOM9+AgKzvrGhH8kpzoLFlOJiTo1zt7CqIs8L
 yRjpY+DExop/G4UsBctnTTv3slEK+Fgkm6PxN2FDulHNWcVDu9Y9eabEkEUWCuvsBMKV
 OvnJAvdmVGBLEM8dsZLlGnkzNfDJl6LCWtj+4cJC6TyVJGt40peq//cQZx4qsoiVGgBm
 hhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ykno5ScqHISl5MvpMMbNruwqmEFF7aFVt3CW4PsTnD0=;
 b=DRF9iWTN8h7v4Ero21AicrOwCXX3M8r7xF09d82QGTMk4JxmmkEjFcoe59oBTejKRa
 KcpTL+f5rg9O82ggnUVWYKGo2Jc3S1nEsG2q3OFZqJPq8UZ1ImpF+nrDjTgoZEcDH/+y
 VydS/AMROTJVY6Ut6uhGzDSaiaYgZLgQ1NH8DccFMCNdmlBU+BwlNAVbnmYY7OMAOaOv
 KhBI+DmxdcV2IWrWissZnKVpwP1vtOceLkdm3VQtj6UO1r8+zE8Hxm/zlDNKl9hGonsH
 +9m+rHCnwvPZ3ri5Ks8c8yosHokvFS1lFTf3p/HUbz1E43UZKC60UlLa0qMbtiPZHTWr
 7vLQ==
X-Gm-Message-State: AOAM531a0KUslxcreQnRkPGpupKDafEr7EPgllPr98h87BxNCHIAd9Be
 CyZS+GLlf/y6vbGyenQTrESYXA==
X-Google-Smtp-Source: ABdhPJyzPZTQeNBeNMprhLvNq5mnP5aEiblRwvbvAdvjHR4A3MC9MpNeyNItO6/UOSlkhMm9TyIMbw==
X-Received: by 2002:a2e:90d6:: with SMTP id o22mr8369126ljg.473.1622247921499; 
 Fri, 28 May 2021 17:25:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Sat, 29 May 2021 03:25:07 +0300
Message-Id: <20210529002508.3839467-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 7/8] drm/msm: do include unused headers in
 msm_disp_snapshot.h
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  |  3 +++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 19 -------------------
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++++++++
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index c1f725c0cf60..802e860cd045 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -5,6 +5,9 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
+#include <linux/devcoredump.h>
+
+#include "msm_kms.h"
 #include "msm_disp_snapshot.h"
 
 static ssize_t __maybe_unused disp_devcoredump_read(char *buffer, loff_t offset,
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index 327df4892a9c..402bde48a2a7 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -6,28 +6,9 @@
 #ifndef MSM_DISP_SNAPSHOT_H_
 #define MSM_DISP_SNAPSHOT_H_
 
-#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
-#include "../../../drm_crtc_internal.h"
 #include <drm/drm_print.h>
-#include <drm/drm_atomic.h>
-#include <linux/debugfs.h>
-#include <linux/list.h>
-#include <linux/delay.h>
-#include <linux/spinlock.h>
-#include <linux/ktime.h>
-#include <linux/debugfs.h>
-#include <linux/uaccess.h>
-#include <linux/dma-buf.h>
-#include <linux/slab.h>
-#include <linux/list_sort.h>
-#include <linux/pm.h>
-#include <linux/pm_runtime.h>
-#include <linux/kthread.h>
-#include <linux/devcoredump.h>
 #include <linux/dump_state.h>
-#include <stdarg.h>
-#include "msm_kms.h"
 
 #define MSM_DISP_SNAPSHOT_MAX_BLKS		10
 
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 9f61e376bec2..5b278329a9ee 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -5,6 +5,14 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
+#include <linux/io.h>
+
+#include "../../../drm_crtc_internal.h"
+
+#include "msm_kms.h"
+#include "dsi.h"
 #include "msm_disp_snapshot.h"
 
 static void msm_disp_state_dump_regs(u32 *dump_addr, size_t aligned_len, void __iomem *base_addr)
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
