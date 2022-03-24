Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357784E6558
	for <lists+freedreno@lfdr.de>; Thu, 24 Mar 2022 15:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB7A10E8BA;
	Thu, 24 Mar 2022 14:35:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 856 seconds by postgrey-1.36 at gabe;
 Thu, 24 Mar 2022 08:52:24 UTC
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com
 [203.205.221.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF8910E866
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1648111941;
 bh=PdI9M8lLoPowcX452EcX6k9LkvHzZyFe5xCg2aOT5z4=;
 h=From:To:Cc:Subject:Date;
 b=xp1MaVSJlX2GHeehjmqVJRFgkHOLg/fPoGluMIJnoaphLmBlwsyBtb1cOvTMFhbEH
 ZLx2x/rDbZxWxUsTolzziXpmoKBaPFnDR5ZCHakt+b/IVaSaoD9oeZ+0U7N90CjUDn
 YzyAKV7pbPvqQNONTsI89LLMqaU2ZggtOB5KpE1c=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
 id 9378DC37; Thu, 24 Mar 2022 16:36:55 +0800
X-QQ-mid: xmsmtpt1648111015tha0g0i7j
Message-ID: <tencent_F71D40EE9851737338A6289EC3A3942EFE09@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeieiszZ2O+QJKzXzwRb+Wv/lEVxDjwkYxMewJHYJdFQoHsoWu9iam
 ajhSQ1Eh+e59SwWAJQNIolA9hH/lQO4f1IuiJrqh01QGQQ8ynx0vMZGFAxTrWV/nL4TZ50nEHhCA
 PfT6P9/3oSVTf0oUQNZhJhUqNJubqPtVBrsJxit3KUIEdtGymqR2GqkLJrTUzGoAP64J8TY8yV9p
 9T0ViPj0BviZ2jvNNEeO4NHAnnxVRGooB5Smg4EQfAXjHZ+U7NXD9DeDsulbB2O3WsjEMUwmbUX/
 ADBjSHLTH7MBY41RUYPX9dQAZ2Nf+IQGfr4sqwcHe+VpytsaAIb0l8FZdedLnu7owihH7/bB0v9w
 v3e1RXil9eAuCmyr3rNX5QpjaiLmjhYRpbRUNFtpKlT2xwQQxsCDC/myDcvfbciwVlDxBk0aXiIQ
 6QghgDCatQm7ZwMb0INN9vCio1kfph/qKCCfq+BUMpXVtNXVwrPK680hWRBfVJCqkw7acP3mMia3
 Bz+5wCSRUSHuDffpafV3/gPepA0ROFJef9Gsx7s+nxaKpeyIQFRfV0LFUVVYToudcy+3otN+loGR
 TV2OGBWjWfMWM+f8XV5kH6wAGlVxKwqe1uFxN+gqf1S6P+yl890qVRqvI7FjqqQVN/fbXiMgnYpA
 dL+SUIo8JEJqMcDJYmMpiSylhXfa94+qdeFiHGHkpsTgSA1PD9TvU5C9e+4MnNBOolUOFy1IgNT6
 qToKziTVG5vtvfM+IMUbXgPDclAYlMtEC9omhpL+vIOMcjZpQnTE2X8QzS/JTU4yt4gJSPLOaaIG
 zfCgezFDJ2hrNk3bmb9cBHRKhm+JXn48gMqMCAUX9W7Ns4xzoJFz+KnndZsd0gAL886EkEk6H95v
 L5nGvh0HYjfeqSczSXqrYSc2ynJYrR+aWjFCZIHMGI4x4PVR9+kQHOwcZuktExV5xkpTnsxCMYqi
 hfz6C6jwuNs/O3Y468qg==
From: xkernel.wang@foxmail.com
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Date: Thu, 24 Mar 2022 16:36:44 +0800
X-OQ-MSGID: <20220324083644.2666-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Mar 2022 14:34:59 +0000
Subject: [Freedreno] [PATCH] drm/msm/mdp5: check the return of kzalloc()
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69af..5f914cc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -90,15 +90,18 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 		__drm_atomic_helper_plane_destroy_state(plane->state);
 
 	kfree(to_mdp5_plane_state(plane->state));
-	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	plane->state = NULL;
 
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
-		mdp5_state->base.zpos = STAGE_BASE;
-	else
-		mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
-	mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
+	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (mdp5_state) {
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+			mdp5_state->base.zpos = STAGE_BASE;
+		else
+			mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
+		mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
 
-	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
+		__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
+	}
 }
 
 static struct drm_plane_state *
-- 
