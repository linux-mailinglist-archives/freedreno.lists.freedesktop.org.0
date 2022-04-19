Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3A50775E
	for <lists+freedreno@lfdr.de>; Tue, 19 Apr 2022 20:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F33A10E177;
	Tue, 19 Apr 2022 18:14:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BD510EF08;
 Tue, 19 Apr 2022 18:14:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64D2860DBC;
 Tue, 19 Apr 2022 18:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DAEC385A5;
 Tue, 19 Apr 2022 18:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650392070;
 bh=904Yeuvzqm23g7s+sAX4Ms24/YBBVjFmcCiyB/hFFGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mWDrXPhzwIMhmqu40vwvmbpX3ghdzXVP2Jt9bn4LXQlc+99f8DO+RolK328IPH4gx
 LeeKbHf6ZyCJElVcFSPK57L7G/QhXmTBWTJBPpLO5Gtg8V3jsnB9IlGOidS24Py65W
 wVqtnBzO2ZmdTw9JV3A2p5hjJTndf9OtN0lDlmUpJ8TO1YQ/73TqJZLDcSwik+54GF
 +2s/Si/eOuSAvTQCFf+/A97SqGr6WNLFtlbv2wzfZmdwoxrOG0kNk/bF80T8IMnYng
 THDhnIiDr2/MXQDsiK+1mHg731ULnJC9DXLOACPtjVo4QhFBPIkMJrKcFyQvWaZ3Hn
 dQr11ztXOvQaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 19 Apr 2022 14:13:46 -0400
Message-Id: <20220419181353.485719-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419181353.485719-1-sashal@kernel.org>
References: <20220419181353.485719-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH AUTOSEL 5.10 12/18] drm/msm/mdp5: check the
 return of kzalloc()
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
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, maxime@cerno.tech, daniel@ffwll.ch,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Xiaoke Wang <xkernel.wang@foxmail.com>

[ Upstream commit 047ae665577776b7feb11bd4f81f46627cff95e7 ]

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Besides, since mdp5_plane_reset() is void type, so we should better
set `plane-state` to NULL after releasing it.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/481055/
Link: https://lore.kernel.org/r/tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 83423092de2f..da0799333970 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -179,7 +179,10 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 		drm_framebuffer_put(plane->state->fb);
 
 	kfree(to_mdp5_plane_state(plane->state));
+	plane->state = NULL;
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (!mdp5_state)
+		return;
 
 	/* assign default blend parameters */
 	mdp5_state->alpha = 255;
-- 
2.35.1

