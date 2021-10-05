Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0ED421C9E
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 04:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAEC6F513;
	Tue,  5 Oct 2021 02:36:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CCD6EA5C
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 02:36:09 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so24099934otj.2
 for <freedreno@lists.freedesktop.org>; Mon, 04 Oct 2021 19:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GYY3fgaaeOEZFwlrXaNb8Km6kTmaOO7oRCYiPn9Rtw=;
 b=qQxkZKeNLS9TSHR3BlSX1ArGn+F4qj0wLMrriaL9e+NNs7BGuGFPd04emb85TkfPqs
 X5AgvVsDLajRGyM/ad3xXjCLnxemgsLZiSsaXyU8ZIF0MZ2f3paGBdn3qlHqBAWB6L1K
 L6B/pOj4UvESvrUkJkI5Tuq4Mfi7nWF3jlQA297TMkMYlWNoZuAiaUM70ZrRkq0twPWM
 1iPyV55ubu9/9JIibbHyGJy47zoRQT8OXWRlrVswfb9Rxz578tl+dzTTZMqOnPos8/5h
 +mBryetbbDvyQ744howTfEswI9PW1svgzLRTQZaC8LMS8BMG5xI+N4iw6ZA04Rjj5sTo
 mcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GYY3fgaaeOEZFwlrXaNb8Km6kTmaOO7oRCYiPn9Rtw=;
 b=U+Ybzqgp3Lzr+i7QyIff/MIVQUy7hXJzHGCjo+L2hVCDMyG9ToQ4Kl63pt572sItAr
 WigaVqTgm9VnhLOc8ilVqbPL734OzF5sAjtsBZU3b7rDKttJfsfKDHls6FH2/8YaCYl/
 N0wPtux99HYs3GbcGXoJxknjT/5oiaIQTQDHPKY6JRTo0PBwUmgkjr/jlGKi2D6X/+Bm
 sCHdiOgYI5GLD4PnbDoawtenF73UDKgMFD9OUu4MiLM8jkRih6H0cYwuhXwskJRb2SHj
 e68ljD7GKEtaWCx1zT8xpIYlhVwMK6KCy43oFSm1EGDrT+dpG0w1oO7cTkE0aOBxIwJU
 jg1Q==
X-Gm-Message-State: AOAM530wCJpznb/iQ4clyuXJT7RHz/vqrKsWrWMrPtSYa/A8IDAP5978
 fpL6LzexR2azniP47BMBHhwt6A==
X-Google-Smtp-Source: ABdhPJygR0UDTE4BCHMd53yNo4xPeVw33V9dkfjhe2wQn4fgUTpyYl/AR4nlydFZHzSlhUGbJGWU4A==
X-Received: by 2002:a9d:7307:: with SMTP id e7mr12316641otk.35.1633401369095; 
 Mon, 04 Oct 2021 19:36:09 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 i12sm3055329oik.50.2021.10.04.19.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 19:36:08 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sankeerth Billakanti <sbillaka@codeaurora.org>
Date: Mon,  4 Oct 2021 19:37:50 -0700
Message-Id: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dp: Shorten SETUP timeout
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

Found in the middle of a patch from Sankeerth was the reduction of the
INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
is initalized and HPD interrupt start to be serviced, so in the case of
eDP this reduction improves the user experience dramatically - i.e.
removes 9.9s of bland screen time at boot.

Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 21b9c1de4ecb..46d9f3eb6d13 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1438,7 +1438,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp_hpd_event_setup(dp);
 
-	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);
 }
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
-- 
2.29.2

