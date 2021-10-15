Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4587E42FE92
	for <lists+freedreno@lfdr.de>; Sat, 16 Oct 2021 01:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AC26E402;
	Fri, 15 Oct 2021 23:11:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C006E402
 for <freedreno@lists.freedesktop.org>; Fri, 15 Oct 2021 23:11:19 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 l24-20020a9d1c98000000b00552a5c6b23cso14829119ota.9
 for <freedreno@lists.freedesktop.org>; Fri, 15 Oct 2021 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUmZDgtmuXy7pQJ38Tzw5qxbkrp4xNejQK3lDNZjLFg=;
 b=vkr6f/Hnqm9g23KalLp7H/Lvpczy/LuFqXn7egw6IF25H2KapElTrVg3Oqh1ajaUZY
 ulzMIZfZog772rpAe5L1W7zbyXfyvIJ+b8YfW/EWJ/n7Ono02IFwDP58Tl7GGuhp3RNn
 a/IUG0Fj6kytSJpwHC6E9t/JWfxDXMxBV5F3XYTdPqwAWsIsIor7koJ8WK5B5Pv3jmSU
 rOOEO8VcI2OecCLlM/twc+zcaPYuWkg+Q9q13hisWtswSTJK5QRvsD7VxwS6nNUcSIgB
 pipXe5b7SwCtu69ZrAhp/LhgXR6gPTNVPqedmym1S5l34I4IvmgPInmbyuYxoH28qvkF
 O1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUmZDgtmuXy7pQJ38Tzw5qxbkrp4xNejQK3lDNZjLFg=;
 b=Mj3fzw/IwzG7b3uV9dASSHoTxOtomzUj6JGXYY8GGHw9VPNxRUKjzyxws7MMC7ta6D
 kPEJZp4gCV+tNpoVUMJeTNDYltHAb+stesI3xt0R43ZGWZUP7WMEvanuFjwHNdU+P7Xr
 knNMktsO3mL5h3zRdxalm09HvIGLLm6kLJEikMzHXGXoWXh4D3yHow9pzfGziCbt9sSQ
 zmtfkmn2zHr0q+r0/XH81RRtZnvrM0pVJ8NTlEASUsFURiX88Gu1l/UNecYsGwNTrhVr
 jzsOPTTWtNGjIl2cbIqyojCay7i9TXn4aWD7rCKeN8GArL+9xS9msxSZyfQK3vtLBd/h
 rXcg==
X-Gm-Message-State: AOAM532ipPMUSU1oOL6v+widjFKNzhPZ+kwSKfmn7LXLoQThXA4g0k8O
 aN7zq4sa9pxM81mHF8vey8aabQ==
X-Google-Smtp-Source: ABdhPJzF/3yWadmmoHsXojqWAjiA8AD4RF0snFNDRgkCZDIdsm7bW/taSm0djFzOBF5ICbjuMjL3OA==
X-Received: by 2002:a9d:a61:: with SMTP id 88mr10612502otg.152.1634339478519; 
 Fri, 15 Oct 2021 16:11:18 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 103sm1527969otj.44.2021.10.15.16.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 16:11:18 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 15 Oct 2021 16:13:07 -0700
Message-Id: <20211015231307.1784165-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dp: Only create debugfs for PRIMARY
 minor
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

dpu_kms_debugfs_init() and hence dp_debug_get() gets invoked for each
minor being registered. But dp_debug_get() will allocate a new struct
dp_debug for each call and this will be associated as dp->debug.

As such dp_debug will create debugfs files in both the PRIMARY and the
RENDER minor's debugfs directory, but only the last reference will be
remembered.

The only use of this reference today is in the cleanup path in
dp_display_deinit_sub_modules() and the dp_debug_private object does
outlive the debugfs entries in either case, so there doesn't seem to be
any adverse effects of this, but per the code the current behavior is
unexpected, so change it to only create dp_debug for the PRIMARY minor.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3aa67c53dbc0..06773b58bb60 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -10,6 +10,7 @@
 #include <linux/component.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
+#include <drm/drm_file.h>
 #include <drm/drm_panel.h>
 
 #include "msm_drv.h"
@@ -1463,6 +1464,10 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 	dev = &dp->pdev->dev;
 
+	/* Only create one set of debugfs per DP instance */
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return;
+
 	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
 					dp->link, dp->dp_display.connector,
 					minor);
-- 
2.29.2

