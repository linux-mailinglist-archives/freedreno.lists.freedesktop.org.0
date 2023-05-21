Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96FE70AF40
	for <lists+freedreno@lfdr.de>; Sun, 21 May 2023 19:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E472610E073;
	Sun, 21 May 2023 17:21:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1510E1E2
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 17:21:50 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f3a7241c0aso4147677e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689709; x=1687281709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aL7y3wzagnr2HfjgObLdfzPbAHB3ifg2d+IXSFsg1QU=;
 b=GsVAEld/oI9yK0l6q2C4BZv8SsAtZ8rQFk6ByzPLXa6jn+B1/ad44CM4llg0ulPxQp
 R3+M+o32S9oAsar9vfkHrh8ooQ1fUCXhAsftAmxNpXqRrN9KfqMUdExKwsRroadskxdQ
 eiSyKzsG+MrEc9JRIAb/RL/OWKxBzMBjfGdu3TtuH9ZN60qRTvHL/MgaCwKjWrnDPOla
 olJc0iVvrAAVEq9SpSukbiN92wN4P/8FToWQ5pbQpo9PYEY2F23/OrI9OQdt9Hc2qldq
 thwhHMx4xjciiqbR1iWkd2aI+hTDEdO+KZhxEG1yCI69llZckDPf6wvbalOFPJW5Yf2u
 S7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689709; x=1687281709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aL7y3wzagnr2HfjgObLdfzPbAHB3ifg2d+IXSFsg1QU=;
 b=cBDrpenFMZSR/jNo1hYcjoT1VTrNgJJya2t8x24ycYQqIBQY0QkqXh7H1dGi+1DMdo
 UiAZLTWN9mFH9id/pJRBgu+hc1Dom6pZJP97gGdsHNE1z/flvbqVKDnV/LDnt1ElUP1T
 8OEu68byeURYRcEjq4HSTvXZw/+/1z34UsvDFFs5qcrxpT8EZqCloZJBUKFmYZzzXzR9
 MUGnhwiNRpgPMUhKiCd4lheM8++RSiReFk/5b42cj0yAYGLE8NZLi+MVOFZbTvyiZ8sk
 sWvT6H0eoZ4mEBj01TqYhXV5x0DpzOmNbwAg7NJ2Kwj5YcroKoaKX7NxwFMMwQka0Zps
 bMLQ==
X-Gm-Message-State: AC+VfDy8KvF1fFwqA+tUjt3/anoUVL15DoArT91/aBkyF85mSkgXNEPe
 mzq87OC40BgocSK6R+m4vv5aUQ==
X-Google-Smtp-Source: ACHHUZ7evLh/2VEFyCJXkXaDUxmCRMJ0SsM9ISKW0W8NxY03olOJ+t6sUWJPuxoLeVF8dCRm3S4XZA==
X-Received: by 2002:a19:ee01:0:b0:4f3:a3e0:850e with SMTP id
 g1-20020a19ee01000000b004f3a3e0850emr3063162lfb.35.1684689708684; 
 Sun, 21 May 2023 10:21:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r22-20020ac24d16000000b004f24cb9ef14sm686339lfi.47.2023.05.21.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:21:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 21 May 2023 20:21:46 +0300
Message-Id: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop SSPP-specifig debugfs register dumps in favour of using
debugfs/dri/0/kms or devcoredump.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 ---------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index bfd82c2921af..6c5ebee2f7cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -727,31 +727,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 	debugfs_create_xul("features", 0600,
 			debugfs_root, (unsigned long *)&hw_pipe->cap->features);
 
-	/* add register dump support */
-	dpu_debugfs_create_regset32("src_blk", 0400,
-			debugfs_root,
-			sblk->src_blk.base + cfg->base,
-			sblk->src_blk.len,
-			kms);
-
-	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
-		dpu_debugfs_create_regset32("scaler_blk", 0400,
-				debugfs_root,
-				sblk->scaler_blk.base + cfg->base,
-				sblk->scaler_blk.len,
-				kms);
-
-	if (cfg->features & BIT(DPU_SSPP_CSC) ||
-			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
-		dpu_debugfs_create_regset32("csc_blk", 0400,
-				debugfs_root,
-				sblk->csc_blk.base + cfg->base,
-				sblk->csc_blk.len,
-				kms);
-
 	debugfs_create_u32("xin_id",
 			0400,
 			debugfs_root,
-- 
2.39.2

