Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9703BF5DC
	for <lists+freedreno@lfdr.de>; Thu,  8 Jul 2021 08:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2922B6E155;
	Thu,  8 Jul 2021 06:56:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FD16E0CA
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jul 2021 06:56:20 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id x16so4579512pfa.13
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jul 2021 23:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BAyx8HGJRdLOBdbNiU99QlY+5w2alIzKC7hMMjJk8E=;
 b=NHKTbL1+5esONkdEeIVUEHanUegxhWFq3mH2qGjsXdj1X4CnZ25OcIeCnh1Cz26/fD
 kX0pEMz5+wuULkM4jGkngh+2zCZzZ//MWkaMBjnnQj1BxLgsg02dZLG+cN7b2Z+y8sow
 h7S6o4wsaeft1bc7Ih5xOyZb+/4dtQEJdUkPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BAyx8HGJRdLOBdbNiU99QlY+5w2alIzKC7hMMjJk8E=;
 b=oA4KiasVRHQoNXPyP+FH3hYL8FO2YQdNglK+xL9qO367p7+YW2+iioiZwbhNqI2hwI
 gswncUE7U0zjo392T4+YEEkNPKPNcyYkVbKFCfv+h1UnIUFJFtMlx7E86A85tgxyTKZa
 fT2B3NhVpy1mIyzEZ0jVjK2OlkBTT4hCa3ZcJUpuA/Aycfl677VZ+RsNfF1LiZNaf4PM
 SVzx3qxKa4dfrcWulqoUdLwKnq/mETTOluV+XGPCkRmWIKAdWNviSWccp7DzGeTGvwAe
 Z2+RfAIH3VReWfthlHO9uJTRNNvfNFrPPoWx2FMWbcwMiqQSxr2DQoDoQLc11C37ScoC
 InCg==
X-Gm-Message-State: AOAM5331P4PEV9PyWHUE4aC/bp1Xe8T8FSNR9Ji5MK75iPYtLlpKjpnE
 X5gSUeXr71f4EusLMO7h13SoXw==
X-Google-Smtp-Source: ABdhPJxigodUsLw90BixpU3dO51TKFxRvaaErkAE8oVzv77ily6wyBUHpPvwY3JTNwAh2mxe/+P+EQ==
X-Received: by 2002:a63:e043:: with SMTP id n3mr6974211pgj.106.1625727380608; 
 Wed, 07 Jul 2021 23:56:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:82ce:1825:c0a5:9605])
 by smtp.gmail.com with ESMTPSA id a23sm1120910pfa.16.2021.07.07.23.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 23:56:20 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Wed,  7 Jul 2021 23:56:19 -0700
Message-Id: <20210708065619.999199-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dpu: Add newlines to printks
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add some missing newlines to the various DRM printks in this file.
Noticed while looking at logs. While we're here unbreak quoted
strings so grepping them is easier.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1c04b7cce43e..0e9d3fa1544b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -274,20 +274,20 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 
 	/* return EWOULDBLOCK since we know the wait isn't necessary */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
-		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d",
+		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d\n",
 			  DRMID(phys_enc->parent), intr_idx,
 			  irq->irq_idx);
 		return -EWOULDBLOCK;
 	}
 
 	if (irq->irq_idx < 0) {
-		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s",
+		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s\n",
 			      DRMID(phys_enc->parent), intr_idx,
 			      irq->name);
 		return 0;
 	}
 
-	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d",
+	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d\n",
 		      DRMID(phys_enc->parent), intr_idx,
 		      irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
 		      atomic_read(wait_info->atomic_cnt));
@@ -303,8 +303,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		if (irq_status) {
 			unsigned long flags;
 
-			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, "
-				      "irq=%d, pp=%d, atomic_cnt=%d",
+			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
 				      DRMID(phys_enc->parent), intr_idx,
 				      irq->irq_idx,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
@@ -315,8 +314,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, "
-				      "irq=%d, pp=%d, atomic_cnt=%d",
+			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
 				      DRMID(phys_enc->parent), intr_idx,
 				      irq->irq_idx,
 				      phys_enc->hw_pp->idx - PINGPONG_0,

base-commit: e9f1cbc0c4114880090c7a578117d3b9cf184ad4
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
