Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0526BD505
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 17:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3098C10ED69;
	Thu, 16 Mar 2023 16:17:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F7610ED56
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a32so2250570ljr.9
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1nSmyfSHo7EBUHuuEhKgpihhBPnp/4UutQgvjZNsSEg=;
 b=u2xNUiJkQM9B0eiqb221sVFMvScOKzo9sIxm/zuP3J0dvv4lysT0XsUMBVFeHA2By+
 mylU9P7/ivUpOLpcC+PKN7K25uRe3JjO6IYJapUkz/YsDmtoxaa9hawBtBCliyrh2eRx
 YiR4diYuYWaPncvEtT+L9d64zYNcHQ1b3UgKsxhiCS6dsnPQUlryEMtEioyq/ImJPwOl
 qKJhMLD7+Y0URaG3o7z2YVBOntj4cG7Ve5E1W86r03RzP+lRyAhjpRQZaKeiV7CkzvwO
 R+CXtl11x1JzM2osWmHz8VKEiLozp4jhmpItJ+KtlHIJo2oMTul5CpcVt/S1xv1sibwp
 hOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1nSmyfSHo7EBUHuuEhKgpihhBPnp/4UutQgvjZNsSEg=;
 b=odTRolBlkYMpGJXYqZzYB8BSDH4emn7zA0TUtF/79k1XS+05Ucb36B3rpvVre3C9Sk
 CxM5JLnQMvOoE9EMnkOfTHYz/xQ1kYStiWa8YAGbxq05S4XhJkDllV006dFxfOLuHwxG
 gZUhEcfhz63t9gzD369KJNLGGWVjAJ5Wv58C4E7ixBSKKRJR7D7s0GB/a9N6SgkahQk/
 1p7ZBtfZgkLdD6jYb6Zny7TDioaS2zAM0t98+sCbhawOvVIQ3WYZvuWMe0rj++FL584T
 1EraZ/gODbMinyLyHt9UNNHLbxxc+Ghm2Hr8QQFqHH0kZA+y7w24ItXp2G1ma+HmeORo
 qS9w==
X-Gm-Message-State: AO0yUKUdD+7ciRmJ6WTFQLSLxkYpo1LdPM65krgsZCmzPL3qWOa2drvg
 +P5f4/G731i2HfrMz5OLAZhYsQ==
X-Google-Smtp-Source: AK7set/zAo1Z9sj8A61aT7OPf9221QTcwmReFBcZfPS2dPSgVQaVydrjfqBdcrKtLCVyV42gkKaQSw==
X-Received: by 2002:a2e:b8cd:0:b0:298:9c76:ae3f with SMTP id
 s13-20020a2eb8cd000000b002989c76ae3fmr3192465ljp.40.1678983425242; 
 Thu, 16 Mar 2023 09:17:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Mar 2023 19:16:32 +0300
Message-Id: <20230316161653.4106395-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 11/32] drm/msm/dpu: move stride programming
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
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
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

