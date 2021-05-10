Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F04377A77
	for <lists+freedreno@lfdr.de>; Mon, 10 May 2021 05:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8173D6E328;
	Mon, 10 May 2021 03:20:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Mon, 10 May 2021 03:20:22 UTC
Received: from mail-m118208.qiye.163.com (mail-m118208.qiye.163.com
 [115.236.118.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924176E328;
 Mon, 10 May 2021 03:20:22 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 475DEE01DC;
 Mon, 10 May 2021 11:12:55 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 Bernard Zhao <bernard@vivo.com>, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Sun,  9 May 2021 20:12:27 -0700
Message-Id: <20210510031250.5303-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQx0eHlZMS0pCGUwZGB1CSklVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCI6OBw*Lz8TDT8rDxkvTBUX
 SzEKFB1VSlVKTUlLTUpNSExNS05LVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFJTExPNwY+
X-HM-Tid: 0a7954436d742c17kusn475dee01dc
Subject: [Freedreno] [PATCH] drm/msm: fix warning "using plain integer as
 NULL pointer"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix sparse warning:
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1195:41: warning: Using plain integer as NULL pointer
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1348:32: warning: Using plain integer as NULL pointer

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index df7f3d3afd8b..cc5cceae80f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1196,7 +1196,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		if (DPU_FORMAT_IS_YUV(fmt))
 			_dpu_plane_setup_csc(pdpu);
 		else
-			pdpu->csc_ptr = 0;
+			pdpu->csc_ptr = NULL;
 	}
 
 	_dpu_plane_set_qos_lut(plane, fb);
@@ -1349,7 +1349,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
 	/* remove previous state, if present */
 	if (plane->state) {
 		dpu_plane_destroy_state(plane, plane->state);
-		plane->state = 0;
+		plane->state = NULL;
 	}
 
 	pstate = kzalloc(sizeof(*pstate), GFP_KERNEL);
-- 
2.31.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
