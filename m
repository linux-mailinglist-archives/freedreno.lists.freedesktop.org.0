Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2354B9745
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 04:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1DF10E78E;
	Thu, 17 Feb 2022 03:54:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F0A10E789
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 03:54:03 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id n24so6347646ljj.10
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 19:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0kyxRMMBG2gpm69Eogx/Pqcstxzhu1JTR7Us2wGmBvY=;
 b=fKV36McY3ySvJQwBRVQSuXKAstnJZQcBQRIuW05OzVCs7WnOqmkmKW4/+PbXwA18n/
 HiuJIUpyCQW87rPyh8GbIiZpfpNgXJtXBehB3MufCtb4XiQqriewEYgZXXQuKpOXq0gP
 9FFOSnSZBCb19/h5skw6QKaT8ZtdyS4Coywy7gs+htHnrsOH+YKvTHzX04ANp+I4VCcl
 vbDysr3lHt8QGupfuz5WMrMRosE0J/gLlpuKXIfMAAK+xR44Uu3pxeMKixTzm/0t78cK
 N1Kok1Zldl0FNTr4ABFP6TNhYuSUQj7BhdIaGW3HB66VgNZer7Gi1RLFzm9PIScrKeBB
 ORtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0kyxRMMBG2gpm69Eogx/Pqcstxzhu1JTR7Us2wGmBvY=;
 b=qMEvFRAKTtZh8Qj+5Af1fJWJM2aSt/LmLGH7xPv2lJ1VmfXHSxZ+RyDoXasKhh/MEj
 Ant1ZovXHcYFBmW3jIJWu+rw1HG589Ewj0BqUUW6VRDWoTvz4HsNK7Rj8Sq02jvFXzHb
 vd15f+MOy5kaD0T4sDRQe2YFv/TEGzy45c9e8dhZvGWNhO6Aedcfvb1+T9HKLBpD/2JO
 OJucD5I5ZUc2nkpLCkuysUcnyLQ8JolPbIsC25J4I3keKkIrGsAteKYV4O7+z1jDhXjC
 EZF6kFPFhZO2rOIqmmeTAbxuiBMvr+YNV2ZBe0beRdc4+oYlFehNhDgVN1MfdHwxymbI
 lvtQ==
X-Gm-Message-State: AOAM531l5NWXra651wvi3LNOe6mgnYcfhLojVm94hoTaQ16ITnFdZjUV
 b9sE9nYN55NzDz08c6m36M0cyg==
X-Google-Smtp-Source: ABdhPJwjg6TalywIhRqRrSyVrQ9fIteRP0SsmFbcNLffktdUAwVe97wMS+C2UjwtwQCFO5vOAG1Psg==
X-Received: by 2002:a05:651c:1547:b0:244:8a9b:d0a1 with SMTP id
 y7-20020a05651c154700b002448a9bd0a1mr882457ljp.53.1645070042135; 
 Wed, 16 Feb 2022 19:54:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:54:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 17 Feb 2022 06:53:53 +0300
Message-Id: <20220217035358.465904-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/7] drm/msm: move struct msm_display_info to
 dpu driver
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The msm_display_info structure is not used by the rest of msm driver, so
move it into the dpu1 (dpu_encoder.h to be precise).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index e241914a9677..ebe3944355bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -34,6 +34,24 @@ struct dpu_encoder_hw_resources {
 void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
 				  struct dpu_encoder_hw_resources *hw_res);
 
+/**
+ * struct msm_display_info - defines display properties
+ * @intf_type:          DRM_MODE_ENCODER_ type
+ * @capabilities:       Bitmask of display flags
+ * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
+ * @h_tile_instance:    Controller instance used per tile. Number of elements is
+ *                      based on num_of_h_tiles
+ * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
+ *				 used instead of panel TE in cmd mode panels
+ */
+struct msm_display_info {
+	int intf_type;
+	uint32_t capabilities;
+	uint32_t num_of_h_tiles;
+	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
+	bool is_te_using_watchdog_timer;
+};
+
 /**
  * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
  * @encoder:	encoder pointer
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6bd4e4..16f9e25ee19e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -109,24 +109,6 @@ struct msm_display_topology {
 	u32 num_dspp;
 };
 
-/**
- * struct msm_display_info - defines display properties
- * @intf_type:          DRM_MODE_ENCODER_ type
- * @capabilities:       Bitmask of display flags
- * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
- * @h_tile_instance:    Controller instance used per tile. Number of elements is
- *                      based on num_of_h_tiles
- * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
- *				 used instead of panel TE in cmd mode panels
- */
-struct msm_display_info {
-	int intf_type;
-	uint32_t capabilities;
-	uint32_t num_of_h_tiles;
-	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
-	bool is_te_using_watchdog_timer;
-};
-
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-- 
2.34.1

