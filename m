Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54179176B46
	for <lists+freedreno@lfdr.de>; Tue,  3 Mar 2020 03:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EA76E95C;
	Tue,  3 Mar 2020 02:49:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12F06E923;
 Tue,  3 Mar 2020 02:49:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CBF97246DE;
 Tue,  3 Mar 2020 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583203782;
 bh=0f47R/IOMTYex/I5vBuWikGmqF4Nke+6/xBNSWEcrsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ONrY6pxvAGvVJicKP5qijGahU+njVZKpW/yQxRRY6SIgP36BEGmFzSpjskyV9lFUI
 EJdTYmxzi9xJc/RSWi/JQM2k2+Z59QfxyvW4ByceKzCiTTRkyo/951NwX8m4Ml7Tbc
 XulTGOXDvNWsbwPhImpVlPmMNXgkdBMJEeMU+Leg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  2 Mar 2020 21:49:18 -0500
Message-Id: <20200303024933.10371-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303024933.10371-1-sashal@kernel.org>
References: <20200303024933.10371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Freedreno] [PATCH AUTOSEL 4.14 07/22] drm/msm/mdp5: rate limit pp
 done timeout warnings
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Brian Masney <masneyb@onstation.org>

[ Upstream commit ef8c9809acb0805c991bba8bdd4749fc46d44a98 ]

Add rate limiting of the 'pp done time out' warnings since these
warnings can quickly fill the dmesg buffer.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
index 4409776770012..99d356b6e9151 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
@@ -1004,8 +1004,8 @@ static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)
 	ret = wait_for_completion_timeout(&mdp5_crtc->pp_completion,
 						msecs_to_jiffies(50));
 	if (ret == 0)
-		dev_warn(dev->dev, "pp done time out, lm=%d\n",
-			 mdp5_cstate->pipeline.mixer->lm);
+		dev_warn_ratelimited(dev->dev, "pp done time out, lm=%d\n",
+				     mdp5_cstate->pipeline.mixer->lm);
 }
 
 static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
-- 
2.20.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
