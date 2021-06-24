Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2843B31FA
	for <lists+freedreno@lfdr.de>; Thu, 24 Jun 2021 16:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962CC6EC25;
	Thu, 24 Jun 2021 14:57:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F266EC1B
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x24so10728414lfr.10
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hys3VoodSCY+pIfMzjrkMFnG9NkOn3VbfSGPhyfFM/w=;
 b=OtPWTlR7VlVAwZ88Rn4mR1aDNFmFeS6Ft8kTw42PERDQnPxBw1LgJwA/IGQet5qXqJ
 R8T2y4HmREsnNk1fFhm5ROegMkBDOoG+CkccID38fN/1DgwaWQIjJUjIuPD1rT5RjlGW
 Gfj2cX/jydWmrsuqgJWWL1/XetOAPTyF7KAY71Zdc2iUwqSlO2CF0SV/34jaUN4r23PS
 jLuYH31q6HhQHAbl9hTqnPHErC/vhDI4M6Uz0ZshncHv6lRmw2SIufgmazoKgswlzUui
 12YFwviMtXJ+G5YdTjnn8MDDgVYLMNwWs9GmOtDOs83cTDhsU2p+lyyyg5XemsdmtJl9
 3rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hys3VoodSCY+pIfMzjrkMFnG9NkOn3VbfSGPhyfFM/w=;
 b=Q5bimZh5gV5EsQXNO+fSGSC2bohl7T12x7G3rVQ9lvqzkdKbDtewRXosWUjfDsev8J
 Z3ax+ZJYLZlrI9bHMCIHNYdi/oy36kmP08k7vcWSfnxOOBhOPXnjv6wmv6cPhS71Uwuh
 WXxJtOukfWRYYh8ZAIpawnlx4KgsS6PhlGVqJBOR9s93jQZVEihOgS5ItzmPBLaHi7uz
 VGQ/BsFuTqvQiI0UaKTpsdk5bHMViOUi1Q76ymP/QoP0kMxlGZ7TVrDHmvI7MyEhFY94
 Zwi092dagH7Ay38UanMST74CYRTJ1DLJi/PQD0PRrDKYl4UJqE0z553rBQ5nrU1Z4Wfi
 /zHg==
X-Gm-Message-State: AOAM530/bQAp0kb+DVBRYwNdBC/vBRQAQVHm6JIu3to/5lkyteqR1qoV
 lDeIhR+Z3PkcLbN7Gfxd2cC+FQ==
X-Google-Smtp-Source: ABdhPJyfp/lezMEkLPUEBxNCauD2O3a7VevfMPowkL9NHbNo3lizCRH+iIeRxCHirl1z/zNfSrw6pA==
X-Received: by 2002:ac2:4d19:: with SMTP id r25mr4185459lfi.150.1624546663565; 
 Thu, 24 Jun 2021 07:57:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 24 Jun 2021 17:57:23 +0300
Message-Id: <20210624145733.2561992-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 07/17] drm/msm/dpu: don't cache
 pipe->cap->features in dpu_plane
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

Do not cache hw_pipe's features in dpu_plane. Use
pdpu->pipe_hw->cap->features directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 521ae699dc5a..cf45a86877e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -100,7 +100,6 @@ struct dpu_plane {
 	struct mutex lock;
 
 	enum dpu_sspp pipe;
-	uint32_t features;      /* capabilities from catalog */
 
 	struct dpu_hw_pipe *pipe_hw;
 	uint32_t color_fill;
@@ -624,7 +623,7 @@ static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
 		return;
 	}
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
 		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc10_YUV2RGB_601L;
 	else
 		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc_YUV2RGB_601L;
@@ -972,8 +971,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pdpu->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->features & (BIT(DPU_SSPP_CSC)
+		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
 		 | BIT(DPU_SSPP_CSC_10BIT))))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
@@ -1412,8 +1411,8 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
-	debugfs_create_x32("features", 0600,
-			pdpu->debugfs_root, &pdpu->features);
+	debugfs_create_xul("features", 0600,
+			pdpu->debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
 
 	/* add register dump support */
 	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
@@ -1572,7 +1571,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	}
 
 	/* cache features mask for later */
-	pdpu->features = pdpu->pipe_hw->cap->features;
 	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
 	if (!pdpu->pipe_sblk) {
 		DPU_ERROR("[%u]invalid sblk\n", pipe);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
