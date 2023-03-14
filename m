Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0471A6B9983
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21A210E84A;
	Tue, 14 Mar 2023 15:35:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4EF10EA9A
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:54 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id h3so16423385lja.12
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awI8lXOjtVG5jYWXurUXcicFTnHYutMV2m5uqlNXmOs=;
 b=Am0YlKSYlYufy9Gj45RgA3b0rlkBkD77GYRtkQ5eD6lbKLeYjRQWmfAoeyyTCNXGDB
 eJJPQyQ3XiZU4jIRMwuz4E89gyFeArbjKTon0n0w46PJwrUnxdyRHQ9kIEQZUFozRLLq
 Z6rpjvZjq5HvdOjxXme9TrCpIU3OenXdQFTcZG1/Bh+uHxjZwKIcnsUQKBT9u1k1zha6
 lyN7Mtd9F3I1eQ9CKR0CcPJsf4kJVL7SIBTlrN3ID9ZovV6rt1hXRgtJOU8y3KCLjVmz
 hVCTD6uBC3jwJx2TPV6s+HuC3TyeBX9axVGVUbzvvfTjKqVuA5rCvQoGB0wfmY5yNnTQ
 mXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=awI8lXOjtVG5jYWXurUXcicFTnHYutMV2m5uqlNXmOs=;
 b=o9t6bFmtQheoc59NsLITxMPqj8hwJQ2+R8bOltfAL6LjXIOHm5PGiAjucD2ScUZFq0
 GPhm9aAeaRQn7Q+jFG2MsY0+rhrslP0rQZbOs7J83A403uVB0n6d7IEJG0P8QKYEfyV3
 UHMa4bU2QZMZN7McCHlyZxWC9roOX7q6TqWry0Bw22aRmLGDEJ1XPAXz+DdGdsRb7lny
 O2OZHIKeiEiPugX9EXzXUMsKnrgSiByIL6luat4fLqJEXqKF/KmE29ary7AnO4NjFaL1
 tJGfW6GWeo8vLjH9HTXONI5AcqPQu/S/EucpV2l1wLtqYWvsO3ReZdur8VLcS9MJfqIB
 /FZQ==
X-Gm-Message-State: AO0yUKW6l+nAlkWKimALco6ieF+4jSx/+0aZy9U9EiE8P5CCr+A2yttm
 N2GRqAkcxGeLWDZEonBI7PqFeg==
X-Google-Smtp-Source: AK7set8vZ71tRD5rXDXzWng/5ZfiAjLZ0rpSkuAOHUbYUNCKPrq9Jo8PGNiX68G/Jh7eV4HoflfQxA==
X-Received: by 2002:a05:651c:1682:b0:293:2bf4:d939 with SMTP id
 bd2-20020a05651c168200b002932bf4d939mr12331782ljb.12.1678808154169; 
 Tue, 14 Mar 2023 08:35:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Mar 2023 18:35:24 +0300
Message-Id: <20230314153545.3442879-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 11/32] drm/msm/dpu: move stride programming
 to dpu_hw_sspp_setup_sourceaddress
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

Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
dpu_hw_sspp_setup_rects() programs only source and destination
rectangles.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 0a43c5682b2b..ab95f2817378 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -451,7 +451,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
-	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
+	u32 src_size, src_xy, dst_size, dst_xy;
 	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
 	u32 idx;
 
@@ -482,44 +482,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
 		drm_rect_width(&cfg->dst_rect);
 
-	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
-		ystride0 = (cfg->layout.plane_pitch[0]) |
-			(cfg->layout.plane_pitch[1] << 16);
-		ystride1 = (cfg->layout.plane_pitch[2]) |
-			(cfg->layout.plane_pitch[3] << 16);
-	} else {
-		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
-		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
-
-		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
-			ystride0 = (ystride0 & 0xFFFF0000) |
-				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
-			ystride1 = (ystride1 & 0xFFFF0000)|
-				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
-		} else {
-			ystride0 = (ystride0 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[0] << 16) &
-				 0xFFFF0000);
-			ystride1 = (ystride1 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[2] << 16) &
-				 0xFFFF0000);
-		}
-	}
-
 	/* rectangle register programming */
 	DPU_REG_WRITE(c, src_size_off + idx, src_size);
 	DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
 	DPU_REG_WRITE(c, out_size_off + idx, dst_size);
 	DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
-
-	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
-	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		struct dpu_hw_sspp_cfg *cfg)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 ystride0, ystride1;
 	int i;
 	u32 idx;
 
@@ -541,6 +515,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
 				cfg->layout.plane_addr[2]);
 	}
+
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
+		ystride0 = (cfg->layout.plane_pitch[0]) |
+			(cfg->layout.plane_pitch[1] << 16);
+		ystride1 = (cfg->layout.plane_pitch[2]) |
+			(cfg->layout.plane_pitch[3] << 16);
+	} else {
+		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
+		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
+
+		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
+			ystride0 = (ystride0 & 0xFFFF0000) |
+				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
+			ystride1 = (ystride1 & 0xFFFF0000)|
+				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
+		} else {
+			ystride0 = (ystride0 & 0x0000FFFF) |
+				((cfg->layout.plane_pitch[0] << 16) &
+				 0xFFFF0000);
+			ystride1 = (ystride1 & 0x0000FFFF) |
+				((cfg->layout.plane_pitch[2] << 16) &
+				 0xFFFF0000);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
+	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
-- 
2.30.2

