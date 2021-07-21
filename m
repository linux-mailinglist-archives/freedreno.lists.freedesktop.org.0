Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56E3D15AA
	for <lists+freedreno@lfdr.de>; Wed, 21 Jul 2021 19:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC726EB49;
	Wed, 21 Jul 2021 17:55:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40656EA20
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 17:55:50 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id c15so1348612qvw.6
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 10:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0pycXB2ultmLkKc35aeNj2U+LPhWXxWP52T2qDeRhjs=;
 b=VQnE8G+T99lqj+jpc8gjTrDIq60JvIspB210ozZeqOOMmMWKPswtglKyQ/zpgkH8xf
 nSzdznQC/pcNlTb+rokrH057TouO69ecT3IdtH4UMAttClC7sNr660xpBHvAE0AIXAjR
 xGj3wmsOPr3Iy23GWqOeN2yjeLnpugyXQDEs/TM10uBJUuXbqQQRB2MOQhR9gc2S0yZ6
 ieMFY38yfiEuI3efFX25D9oEN0kxhojGFGP6MQ7iLMoK2Lp5uxhiFV5GbBvf36oO3sbx
 e/WRldFNXL8dyuTodbz8ocXxzsjHcGIGW1ADfUiDnv5p6eTBMHtAkv5d8YSKh8Hk86H8
 v+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0pycXB2ultmLkKc35aeNj2U+LPhWXxWP52T2qDeRhjs=;
 b=DESa+26cNb8PqJCjSzTncHSaG1B2flbYfs+rfmxAHBKYMthRT8kzTF/gIQETpXiBZh
 tupUvdbcGJtKAqepqP32ZBwbSoVxIdYG9urSU5TFKWFYURRUOdsuYSv0Iz53X3Vqwbq0
 N61UDhmDqPNvanRYjoBaY7fJh08qN6Vg5JvUQ9+8sukdnIEspe/fhKJMbQiL3x4MtE53
 JvrvlHMCHMjUmgxpd4KrryR1f7tOcf8bcpg2U7tGVnAYdtPjEKm/h9XFzuY1HT301pAu
 384tvMpaqnaQ0LvFXINfavWx41uifr4k9cbvtKISB5nVcdi1ZzmVf639BDBgjFb0EhfU
 LpHA==
X-Gm-Message-State: AOAM530MCifY/JODvUTnEmR2Fp7RgG1nmTtghLQ+/34S3SycfnFFL1c7
 vMan69Kqe82xyj9lbJWXGRQE+Q==
X-Google-Smtp-Source: ABdhPJz/2XnWjDEIVkqQXiPb5u4xelAKiOrD8F4Pkyijtn6fTUroFWIgLbFDelftl6codkhebYsC4Q==
X-Received: by 2002:ad4:538c:: with SMTP id i12mr37924550qvv.51.1626890149955; 
 Wed, 21 Jul 2021 10:55:49 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id j8sm9492446qti.20.2021.07.21.10.55.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:55:49 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Date: Wed, 21 Jul 2021 13:55:11 -0400
Message-Id: <20210721175526.22020-5-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND PATCH v6 04/14] drm/msm/dpu: Replace
 definitions for dpu debug macros
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
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The debug messages shouldn't be logged as errors when debug categories
are enabled. Use the drm logging helpers to do the right thing

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-5-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 323a6bce9e64..c33164d3944a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,27 +31,15 @@
  * DPU_DEBUG - macro for kms/plane/crtc/encoder/connector logs
  * @fmt: Pointer to format string
  */
-#define DPU_DEBUG(fmt, ...)                                                \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_KMS))                         \
-			DRM_DEBUG(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+#define DPU_DEBUG(fmt, ...) DRM_DEBUG_KMS(fmt, ##__VA_ARGS__)
 
 /**
  * DPU_DEBUG_DRIVER - macro for hardware driver logging
  * @fmt: Pointer to format string
  */
-#define DPU_DEBUG_DRIVER(fmt, ...)                                         \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
-			DRM_ERROR(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
-
-#define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
+#define DPU_DEBUG_DRIVER(fmt, ...) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
+
+#define DPU_ERROR(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
 
 /**
  * ktime_compare_safe - compare two ktime structures
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
