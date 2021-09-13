Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63093409B76
	for <lists+freedreno@lfdr.de>; Mon, 13 Sep 2021 19:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF836ECEA;
	Mon, 13 Sep 2021 17:58:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7C76ECE9
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:31 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id d11so8892296qtw.3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x1esUjNDDpPwTIgE//tv/AYRTHQITQZPLKG3TQ/M4Aw=;
 b=HSkzBKaW16XHN25FVhfE4ylfh7Ho8sKCp7NrHnYeZ9jqVbeqyvv5nhvkjL7XnJKf4/
 BaklNXOp8gHXE+dIxpH1EqfKnYbBykjq53Yy+f9sYHgj5MhRKM3vU+TNRzbWCCrlgjRL
 d6Btg46MYbzPzLbcJsGef7oPKYbzbT8e8DOQ5S6WvYFiPu11tikgrc5rpfIXNQze8xAS
 EF5ybQt4EiD/YWqON6MYIWklZfZEaCODI3MttyJMNpzbQRoqnK4w7g5RcGHiZtTbrP1P
 bFHxJyDV5PUtAZJoKr8Nn73rhfQAKxB5ggKQWeIGZ3g1VCe/ow++3JDp6sm+AthJmZrI
 oqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x1esUjNDDpPwTIgE//tv/AYRTHQITQZPLKG3TQ/M4Aw=;
 b=2YLpEj6hSZUEO3rbFWIq5x0gXCFTe8r8WAjOKqqqc+JBHnS5F7eP5yl1nJiciXQpUB
 omWkV2VXMFyEfwuSfJAP7vIjBseIiKwcbeCJ8666GsIbT/bsyP/GSVZSVy5v8UpWyAte
 zYOagBzVO8yyGZStBUaRnqEbmvwnlX9fFGqnL6tgdumYbARB8zI267oD0+A8yLf0pjgc
 pfVvc2Pb5OoJGkAABmmTXXgjfvel8pWsbCJ0w+Aahqc43Rezxs2UKsrUIYzK9Wy7SEEl
 7DJa3GttLeGF3Ih5o8/Hmg6oak7+14CE1bfYI3qe4tq9PZJtIf0PO3WY2OsDzq0GXLKi
 G+YA==
X-Gm-Message-State: AOAM533cIskQ6h7Vzr2gDPaszcroHmqOmBrIl3pJHtJq0DghB6lL+rUQ
 VDW1aLHUDKqfECIY1SOkPxaxpw==
X-Google-Smtp-Source: ABdhPJwprGZQb5yj3SWlC8k2jMSq4z8CKpwRKlPSj4/nEKy9bCRmbnJ3kYbKUVAN837wrtFHdahvyQ==
X-Received: by 2002:a05:622a:199f:: with SMTP id
 u31mr763515qtc.141.1631555910663; 
 Mon, 13 Sep 2021 10:58:30 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id v145sm5853873qkb.132.2021.09.13.10.58.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:30 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Date: Mon, 13 Sep 2021 13:57:39 -0400
Message-Id: <20210913175747.47456-9-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 08/14] drm/msm/dpu_kms: Re-order dpu includes
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

