Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C2259C4F3
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 19:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B2C9B649;
	Mon, 22 Aug 2022 17:25:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44669B608
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 17:24:58 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id s1so13458037lfp.6
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JWuoaMhPoCYrN68iQTiKw3Xyik+rAwN10Yl4sr/ahzU=;
 b=f6q6TIV3VK+J93nQI1kLTXaNNxYsE3V9/haK8AfzXCOYGvLAHr3vKN+ZT39d5Lm5Zl
 y4JQhizivD0Ss+Cg00cS+Y8b5GQpKoG5q81CdI8+u1/CAP6gwWnF4scUffxoEyDjNCs9
 ih4xmf4MRwlBIioVpPQ8AsZBvFx5cF1TK5gSwVjnQCWMfKsYVXQEx+6BLIjFJ6rvbHFB
 Agi8RWW+JYDsjT7cKrnVhbZ7Dt3rjwStt+2qGF4aHTSoeBsbGnMLmudy6VKKjwKHw4o8
 cE1GAWSWfu3iFv69p7ileM1n3GzsuuiwQzmpCiLYe8zvoaAOB+wnfnZTArtN3JRzYS2p
 JVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JWuoaMhPoCYrN68iQTiKw3Xyik+rAwN10Yl4sr/ahzU=;
 b=hu2qVyzTjxg0gfu2m9sMQgWIVP0/3lZddzEyzNJFR1vntbalZlHXAVE3s9lKQcYG4A
 v5Tk9ddNOryI5NNbCsHoyq65hxZg5MLBWaAfObgR+ABBs5Af7ckUQjl3GcZofBSA4vJ8
 WQMqB1yyZD8V2lkRm/gfSMADjOle+4aR+0JZgvjQSM9YCIkPfXxixvdcXVojICThwsZu
 Ttzd8xMpP9UleO9/F9cF3VWKQOuDZ9Nyrn4ixgRXpVGbZsp5NUkwbRDy5Ok1wlDCcPRZ
 7j6xGrV2Rl13TsZI2yCJREgNQc2t7mDSrFuTHTQiGfLtr1JwveE2AQKcvwJGssWgboJg
 K4vA==
X-Gm-Message-State: ACgBeo2CqO8bD1HiAhT9CESnPORpnhzz2YHAd71La1OewNaK/aWFm7iu
 PuJnkqjqvzZX+/XW4rvYHauXnw==
X-Google-Smtp-Source: AA6agR6alkF8nw1SuE7MWnj5Ag0t/49LhC6nM8UItPjcfwKrwY9mh3KdwAR2h9UYfS7mybb6ZNs6oQ==
X-Received: by 2002:a05:6512:3409:b0:48a:ef04:4ec2 with SMTP id
 i9-20020a056512340900b0048aef044ec2mr7905189lfr.230.1661189096986; 
 Mon, 22 Aug 2022 10:24:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v15-20020ac2560f000000b0048af4dc964asm2012603lfd.73.2022.08.22.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 10:24:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 22 Aug 2022 20:24:55 +0300
Message-Id: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: drop unused memory allocation
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop the dpu_cfg variable and corresponding kzalloc, which became unused
after changing hw catalog to static configuration.

Fixes: de7d480f5e8c ("drm/msm/dpu: make dpu hardware catalog static const")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0239a811d5ec..50ab17c9afd2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1939,11 +1939,6 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
 {
 	int i;
-	struct dpu_mdss_cfg *dpu_cfg;
-
-	dpu_cfg = kzalloc(sizeof(*dpu_cfg), GFP_KERNEL);
-	if (!dpu_cfg)
-		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
 		if (cfg_handler[i].hw_rev == hw_rev)
-- 
2.35.1

