Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC1B465934
	for <lists+freedreno@lfdr.de>; Wed,  1 Dec 2021 23:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2A96E933;
	Wed,  1 Dec 2021 22:26:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5626E5A1
 for <freedreno@lists.freedesktop.org>; Wed,  1 Dec 2021 22:26:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id m12so12933251ljj.6
 for <freedreno@lists.freedesktop.org>; Wed, 01 Dec 2021 14:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJdNyjaCPbt0SX5JXfaq3vc4wNX+Lqbrq4BbSv0o6ck=;
 b=gRsXariZ+vA4q+zfrI7GwlR5hsOVobuQjJde3sOr+LExlL97lCDlsMjqtPDLpQr4V1
 IZpV7cO55ckE5qQKTfZd7I+t9zZEKxHx8P11+L8w3vu+UvYCF/i6oNgO4ghlr9KupX4d
 CnjG1ZAd0YNqHI6pW8M17W8Jqv2F7wqZ7b557/5tkNasuQf8mE/6AtrQzWQpD77GzZHV
 aqFWrB/W8APB4DEDUp2VY6PWmadSFuT4x2skWtVkF4kjCuxN8sw3LJiYGxjnxGpyMtxw
 rP828lszpIPbT/mYGxbCYK/cBOU90LFbxbSkA66lJ1ZrxzOD+Y8/LDuMw+ZzTBD7Dl48
 6uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJdNyjaCPbt0SX5JXfaq3vc4wNX+Lqbrq4BbSv0o6ck=;
 b=bsmYRMBe5WAje9w4xcISpH1skN9+dX6rntB5e47GZSO24CgNU2M7qPRVzXdv9oTIVW
 Qqg+WcmrbWPES0WBG3Wr43hWP0ZW9+ISx2MZGP2OMbC4tboBTc8A7e0NR7YtZ2rhdEFH
 qGvoHAiA+Lc16tZP9tjtPnoB7023KQhJqRY/+ZScW4MhiWOaNw8GeqTm+SjDBbKX80zA
 41yDm2ZGJzRQpytpOymf6p0aB02s4Z8/gYxEdf6rFEW6txB7N5g+4swRvrd+fA9YLRju
 7oNEgGsNyWJ3x9OKJ/X9tWZ6gZtLyj2G9nF3EieceZZTL9jXAIGt3chqpErChmxcyzOZ
 oG1Q==
X-Gm-Message-State: AOAM5336eJ48VEBQnfI1qGaebaDGzHd8ZkrJ5YYvRUXSTpoNlvjN8YZz
 Ek6coASDa5DH1IxkqVTlzEuHFQ==
X-Google-Smtp-Source: ABdhPJys5yzDwH0LJnm7duSIbsZsGK4mv5NuOVsCs78pmcT4r7e6K8kelf5WuhyuHVoGPHW+hHMgJw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id
 z15mr7974458ljo.30.1638397600784; 
 Wed, 01 Dec 2021 14:26:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:26:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  2 Dec 2021 01:26:31 +0300
Message-Id: <20211201222633.2476780-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 6/8] drm/msm/dpu: stop manually removing
 debugfs files for the DPU CRTC
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DRM code handles removing all debugfs recursively. Drop CRTC-specific
code to perform that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  3 ---
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d290809d59bd..9899f7424131 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1424,15 +1424,16 @@ DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
 static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
+	struct dentry *debugfs_root;
 
-	dpu_crtc->debugfs_root = debugfs_create_dir(dpu_crtc->name,
+	debugfs_root = debugfs_create_dir(dpu_crtc->name,
 			crtc->dev->primary->debugfs_root);
 
 	debugfs_create_file("status", 0400,
-			dpu_crtc->debugfs_root,
+			debugfs_root,
 			dpu_crtc, &_dpu_debugfs_status_fops);
 	debugfs_create_file("state", 0600,
-			dpu_crtc->debugfs_root,
+			debugfs_root,
 			&dpu_crtc->base,
 			&dpu_crtc_debugfs_state_fops);
 
@@ -1450,13 +1451,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
 	return _dpu_crtc_init_debugfs(crtc);
 }
 
-static void dpu_crtc_early_unregister(struct drm_crtc *crtc)
-{
-	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-
-	debugfs_remove_recursive(dpu_crtc->debugfs_root);
-}
-
 static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.destroy = dpu_crtc_destroy,
@@ -1465,7 +1459,6 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
 	.atomic_destroy_state = dpu_crtc_destroy_state,
 	.late_register = dpu_crtc_late_register,
-	.early_unregister = dpu_crtc_early_unregister,
 	.verify_crc_source = dpu_crtc_verify_crc_source,
 	.set_crc_source = dpu_crtc_set_crc_source,
 	.enable_vblank  = msm_crtc_enable_vblank,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 4328e133d71c..b8785c394fcc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -129,7 +129,6 @@ struct dpu_crtc_frame_event {
  * @drm_requested_vblank : Whether vblanks have been enabled in the encoder
  * @property_info : Opaque structure for generic property support
  * @property_defaults : Array of default values for generic property support
- * @debugfs_root  : Parent of debugfs node
  * @vblank_cb_count : count of vblank callback since last reset
  * @play_count    : frame count between crtc enable and disable
  * @vblank_cb_time  : ktime at vblank count reset
@@ -160,8 +159,6 @@ struct dpu_crtc {
 	struct drm_pending_vblank_event *event;
 	u32 vsync_count;
 
-	struct dentry *debugfs_root;
-
 	u32 vblank_cb_count;
 	u64 play_count;
 	ktime_t vblank_cb_time;
-- 
2.33.0

