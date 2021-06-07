Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0C439E927
	for <lists+freedreno@lfdr.de>; Mon,  7 Jun 2021 23:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D256EA27;
	Mon,  7 Jun 2021 21:39:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51E86EA27
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jun 2021 21:39:11 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id c11so24199532ljd.6
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jun 2021 14:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8CKvwSQLjjj+5EJDA8ATWx2yaOhMI1EEsNUtEuV8bk=;
 b=EE8BrWdnOfaSRktSGtAbHGRjUb/zfSuaXZNayvdpAMV6+DhBqv7HwiJZ0qtfYNTipo
 lUc1kkM4MrYxw1Unia3/QlQHLVsp7W2Ei8iqe4/yzsfmKBtaWgEabb57y5gDrGw2jm92
 hDCA6mfDG9VTnyL/IBIHWRuJRfu/0eL2bQUuypQ2OsMoh67O4c+Z1AdM9IDmn48oXrfS
 3ZH5HeNa1Qz1koFEd+YVMvYjQJEw5tToGmVQIOPYbDhABy0MtXqGMKcyfCeoxlI+uXBz
 f1ea1+X7+bWPSZla4TFXywzmTYkDMi1Sk/G4JkL44zsIi5c4+9Gtv/MVafOuGuA3DiU/
 5y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u8CKvwSQLjjj+5EJDA8ATWx2yaOhMI1EEsNUtEuV8bk=;
 b=DxobLxsUR1zAOQCjWlF14nhVklJqTSlhVeXMJANDviQV+9ijqoRAX6AiaisQ/nSitJ
 j2KUMLcOeivR73FtTDF23Lj0DeFkYa8rSb90UvC+MpsqVu21EsMtYqjQHqUTykFJwnpD
 i+jTnz+o9LSBpesvwnOO5icfwhy6ae6bCA8bottcUvv6h8vFXYcOee3Q3HTrXgDxFZ4K
 yM9GNvVF76zcHNE1Mf+QlamsIfpoAthCyGr9520qcDLO3oFln9XD87wbDpYhrL4eaNMn
 /asCysD9KPIgnvp+3EGcFfCT72bm6rBCZdWvYCJDuerf2uwCdSJIJReZKkM57SAfdyr3
 78lA==
X-Gm-Message-State: AOAM533Mo1yLQ/7IDqfj7hChNQURVzGa2A5m1JrzMrjBDgo8T+i7rox8
 kU/nEP/9PFZ27+7B0h+x8aO88w==
X-Google-Smtp-Source: ABdhPJxopuAC3ib67JMkqaKVp9CX94BbYI9bARVwAKqMkZLRE+Amgp4fyqCYVPbLrcOGlFPzfAvW3Q==
X-Received: by 2002:a05:651c:38b:: with SMTP id
 e11mr15788576ljp.198.1623101950184; 
 Mon, 07 Jun 2021 14:39:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h22sm688111ljk.133.2021.06.07.14.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 14:39:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue,  8 Jun 2021 00:39:09 +0300
Message-Id: <20210607213909.2186556-1-dmitry.baryshkov@linaro.org>
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
index cc18ea2b244c..d77693904a15 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -374,14 +374,14 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
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
 	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_dual_dsi, msm_dsi->phy);
 	if (ret) {
 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
