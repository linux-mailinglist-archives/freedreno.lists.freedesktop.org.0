Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB35A92E1
	for <lists+freedreno@lfdr.de>; Thu,  1 Sep 2022 11:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B4810E666;
	Thu,  1 Sep 2022 09:15:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD78810E666
 for <freedreno@lists.freedesktop.org>; Thu,  1 Sep 2022 09:15:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id m7so14579445lfq.8
 for <freedreno@lists.freedesktop.org>; Thu, 01 Sep 2022 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0PopVUeDqVd8id5zcihhw1xot4mofrXOyc1GZjax4ec=;
 b=IvP5i70p6ppN98XYu7InwUNO/+mqptBcaId0KlOwGkf8kyje4IQAH2CDYHJMDp/ZkV
 ghEi4pY9LVoo25cOb3Hn6nvWNCrDZKlvqmXrmQy/2QZBmTJI4DlLM2sG00w3mIYIj2X1
 2tZsUDbm0nz3vikoSorTOUEXrx7rY+G/beM993ie//kW8O4VYZFpH8OZwv6tcD0bfeBS
 Zox9T3tugtECHNPlCggRMug5xoVMHWC6mRXfC3J2F53BXuVVr1lqRrYu30dpb8wOl7iF
 Yy/a7pLx90ybXbpD4qmPqCn5+xj5wmjKBY9H/FXKsaDUmnGyJ/+9O9MciMzRpAz2QB+H
 qipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0PopVUeDqVd8id5zcihhw1xot4mofrXOyc1GZjax4ec=;
 b=mhhLT9l2CdIz1o0Mokuh30i9xnVoe2HQhu66zw5vnnNyYhTLji7HGIipy8+mED9b87
 1zhLkOx71aA1WX4+5/3LnJZjZUXl/KIishgL1qFnvwFbAO69qMGORPkgRlkxAXxSoXg/
 utwAuR8PmIvLotUZq50FxAMSwJA5Fc62XQxEm4MJ+0GHf7XVBC/VsO3uDAyZR89JRJkp
 xocrfeRYNz+Kdf9jpTMclJFpkz9XEllJo6Dy2WtYz4+EqRjJEH0GPR94DVC38JkMiplK
 H8iLDgPDzl+GnEehJJUH2z0GUWDOqPIZf3prc5bC+ciP4RMBTb9FM2Kkl1QOQeBED9eT
 NABA==
X-Gm-Message-State: ACgBeo3wrKrFkyBwbkdLJH/CrHKqRYy+za7HLuJ4Pahna7jTNh9U3gg8
 2dGzl4THBhe4EIVshCvbQNqfJQ==
X-Google-Smtp-Source: AA6agR5gcvtrIHFZtE7o0eCPzN0rFEUKDxuoa820dKQCQFP47AtJxDVJ+nfan1kBmHAfIo9uLh6Mtw==
X-Received: by 2002:a05:6512:3fa2:b0:48a:16df:266f with SMTP id
 x34-20020a0565123fa200b0048a16df266fmr10153605lfa.414.1662023730688; 
 Thu, 01 Sep 2022 02:15:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  1 Sep 2022 12:15:26 +0300
Message-Id: <20220901091527.1992208-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 2/3] drm/msm/dp: switch to using
 platform_get_irq()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There is little point in using irq_of_parse_and_map(). Switch to plain
and usual platform_get_irq() for parsing the DP IRQ line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3173e6962a78..40c7f91abec9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1243,8 +1243,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
-	if (!dp->irq) {
+	dp->irq = platform_get_irq(dp->pdev, 0);
+	if (dp->irq < 0) {
 		DRM_ERROR("failed to get irq\n");
 		return -EINVAL;
 	}
-- 
2.35.1

