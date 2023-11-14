Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8407EBA15
	for <lists+freedreno@lfdr.de>; Wed, 15 Nov 2023 00:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D401F10E409;
	Tue, 14 Nov 2023 23:00:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8710E4E4
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 23:00:48 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-46263d50b29so89231137.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 15:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700002847; x=1700607647; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YR/mkTlXJRgIJS/EJMZQRz4ww5S2W5Npa8fLQfW52YM=;
 b=IwT/9jn/dhF+WDrtmcTwKNaQczreaUADV7nNS70BY6ikvuY6LVPKCxDrAEYurVOb94
 LXAdZR8E7fl8c3WBd2RPFDUbEF25hK0VVw/fxbxZS/uS1LJEelFFghtEw6qw5D505ZsM
 G++LQI3iayFJWnLLqt3kgkyR2MRfhz3OE+nvmgc/kfbWRpCaq3kW9alF/MWMb5ytr6Xd
 ZK8zswq4DZ+mvB+uzyj5J3f5C/6C4dXzJdD8mFI4A2pXqWkxghECeu/9wqIemPVDSfw/
 ey5eAxKPHBdVoOYNGYq2s5mW/jtUcjXDGUn6KD+Akk1jPraLs0T0zPJ9RZ7qvhEwVIz2
 sgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700002847; x=1700607647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YR/mkTlXJRgIJS/EJMZQRz4ww5S2W5Npa8fLQfW52YM=;
 b=pL1edrXkE4ydcokj38/YVK/Qk8i7TCSyU6fK2WdBsbcIBteCV3nzzMkU1MlOvqCTqo
 IIbGWft0z0xdPGNVjt22j4hfOSI2IWKfKRUpp3/YX0m/HAUO/7hxyF277oAEQd2wNQ5S
 bwYydj6eqh4Ukuvsfve7Y9a84B4wmHnW9l66xRngIP/5/DKY1eaVBW+3SHcBrLJfi3QG
 /ClHRLVWzI3UaOYqeAuzYxZrTFovo6vETUVfFjVbq/VeLD3p+7uOG+Mu13ArIMH4sh41
 N+yGazUS+OC8Z+sxtaBnobQNEmelkztoxH/WK0/eVV8WiBtP/d12VyOT1ya5XWbBckdz
 1mUA==
X-Gm-Message-State: AOJu0YwpSYYlPD6dS6s/5rNlRIpUqXGbQ08Bki1qpTipb0k22NA9dSUq
 GScaWlrlAlA4FjzkyDD8sSmStIhePlcd1MnCOS0=
X-Google-Smtp-Source: AGHT+IGEipMZ0wWdCFEW37YaqFstmZB087eBM8BroWKdjsRAujSSep+py5so9+Y1GvtCk8GaGlxZ6A==
X-Received: by 2002:a67:e002:0:b0:45d:8f83:e10f with SMTP id
 c2-20020a67e002000000b0045d8f83e10fmr10524052vsl.4.1700002847082; 
 Tue, 14 Nov 2023 15:00:47 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 15:00:46 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue, 14 Nov 2023 17:58:34 -0500
Message-Id: <20231114225857.19702-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114225857.19702-1-jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 6/6] drm/msm/dsi: fix DSC for the bonded DSI
 case
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
Cc: David Airlie <airlied@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

For the bonded DSI case, DSC pic_width and timing calculations should use
the width of a single panel instead of the total combined width.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 20 +++++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  2 +-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 28379b1af63f..3a641e69447c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -93,7 +93,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
 enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode);
+					    const struct drm_display_mode *mode,
+					    bool is_bonded_dsi);
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 892a463a7e03..cf06736e5a60 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -940,8 +940,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			       mode->hdisplay, mode->vdisplay);
 			return;
 		}
-
-		dsc->pic_width = mode->hdisplay;
+		dsc->pic_width = hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
@@ -952,6 +951,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
+		if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
+			dsi_update_dsc_timing(msm_host, false, hdisplay);
+		else
+			dsi_update_dsc_timing(msm_host, true, hdisplay);
+
 		/* Divide the display by 3 but keep back/font porch and
 		 * pulse width same
 		 */
@@ -968,9 +972,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	}
 
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		if (msm_host->dsc)
-			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
-
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
 			DSI_ACTIVE_H_START(ha_start) |
 			DSI_ACTIVE_H_END(ha_end));
@@ -989,9 +990,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
-		if (msm_host->dsc)
-			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
-
 		/* image data and 1 byte write_memory_start cmd */
 		if (!msm_host->dsc)
 			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
@@ -2479,7 +2477,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 }
 
 enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode)
+					    const struct drm_display_mode *mode,
+					    bool is_bonded_dsi)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	struct drm_dsc_config *dsc = msm_host->dsc;
@@ -2489,6 +2488,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 	if (!msm_host->dsc)
 		return MODE_OK;
 
+	if (is_bonded_dsi)
+		pic_width = mode->hdisplay / 2;
+
 	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
 		       pic_width, dsc->slice_width);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 896f369fdd53..2ca1a7ca3659 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -455,7 +455,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_ERROR;
 	}
 
-	return msm_dsi_host_check_dsc(host, mode);
+	return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
 }
 
 static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
-- 
2.26.1

