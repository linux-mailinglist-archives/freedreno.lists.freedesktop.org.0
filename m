Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610D389A7A
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 02:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E766E5D5;
	Thu, 20 May 2021 00:25:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CCA6E4F1
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 00:25:28 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id b13so7336145pfv.4
 for <freedreno@lists.freedesktop.org>; Wed, 19 May 2021 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gm72nwXpdE7RmMD+c9dyNsOFYFMq7AQj3MbF+XKSlWQ=;
 b=UqC0yWQ9R5JvKixzeUdDD01pWSLv+fpdp/03qcIkZhAwK5Kap/ew8RZePWbSbXRD46
 q7WXLSHmfaKhKooj+IesNu1xcAVOJFXJF81IxZikgaJSTDZ0fwlQ2IFnCrPfQSqsVVO3
 Gk1Kmcp7VlHe8VSzzpXYjlL4s0Q2kRDPsORxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gm72nwXpdE7RmMD+c9dyNsOFYFMq7AQj3MbF+XKSlWQ=;
 b=ASzULRdJ7twMGTsiz3tMBVBTp+NZ1DrbBJ8MdLrTD73DhGyH8uB2Z1hkcvzXKD7vqh
 h+TD3o8IOa76j3HKEdVRoTRHzCclO9pan9ZOMingeo6N1X6P4XuvxzIOjCuIG3FHUPVT
 Qz6bsz5CB/mCcZZ9s3hYXGeftHvP7Oh/IwYhQXkZTUt4RQDnXpUKW8hBrGX8oOePKFJ6
 XYetfDNjk12rqnJK1cIzPEGpbxgmCwdBHcc7Hr0ziCv3KrUkXfJOMK4nBvvGGgJEP8eI
 pz4UyDIv5eNltaiwnlOqnQ+YsNMG7abFod1j/G65L8SNzMPUb9RI8yxCmx/AAmRZYx0c
 ZNCA==
X-Gm-Message-State: AOAM530jJ3eCujG2mfnlIUG+uU4QHeU04Pl0JHofygSsPMi9xkVU4GMp
 fSpRTxIHWIkPE7Fp8dZA4QQAXQ==
X-Google-Smtp-Source: ABdhPJwNWO63s1Z5yApVrizJPTmgihkFNM8TC2kJOBfC18nrxp5jGPb+J16z/e7HhYyam76qI+Pa9Q==
X-Received: by 2002:aa7:870c:0:b029:2a1:f060:f17d with SMTP id
 b12-20020aa7870c0000b02902a1f060f17dmr1648391pfo.24.1621470327798; 
 Wed, 19 May 2021 17:25:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
 by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:25:27 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 19 May 2021 17:25:18 -0700
Message-Id: <20210520002519.3538432-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
References: <20210520002519.3538432-1-swboyd@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 6/7] component: Move struct aggregate_device out
 to header file
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
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This allows aggregate driver writers to use the device passed to their
probe/remove/shutdown functions properly instead of treating it as an
opaque pointer.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 13 -------------
 include/linux/component.h | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 155aab7eefa6..1b4c84453319 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -62,19 +62,6 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct aggregate_device {
-	const struct component_master_ops *ops;
-	struct device dev;
-	struct component_match *match;
-
-	int id;
-};
-
-static inline struct aggregate_device *to_aggregate_device(struct device *d)
-{
-	return container_of(d, struct aggregate_device, dev);
-}
-
 struct component {
 	struct list_head node;
 	struct aggregate_device *adev;
diff --git a/include/linux/component.h b/include/linux/component.h
index bc71d34a3416..d19cc3418d12 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -39,7 +39,7 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-struct aggregate_device;
+struct component_match;
 
 /**
  * struct component_master_ops - callback for the aggregate driver
@@ -80,7 +80,18 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
-struct component_match;
+struct aggregate_device {
+	const struct component_master_ops *ops;
+	struct device dev;
+	struct component_match *match;
+
+	int id;
+};
+
+static inline struct aggregate_device *to_aggregate_device(struct device *d)
+{
+	return container_of(d, struct aggregate_device, dev);
+}
 
 /**
  * struct aggregate_driver - Aggregate driver (made up of other drivers)
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
