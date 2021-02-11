Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732013195EB
	for <lists+freedreno@lfdr.de>; Thu, 11 Feb 2021 23:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB05D6EE76;
	Thu, 11 Feb 2021 22:41:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6176EE77
 for <freedreno@lists.freedesktop.org>; Thu, 11 Feb 2021 22:41:00 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id t26so4973731pgv.3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Feb 2021 14:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B6yvPNRRNRl+hAEm+aAT4OMwWbagrM0k8oerqfFt/Fk=;
 b=YY4SkTg7rV4kPjQAkZOLvLicOXO6Y+7cVQ/0LiM1pIHZgGh1E3le3JNADcZA9QBqwD
 RAPUqPDgumgL705j+GvlBu0L6iJycVzgsFNx1q5EHNd9O1z54qA7fR078HEud6FvhRbc
 eqXDmistUlMI3PCbnvlRLq4NNrGQBymskySB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B6yvPNRRNRl+hAEm+aAT4OMwWbagrM0k8oerqfFt/Fk=;
 b=q2pInG1vCbPuH13neVIo+TCWcqmgxsMshI3IjVEfJe2LNi3g2aRsWNYzkihK6gh6Yx
 +n28nIiA3m4ydBznc/KiepU3BKGAZEfCuqrD9ia02/6G6LARFcz29aZQSCwu4MdIkHf1
 sK22jjFD9kmcXL4HAtAoZAxFhNcPbNj5RrbQOKxS9o8TC5jaiDdjNZG0wZ6vRnpSwLOV
 wGr7blE/JH2RImhp2P5i7puLkuZoKnXsUzRiFf37mFrQf50F1ENGYNbGqGQ4q1NsZ0vk
 WokECPjFTLWole8Qo1hyFxvMWlFlpilx2iNFo2f4ImNMd4t15sw9wqQYQFK+HZrPB9Jw
 HMMA==
X-Gm-Message-State: AOAM533CModBA+A7aVadyRqqlAt8JvqNLc+7QcvN8bkB4DIelgqoAI86
 dXWJnXi1sLzj9NgGydKk86IL0A==
X-Google-Smtp-Source: ABdhPJzT0xSERmgIjPMidxbPCsmfbyLhZNGEakqTmas5KJF/Xma8ce2B7quh8a1ulXA9ffLJ4R3uZA==
X-Received: by 2002:a62:8416:0:b029:1dd:9d4e:7002 with SMTP id
 k22-20020a6284160000b02901dd9d4e7002mr321648pfd.18.1613083260119; 
 Thu, 11 Feb 2021 14:41:00 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f038:5688:cf3c:eca2])
 by smtp.gmail.com with ESMTPSA id i67sm6675454pfc.153.2021.02.11.14.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:40:59 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 Feb 2021 14:40:58 -0800
Message-Id: <20210211224058.2853809-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/kms: Use nested locking for crtc lock
 instead of custom classes
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
Cc: Sean Paul <sean@poorly.run>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We don't need to make up custom lock classes here, we can simply use
mutex_lock_nested() and pass in the index of the crtc to the locking
APIs instead. This helps lockdep understand that these are really
different locks while avoiding having to allocate custom lockdep
classes.

Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 7 +++++--
 drivers/gpu/drm/msm/msm_kms.h    | 8 ++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 6a326761dc4a..edcaccaa27e6 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -57,10 +57,13 @@ static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
 
 static void lock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
 {
+	int crtc_index;
 	struct drm_crtc *crtc;
 
-	for_each_crtc_mask(kms->dev, crtc, crtc_mask)
-		mutex_lock(&kms->commit_lock[drm_crtc_index(crtc)]);
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask) {
+		crtc_index = drm_crtc_index(crtc);
+		mutex_lock_nested(&kms->commit_lock[crtc_index], crtc_index);
+	}
 }
 
 static void unlock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 4735251a394d..d8151a89e163 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -157,7 +157,6 @@ struct msm_kms {
 	 * from the crtc's pending_timer close to end of the frame:
 	 */
 	struct mutex commit_lock[MAX_CRTCS];
-	struct lock_class_key commit_lock_keys[MAX_CRTCS];
 	unsigned pending_crtc_mask;
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 };
@@ -167,11 +166,8 @@ static inline int msm_kms_init(struct msm_kms *kms,
 {
 	unsigned i, ret;
 
-	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
-		lockdep_register_key(&kms->commit_lock_keys[i]);
-		__mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
-			     &kms->commit_lock_keys[i]);
-	}
+	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
+		mutex_init(&kms->commit_lock[i]);
 
 	kms->funcs = funcs;
 

base-commit: 182b4a2d251305201b6f9cae29067f7112f05835
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
