Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AD3A1EA4
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 23:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A35B6E23B;
	Wed,  9 Jun 2021 21:12:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A556E151
 for <freedreno@lists.freedesktop.org>; Wed,  9 Jun 2021 21:12:14 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z22so1659204ljh.8
 for <freedreno@lists.freedesktop.org>; Wed, 09 Jun 2021 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ts8DwiaDqPOs2OwdpZWZvH9efpSW/cfgQfXfr2VJnsY=;
 b=qB6efk8WElbeGE4xkHwIJoJRj6pWdF2CQRTPayPhe7XJlXaCsGpankVzP4BGpJ/kcH
 NJux/CPKhxHQ4qbPoVUClT6qO6qA9hid44j8x8MJu9bk6UvEqJg1c/j83GzyDeHo4TOz
 2frDpgoEU2XMktH5vaLeLPGv5Y+vs5nAZTJGqfE8q2YraucJNTgea/79IhX0L6KoINC5
 IiagOx74PxGjqwkH4YVjJu9tmOvDlTAi2dvQDZg9HrCSO3u5jf81lF7IGot/rFV1Y2qJ
 Di26JKunUoKcbdDOlILJFLWCK0Nx3oRrDZwgTDh4sR5ornwiProFxFbS5pR66cOAQ+40
 BUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ts8DwiaDqPOs2OwdpZWZvH9efpSW/cfgQfXfr2VJnsY=;
 b=CyOs+jR2eBD8jzW5YNa7vTzByBJYTuE1COv5CDNj9o/o6n5xYD/2TfC2V1OX1U0Xmk
 gbafT6vdtJJ3RQpynOAAu0F0qu+eJmp+fRQ8ZSpb8JIfFssrygDim0xBPTB41zMjDKEt
 ZbL1yt0K58uCTLV10YdrJ2SrbwcEoHWKTjK/TpsF9cAB8lRKnxkc5JnQP3qFU9OYkta8
 M5TvV1twobJSbP11pxSZeZcAm4+/wbDi3JZp/Sz/feaOZRVWPQULNiB4P3fu61uFuFub
 Hvrw+UJesEp3brG14xvsvWJyPDBd2BHvl1vHbkLE535VqoOfG/lBeF6dq4UY5/v5rHiv
 MFQw==
X-Gm-Message-State: AOAM531Hr0q9W8JOlOu23eL0QUGmEU3GoAR9UQ/alH5vkFQnxWa/CsZJ
 vg+eC2KWHTIsdXkPk1GKSXMG6w==
X-Google-Smtp-Source: ABdhPJxfRYXQjSzaFokCrJrThcfusHj/YwvYPxQ0C2/I6g+9g2UmLnKTBe+UUgUB8fatAO0nyvtKQg==
X-Received: by 2002:a05:651c:2113:: with SMTP id
 a19mr579037ljq.431.1623273133115; 
 Wed, 09 Jun 2021 14:12:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k24sm93130lji.76.2021.06.09.14.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:12:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 10 Jun 2021 00:12:11 +0300
Message-Id: <20210609211211.2561090-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi: do not enable PHYs when called for
 the slave DSI interface
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

Move the call to dsi_mgr_phy_enable after checking whether the DSI
interface is slave, so that PHY enablement happens together with the
host enablement.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cd016576e8c5..9243edada9ba 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -373,14 +373,14 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (!msm_dsi_device_connected(msm_dsi))
 		return;
 
-	ret = dsi_mgr_phy_enable(id, phy_shared_timings);
-	if (ret)
-		goto phy_en_fail;
-
 	/* Do nothing with the host if it is slave-DSI in case of dual DSI */
 	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
+	ret = dsi_mgr_phy_enable(id, phy_shared_timings);
+	if (ret)
+		goto phy_en_fail;
+
 	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_dual_dsi);
 	if (ret) {
 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
