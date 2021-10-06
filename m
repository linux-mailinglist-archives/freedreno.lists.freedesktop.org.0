Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A17424837
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 22:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C94B6EE64;
	Wed,  6 Oct 2021 20:48:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38D76E558
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 20:48:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x27so15585105lfa.9
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 13:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R4j4McPlc/+lAeM9Wl4HLExls29kqJZ7/vF2Ck1kcqA=;
 b=E2FXwHy8vYhenDZFy+97/bSDcaYarSzPGF4sKDxUKKPWqdg5Tns39SAxX794DM65P8
 HcAl5sl3nnD40tEvkP9CRBxm9xNOv9W5DH6Z+iYtMnED+gg6acg7JwcrTHePZpOHFzNJ
 nTFURiSbmPdimg/Ukm00wyj2NOUfqk2ZdY1RRWENhfUKOcCUpZlMnJOcb5024ypR8vWj
 jAZKQ8h4kUY/GJEZezMmoYJCq12mLXHy+Zve0eDTz6dTKFabySzxDORciw9MmK/tGo0/
 06zLs98mKrC8GuP9KgEXA4kpRxyJ462SJWPtaRfkFmyT39NfZhcc6uLU6b9IfStCH9HA
 /wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R4j4McPlc/+lAeM9Wl4HLExls29kqJZ7/vF2Ck1kcqA=;
 b=bNkBmAPeyzmMWphGG4XUeb1qLUeJn4EXfvq5tM5xu/yx1cSejMQyiOCrzngZAG1Qj2
 /CePAgN0yfGgTq9jRPkHwqFGaWzqJOMiUGly/kcESUj1Vu6d1r9qW9g5GOs71fU0T9p/
 2BhgwqfBxpl0NBSNyAZJvY7XLBOgGCw/gQiow+H/FGiiwdzuDvCafkyv43bNMdeZUFT3
 Bg95ssob0rwGnW0TmJsuNgYJ3OGjBuLMPmjc4M3h5m+FKR2q68TlLU9XZCkBrgBN8/+Y
 WrHYk4sMRXpSETRlSPcecCnRVLQi/WlGVxGAe73nEZkcUxbvo5ajlOAd4cV/a54qx5Tm
 +BTg==
X-Gm-Message-State: AOAM53055pBPv8MUOiF+sPqXS13P5Ri6f2BDNWJOs4Ux9jvBD0cBPj1N
 nZ+Ukjpg+6F2Spym7t/JDBAAMQ==
X-Google-Smtp-Source: ABdhPJwpskYvbnXFarxIr/6JKRf3qn0rHbCDumnq9HTNk2sRM5W2ywQqg1tBs2thLAAZtvu4S3Ejng==
X-Received: by 2002:a2e:7203:: with SMTP id n3mr229653ljc.195.1633553310086;
 Wed, 06 Oct 2021 13:48:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y19sm2378787ljc.116.2021.10.06.13.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:48:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Wed,  6 Oct 2021 23:48:27 +0300
Message-Id: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/msm/dsi: untangle cphy setting from the
 src pll setting
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

Move DPHY/CPHY setting from msm_dsi_host_set_src_pll() to new function
msm_dsi_host_set_phy_mode().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 8 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index b50db91cb8a7..7dfb6d198ca9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -118,6 +118,8 @@ unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
+void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
+			struct msm_dsi_phy *src_phy);
 int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
 			struct msm_dsi_phy *src_phy);
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..1ffcd0577e99 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2224,6 +2224,14 @@ void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
 	wmb();
 }
 
+void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
+	struct msm_dsi_phy *src_phy)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	msm_host->cphy_mode = src_phy->cphy_mode;
+}
+
 int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
 	struct msm_dsi_phy *src_phy)
 {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index c41d39f5b7cf..49a0a0841487 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -77,6 +77,7 @@ static int dsi_mgr_setup_components(int id)
 			return ret;
 
 		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
+		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
 		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
 	} else if (!other_dsi) {
 		ret = 0;
@@ -104,6 +105,8 @@ static int dsi_mgr_setup_components(int id)
 					MSM_DSI_PHY_MASTER);
 		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
 					MSM_DSI_PHY_SLAVE);
+		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
+		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
 		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
 		if (ret)
 			return ret;
-- 
2.33.0

