Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA827BEC21
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 22:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187D910E2E8;
	Mon,  9 Oct 2023 20:57:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728FD10E1AE
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 20:57:33 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so6350082e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885051; x=1697489851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FsVPh0iTyvo+/vzHQV8VGhwEhSRLAhFjYHzI1LkCqoU=;
 b=fM+ChsuhRsUjY2UQmiSTQrn0vK/n+5IjJvaVzfsxfEa9xhCQBo9YyBciMI2EQIkVC+
 SYNevHw9SP7ieLYyXyVVS3Xt47YwIXlcJxITVe4IqEboRV2gy+teZWiThiGzWOuj3Td6
 7fKgvA1jMGYqCMQZ9o3m2ZBgdndtwQ0nje2u5YMbWJ9H+juoAX3xkUMXckZ3eSXjZ8PP
 Ty3VOV4oNX66flFvm8dFRBJi5gHmQwqHEb1jIYuxzZVgfflZ59eemxoK6riaDditBiui
 x0J5LVnr5J5r5g46p+l4rAoT7FR9lFg8axXGEPSR585cu3jVcqrnyv/EgNge3HV89KTa
 vJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885051; x=1697489851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FsVPh0iTyvo+/vzHQV8VGhwEhSRLAhFjYHzI1LkCqoU=;
 b=du+yMWTeJx5UTn56sVlHnKm5ZaBy81azO8I7qxLZMBaICkWZ3iXf7qmITfRgj/TF1X
 YIcMFjWg2QVlGMHJxaICsSLi9lypAqk7GOcex5ffS2U+NO6383ZDb18DSeRJABDRsDSs
 MsW0586Rz3RetmsRciMM+gQVwwp3vSHORmtISsFYlIYy0+N+xhsLfhd06ukMUNLS8fcV
 gJ8Xl8HnsbSw5DGLoS9wtQvPF1IyOlzpIwUJckknmKi4qYZo14dIOk5PQEi7E3WPaDY2
 zJxHyoo/eNxFMkXKiwrrSCaO82KZRm6I9zgdr5FmXRSIvo9s1zbFAUe9IxMcPM9+xbdD
 DCQQ==
X-Gm-Message-State: AOJu0YxkABZFtiOGUKoPAW7Qi47E1uuqnp1e6EsN8srFSxT+Jv7uf/hx
 RNt77TJVRQisaSvxUS6F1JYw2Q==
X-Google-Smtp-Source: AGHT+IFJGy2KJmPdttBhioSDz9qzigsu77WQDa9aMgmNBJ9OPd2PNRDZd1XwmqmSd4bs014nxx5NOQ==
X-Received: by 2002:a19:e010:0:b0:500:b74b:e53 with SMTP id
 x16-20020a19e010000000b00500b74b0e53mr12915898lfg.46.1696885051661; 
 Mon, 09 Oct 2023 13:57:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 13:57:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 23:57:25 +0300
Message-Id: <20231009205727.2781802-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/5] drm/msm/dsi: stop calling set_split_display
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since the commit 8b03ad30e314 ("drm/msm/dsi: Use one connector for dual
DSI mode"), the second DSI host in the bonded pair will not be
associated with the encoder and will not get the bridges, thus making
condition in msm_dsi_manager_set_split_display() always false.

Technically that change broke bonded DSI support in the MDP5 driver. But
since nobody complained in the last 5.5 years, it seems that nobody
cares enough.

Drop the msm_dsi_manager_set_split_display() completely and stop calling
the set_split_display() KMS callback. Also remove the
msm_dsi::external_bridge field which was only used by the mentioned
function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  5 ----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 35 ---------------------------
 2 files changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index b7edcb7b3ddc..525c7ba22227 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -38,11 +38,6 @@ struct msm_dsi {
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
 
-	/*
-	 * external_bridge connected to dsi bridge output
-	 */
-	struct drm_bridge *external_bridge;
-
 	struct device *phy_dev;
 	bool phy_enabled;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index af840a1e9fc0..8eb73287dffb 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -198,36 +198,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-static void msm_dsi_manager_set_split_display(u8 id)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
-	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	struct msm_dsi *master_dsi, *slave_dsi;
-
-	if (IS_BONDED_DSI() && !IS_MASTER_DSI_LINK(id)) {
-		master_dsi = other_dsi;
-		slave_dsi = msm_dsi;
-	} else {
-		master_dsi = msm_dsi;
-		slave_dsi = other_dsi;
-	}
-
-	if (!msm_dsi->external_bridge || !IS_BONDED_DSI())
-		return;
-
-	/*
-	 * Set split display info to kms once bonded DSI panel is connected to
-	 * both hosts.
-	 */
-	if (other_dsi && other_dsi->external_bridge && kms->funcs->set_split_display) {
-		kms->funcs->set_split_display(kms, master_dsi->encoder,
-					      slave_dsi->encoder,
-					      msm_dsi_is_cmd_mode(msm_dsi));
-	}
-}
-
 static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
@@ -504,8 +474,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 	if (IS_ERR(ext_bridge))
 		return PTR_ERR(ext_bridge);
 
-	msm_dsi->external_bridge = ext_bridge;
-
 	encoder = msm_dsi->encoder;
 
 	/*
@@ -538,9 +506,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 			return ret;
 	}
 
-	/* The pipeline is ready, ping encoders if necessary */
-	msm_dsi_manager_set_split_display(id);
-
 	return 0;
 }
 
-- 
2.39.2

