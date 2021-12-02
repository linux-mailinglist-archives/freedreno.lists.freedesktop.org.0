Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DEE466C35
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E836FBE3;
	Thu,  2 Dec 2021 22:27:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD736FBA2
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:37 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so893805pjb.4
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M08JekQWWfhJJuhYr6RW4wOJsoWLfsGZRbqzD6i13fw=;
 b=B+i5Ls7wrF2++Xq/jQqVhKISURVDtWKr+Of7/Dbgq4Bt0C+Du6oFRWA53Qp3IZsQQ7
 vBkw6heR9rBQQrudufmJ7YQtxEqEPEG/ZP/vQpiuLI5+EWmoNlFCXYRhrjDHtIsVeViS
 YQ7CULwmnkFx1q1lQulAPU/9RUSQeXpwOhWow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M08JekQWWfhJJuhYr6RW4wOJsoWLfsGZRbqzD6i13fw=;
 b=6kYg8K+b6fviePAJYDdpbd/ObZy0jULT/z9deHS1RrbZ2VzkoM+gfe4jXpWLACHc72
 OnPhWN1Ymi7o5Cl+C1Dj6/5srKiP6+AFaLTIX3EtxgoApBWS9FVntCtbzDXni+nIvFvl
 mOBPYBx63oL5aSgBFjsZYbomVL98jgiDEf6zV9ZnM7RtPKrGs+v4H+k/sNcJ2m2cDo8y
 J8XM3PS0GYjsJNO5a7OafrrAOi9sIXV6R/YyRlyMrm5QBGhwPZuGnDVOoEtoMgQwnUZJ
 Qix2JOJ7azwMaUuJzTE2Xbc9Sn2gbLunrMSVdzZ7Oq0SvUOcx8jNzlHegX6Nknd9OMY5
 ioXA==
X-Gm-Message-State: AOAM530vwb2bJFXgD5J80CzuWj8vHkE4XmFYtXrknqaayE6FDhjRxo3m
 MQQlFlNYaOOElUXhW51BmUWqc89fZ0W0Tw==
X-Google-Smtp-Source: ABdhPJyvaIgvk3KgS40jCQL1KZMeoM4fJb4tO+zhFvPEG+xtzKlHXn84csPkGOfPvvfWPE3xS8XVvw==
X-Received: by 2002:a17:90a:df96:: with SMTP id
 p22mr9145224pjv.129.1638484056924; 
 Thu, 02 Dec 2021 14:27:36 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:36 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  2 Dec 2021 14:26:59 -0800
Message-Id: <20211202222732.2453851-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 01/34] component: Introduce struct
 aggregate_device
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Replace 'struct master' with 'struct aggregate_device' and then rename
'master' to 'adev' everywhere in the code. While we're here, put a
struct device inside the aggregate device so that we can register it
with a bus_type in the next patch.

The diff is large but that's because this is mostly a rename, where
sometimes 'master' is replaced with 'adev' and other times it is
replaced with 'parent' to indicate that the struct device that was being
used is actually the parent of the aggregate device and driver.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 2d25a6416587..d25048d04b70 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -9,6 +9,7 @@
  */
 #include <linux/component.h>
 #include <linux/device.h>
+#include <linux/idr.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -63,7 +64,10 @@ struct master {
 
 	const struct component_master_ops *ops;
 	struct device *parent;
+	struct device dev;
 	struct component_match *match;
+
+	int id;
 };
 
 struct component {
@@ -79,6 +83,7 @@ struct component {
 static DEFINE_MUTEX(component_mutex);
 static LIST_HEAD(component_list);
 static LIST_HEAD(masters);
+static DEFINE_IDA(aggregate_ida);
 
 #ifdef CONFIG_DEBUG_FS
 
@@ -440,6 +445,7 @@ static void free_master(struct master *master)
 		}
 	}
 
+	ida_free(&aggregate_ida, master->id);
 	kfree(master);
 }
 
@@ -460,7 +466,7 @@ int component_master_add_with_match(struct device *parent,
 	struct component_match *match)
 {
 	struct master *master;
-	int ret;
+	int ret, id;
 
 	/* Reallocate the match array for its true size */
 	ret = component_match_realloc(match, match->num);
@@ -471,9 +477,17 @@ int component_master_add_with_match(struct device *parent,
 	if (!master)
 		return -ENOMEM;
 
+	id = ida_alloc(&aggregate_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(master);
+		return id;
+	}
+
+	master->id = id;
 	master->parent = parent;
 	master->ops = ops;
 	master->match = match;
+	dev_set_name(&master->dev, "aggregate%d", id);
 
 	component_master_debugfs_add(master);
 	/* Add to the list of available masters. */
-- 
https://chromeos.dev

