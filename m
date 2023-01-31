Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE03683944
	for <lists+freedreno@lfdr.de>; Tue, 31 Jan 2023 23:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F138A10E2BA;
	Tue, 31 Jan 2023 22:22:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632A110E2BA
 for <freedreno@lists.freedesktop.org>; Tue, 31 Jan 2023 22:22:18 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso90566pjb.4
 for <freedreno@lists.freedesktop.org>; Tue, 31 Jan 2023 14:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nDJfgGY2Uq4pkbdaiIQ1ONvu1Aumpm8UVU5btqep3hU=;
 b=C//XxpbCdZukvZqKglW8c6wuEVing1SDTbUUogS/ymch/qoW0vbXqPjsij+7C39bKM
 cz2v/jqa/PU4i47Iz53rPk2Vw3mNsCvZevPClswFn03twuQH9OPEeoCTzI0WxPUHRVN+
 yilQTQAnqMoG4QmPIPzwSaV9MSqokzOW+hEIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nDJfgGY2Uq4pkbdaiIQ1ONvu1Aumpm8UVU5btqep3hU=;
 b=IawRPCq4GdKVONt9h5/77944tB0h52lueVBw9+o2XWNvnIPoXDYoZU4OZEMtTaihpZ
 7QyfCgpF5iF+Dzmk5atlJP6a95DCjIRR6QCZjIF8BNU2fhMbzuMboW7R/eeclKu3zCv1
 r73nFJn4hJlyo/xfb/HnY+FyV54DLMdVQlV9QsEEy9A05fyZQW/wGcbMOX6UrnJUkYBG
 kpBqsoj1xu/8n0QSjNAEsl6pwAFpSM9OV4CQbEhWX1DWzybO52OgB6nKn+JdvUBidVe8
 eonCCeyPPkWkV6DjglT8DnIbgwNG5ibmMF87O7YeRDnz5ZxwUeAXqddZjzBU4rdk6nKM
 jBnQ==
X-Gm-Message-State: AO0yUKVZQ9qCT9NKP4g8PwTbkmOu3V1HSWjH1LCkGkVM6d1np97I8IcM
 J+RbQRq2yeG4sQqi1gAZUQoPnA==
X-Google-Smtp-Source: AK7set9E0fDgYOMAjwM1gzKlM6zWrGLc2FbOBfwbJBwFkBrg9zJem7/LBAqKEjhYlOZ3sKIlqEM0TA==
X-Received: by 2002:a17:903:138c:b0:192:d625:ecc4 with SMTP id
 jx12-20020a170903138c00b00192d625ecc4mr495493plb.18.1675203738010; 
 Tue, 31 Jan 2023 14:22:18 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:138e:73d3:502:64f])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0019339f3368asm10377471plh.3.2023.01.31.14.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 14:22:17 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Jan 2023 14:18:24 -0800
Message-Id: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFT PATCH v2 1/3] drm/bridge: tc358762: Set
 pre_enable_prev_first
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
Cc: freedreno@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
order"). This should allow us to revert commit ec7981e6c614
("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
time").

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/tc358762.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 0b6a28436885..77f7f7f54757 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.39.1.456.gfc5497dd1b-goog

