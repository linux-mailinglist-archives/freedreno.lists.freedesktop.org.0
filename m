Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E826E90E
	for <lists+freedreno@lfdr.de>; Fri, 18 Sep 2020 00:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE0B6E422;
	Thu, 17 Sep 2020 22:44:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1596E422
 for <freedreno@lists.freedesktop.org>; Thu, 17 Sep 2020 22:44:27 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id k13so1914412plk.3
 for <freedreno@lists.freedesktop.org>; Thu, 17 Sep 2020 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emK8TCQ/AOCbQCaTZuyx4EX1GGlS5xLteCwUhZhZWKs=;
 b=asVwRODTCKzTMhPdETpQLiZroP91Get/mIBjAac5bezdK+pOzFI4MJpd0T9o9DUYWW
 Jrgc59dc5QywWAx0/rRfNXXzIp+8G6594T6t/N1pVZVe2h3Q97pV/5VPO3dLx5rXGWbS
 OUXTBUjCBjdKZPF75UxabZQM0laVCy2zi9SYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emK8TCQ/AOCbQCaTZuyx4EX1GGlS5xLteCwUhZhZWKs=;
 b=fcd9qNtLW9JR0nOYcT89LFHem8eP7nG5HAXe0PNfPkwjr3bt6OiBhP9DP8Sw7OLWH/
 VHH2k8nRNPqf/qVNpxaNPT3+p55kPyfTWipbzFa1/FWCpVxQwMq8bFYJ5o1z8OgTMdVB
 RPLbouUOp0/z8OXPfq/t/j43ufOKVPMoAtBfmS+TqFdKYWwFRrWnAfW2w+S7x5KH5qr0
 jee3tPukW3zxIFkHf/6i1f/+X2QXm/R8321dBxL8NJNCe+a7Q97iX8T4WTUtWqJ+reX5
 28vIuFPa2RYh9dSjtPX5ufM2R4W46AHBbY1FEB5lf65Q9fS+vc70CZqrT6QjCnj2jca8
 F2zg==
X-Gm-Message-State: AOAM532FIebdfvuGun7Cz2Zh/jAO/4G2r/2JA7YdZtCj+aMgIKQuzoPV
 Zk4/sYKEThq8ZtJjRrrjjg1iZA==
X-Google-Smtp-Source: ABdhPJywypDGBU0fygZ+vRZ0Ah7m+uJXUNioxfPKAcCRYPGZUExxbYZ5CmLJLP3uPld3wN0+0sGN1Q==
X-Received: by 2002:a17:902:8509:b029:d0:cbe1:e746 with SMTP id
 bj9-20020a1709028509b02900d0cbe1e746mr29812096plb.33.1600382667062; 
 Thu, 17 Sep 2020 15:44:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id l123sm674509pgl.24.2020.09.17.15.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 15:44:26 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Thu, 17 Sep 2020 15:44:25 -0700
Message-Id: <20200917224425.2331583-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dp: Sleep properly in dp_hpd_handler
 kthread
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Douglas Anderson <dianders@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We shouldn't be waiting for an event here with a timeout of 100ms when
we're not in the 'timeout' arm of the if condition. Instead we should be
sleeping in the interruptible state (S) until something happens and we
need to wakeup. Right now this kthread is running almost all the time
because it sleeps for 100ms, wakes up, sees there's nothing to do, and
then starts the process all over again. Looking at top it shows up in
the D state (uninterruptible) because it uses wait_event_timeout(). FIx
this up.

Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Based on msm-next-dp of https://gitlab.freedesktop.org/drm/msm.git

 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 05a97e097edf..e175aa3fd3a9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -970,9 +970,8 @@ static int hpd_event_thread(void *data)
 				(dp_priv->event_pndx == dp_priv->event_gndx),
 						EVENT_TIMEOUT);
 		} else {
-			wait_event_timeout(dp_priv->event_q,
-				(dp_priv->event_pndx != dp_priv->event_gndx),
-						EVENT_TIMEOUT);
+			wait_event_interruptible(dp_priv->event_q,
+				(dp_priv->event_pndx != dp_priv->event_gndx));
 		}
 		spin_lock_irqsave(&dp_priv->event_lock, flag);
 		todo = &dp_priv->event_list[dp_priv->event_gndx];

base-commit: 937f941ca06f2f3ab64baebf31be2c16d57ae7b8
-- 
Sent by a computer, using git, on the internet

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
