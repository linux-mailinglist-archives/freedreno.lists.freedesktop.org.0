Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6F956AF7B
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 02:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AFF10EAD0;
	Fri,  8 Jul 2022 00:58:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E3710E3E9
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 00:58:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r22so14173804pgr.2
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 17:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wqH5lkEcgEYk9IYTlg7iiusMTMJ78GFXYQavtNkHZMw=;
 b=lo+hFye8gJ55EUBpH4qJcrCfNq5oeEJhQPpVm+NiIuWI5MOgPEV8FhJUuus3gn9L1C
 EjvJ4pam77D1yeha2CE04BwLe2y3NQVg+cF79TNrt0fYGhZyS84UPaGnnO47EVTi/3Lp
 P5EZxO8aQyla+UPX/0pZfSbU/kKh99a058FqJD4RpS0Zw/sAkEi9I1KHCfE2n4hf/1wI
 MXSM4eAkkadOCYC3PpdoOjK3aTYpa0dbNBHQ9mQE10ArvpJgDEdzVmbOj0w/PW0l1jWJ
 FLa1oaeWRKGvmUkoG0KwyopFk0z6D6qaiis/839B68NcM3fLP1PbLX2nce5QQKn/XnAl
 09PQ==
X-Gm-Message-State: AJIora/qi1OvEAFOifd4sfbT9J1roZS6oW5LmIODJBKRoOjnla0BssO/
 k8fT2gZl2GWlnOc/b+UgqQ==
X-Google-Smtp-Source: AGRyM1vacj7yRlF6w+n1Bho6IKjJtTx/+ZIht2cmpzn70gZgkzg8M8pXSk63aKGy6xj6m/IaJpgGqw==
X-Received: by 2002:a63:ea05:0:b0:411:f94f:b80f with SMTP id
 c5-20020a63ea05000000b00411f94fb80fmr789435pgi.189.1657241923152; 
 Thu, 07 Jul 2022 17:58:43 -0700 (PDT)
Received: from localhost.localdomain ([156.146.53.107])
 by smtp.gmail.com with ESMTPSA id
 a140-20020a621a92000000b005289fbef7c4sm5034884pfa.140.2022.07.07.17.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 17:58:42 -0700 (PDT)
From: sunliming <sunliming@kylinos.cn>
To: christian.koenig@amd.com, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org
Date: Fri,  8 Jul 2022 08:58:32 +0800
Message-Id: <20220708005832.439722-1-sunliming@kylinos.cn>
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

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: sunliming <sunliming@kylinos.cn>
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

