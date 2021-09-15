Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F007B40CE37
	for <lists+freedreno@lfdr.de>; Wed, 15 Sep 2021 22:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EB66EA48;
	Wed, 15 Sep 2021 20:39:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DD86EA4A
 for <freedreno@lists.freedesktop.org>; Wed, 15 Sep 2021 20:39:21 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id a13so2750214qvo.9
 for <freedreno@lists.freedesktop.org>; Wed, 15 Sep 2021 13:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KxmkAJV9ZiXz1VZdO5RDAtoOnhIZgkvlq9IMhYeBvCI=;
 b=VJyq0dLF/hIukXRkiDYuN1USKHBDNJJRvqQz/YqQ/52q3fKBVx+ATDY+KWNBxaN1tJ
 AMrdwzvzeryTANiyfxKXDNq0nxCzDD+X7IysTKAOWljDT9uQA38v5lBLAYnum3kCppv3
 6yIXCGpDkzqtQLKL90J4bEa8sZTXtS776viOPZxqUBto75jnLvZm3zcFinO0cA148ocY
 mHCc6ErzdPiqjGDZ4Uf9yILcXglEoETzc/GRAXLIqQG/G50PidjiwqBIU0Y7bIdUTykK
 jB12yk3Bc16zH2tIvk7AiSUAI8dOOBK4LK5AS+KSrU7aTA54laZXtLpM5mOCHC4FmMkT
 W4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KxmkAJV9ZiXz1VZdO5RDAtoOnhIZgkvlq9IMhYeBvCI=;
 b=oI/riKgTB8HB4df1TndKQNoK2KP8t2704PPL9ObDishXPQTtwdCRMSR5N92oUwzgTw
 z3L8vGQ+y0FgwPcgf5IzLLLAqLUqeoOzBWWR2gJPuY7mOvH03rGfutB9kW4tFUzbGDhc
 LdJptTgUoFjvkhfiah1sUXk5i/a+ymjgxS8JzjE6mXwt4DaSeYuyk4khx1YhxmHWm2Aj
 8tILma0t55OZbijhJVYJ3KrtABBYBJDEFeC73Xye1/nblwYGDAxsoBglohP26oVMcMby
 uUzaYv/t6uhkJ16EiS+qrhI/WPhnjjjZIN6z+BThmvEYodHKvaFDjqOKU5B8kMm2i1Pz
 K3xQ==
X-Gm-Message-State: AOAM533p6hK5Z+GdSLjeyS4XZLcblCHXy0MEDkS+bKAVXN1zZUvL95oh
 WIMvp0oU9K6tsN1jr5GxjhvbPg==
X-Google-Smtp-Source: ABdhPJxSKhnrhOf3Y3kLRjW3BfWFtWjOwSoFk1lnfWF7C34Zq9UO645CASu+Vc7YqbfL43cag+DaBg==
X-Received: by 2002:a0c:80ce:: with SMTP id 72mr1859211qvb.39.1631738360201;
 Wed, 15 Sep 2021 13:39:20 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id 90sm696629qte.89.2021.09.15.13.39.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Sep 2021 13:39:19 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Date: Wed, 15 Sep 2021 16:38:27 -0400
Message-Id: <20210915203834.1439-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 08/13] drm/msm/dpu_kms: Re-order dpu includes
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

From: Sean Paul <seanpaul@chromium.org>

Make includes alphabetical in dpu_kms.c

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1

Changes in v2:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae48f41821cf..fb0d9f781c66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -21,14 +21,14 @@
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
-#include "dpu_kms.h"
 #include "dpu_core_irq.h"
+#include "dpu_crtc.h"
+#include "dpu_encoder.h"
 #include "dpu_formats.h"
 #include "dpu_hw_vbif.h"
-#include "dpu_vbif.h"
-#include "dpu_encoder.h"
+#include "dpu_kms.h"
 #include "dpu_plane.h"
-#include "dpu_crtc.h"
+#include "dpu_vbif.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
-- 
Sean Paul, Software Engineer, Google / Chromium OS

