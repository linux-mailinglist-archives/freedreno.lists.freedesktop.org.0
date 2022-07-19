Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579C57902E
	for <lists+freedreno@lfdr.de>; Tue, 19 Jul 2022 03:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185FD11A898;
	Tue, 19 Jul 2022 01:56:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031911A872
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 01:56:36 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id e16so12220495pfm.11
 for <freedreno@lists.freedesktop.org>; Mon, 18 Jul 2022 18:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/a4FiR7aLndGxzWuyiR1P2igj/4sxawq1FoYvUVjoOA=;
 b=ejpnTYXthwyk9FfureAtbzDCOPHGhskkJxigz1JkHJWU41eW4/OKibnuCarDay2GAU
 Hb66C3XWu9gGkmd/XtV2JdoBeXc3DArbff4BHvs9DFIAbP2K+O8ps7nveDabYoj6T2s5
 LOdUE1zb+qJpWR7gwbMkPotCfClmhbH5PhAKPFGzUwddvrJQw/tXw+5MRkxgvRfkgwUN
 0q32y8Iizcqu4SL217DjCTr9229PqmxAVe/Dtg1B+O8eXWrssLBSCOKFu+7Squkf3Uzm
 Z4JI3VWwslTvJFW0hQ4mi6FmICm1i0X0J+4rpU1NE6IVf7inJImDjObgMB9lqHp+Bs0O
 EHsQ==
X-Gm-Message-State: AJIora8eVTpzTULRInOeDC6Yvq09xcOyHy1gHpisvPuTvlvvOJMk5I/Y
 nYTQWghysQ6jn2fg85i7pg==
X-Google-Smtp-Source: AGRyM1sC9k4aPblFgOso28rTleM2SsyhMxxgJNyGcr1cBKdOSZu0+rwvpzTCFaSpg2Zl+X8eVVVajA==
X-Received: by 2002:a63:6846:0:b0:415:bb65:d6f0 with SMTP id
 d67-20020a636846000000b00415bb65d6f0mr26989951pgc.238.1658195795563; 
 Mon, 18 Jul 2022 18:56:35 -0700 (PDT)
Received: from localhost.localdomain ([156.146.53.107])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a170903024f00b0015f2b3bc97asm10067405plh.13.2022.07.18.18.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 18:56:35 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: christian.koenig@amd.com, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org
Date: Tue, 19 Jul 2022 09:56:22 +0800
Message-Id: <20220719015622.646718-1-sunliming@kylinos.cn>
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 kelulanainsley@gmail.com, linux-kernel@vger.kernel.org,
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

