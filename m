Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E0393881
	for <lists+freedreno@lfdr.de>; Fri, 28 May 2021 00:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3486E0F1;
	Thu, 27 May 2021 22:03:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8917E6E0F1
 for <freedreno@lists.freedesktop.org>; Thu, 27 May 2021 22:03:33 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b26so2308106lfq.4
 for <freedreno@lists.freedesktop.org>; Thu, 27 May 2021 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2FMXmqOYVBO9+wFKj80xIXzCv9cq/mWbBoWznbYoVQ=;
 b=Se4zlNj9CjTtjHRXf23jz/kQmtFW2Sg9rXQ95SfIU/eLELFLvLu0FjEDsy8CZAUizo
 qeRxrWhVMCCjFRKGIc1oV6SoldDNhDnskD4QAOJTmQOreOSuBeu2Ml3jhrQuvAtbn5fW
 d5J8ln2kd+z7TmoGOcezG2KUidfV/z8JbC19Ngod6FQTZAb4pok+tEAtebggLOdb2P9e
 ekRv6FVuOt/enZirsxFgGi844F9ruuOTUzRhDqovxTVUVEYLh8Kb02Q5aOKILdR+rfqS
 G53qLzT2GQUtSim8o+t5hF9Klju2WvUX8DQJLsV+mQj1YrlXV45+qj4k8QYzwpIaTsBy
 DzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2FMXmqOYVBO9+wFKj80xIXzCv9cq/mWbBoWznbYoVQ=;
 b=NCB6wua5iIJMYTaEZfnAXeJfYKtm439F+m2YIYEPz9kCiMzjHT1Zt3ZJoJDZBYN7Df
 WUAQKcjOqlCoZIO6ySFdE3QfQ8koDUmBAtKgMspL/+nDKaZJmDmPHySFBAS/+3vUI777
 jPAusrC/SR60QgRC+QyXc9dMg9isaAogjl5LpDlEwzVISe4YO4Hn6Gcvqzkpkznqet/I
 1fm4XFlcTXf5K4QvK/Zw6ubVKkbjFli79CPD6P17mFhKGt+SzHp4J13Unk15cDIxvnPA
 O5hLgUCx+bmHa+bUehvJ+hNGpoBeS2xZNc7ajxzb7dvY1a6J7ZpVkB+Ex8j4NcRclsy2
 vxhg==
X-Gm-Message-State: AOAM5331iP5kIPUt8ek7QjkBhc6XGyM8cmD8U0qAxRmHO1vKU37AA6lJ
 H7gDzOgKD1Gxi8keHNB2PWS5IQ==
X-Google-Smtp-Source: ABdhPJxh5y9hRAa3nCC+HCO2Xo//EOj94ljU4Kx9n4BlCJyA1o93MMclgoLN9dTd0QgdeHkawmwDMw==
X-Received: by 2002:a05:6512:3c96:: with SMTP id
 h22mr3799949lfv.426.1622153011543; 
 Thu, 27 May 2021 15:03:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i25sm98403lfl.212.2021.05.27.15.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 15:03:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Fri, 28 May 2021 01:03:30 +0300
Message-Id: <20210527220330.3364716-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: fix display snapshotting if DP or DSI
 is disabled
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
Cc: kernel test robot <lkp@intel.com>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix following warnings generated when either DP or DSI support is
disabled:

drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:141:3: error: implicit declaration of function 'msm_dp_snapshot'; did you mean 'msm_dsi_snapshot'? [-Werror=implicit-function-declaration]

drivers/gpu/drm/msm/msm_kms.h:127:26: warning: 'struct msm_disp_state' declared inside parameter list will not be visible outside of this definition or declaration
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:867:21: error: initialization of 'void (*)(struct msm_disp_state *, struct msm_kms *)' from incompatible pointer type 'void (*)(struct msm_disp_state *, struct msm_kms *)' [-Werror=incompatible-pointer-types]
drivers/gpu/drm/msm/dsi/dsi.h:94:30: warning: 'struct msm_disp_state' declared inside parameter list will not be visible outside of this definition or declaration

Reported-by: kernel test robot <lkp@intel.com>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Fixes: 1c3b7ac1a71d ("drm/msm: pass dump state as a function argument")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h |  1 -
 drivers/gpu/drm/msm/dsi/dsi.h                |  2 --
 drivers/gpu/drm/msm/msm_drv.h                | 12 +++++++++++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index c6174a366095..c92a9508c8d3 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -27,7 +27,6 @@
 #include <linux/devcoredump.h>
 #include <stdarg.h>
 #include "msm_kms.h"
-#include "dsi.h"
 
 #define MSM_DISP_SNAPSHOT_MAX_BLKS		10
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index cea73f9c4be9..9b8e9b07eced 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -91,8 +91,6 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 	return msm_dsi->panel || msm_dsi->external_bridge;
 }
 
-void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
-
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 
 /* dsi host */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c33fc1293789..ba60bf6f124c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -43,6 +43,7 @@ struct msm_gem_submit;
 struct msm_fence_context;
 struct msm_gem_address_space;
 struct msm_gem_vma;
+struct msm_disp_state;
 
 #define MAX_CRTCS      8
 #define MAX_PLANES     20
@@ -340,6 +341,8 @@ void __init msm_dsi_register(void);
 void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder);
+void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
+
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -353,6 +356,10 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
 {
 	return -EINVAL;
 }
+static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
+{
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP
@@ -367,7 +374,6 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
-struct msm_disp_state;
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
@@ -412,6 +418,10 @@ static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
 }
 
+static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
+{
+}
+
 static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 		struct drm_minor *minor)
 {
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
