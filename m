Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5D81F2131
	for <lists+freedreno@lfdr.de>; Mon,  8 Jun 2020 23:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4496E99C;
	Mon,  8 Jun 2020 21:05:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67346E99B
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:45 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k22so15913500qtm.6
 for <freedreno@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l260Oczt5NYvBAM8JWGWfwlC6xbJl17o2VEf10AzS44=;
 b=CseeuErBEfArFH/qvOm2e4aOzEu/535Sq9CuJsWO1Q85F5s0ZS6M7UdDa5H4jhBgGa
 mYOopnpofEfIk8y1bVHZIwXOVLbImEkLkXO3i6I8C9ZoZgeRZKZxaigphcgOXPBTEm6e
 GTMuVEQV35zYYmlj2g+7ofAGHlHaNf7z9t4NgGFjBtQmJW1LPjapU5eyBeyw1NX4SoJ6
 7oCK5TGSqKR3jgn6fDhvNkX+YFV9xSIRKs1rpLc6/DvOV3A4ebbC3ZpAYqvuw3wFZcB2
 S0XR8qMXnZ6WDHwEw9SUOxjQq3IOaA90FyIleE5dHV5Sp/aSVA445nB2Cw+X2J2Akfs+
 VozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l260Oczt5NYvBAM8JWGWfwlC6xbJl17o2VEf10AzS44=;
 b=I9X9OPVONVDghKXmqayKRsZGYaCFZrDzlg6cvDMAkN6nz/8lM25ZG1h3MUoPyy5w7A
 cyxXAKSCDuuvi4ht1HJqSMADc6I6KEg3+dK6LWRlUua2/pXanBZt1DIQe46mLfdoPbtm
 Myn8EH6FkJFRzMHYhSrMDG5pT8W/96ki6uyt06/HI09wiMi5YDdDJTaJYofalV2QZWD3
 K0+eaTIL5UyE7PY9NjyIVB1f8Hymq1lnyybPGE9EW3wDDoYguDRAvGTyA8Lj0HJE/fLk
 J5UA+4/QVVOw5GnKUKJw+i89C67wCXdwdTx/r6bYoS3vVaJIYUatEHeT9qrgsSvI7jRH
 5Hyg==
X-Gm-Message-State: AOAM532OmxlKWh/7tdMhxC0u6oZXJkuAOFX7iemE/kWn/cgm2rI+vV15
 qgRXnMUT4z9+MO9TdefKd3Ip4A==
X-Google-Smtp-Source: ABdhPJz+V6uEQOV6V65xXTa5fOfwbjDQhqzzFkU5HU0ppoPhtj/oZgEmG1jcwSwRc3m01YVKe+vcTA==
X-Received: by 2002:ac8:342b:: with SMTP id u40mr24513501qtb.59.1591650344787; 
 Mon, 08 Jun 2020 14:05:44 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id z19sm9028902qtz.81.2020.06.08.14.05.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:44 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Date: Mon,  8 Jun 2020 17:04:54 -0400
Message-Id: <20200608210505.48519-5-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
Subject: [Freedreno] [PATCH v5 04/13] drm/msm/dpu: Replace definitions for
 dpu debug macros
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, maarten.lankhorst@linux.intel.com,
 Rob Clark <robdclark@gmail.com>, mripard@kernel.org, ppaalanen@gmail.com,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, airlied@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The debug messages shouldn't be logged as errors when debug categories
are enabled. Use the drm logging helpers to do the right thing

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 4e32d040f1e6..89c444ec3bb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -29,27 +29,15 @@
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
