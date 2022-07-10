Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4756D0D1
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 20:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DCC18A8E4;
	Sun, 10 Jul 2022 18:45:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FABC18A8DE
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 18:45:42 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id m16so3942649ljh.10
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uWwdgVhw97ycQZv8C/Sh0UEbnMAmSyLV+RkBre0LXe8=;
 b=VM59dWdakzh5XQwNICK6kXEEo+YWwiCVy9JGbP2JY5W6Y0kvU1OHuBZJBMFg2Hvce5
 c7FxYxH1HATW4UfDyk5KLRqgWx94ckF7ge1rihrl/atMrsUo2R4q8tEwC2JgOXgiGw2Z
 cuOTpgg1JRo8fStkzOMwcl1mLNHkR2YFO/yhiD0ZsyVxv/xeWD3bcge4mpFZ91SLib2V
 5tDd8W6ESihmQKkDYyxw4GERoPV4u5L+0njRB0htab1ioKOLxk8SsvwhACYGXyA8vBFs
 WqS+PcxOp2Z4LMD4tY4a7vqlMcHwa28YyNeLPuJsHuxPrqPjj9unesNAyZQrWJjG+y4S
 OXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uWwdgVhw97ycQZv8C/Sh0UEbnMAmSyLV+RkBre0LXe8=;
 b=a6Z7ZWjqek+mH0sM4xp5gBOjzrIO66+xLPDhvtA6J0fW15hhf0qlgKHUNlqA21HQ8P
 OUA18VI05G9w2pS51iXJLUGzRCPUaAPzDdccvsPliV02px35SsNZQ8LkRmcFKi4IRgSR
 qcg0coCvvnzaNQfpfSzm83t6wjz00FYZcIbDSpZaNGnEfWzUywgCDXAZfNaUxnQXNnxv
 BZvVKpP/m/qliSfkdA0dyp/CRsJ4Tz9kBNEv8qaUr/8OuVj+Qu/wpTe2cKtipHN8xl0o
 k6QJlA2Ig/Ayd6m5lHV9rXssXM818mVljd7EPExZQJ2r1X69ld7grMfS/yiBdgxY1MeW
 YiNQ==
X-Gm-Message-State: AJIora8BxHP1DKqKYAE1nW/X+aZFFvedJwGt22XU4zm23TVbXkrPwU2U
 GViR56LaAK/l4bt4hiMdodBZcQ==
X-Google-Smtp-Source: AGRyM1vc2XvQcEV3NW4pR+bqJctZPGBZRBAOO5hfwQBC6CMtGP22NXTaB+XZ0SdndD67zQAcAfdasw==
X-Received: by 2002:a05:651c:508:b0:25b:b0e4:8a0f with SMTP id
 o8-20020a05651c050800b0025bb0e48a0fmr8063260ljp.72.1657478740219; 
 Sun, 10 Jul 2022 11:45:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 11:45:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Date: Sun, 10 Jul 2022 21:45:34 +0300
Message-Id: <20220710184536.172705-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 1/3] drm/bridge: ti-sn65dsi86: switch to
 atomic ops
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Make ti-sn65dsi86 use atomic_enable / atomic_disable / atomic_pre_enable
/ atomic_post_disable rather than their non-atomic versions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8cad662de9bb..01171547f638 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void ti_sn_bridge_disable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 	return ret;
 }
 
-static void ti_sn_bridge_enable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	const char *last_err_str = "No supported DP rate";
@@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   VSTREAM_ENABLE);
 }
 
-static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 	usleep_range(100, 110);
 }
 
-static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1114,10 +1118,10 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
-	.pre_enable = ti_sn_bridge_pre_enable,
-	.enable = ti_sn_bridge_enable,
-	.disable = ti_sn_bridge_disable,
-	.post_disable = ti_sn_bridge_post_disable,
+	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
+	.atomic_enable = ti_sn_bridge_atomic_enable,
+	.atomic_disable = ti_sn_bridge_atomic_disable,
+	.atomic_post_disable = ti_sn_bridge_atomic_post_disable,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
-- 
2.35.1

