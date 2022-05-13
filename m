Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F918526B05
	for <lists+freedreno@lfdr.de>; Fri, 13 May 2022 22:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CC910E3BC;
	Fri, 13 May 2022 20:15:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464DE10E331
 for <freedreno@lists.freedesktop.org>; Fri, 13 May 2022 20:15:33 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id x88so9017683pjj.1
 for <freedreno@lists.freedesktop.org>; Fri, 13 May 2022 13:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z8tyfGIyj4QCjWxzXzO8gJFUZd4JNIC7ZKxyO4yxAcs=;
 b=F1DwqMbX3C4qM5XgU+UfmsdneLS0XU7rLeNYlh9QwnShg4eBHYTmLougzM4093Zgq3
 LeVMSUKpnmOp1po+rlLKyEBMh1uhHNo0MYtEYk6jOB8JwVpzjwio/D3C4D745ZFM8i+a
 hFZ8UKOQKjO+iEj6taXWN4v3Cv+4Jb2LTbD+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z8tyfGIyj4QCjWxzXzO8gJFUZd4JNIC7ZKxyO4yxAcs=;
 b=kwW2BEoXCyWBDShm94ZJILNmU+HE5SKkjytmEiG8ZDJzY7NSX9FtpSdQ1Cp0dac4/O
 0fU9Ud75UVBIv5UHaV74Cr0vZ1dfMPXITQpr/6avrgGAdo6i8pOha/zSUkyiK4sNQcoc
 M70Fh1lK7Kd2pUq7e/afpq5vOLu6DiTWujC2doxkslacRnn8LmoeJbLi2GflJ0c9/7PH
 nNNF+RZ6Ps8Q+IqbfAdIC2J9JLGTE0Ezm/XmuUMqINgWqkakCravV08fag+ztVwxQ1ME
 pmQvr+flvjBNGZnHw/G3vUpgtiYTGB45/kkgW+r/uhWTfaOOu+IIyOWDyVN/Qq+Sl6Uy
 tLUA==
X-Gm-Message-State: AOAM531ATn9G2H+i/PmKRf3Ou9huv5qF2H/xDMwXKWLSIfOrcRnoAc8Q
 JulU2WDA1fT8Fmq5brLxTtSHEnDGLCeh0Hskod8OuA==
X-Google-Smtp-Source: ABdhPJzcImkmUNnAnRYKJR4fAAj/PKirufEjVgtKSVv9x3OVOt1fZUvIBWdxj8liHAinYjSiebfazA==
X-Received: by 2002:a17:902:a981:b0:156:229d:6834 with SMTP id
 bh1-20020a170902a98100b00156229d6834mr5874937plb.128.1652472921993; 
 Fri, 13 May 2022 13:15:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f334:6f80:82ed:5653])
 by smtp.gmail.com with ESMTPSA id
 im2-20020a170902bb0200b0015e8d4eb1bdsm2332362plb.7.2022.05.13.13.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 13:15:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 May 2022 13:15:13 -0700
Message-Id: <20220513131504.v5.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5] drm/msm/dsi: don't powerup at modeset time
 for parade-ps8640
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
chip to fail to turn the display back on after it turns off.

Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
handle the new power sequence. The Linux driver has almost nothing in
it and most of the logic for this bridge chip is in black-box firmware
that the bridge chip uses.

Also unfortunately, reverting the patch will break "tc358762".

The long term solution here is probably Dave Stevenson's series [1]
that would give more flexibility. However, that is likely not a quick
fix.

For the short term, we'll look at the compatible of the next bridge in
the chain and go back to the old way for the Parade PS8640 bridge
chip. If it's found that other bridge chips also need this workaround
then we can add them to the list or consider inverting the
condition. However, the hope is that the framework will not take too
much longer to land and we won't have to add anything other than
ps8640 here.

[1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com

Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset time")
Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Note that, unlike `struct device`, `struct drm_bridge` still has a
`#ifdef` around the `of_node`. The extra stub function in this patch
is to make sure that we can pass COMPILE_TEST, not because I expect
that we'll actually run into real users who are running this driver
without device tree.

Changes in v5:
- Add a comment saying that this is temporary.

Changes in v4:
- Use the compatible string of the next bridge as per Rob.

Changes in v3:
- No longer a revert; now a module parameter.

Changes in v2:
- Remove the mud from my face.

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 32 ++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 50b987658b1f..7fe5eb1dd066 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -34,6 +34,32 @@ static struct msm_dsi_manager msm_dsim_glb;
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
 #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
 
+#ifdef CONFIG_OF
+static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
+{
+	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
+
+	/*
+	 * If the next bridge in the chain is the Parade ps8640 bridge chip
+	 * then don't power on early since it seems to violate the expectations
+	 * of the firmware that the bridge chip is running.
+	 *
+	 * NOTE: this is expected to be a temporary special case. It's expected
+	 * that we'll eventually have a framework that allows the next level
+	 * bridge to indicate whether it needs us to power on before it or
+	 * after it. When that framework is in place then we'll use it and
+	 * remove this special case.
+	 */
+	return !(next_bridge && next_bridge->of_node &&
+		 of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
+}
+#else
+static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
+{
+	return true;
+}
+#endif
+
 static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
 {
 	return msm_dsim_glb.dsi[id];
@@ -389,6 +415,9 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
+	if (!dsi_mgr_power_on_early(bridge))
+		dsi_mgr_bridge_power_on(bridge);
+
 	/* Always call panel functions once, because even for dual panels,
 	 * there is only one drm_panel instance.
 	 */
@@ -570,7 +599,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
 
-	dsi_mgr_bridge_power_on(bridge);
+	if (dsi_mgr_power_on_early(bridge))
+		dsi_mgr_bridge_power_on(bridge);
 }
 
 static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
-- 
2.36.0.550.gb090851708-goog

