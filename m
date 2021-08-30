Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC53FBB88
	for <lists+freedreno@lfdr.de>; Mon, 30 Aug 2021 20:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B2E89C08;
	Mon, 30 Aug 2021 18:14:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5465489C08
 for <freedreno@lists.freedesktop.org>; Mon, 30 Aug 2021 18:14:09 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id w17so2754349qta.9
 for <freedreno@lists.freedesktop.org>; Mon, 30 Aug 2021 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IVWaWVzfZ6dq3aPM/lg08djCsHf+IxpxXcQYxpXjdvo=;
 b=kjRYVTdHYuIFgk2GntwtTxPtNC5JrGOxLcZ95T8Zfj7pePKT1W57iB7Z8bRLFXxKCd
 hROF5hS/7GX4zTMubhriKydOkNaywkylxsoIFS5ZaoykDCufEPBzTS1U/ILASY3KsRxK
 f4C0HPBKeHV/hCCw4lcgPAGVxzsiQ7ydHoCMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IVWaWVzfZ6dq3aPM/lg08djCsHf+IxpxXcQYxpXjdvo=;
 b=qEMrf+4112PE6bQdpBik++JwXpVVw0aD86dpWEBFHu5eg2/nP+HlxiE96RxfJP31en
 k3Cxo935kwvNKF757S2h9mkkd/9Izib4/TmgE2fek0XELYI3xBBuJ/slBOoC6c+5GZ9y
 QYQOklMQlrFNU1QSfyLS78bFC8bzUXVpB8cdkRp+BTYie9yNKc98IuC11ByHujTan1Gz
 AWyXp8lee4zl4FvVHee/wTW+o6lm+RLQDtB67tlcYKX57057izl1SN5sugQcDM3jQ44M
 4DuBomexfdHRb3KLt7MjlUKXb4f5XzH0Xzkyw7j7ySGcvTIzKWHGORkqMwXWABb4ERVV
 Bxrw==
X-Gm-Message-State: AOAM532gvW0Dd8+8e1xm9/L0L2rGCQEySZfUmXIDMxmaCHfCBZq5iVbg
 k9C+EqQsieExTkgAcosojgSjXLJD0i8CtQ==
X-Google-Smtp-Source: ABdhPJwaxvSzca/tsIiaIMY+/TE97JesTABqx9M/rn05CbqJMLSyVtrOLov5IbLY2P1uoxC0N9bpUA==
X-Received: by 2002:ac8:73d8:: with SMTP id v24mr22049022qtp.203.1630347248097; 
 Mon, 30 Aug 2021 11:14:08 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:416:6752:2510:e746:b547])
 by smtp.gmail.com with ESMTPSA id r140sm11911311qke.15.2021.08.30.11.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 11:14:07 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: freedreno@lists.freedesktop.org
Cc: seanpaul@chromium.org, abhinavk@codeaurora.org, robdclark@chromium.org,
 Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 30 Aug 2021 14:13:59 -0400
Message-Id: <20210830181359.124267-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210811180844.2130484-1-markyacoub@chromium.org>
References: <20210811180844.2130484-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm: Change dpu_crtc_get_vblank_counter
 to use vsync count.
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[why]
vsync_cnt atomic counter increments for every hw vsync. On the other
hand, frame count is a register that increments when the frame gets
actually pushed out. We cannnot read this register whenever the timing
engine is off, but vblank counter should still return a valid number.
This behavior also matches the downstream driver.

[How]
Read the encoder vsync count instead of the dpu_encoder_phys frame
count.

Suggested-by: Abhinav Kumar <abhinavk@codeaurora.org>
CC: Rob Clark <robdclark@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  8 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++--
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9a5c70c87cc86..cfd426b6776e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -78,15 +78,13 @@ static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 
 static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 {
-	struct drm_encoder *encoder;
-
-	encoder = get_encoder_from_crtc(crtc);
+	struct drm_encoder *encoder = get_encoder_from_crtc(crtc);
 	if (!encoder) {
 		DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
-		return false;
+		return 0;
 	}
 
-	return dpu_encoder_get_frame_count(encoder);
+	return dpu_encoder_get_vsync_count(encoder);
 }
 
 static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1c04b7cce43e3..41d5643327709 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -397,19 +397,11 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
 	return 0;
 }
 
-int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
+int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc)
 {
-	struct dpu_encoder_virt *dpu_enc;
-	struct dpu_encoder_phys *phys;
-	int framecount = 0;
-
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	phys = dpu_enc ? dpu_enc->cur_master : NULL;
-
-	if (phys && phys->ops.get_frame_count)
-		framecount = phys->ops.get_frame_count(phys);
-
-	return framecount;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct dpu_encoder_phys *phys = dpu_enc ? dpu_enc->cur_master : NULL;
+	return phys ? atomic_read(&phys->vsync_cnt) : 0;
 }
 
 int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 99a5d73c9b886..e241914a96777 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -163,9 +163,9 @@ void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
 int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
 
 /**
- * dpu_encoder_get_frame_count - get interface frame count for the encoder.
+ * dpu_encoder_get_vsync_count - get vsync count for the encoder.
  * @drm_enc:    Pointer to previously created drm encoder structure
  */
-int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
+int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
 #endif /* __DPU_ENCODER_H__ */
-- 
2.33.0.259.gc128427fd7-goog

