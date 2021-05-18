Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E627C387677
	for <lists+freedreno@lfdr.de>; Tue, 18 May 2021 12:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515316E0BF;
	Tue, 18 May 2021 10:27:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from vps5.brixit.nl (vps5.brixit.nl [192.81.221.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FF36E0BF
 for <freedreno@lists.freedesktop.org>; Tue, 18 May 2021 10:27:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [77.239.252.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by vps5.brixit.nl (Postfix) with ESMTPSA id 1A3F56075F;
 Tue, 18 May 2021 10:27:28 +0000 (UTC)
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Date: Tue, 18 May 2021 13:26:24 +0300
Message-Id: <20210518102624.1193955-1-alexeymin@postmarketos.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: Init mm_list before accessing it for
 use_vram path
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
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix NULL pointer dereference caused by update_inactive()
trying to list_del() an uninitialized mm_list who's
prev/next pointers are NULL.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b199942266a26..b8c873fc63a78 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1227,6 +1227,13 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 
 		to_msm_bo(obj)->vram_node = &vma->node;
 
+		/* Call chain get_pages() -> update_inactive() tries to
+		 * access msm_obj->mm_list, but it is not initialized yet.
+		 * To avoid NULL pointer dereference error, initialize
+		 * mm_list to be empty.
+		 */
+		INIT_LIST_HEAD(&msm_obj->mm_list);
+
 		msm_gem_lock(obj);
 		pages = get_pages(obj);
 		msm_gem_unlock(obj);
-- 
2.26.3

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
