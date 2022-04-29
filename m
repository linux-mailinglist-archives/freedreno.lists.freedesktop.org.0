Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB06451591B
	for <lists+freedreno@lfdr.de>; Sat, 30 Apr 2022 01:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977C010E282;
	Fri, 29 Apr 2022 23:43:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9836C10E282
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 23:43:55 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y38so8117417pfa.6
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 16:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wiS8qEoWRaz1WJHgDpdYQzj9UXTuORSLeUZZBuLbpAQ=;
 b=QfV9qZQSy7zKpLgp3XKRuVVGQgXKgCEdZT8M6YLWLWuzskyledgrDoNbnEeL6+vdAy
 J1x4CD4N/XKato7QqwqelKbTKiWvYbwUH3sZuY4jCfH6bKi9uUj8MsW6jOFLQXVjURAX
 OatmJuCqt75DW8gtrxh6zZLgi05jRW6xz/fmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wiS8qEoWRaz1WJHgDpdYQzj9UXTuORSLeUZZBuLbpAQ=;
 b=Ma8GZOQtKZTetw/NnI2MKiAGKlWd8jsVa4uHwmr7EHkrwS8Bfj4LTLkPPgOD7HarKz
 qqSJcxUQpJVfJJ7p1AhAbrSxEcp7zm3SL/AyPfNH7MnsTzdJlTLmenKQsZPdzZQvlDeq
 YzjopdQ3a+Js0S3RdKPieftP+cjHLV3Fl05K2zk/eqpm4fcLdY3s4GBkNvywpaVLH3g6
 /lmLJZ4BGQUBiETqJT77rAiB+8z8LEwXb+np/kGSeF6/wK6wqnEKlETSyiCaOAZiqNQm
 KI0NiCv/JQPwsvlK1uIpLQa0RPIAcCzl/MXgE27rXu3BOSLXd/YbcCUaA1vD3QMPOu2Z
 riwQ==
X-Gm-Message-State: AOAM5332t0wKq/04BJvWtTo3w9bahs7iPbLgxgpJ0jg5oH9/xOMi9W6z
 XZFXKIDWLUdOhSiDndi/iYpLpg==
X-Google-Smtp-Source: ABdhPJyGwn4LqJY11HpxsF3RCIIDl8jF0wjSNEEMrwJ5U7v246J/p3J5Kt/Ft8+Hq1Ze7VFy0q1q0g==
X-Received: by 2002:a05:6a00:190f:b0:50d:8b82:cb90 with SMTP id
 y15-20020a056a00190f00b0050d8b82cb90mr1532752pfi.65.1651275835135; 
 Fri, 29 Apr 2022 16:43:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:408:3697:902b:59f1])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a1709028bc100b0015e8d4eb26dsm152563plo.183.2022.04.29.16.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 16:43:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Date: Fri, 29 Apr 2022 16:43:47 -0700
Message-Id: <20220429164325.1.I2a3b980ea051e59140227999f0f0ca16f1125768@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] device property: Fix recent breakage of
 fwnode_get_next_parent_dev()
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Due to a subtle typo, instead of commit 87ffea09470d ("device
property: Introduce fwnode_for_each_parent_node()") being a no-op
change, it ended up causing the display on my sc7180-trogdor-lazor
device from coming up unless I added "fw_devlink=off" to my kernel
command line. Fix the typo.

Fixes: 87ffea09470d ("device property: Introduce fwnode_for_each_parent_node()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/base/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 36401cfe432c..52e85dcb20b5 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -600,7 +600,7 @@ struct device *fwnode_get_next_parent_dev(struct fwnode_handle *fwnode)
 	struct device *dev;
 
 	fwnode_for_each_parent_node(fwnode, parent) {
-		dev = get_dev_from_fwnode(fwnode);
+		dev = get_dev_from_fwnode(parent);
 		if (dev) {
 			fwnode_handle_put(parent);
 			return dev;
-- 
2.36.0.464.gb9c8b46e94-goog

