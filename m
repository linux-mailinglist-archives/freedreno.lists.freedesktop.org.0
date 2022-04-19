Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E26507081
	for <lists+freedreno@lfdr.de>; Tue, 19 Apr 2022 16:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CB410EF44;
	Tue, 19 Apr 2022 14:29:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Tue, 19 Apr 2022 06:22:56 UTC
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
 by gabe.freedesktop.org (Postfix) with ESMTP id 863FF10E7AD
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 06:22:56 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 19 Apr
 2022 14:16:23 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 19 Apr
 2022 14:16:21 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>
Date: Tue, 19 Apr 2022 14:16:19 +0800
Message-ID: <1650348980-19050-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Tue, 19 Apr 2022 14:29:50 +0000
Subject: [Freedreno] [PATCH] drm/msm/mdp5: Eliminate useless code
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Haowen Bai <baihaowen@meizu.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since mdp5_state is initialized twice at the same time, so
we make code simple and easy to understand by delete one.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 428f88b786f9..406c34e9f3f8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -386,8 +386,6 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
 	if (!crtc_state->active)
 		return -EINVAL;
 
-	mdp5_state = to_mdp5_plane_state(new_plane_state);
-
 	/* don't use fast path if we don't have a hwpipe allocated yet */
 	if (!mdp5_state->hwpipe)
 		return -EINVAL;
-- 
2.7.4

