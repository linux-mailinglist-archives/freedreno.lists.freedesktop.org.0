Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBD84F4812
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 01:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4688E10EC6C;
	Tue,  5 Apr 2022 23:45:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9142E10EB2C
 for <freedreno@lists.freedesktop.org>; Tue,  5 Apr 2022 23:45:55 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q68so1077234ljb.3
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 16:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Iqbt8lWWr5PzRARKZi/p/Y11hVS9kTb+tshjhqgJ7E=;
 b=wRW6uTvNQyhoC+8+zMwMBjUsGSemFwkaIJ8xaNBFrridKcCvtpLpQyKrjQi92H0RXs
 1D/QOTXmnzYeouRzogg5XhCE2NbolhKi7R5bnxy0vwps03S5Kw6INRd3FQJNmj01+qPz
 xauU8d/5fQNStJjmZafsoSV03V45G4aKtm3lWT4i/jYtKvl9TDeSnsP9arkpL4sZm3a5
 847El/elkSrnN4m36pMvypC4m362PwtvyUhNsxl+pRqclq/77+e0knH7z6rF3T7L0Gyh
 PcQMS8E6R8iKI4SvjktmVpngyc9yrfgZA7SoDx3dX7mepxwHdlYbPNfer0R3yXioZ5DV
 QFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Iqbt8lWWr5PzRARKZi/p/Y11hVS9kTb+tshjhqgJ7E=;
 b=NLdajrh5QiK/p6QTcuKfsIOOhc7psPVhunl7Apa4KmDETe7ggCarv8BES7UFUrhsjH
 frBkR4ubAq+FYq0JvWKKQFt1TNasFuaTyCCh4P9F3YEqJLjwvUmG924N8WSGGC+3IsMr
 YOeIJuQGjoDdI1XOp7s1uUWGkZcdKt1V+R5Tn4Yw02roRpchGEdHTkSvVwtbhPBNNsr0
 cNexlbVPywSPv38ZzpJdS/ep1SP/LV95GIWDLCB3thXvJ5VFzZNU3bOD7oxsTDl5NwJE
 8KJmGb/Ip0xNQv+uG22Q3K/pn69IdTfdv/tNBd9mhb+zTmmYd1rAl55MenaMZe8JAw/m
 gVPg==
X-Gm-Message-State: AOAM531LSz8ZbZZbQ2a/EyxcBccnHzsYbp+gMgcST0Zo52c5+MfaIlYt
 jZDQTsNXtJXES3c/RQPX66xMuw==
X-Google-Smtp-Source: ABdhPJw4ndQZB0hZbehYl/6rPiUUMMPM2zRus59KEaw1GkIplzOXt3oANnF+9oTn3gbdRdhjTxezXw==
X-Received: by 2002:a2e:b88b:0:b0:249:a45a:b9a3 with SMTP id
 r11-20020a2eb88b000000b00249a45ab9a3mr3670215ljp.48.1649202353964; 
 Tue, 05 Apr 2022 16:45:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:45:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 02:45:49 +0300
Message-Id: <20220405234551.359453-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/4] drm/msm/dsi: properly add and remove
 created bridges
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

Add calls to drm_bridge_add()/drm_bridge_remove() for the internal DSI
bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 0c1b7dde377c..918498e71255 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -665,6 +665,8 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
+	drm_bridge_add(bridge);
+
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
 		goto fail;
@@ -735,6 +737,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
 {
+	drm_bridge_remove(bridge);
 }
 
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
-- 
2.35.1

