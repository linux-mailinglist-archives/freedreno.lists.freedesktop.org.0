Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A7C507D65
	for <lists+freedreno@lfdr.de>; Wed, 20 Apr 2022 01:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7F510E133;
	Tue, 19 Apr 2022 23:54:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6961410E133
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 23:54:50 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w19so32085545lfu.11
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 16:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bvNMSN3pjje8DO8VKt+U/tOaBPxKcUXo89mN7XSq4VA=;
 b=nWz2J/9FyHAu9c4LAOFJi56mLrG3hncYMeMG7WQmK9BCcR48yGQnhsD7fmJsGOSF2+
 Z/91Q1S5n+B9GILgoq1zRZZkO2ZNEolOvDS1XWOx5nPGoYaGpHZgppET/Mt5pjLExr1V
 h+CvRplZpiGqBAtFiXPT4WhhBcDCj/PwbKpMb25AwQhBIvYhvB7GhawJEATPnszn0pWu
 DmtB7PI5umXOsFnGgvTAtPoQ5IPBqwdR2S1FwsNag9INcST/lgFInL/xDqzdfdRBWlCF
 zqRs6hVI9E7U/YQakjfz93ExlevzIU/mQb6SGe8gVTsHWUnDPNQxB5YymcgcrvFKCMvq
 VwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bvNMSN3pjje8DO8VKt+U/tOaBPxKcUXo89mN7XSq4VA=;
 b=6VvksF9huPhJkab0bkwYDJG2/6NfJLRUo6R18BnXlkrB04QAHKkaZ8UYg0SHUCZBpd
 F70K4UhrQBbu5wc+9P5d6HW+9oeaiVrrwjaMWDCp2BELoWEvOiHbSKQdBSk8b/V46MuK
 VJoyUjlsHRZ7Ma1zMtgwoYiwLcrcJFuG77Joid3os/t91lekwiFgJ+o+5jMbnDbrb2ni
 PP8YEBsUFGOAFkRSruTNveOWbclTz2WVivVBMWW7dnvdHmKWDVxCcn4F0Qx1gQAsO890
 qmtit81DXoz8hlnkRjAK6BWk2WRGurcfdLh26W6RyhIhvUyA1QHhN16PzD6T4JqToJNr
 +gfQ==
X-Gm-Message-State: AOAM530Ch+FCWgen1HYSPbSCXSzwxhMOaRyFJysCknzwezmYAuvbllNd
 j3rO2veqk0t8jZb+l3/DBnhmDw==
X-Google-Smtp-Source: ABdhPJx7XT4j1TOlMM92aT+5eWOjZGo3AhiUgM2QzsVkznUoE4H9dn+nAStfZOGFuIvdIa0nYUngsA==
X-Received: by 2002:a05:6512:e87:b0:44a:5117:2b2b with SMTP id
 bi7-20020a0565120e8700b0044a51172b2bmr13043804lfb.275.1650412488676; 
 Tue, 19 Apr 2022 16:54:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e7a09000000b0024dbdd8e297sm647725ljc.19.2022.04.19.16.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 16:54:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 20 Apr 2022 02:54:47 +0300
Message-Id: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency
 calculation
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
the clk_core_determine_round_nolock() would clamp the requested rate
between min and max rates from the rate request. Normally these fields
would be filled by clk_core_get_boundaries() called from
clk_round_rate().

However clk_gfx3d_determine_rate() uses a manually crafted rate request,
which did not have these fields filled. Thus the requested frequency
would be clamped to 0, resulting in weird frequencies being requested
from the hardware.

Fix this by filling min_rate and max_rate to the values valid for the
respective PLLs (0 and ULONG_MAX).

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index f675fd969c4d..e9c357309fd9 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -818,7 +818,7 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
 static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 				    struct clk_rate_request *req)
 {
-	struct clk_rate_request parent_req = { };
+	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
 	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
 	struct clk_hw *xo, *p0, *p1, *p2;
 	unsigned long p0_rate;
-- 
2.35.1

