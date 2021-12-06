Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F27F46AA0E
	for <lists+freedreno@lfdr.de>; Mon,  6 Dec 2021 22:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084476F9CC;
	Mon,  6 Dec 2021 21:19:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A796F9CC
 for <freedreno@lists.freedesktop.org>; Mon,  6 Dec 2021 21:19:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0C7A4CE1582;
 Mon,  6 Dec 2021 21:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91DCC341C6;
 Mon,  6 Dec 2021 21:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638825579;
 bh=DmOPVP8gRAHwDRltcXtrVdNkEkqCVs90JbwOIXSNKbo=;
 h=From:To:Cc:Subject:Date:From;
 b=fOwM96AfHixlDO63YdHqT7GCMt6/UPu7HMXWw6p8J8E0g45Ls9vJTYr44CWyCUhpD
 j0d5cL8YeFbitifMNUaqcJjfUiZE1is5rk+rihr26kFnk4YTWgV7kcv56bfKyC2qWs
 x9e2eI7XokpzACAeBACBJU0+12ZZh/tVOrqGhJgw3R2aX5Ex7CMHRIGl8oSPeXRsvi
 maMQpAIwE80MANBym7ViS8u5MOt2n/bR/0Eh23GzRiYYL7JT8MBwc5fYgM/R6whqVA
 tqzddT92olZCT5vz5xAAwXW9XzRGvWWxyDVM0G/37mQyYn6fC3DyA5nxIdEx3khIP/
 v8jG30P7QoQmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  6 Dec 2021 16:19:21 -0500
Message-Id: <20211206211934.1661294-1-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH AUTOSEL 4.19 1/7] drm/msm/dsi: set default
 num_data_lanes
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 Philip Chen <philipchen@chromium.org>, dri-devel@lists.freedesktop.org,
 jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jesszhan@codeaurora.org, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, abhinavk@codeaurora.org,
 Stephen Boyd <swboyd@chromium.org>, tiny.windzz@gmail.com, robdclark@gmail.com,
 vulab@iscas.ac.cn, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Philip Chen <philipchen@chromium.org>

[ Upstream commit cd92cc187c053ab010a1570e2d61d68394a5c725 ]

If "data_lanes" property of the dsi output endpoint is missing in
the DT, num_data_lanes would be 0 by default, which could cause
dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
by the bridge driver.

According to the binding document of msm dsi controller, the
input/output endpoint of the controller is expected to have 4 lanes.
So let's set num_data_lanes to 4 by default.

Signed-off-by: Philip Chen <philipchen@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 77dae147caf90..9abfb19ea7ede 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1677,6 +1677,8 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	if (!prop) {
 		dev_dbg(dev,
 			"failed to find data lane mapping, using default\n");
+		/* Set the number of date lanes to 4 by default. */
+		msm_host->num_data_lanes = 4;
 		return 0;
 	}
 
-- 
2.33.0

