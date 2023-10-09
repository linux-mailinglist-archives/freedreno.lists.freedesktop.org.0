Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8407BEC1B
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 22:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B985F10E1AE;
	Mon,  9 Oct 2023 20:57:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BCB10E1AA
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 20:57:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-503065c4b25so6585476e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885051; x=1697489851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mRCiNMZCeM+Ar6Xq8Rd6MAb4ZZFbkMJC2m2U/eGMOM=;
 b=hAXrsTxyqkbaWwqlrxw1FxDVPjcynV2A6waENgk4FMYLuWtbOk7GVpEGx4yqkAlysc
 d+noYdn9MYYhMMP8P9D7RXnsQm0LEvsq+AbvGpvdp3R8sfohbyb3+QXXG5ffHcoZev/R
 rKgZHVKyjk9UdPpHDPbJUMSp3KFkmJaZb9CQlOJd5yAIb87IoGQXDBH+D2aU4TDXik2u
 97KiFVomicDA/WtgKtDSehnr7YawMhjoMv4LOqV5OS1FXCMme/xapmYBQVAyeUx7mcbQ
 Nd4T12+LiAayqqwEu19t3tWNJs0sSL0024g5aUh2efU/dElZJ+bI0VLR42X4CFlrv1mR
 iE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885051; x=1697489851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mRCiNMZCeM+Ar6Xq8Rd6MAb4ZZFbkMJC2m2U/eGMOM=;
 b=D7Td12Ycligs6KMX7Zj516gWcyC+zAvq7AkJ6ddxno4YppfyroOSUQGbD2z4+MKFuw
 i/qY39hx1KBs0KPGOHhwnRHxM/6kJHebUA5ef7sWECb0apady2D1yTUnGYHmB1DJBfig
 1PvIzwTgQF8i00CjjT4U7p9MJClu1SECU04wwvOCfKYyi36+YLajkf8IGAhh9CEE+Qyq
 lv1W0pB/oMtPuNQ//FelonkPG861Lcd8rsrtS2z11dWkBYLuilcrQ+4FXeXrz98S1oNP
 8GS1zh+dbTHWHQUWwL+l7hw7ZwP8n9ZtfL1kD7RJkPB7xMoaTOb1shgCY5GY3aEifWgW
 pBxg==
X-Gm-Message-State: AOJu0YzPX0AhVSp4XFg6KKo4Hgp2FJKVFjia4gl79yqNC+Pum8U8j73F
 X9kS1GVTsa2FY/tTvSZc0FEv8Q==
X-Google-Smtp-Source: AGHT+IFU7X41OGXzJD9SvazQZs/emXDkqZ6yVTu4T54nQhn3J7EF1X9dwl5ts7ONPF9ntJ0mSqjYQg==
X-Received: by 2002:a05:6512:3993:b0:503:15a5:b368 with SMTP id
 j19-20020a056512399300b0050315a5b368mr14955585lfu.16.1696885050980; 
 Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 23:57:24 +0300
Message-Id: <20231009205727.2781802-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/5] drm/msm/dsi: drop
 msm_dsi_device_connected() function
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

Since the commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order") the
DSI hosts are not bound through the component framework if the DSI
driver wasn't attached to the DSI device connected to this host.

Afterwards, if there is no bridge (including the panel bridge) created
for the DSI device then devm_drm_of_get_bridge() will return an error,
also making msm_dsi_manager_ext_bridge_init() and thus DSI modesetting
init fail.

This way there can be no 'unconnected' MSM DSI bridges. Remove the
msm_dsi_device_connected() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         | 6 ------
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 269975002b95..b7edcb7b3ddc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -61,12 +61,6 @@ int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_tpg_enable(void);
 
-/* msm dsi */
-static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
-{
-	return msm_dsi->external_bridge;
-}
-
 /* dsi host */
 struct msm_dsi_host;
 int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 59f4728fc772..af840a1e9fc0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -305,8 +305,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	int ret;
 
 	DBG("id=%d", id);
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
 
 	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
@@ -364,9 +362,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 
 	DBG("id=%d", id);
 
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
-
 	/*
 	 * Do nothing with the host if it is slave-DSI in case of bonded DSI.
 	 * It is safe to call dsi_mgr_phy_disable() here because a single PHY
-- 
2.39.2

