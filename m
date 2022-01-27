Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0149EB8C
	for <lists+freedreno@lfdr.de>; Thu, 27 Jan 2022 21:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0833C10E223;
	Thu, 27 Jan 2022 20:02:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F23410E1D1
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 20:01:58 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id r59so4133640pjg.4
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jan 2022 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlOjEQaGgQJEWexKeIDPB6ZywfuO0Krhl/6WTCAgp1U=;
 b=eyrrZkbzPEVq72Z6fNYVKdNXOMuVYUB7XGcmAelArR/eBBTm4qv34sUVGHRw2+3Xjb
 qxYlvdBkbnSilPXGvWPCeiDXV+5AgRyZ6rpwDbyu6pszvNmM2d966CHxA1CXRr6njd4o
 N75g5GBD63J2h2qcjJmsi51wKmNMAMIts0FjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlOjEQaGgQJEWexKeIDPB6ZywfuO0Krhl/6WTCAgp1U=;
 b=MgkgzGK8piXSjFFYZOF7NRCIr0Jf7NqrG/pbwu6VrUkOf2yu/CNIf1b3wtAMR/kgW1
 XPy4IB7bm1olFBd6pmHrhmvI3NES3AlhiYS8RepVG5oQ/1DpMSjyuZbcPrQblWw/RFWx
 gzzbz+5SA26R/J5Flux1Nqi7HBVHABTNtmSaSeqLBDd4r0pCTDmnUzHeH1n/OBNX6btR
 HPHSQwPI+bXB7jzEMIVf+oj8pKngLvwlwJuP7yRlFEM8f8plA/zy5qFtXilrTZv/r5iI
 w52/dw0HpVUUC1ECS8XmK3rxGBxssJUMi9IFYUkDBNIzxmVqWfcLFBdUqBveZhOhV0zU
 mwwA==
X-Gm-Message-State: AOAM532N40NX9lQhbA16ZtA/fVbhP52/ETbTu8sY4JJkM/Ylglrftu/D
 1+xs30xAi84kTLqt6FsoGlDtNg==
X-Google-Smtp-Source: ABdhPJw9tnBKTD10bdf8LXuHDZN29rkJYFCfmvP96l1VR5CM/34SWpZehvfM/GsxZluqGTjuFM522g==
X-Received: by 2002:a17:902:f68e:: with SMTP id
 l14mr4800119plg.164.1643313717953; 
 Thu, 27 Jan 2022 12:01:57 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:01:57 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 27 Jan 2022 12:01:09 -0800
Message-Id: <20220127200141.1295328-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 03/35] component: Add
 aggregate_device_parent() for driver use
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This allows aggregate driver writers to get the parent of the aggregate
device passed to their probe/remove/shutdown functions.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 6 ++++++
 include/linux/component.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index dc748ef0b23b..13ac2004a913 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -71,6 +71,12 @@ static inline struct aggregate_device *to_aggregate_device(struct device *d)
 	return container_of(d, struct aggregate_device, dev);
 }
 
+struct device *aggregate_device_parent(const struct aggregate_device *adev)
+{
+	return adev->parent;
+}
+EXPORT_SYMBOL_GPL(aggregate_device_parent);
+
 struct component {
 	struct list_head node;
 	struct aggregate_device *adev;
diff --git a/include/linux/component.h b/include/linux/component.h
index aa69ea0401d3..c39dea7824af 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -43,6 +43,7 @@ int component_bind_all(struct device *parent, void *data);
 void component_unbind_all(struct device *parent, void *data);
 
 struct aggregate_device;
+struct device *aggregate_device_parent(const struct aggregate_device *adev);
 
 /**
  * struct component_master_ops - callback for the aggregate driver
-- 
https://chromeos.dev

