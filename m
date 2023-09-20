Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705B7A7DD6
	for <lists+freedreno@lfdr.de>; Wed, 20 Sep 2023 14:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE03410E497;
	Wed, 20 Sep 2023 12:12:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B6210E497
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 12:12:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65DB161B4C;
 Wed, 20 Sep 2023 12:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA93C433C8;
 Wed, 20 Sep 2023 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1695211963;
 bh=d37Gyg8cP1lMGqwkL3ikoJgK1UnSNQutYmkWCKZnmJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ntjx+xE+C3AH2oQIPsPbfWVVRdDswmLiUhE3GRsEFL/zASj1cXeLI+2SAgjiFLrFz
 626cmIamDZiazR8DLJNcLjOc0WV9m6o0KlZ5mveEmNAU8MbNM3e9rA3CrH+9bSce8F
 cagQzX0KLF9OS5O3zjx/rH534Z5LzWlpBPC3NaMo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Date: Wed, 20 Sep 2023 13:29:01 +0200
Message-ID: <20230920112849.570791208@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112846.440597133@linuxfoundation.org>
References: <20230920112846.440597133@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4.19 101/273] drm/msm/mdp5: Dont leak some plane
 state
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, patches@lists.linux.dev,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org,
 dorum@noisolation.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

4.19-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Daniel Vetter <daniel.vetter@ffwll.ch>

[ Upstream commit fd0ad3b2365c1c58aa5a761c18efc4817193beb6 ]

Apparently no one noticed that mdp5 plane states leak like a sieve
ever since we introduced plane_state->commit refcount a few years ago
in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
early by tracking commits, v3.")

Fix it by using the right helpers.

Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reported-and-tested-by: dorum@noisolation.com
Cc: dorum@noisolation.com
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/551236/
Link: https://lore.kernel.org/r/20230803204521.928582-1-daniel.vetter@ffwll.ch
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 0cbc43f61d9c7..cd5b9ee22a5bb 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -230,8 +230,7 @@ static void mdp5_plane_destroy_state(struct drm_plane *plane,
 {
 	struct mdp5_plane_state *pstate = to_mdp5_plane_state(state);
 
-	if (state->fb)
-		drm_framebuffer_put(state->fb);
+	__drm_atomic_helper_plane_destroy_state(state);
 
 	kfree(pstate);
 }
-- 
2.40.1



