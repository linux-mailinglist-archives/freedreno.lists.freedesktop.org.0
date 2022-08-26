Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC765A2387
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 10:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816C310E751;
	Fri, 26 Aug 2022 08:49:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682D510E751
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 08:49:29 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r69so838189pgr.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 01:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=/a4FiR7aLndGxzWuyiR1P2igj/4sxawq1FoYvUVjoOA=;
 b=N8Pm1mTU7cWHDbzj6ViV0jE/jdW8Ke1Xwv/7efFGL9aOIcyKDVBSP7mr0KkOBae6BD
 Ct6QWod2pOtJq/l4/mylb7TIYfRheyh64U/tz8kxxUcC+uEDcK47JoihXDaIeGflf/be
 0JRKeWFIKsRC+R/3L9Q6ztD3ANWxj1L+ryT0awn/CxtSA8SwIGyoE3UAtDLzhDo+AS9E
 EdcHvQGIBFFlleHbQ4FM9gtCfG8HBMxLHmjNdCf7mfkTgltps+of5cqs4M1y7pSNM32y
 Pb+BYC7GjZssKX9WACDiH9o8OO4Hu1p48jI5mYgB1Dg0tBc1srmaucqI2Pn5JZmruGy1
 DqHw==
X-Gm-Message-State: ACgBeo3A3aOvAFwRhpMwrBtS9bkPR1YcEm8Hq45tl7Irzi+mvJ9oDi24
 7XJQR3sbZ7UbeSBzpSlQdw==
X-Google-Smtp-Source: AA6agR5D+/X+OTlMDgze+3xQO1o0WOIn/bmV+6/bYyku0SHDYfHOfHcKkK95XjZvp4wXhdW1V8vMzA==
X-Received: by 2002:a63:1857:0:b0:41c:4217:426e with SMTP id
 23-20020a631857000000b0041c4217426emr2460335pgy.285.1661503768953; 
 Fri, 26 Aug 2022 01:49:28 -0700 (PDT)
Received: from localhost.localdomain ([156.146.53.107])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a17090b051200b001f8c532b93dsm1118128pjz.15.2022.08.26.01.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 01:49:28 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: christian.koenig@amd.com, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org
Date: Fri, 26 Aug 2022 16:49:17 +0800
Message-Id: <20220826084917.95409-1-sunliming@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND] drm/msm/dsi: fix the inconsistent
 indenting
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
Cc: kernel test robot <lkp@intel.com>, kelulanainsley@gmail.com,
 linux-kernel@vger.kernel.org, inux-arm-msm@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix the inconsistent indenting in function msm_dsi_dphy_timing_calc_v3().

Fix the following smatch warnings:

drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:350 msm_dsi_dphy_timing_calc_v3() warn: inconsistent indenting

Fixes: f1fa7ff44056 ("drm/msm/dsi: implement auto PHY timing calculator for 10nm PHY")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: sunliming <sunliming@kylinos.cn>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index a39de3bdc7fa..56dfa2d24be1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -347,7 +347,7 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 	} else {
 		timing->shared_timings.clk_pre =
 			linear_inter(tmax, tmin, pcnt2, 0, false);
-			timing->shared_timings.clk_pre_inc_by_2 = 0;
+		timing->shared_timings.clk_pre_inc_by_2 = 0;
 	}
 
 	timing->ta_go = 3;
-- 
2.25.1

