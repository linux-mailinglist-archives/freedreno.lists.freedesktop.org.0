Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CEA394988
	for <lists+freedreno@lfdr.de>; Sat, 29 May 2021 02:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6416EADD;
	Sat, 29 May 2021 00:25:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988CC6EAE1
 for <freedreno@lists.freedesktop.org>; Sat, 29 May 2021 00:25:19 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a4so593134ljq.9
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCV6uTNosDGcY6f4l30OjMSBFLKwXUprBp7g5LzOdmE=;
 b=B9TL8QOrWRKN4vhlP3UF93T7lvOoIYr2HC78VowLwyYF6HnFloX6TQmzqE7uP7EDyA
 2IyYlbW7/rmmK2EmftH7ZDjAG97B7JFeflumG/GnO+hoUP6O82j8iezhfK8tfsRK8Hyc
 ZwN5CoHERT7YpHy/c4SQHQq1eK3xuD2NUhNT9xHRwsv1RX0x+LPwl/M7eNJuLMyxODm/
 vq8rjeakbRWvR5PzryZ5ghFK9fSYGU7jq6/9zvVihF992ysDu/WkbTWt3PUs5YgD0YXh
 ywwK/0U7bVzSlK77lNaafXjJeFeq/zCzztTef8LCoC2P3xMjQa81863CmpcutNulz5Xj
 z8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCV6uTNosDGcY6f4l30OjMSBFLKwXUprBp7g5LzOdmE=;
 b=UtI28c3xBZ4wg/bXT1XD5K24lXw3G2JaVM2tYKX1W73/NOyK6G0SkH5pvmGvPgJmvh
 yKu16cdU7O26hU0omlOCasHIbFYSOcWVVxy1BHOMAt+K309LXSB7BT9BeT5C9e2lKRs5
 BTnubTpUJuG0RxSbN+AghWpsXZT0uM/3N/R5YIO+gle4xHefljtHzzWscG6lPhNf84Qp
 +Ty3U3AGQbD0A114WbzW8/R3kZ/Ne3qIqNKjjUfdvQEDU+nssMlpi2Qbnu3Kx+Daqpz1
 VSqnuj42PIBmAzBeahrl+2uI4HA+SpesozYxIPZM/1qM9MJuDt7LiGHsg3GPtXv9rYF2
 WUCw==
X-Gm-Message-State: AOAM533jJrMyL8BoqmdG9WcBWnOVf5cbJ/dLZQMsJ3FmE59pGDay9ODn
 EYrmuNe2eATpddsWUOuLD4CvrQ==
X-Google-Smtp-Source: ABdhPJzDTH3FZAisO38D59+IuUW+xayOopQ58D00IZ0P8NWTksBZ85QlhOsaJ318PhXgbqXop14n8w==
X-Received: by 2002:a2e:5419:: with SMTP id i25mr790907ljb.365.1622247918109; 
 Fri, 28 May 2021 17:25:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Sat, 29 May 2021 03:25:03 +0300
Message-Id: <20210529002508.3839467-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 3/8] drm/msm/dsi: drop msm_dsi_phy_pll_save_state
 from 7nm and 10nm drivers
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Stop calling msm_dsi_phy_pll_save_state() from dsi_pll_7nm_init() and
dsi_pll_10nm_init(), as this is handled now by the generic code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 34bc93548fcf..229e98a496f7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -706,9 +706,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 
 	phy->vco_hw = &pll_10nm->clk_hw;
 
-	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_phy_pll_save_state(phy);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..752a78c9dfcc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -734,9 +734,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	phy->vco_hw = &pll_7nm->clk_hw;
 
-	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_phy_pll_save_state(phy);
-
 	return 0;
 }
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
