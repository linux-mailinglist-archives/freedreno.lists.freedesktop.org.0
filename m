Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206A5C4B97C
	for <lists+freedreno@lfdr.de>; Tue, 11 Nov 2025 07:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05EB10E4E2;
	Tue, 11 Nov 2025 06:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="EDWHUYPz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72EE10E4E2
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 06:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=yXHOEfbHGbvqbP1Nad+xAerCqiTYHUSbE0LcjnK5MOc=; b=EDWHUYPzks2P1f8YajAH8QGHua
 zr78W5BMj2gEuDYW2kwMOb0gXx+iw+tl569j1McNUYCz1l4CXp6yEvXVORBqLfO7PXYliGVhge36S
 yhg2XUMiUNTKXlbYmfY9ocwzGiTLMqQzd+VrD64XWVNkDlALWgZdbFAIAF2xdSbGHIP7MwZzwLsL8
 YvgjNOs2CJmFCGSilvI1FvBVFzFl0FuWlZmto/YtqcMn1tIMnjJkOc2fqSAt5EE6ewKQ2gbubIPpq
 JL11cxH0bsJ/vAuPPCKYCDs9YRiyvbdYkxT8FXjM4ihmGJ9sSIkHDud35x9vBdxz1BhstKhrcWQKm
 3YEhsIlQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vIhTw-00000006aj8-09zz; Tue, 11 Nov 2025 06:03:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/msm/disp: fix kernel-doc warnings
Date: Mon, 10 Nov 2025 22:03:53 -0800
Message-ID: <20251111060353.1972869-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix all kernel-doc warnings in msm_disp_snapshot.h:

msm_disp_snapshot.h:53: warning: Function parameter or struct member
 'blocks' not described in 'msm_disp_state'
msm_disp_snapshot.h:69: warning: Function parameter or struct member
 'node' not described in 'msm_disp_state_block'
msm_disp_snapshot.h:69: warning: Excess struct member 'drm_dev' description
 in 'msm_disp_state_block'
msm_disp_snapshot.h:95: warning: No description found for return value
 of 'msm_disp_snapshot_state_sync'
msm_disp_snapshot.h:100: warning: bad line: 
msm_disp_snapshot.h:117: warning: bad line: 
msm_disp_snapshot.h:125: warning: bad line: 
msm_disp_snapshot.h:142: warning: Excess function parameter 'name'
 description in 'msm_disp_snapshot_add_block'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

--- linux-next-20251107.orig/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ linux-next-20251107/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -38,6 +38,7 @@
  * struct msm_disp_state - structure to store current dpu state
  * @dev: device pointer
  * @drm_dev: drm device pointer
+ * @blocks: list head for hardware state blocks
  * @atomic_state: atomic state duplicated at the time of the error
  * @time: timestamp at which the coredump was captured
  */
@@ -55,7 +56,7 @@ struct msm_disp_state {
 /**
  * struct msm_disp_state_block - structure to store each hardware block state
  * @name: name of the block
- * @drm_dev: handle to the linked list head
+ * @node: handle to the linked list head
  * @size: size of the register space of this hardware block
  * @state: array holding the register dump of this hardware block
  * @base_addr: starting address of this hardware block's register space
@@ -88,8 +89,9 @@ void msm_disp_snapshot_destroy(struct dr
  * msm_disp_snapshot_state_sync - synchronously snapshot display state
  * @kms:  the kms object
  *
- * Returns state or error
+ * Returns: state or error
  *
+ * Context:
  * Must be called with &kms->dump_mutex held
  */
 struct msm_disp_state *msm_disp_snapshot_state_sync(struct msm_kms *kms);
@@ -97,7 +99,7 @@ struct msm_disp_state *msm_disp_snapshot
 /**
  * msm_disp_snapshot_state - trigger to dump the display snapshot
  * @drm_dev:	handle to drm device
-
+ *
  * Returns:	none
  */
 void msm_disp_snapshot_state(struct drm_device *drm_dev);
@@ -114,7 +116,7 @@ void msm_disp_state_print(struct msm_dis
 /**
  * msm_disp_snapshot_capture_state - utility to capture atomic state and hw registers
  * @disp_state:	    handle to msm_disp_state struct
-
+ *
  * Returns:	none
  */
 void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state);
@@ -122,7 +124,7 @@ void msm_disp_snapshot_capture_state(str
 /**
  * msm_disp_state_free - free the memory after the coredump has been read
  * @data:	    handle to struct msm_disp_state
-
+ *
  * Returns: none
  */
 void msm_disp_state_free(void *data);
@@ -130,7 +132,6 @@ void msm_disp_state_free(void *data);
 /**
  * msm_disp_snapshot_add_block - add a hardware block with its register dump
  * @disp_state:	    handle to struct msm_disp_state
- * @name:           name of the hardware block
  * @len:            size of the register space of the hardware block
  * @base_addr:      starting address of the register space of the hardware block
  * @fmt:            format in which the block names need to be printed
