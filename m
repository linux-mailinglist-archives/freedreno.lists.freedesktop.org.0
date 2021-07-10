Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E33C3710
	for <lists+freedreno@lfdr.de>; Sun, 11 Jul 2021 00:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B516EB68;
	Sat, 10 Jul 2021 22:20:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58296EB62
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:11 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id u25so15206559ljj.11
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3wIrEQ/a/ZDjuvpPBXCzjielb0wGCcHqw0GIFindEVk=;
 b=zYYChofoXtmdsDpiClt02ZxCl0VDL4vPaotxf6rJL617xAdo9r7fnaEtO1X0mdFsyK
 Ni7Iv6VwWKIJ7mm+8aHunFln9iM32xFdFjK5E3ZVe2oNRtVtg5VTvPxA21nwK5n8aSfH
 i2wF6ySIENZjfYilOgcF5ew9qViFkfwC7ZvAVnY4sfAozPpUEJW5cnuf6eW4HENEwrXZ
 scmxX33k8Jk4XTdLq/Mbt0D2hMI20KZmeo16maAyao/u7tomP8Rjxx0/RQPjHtUP+lfE
 U5AFIKdhf9VknWBlXdgx85Xy2iCycI5OwoTRHJHWjA6P1xlcxupF2gE/WcCrBfmPP+TQ
 0Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3wIrEQ/a/ZDjuvpPBXCzjielb0wGCcHqw0GIFindEVk=;
 b=UlbT+KuVGZtEYn1CjaLwesK8XsLVJqxUx7gGENLp/TgN7Kpr4hJlCheb8BqWHZFjUZ
 8tT1IEJZYMfzCf7rQQDFwPdpJTD/Z7ucb8k1ERTSqpc9EQFc10T7vraJ49+H7EFIIoN+
 n4OSUtwgnVYB1NuMiBz1ymuu1PH9DgLLfN3Em0LVP0dSymvhGbxEiB381gJTKODyREvN
 g0meEIksGwc8PUpbcmuwjU21nmeNlePH2feLCP/OQS2HcMQkpQ3JwkowUvPLEqG0Hds0
 mX0/lEkFCmAoXUbSCF1RmwDA+oV/NYcjn4nW4cJu9zfjQux6MsinItOlF5qlGgXkvOM/
 Qfbg==
X-Gm-Message-State: AOAM533rpkSZfz+69CvVaO0V0Q8p119ZeBUrPMAqfBBpiD2lkiiPMrUZ
 MY6ShPT+jSmrTn7Fq1OGZtCnYg==
X-Google-Smtp-Source: ABdhPJy1XMXBJJUynvBe2fEjtUnM/k0ik4H55yFpH/ehOXeGEFGldvv+JEhkrlIsCxEndtdLw0jQPQ==
X-Received: by 2002:a2e:93d0:: with SMTP id p16mr3133059ljh.462.1625955610075; 
 Sat, 10 Jul 2021 15:20:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sun, 11 Jul 2021 01:20:00 +0300
Message-Id: <20210710222005.1334734-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 2/7] drm/msm/dsi: add three helper functions
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

Add three helper functions to be used by display drivers for setting up
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  7 +++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 +++++++++++--------
 drivers/gpu/drm/msm/msm_drv.h         | 17 +++++++++++++++--
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 75afc12a7b25..5201d7eb0490 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -13,6 +13,13 @@ struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
 	return msm_dsi->encoder;
 }
 
+bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
+{
+	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
+
+	return !(host_flags & MIPI_DSI_MODE_VIDEO);
+}
+
 static int dsi_get_phy(struct msm_dsi *msm_dsi)
 {
 	struct platform_device *pdev = msm_dsi->pdev;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index b20645ab279b..27d3b9ebf831 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -216,12 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-static bool dsi_mgr_is_cmd_mode(struct msm_dsi *msm_dsi)
-{
-	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
-	return !(host_flags & MIPI_DSI_MODE_VIDEO);
-}
-
 void msm_dsi_manager_setup_encoder(int id)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
@@ -231,7 +225,7 @@ void msm_dsi_manager_setup_encoder(int id)
 
 	if (encoder && kms->funcs->set_encoder_mode)
 		kms->funcs->set_encoder_mode(kms, encoder,
-					     dsi_mgr_is_cmd_mode(msm_dsi));
+					     msm_dsi_is_cmd_mode(msm_dsi));
 }
 
 static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
@@ -276,7 +270,7 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
 	if (other_dsi && other_dsi->panel && kms->funcs->set_split_display) {
 		kms->funcs->set_split_display(kms, master_dsi->encoder,
 					      slave_dsi->encoder,
-					      dsi_mgr_is_cmd_mode(msm_dsi));
+					      msm_dsi_is_cmd_mode(msm_dsi));
 	}
 
 out:
@@ -839,3 +833,12 @@ void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi)
 		msm_dsim->dsi[msm_dsi->id] = NULL;
 }
 
+bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
+{
+	return IS_BONDED_DSI();
+}
+
+bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
+{
+	return IS_MASTER_DSI_LINK(msm_dsi->id);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 1a48a709ffb3..3d331acbc94a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -350,7 +350,9 @@ void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder);
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
-
+bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
+bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
+bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -367,7 +369,18 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
 static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
 {
 }
-
+static inline bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
+static bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
+bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
+{
+	return false
+}
 #endif
 
 #ifdef CONFIG_DRM_MSM_DP
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
