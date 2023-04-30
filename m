Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F26D6F2AB2
	for <lists+freedreno@lfdr.de>; Sun, 30 Apr 2023 22:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C03410E0C6;
	Sun, 30 Apr 2023 20:36:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E9E10E083
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 20:36:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8aea0c7dcso17223071fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 13:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682886961; x=1685478961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6NmOsCOeaXlBzztrIruv87ZFWNmW9EDHTimbYIfZmU=;
 b=q7IaEjj/KVy2H/qnIImiEslsTrlvC/3AuDTdkLJyCAiyWvwkBcLQWhLrRmg5zgsxMR
 GXXAtiQAADRbSmFzuwE82x30spj//x5oYuVRFRvyvCv6LCLsROou5qOfLMPAyrXV0VGo
 ACJuAsR0kg6ljQA8NLgjLYVnoNlU1pDctXClbPiXooqx+1cyUzTbHLUk33p6iQ4EjOXi
 7p/VD/m3Ug7Xlhg6kpE1lumoLvJlOdjMXcwpY5yqAYD9w+uNC/St1SenebeIODX1UVHI
 6jVqCKgQOMXWLPtytFe62iFy9JK+vbkjPFUO7fOR+L296PVSUImfUsbyWHFIJEbLONdb
 8ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682886961; x=1685478961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6NmOsCOeaXlBzztrIruv87ZFWNmW9EDHTimbYIfZmU=;
 b=QwobsoVwaFIPPzFAxGIL+NhxzH3IGISeiomqHWAUFO0DDDPE1TZESu28NNR41/Z4vY
 tNDHix9uqtOn71KAcwttX7MhFiVE1Tj05Yo0fDk+HZJsmRdkGiTmzsl1MbZRL1Y00dKL
 47huKTMbyPOwB2FlGjtch3BaWPUiFJi1xZJbU0veGCu0C4jrlT1EnvXhL9hHLBtlK1XI
 seNbb2WXcSwX+dZoTWWIBBh75kvTCyr7moF+KODqvq7+gjm1okdmQJvPU/jEfhmKRkqr
 O1GVpUbZOxt/mb89TwxkzHBOXEwpcMzqHc1tEL7gLjMcA/hqDpjw/JJdmcR3tVUaCEvS
 d1/A==
X-Gm-Message-State: AC+VfDxIK58hIaZd770MKhZxEn5wHex+QPkNw/EfA038lCDz2lh+pw3J
 D6N6+RboIAB8NdXr+P2jOC0KGg==
X-Google-Smtp-Source: ACHHUZ7DMUyJmLG/H5hj/g6h14Qp8kr3jbzjgiorKr9BIA1e5M3k1Nv13J8nx+stFIzYh+9mtGSszA==
X-Received: by 2002:a05:651c:14f:b0:2a8:e6fd:5e57 with SMTP id
 c15-20020a05651c014f00b002a8e6fd5e57mr3419713ljd.11.1682886961048; 
 Sun, 30 Apr 2023 13:36:01 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Apr 2023 23:35:56 +0300
Message-Id: <20230430203556.3184252-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/4] drm/msm/dpu: move PINGPONG_NONE check to
 dpu_lm_init()
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
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move the check for lm->pingpong being not NONE from dpu_rm_init() to
dpu_lm_init(), following the change to dpu_hw_intf_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 214f207ddf8a..d1c3bd8379ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -161,6 +161,11 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
 {
 	struct dpu_hw_mixer *c;
 
+	if (cfg->pingpong == PINGPONG_NONE) {
+		DPU_DEBUG("skip mixer %d without pingpong\n", cfg->id);
+		return NULL;
+	}
+
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index bf7b8e7c45b1..2ca3c666e22f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -117,11 +117,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		if (lm->pingpong == PINGPONG_NONE) {
-			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
-			continue;
-		}
-
 		hw = dpu_hw_lm_init(lm, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
-- 
2.39.2

