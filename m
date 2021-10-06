Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9BD424734
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 21:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8648F6EE82;
	Wed,  6 Oct 2021 19:39:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCDD6EE21
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 19:39:03 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so5228312pjw.0
 for <freedreno@lists.freedesktop.org>; Wed, 06 Oct 2021 12:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ot2+ntvoFG4rsH4e1sE1QMW5zjuXqRNCEhlTLCik2wM=;
 b=ZMhQIHtNA4/kV1vlNC99CTawkyKetOhHUYakJmO72VYU9TrfpZBzPPLUDYYFReVk3e
 Pom8N145OWgM8buTFKaH7OBf+pPgQzvJcfKcEX4AjvV0g0cy0C30dy8iPjzkw5jEF8z3
 R5paxhucwDP6aHXmIJicXt2jbvOk9XRtrlCMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ot2+ntvoFG4rsH4e1sE1QMW5zjuXqRNCEhlTLCik2wM=;
 b=ddKurUS0dyGWNB3vfOCkPfLvW6b4pXU/S5RkiuXB/Fyo0ZW4SfRpmDYHqlYGfwRg50
 GWssVupvX1zGaklP7jh3crzIMe0/INn71htWie/uCQI2OTSpWQ4IoJ/WrInv76NeOWYR
 +Wts4nykuwTzbxgOe5FP7o2D2D7iqiUPB6HNJVcv1PXgEm9pJyoIA+cyB8W0bqy+oRS7
 vgBADxJ+FgOhqZLZyFyx6XE0EuDYwThCmNhJ4UFIvHtXF0uCF66TVOAI5/scSpcB6Hnv
 wNINvn/0fuuFkMOusrW14diNjgzxSK2klqTUTrY+MpF3qRmIcPo5riwWwdP47UE34i3M
 ydMg==
X-Gm-Message-State: AOAM533g9eoBvHxYHWbvO7HKzSXHSzwdKvgqsLxvKfonJLfV2Omfx5qk
 UD1+v9orRDc3bZ4cOaZDL0soPg==
X-Google-Smtp-Source: ABdhPJxkLFmtSoPOhMgZhiIHEnf6+SjN1wfSYnzctXTRYdCeWsjvLvOF8AP6gzVDYc69tY/rt6+66g==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id
 nu11mr80066pjb.103.1633549142676; 
 Wed, 06 Oct 2021 12:39:02 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:39:02 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Date: Wed,  6 Oct 2021 12:38:19 -0700
Message-Id: <20211006193819.2654854-35-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 34/34] component: Remove all references to
 'master'
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

Remove all references to 'master' in the code now that we've migrated
all the users of the ops structure to the aggregate driver.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 939862b25b10..75323d35773c 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -1,11 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Componentized device handling.
- *
- * This is work in progress.  We gather up the component devices into a list,
- * and bind them when instructed.  At the moment, we're specific to the DRM
- * subsystem, and only handles one master device, but this doesn't have to be
- * the case.
  */
 #include <linux/component.h>
 #include <linux/device.h>
@@ -119,23 +114,23 @@ static int __init component_debug_init(void)
 
 core_initcall(component_debug_init);
 
-static void component_master_debugfs_add(struct aggregate_device *m)
+static void component_debugfs_add(struct aggregate_device *m)
 {
 	debugfs_create_file(dev_name(m->parent), 0444, component_debugfs_dir, m,
 			    &component_devices_fops);
 }
 
-static void component_master_debugfs_del(struct aggregate_device *m)
+static void component_debugfs_del(struct aggregate_device *m)
 {
 	debugfs_remove(debugfs_lookup(dev_name(m->parent), component_debugfs_dir));
 }
 
 #else
 
-static void component_master_debugfs_add(struct aggregate_device *m)
+static void component_debugfs_add(struct aggregate_device *m)
 { }
 
-static void component_master_debugfs_del(struct aggregate_device *m)
+static void component_debugfs_del(struct aggregate_device *m)
 { }
 
 #endif
@@ -343,7 +338,7 @@ EXPORT_SYMBOL(component_match_add_release);
  * @compare_typed: compare function to match against all typed components
  * @compare_data: opaque pointer passed to the @compare function
  *
- * Adds a new component match to the list stored in @matchptr, which the @master
+ * Adds a new component match to the list stored in @matchptr, which the
  * aggregate driver needs to function. The list of component matches pointed to
  * by @matchptr must be initialized to NULL before adding the first match. This
  * only matches against components added with component_add_typed().
@@ -367,7 +362,7 @@ static void free_aggregate_device(struct aggregate_device *adev)
 	struct component_match *match = adev->match;
 	int i;
 
-	component_master_debugfs_del(adev);
+	component_debugfs_del(adev);
 
 	if (match) {
 		for (i = 0; i < match->num; i++) {
@@ -548,7 +543,7 @@ static struct aggregate_device *aggregate_device_add(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
-	component_master_debugfs_add(adev);
+	component_debugfs_add(adev);
 
 	return adev;
 }
-- 
https://chromeos.dev

