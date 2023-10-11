Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC907C52B2
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 13:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B4C10E73D;
	Wed, 11 Oct 2023 11:59:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7880E10E105
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 11:59:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-406650da82bso62381535e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697025574; x=1697630374; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GbTB2uPyXxZYT1sA9JVR+NoxhvrgHUoB1FiBsf5/CkA=;
 b=XhWDSvTEAKRd6dV9zUQ0piLmKgXuPWifwyfgJLc38n7e7PI+FnFB+I9Z/5vEEpcukC
 p7y3b9xZqmKMohVVB8OTs0gDvimj9kkisnCdZM7rhm5u7fMhHLEBoqoEaqoEYliCNWTJ
 If+JPmRSUotqpDC+gRA5XSNbEI4FFwd7QaCqUz7AEjDi5qqmshPY+vQ47FZe0CVcByCH
 1PKwJtfke+fCvGZvPtxg/KVsmGGMp+dN+Gdf8oE9ORdJutGEJM7o1Vu6bILXNpLov1NF
 iCiL2aouyPF8QVjItb3ii5yOvo4OaCExMrn0amBPn+yLQE880d8iTCH4U8ROJZd3Uz8Y
 9x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697025574; x=1697630374;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbTB2uPyXxZYT1sA9JVR+NoxhvrgHUoB1FiBsf5/CkA=;
 b=c8znIoXw03EIpk5+mc0P13ceQ6pSMxhroHXRmbMikZdX8jo9X3FxoLQa7PiTVDnHlI
 J9YbUib0bSP2BoJrZPQTQRUgcUBpRFPYlVTu8Eb+KNNhId+A0hIgKEfxSO8CrtvkasSa
 krIW3DWRcf37vANtxzJabH3KThqYKLFuBKEzjiN+HUsU4PKRkR3WX/YiQg/1bM6e0rVT
 ur+mmRSD+SOAdFLgaaP4mOv7/+S1t0UDTZwJcTtXiehLNaAPjk0N+uGXXOqvqmTX1Opa
 kbi/W5joyxGeJkaN9xjVa0184WnJ63UMMqYhGGn/jXexzopk8NeX2jUydSOJgtwGUV60
 wp7g==
X-Gm-Message-State: AOJu0Yx1splMp/Lu8dkdbVC7O22KJSHXDg/9H4WcTrS1y8COZybFGzLq
 v18VtW09IMW2Lnq2+71kGrzQqJiiYBJ+bVgR+kgkOEiH
X-Google-Smtp-Source: AGHT+IHfw7jkKb6D4VJ2Ce7gX/reoTq0ux9u2+ViRAcdsj0DT1llO5Qx+W6FDyN0ZODBgJvcD3vEQg==
X-Received: by 2002:adf:f1c6:0:b0:324:1521:3a6e with SMTP id
 z6-20020adff1c6000000b0032415213a6emr18092008wro.24.1697025573692; 
 Wed, 11 Oct 2023 04:59:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b00323293bd023sm15447805wro.6.2023.10.11.04.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 04:59:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Oct 2023 13:59:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-1-b219c945df53@linaro.org>
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3100;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=A/G3MVO3WfKh+AqmbjQ5ogAUwEdsxecl9VHw880vMMU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJo4hP9v16iv5MviNHP9TcD7Agb3W8eAPlpNIlMod
 o0b1dQ2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSaOIQAKCRB33NvayMhJ0bInD/
 9Ly1iAVJsLt2ZkqG5V1mRJXRvDzonNt7DX48LRCklfUv+oPTCQS6bmla3/BtEVaUoNAiRegsrwyyrP
 2PCCZbsDSlh9nhbi/mvFYGQsi8w7UVD8LBHFmMkoltHeNSxOwYRHxZ+0xYXEvugvXNTuJGy0bnefuQ
 EP1DPaSSJVhGyMOZx7ObinDoYv3OOJCN+0gJVS3xjlXOH3+GhYmSn4OBQ9OtM/MErLhMOD1yBOLsv4
 rol+TzfIxvaCZ5whloEcB5vB/pcz617DsqSGYg2E9b3KOtvC2r38ekUxKP1Dm9T21oN7wEWQGFmDeT
 f3xhQrmehAAqmHtHwy1oXZWW2vM0EvPH0JYyPX379ae0clAVHnRk6tOfzzXw70uNWpcaE9qo7w3TCm
 h91vLSE6mJ7Ti8x53gbhIoSNLCKcffX7fmNsDmc45ipcj4+PYh7YtxdgfdYCM5s9ZUbSE5voLAU8u/
 tVXFjdnbQRb+0gvjH7ocm8H9xymrbyuYOzix81zYre52d345B1UIF0TgtJYNAczfvI3Ljhpa0zvwEd
 BKCD6XpxZVTUP8DOWrf/fWmbcYN4N7VU0gJr65HyKBKTswvWsC4gJvo2DDTHPFkNzDSEZfB2kod9PI
 DFY83Z651z48F154XzjKXfdaHfc5vA3jLrzmFZzw/IeFJTOni1oR691fhDag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH v2 1/5] drm/msm/dpu: create a
 dpu_hw_clk_force_ctrl() helper
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add an helper to setup the force clock control as it will
be used in multiple HW files.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  | 23 +----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  4 ++++
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cff48763ce25..24e734768a72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -66,34 +66,13 @@ static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 static bool dpu_hw_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
 		enum dpu_clk_ctrl_type clk_ctrl, bool enable)
 {
-	struct dpu_hw_blk_reg_map *c;
-	u32 reg_off, bit_off;
-	u32 reg_val, new_val;
-	bool clk_forced_on;
-
 	if (!mdp)
 		return false;
 
-	c = &mdp->hw;
-
 	if (clk_ctrl <= DPU_CLK_CTRL_NONE || clk_ctrl >= DPU_CLK_CTRL_MAX)
 		return false;
 
-	reg_off = mdp->caps->clk_ctrls[clk_ctrl].reg_off;
-	bit_off = mdp->caps->clk_ctrls[clk_ctrl].bit_off;
-
-	reg_val = DPU_REG_READ(c, reg_off);
-
-	if (enable)
-		new_val = reg_val | BIT(bit_off);
-	else
-		new_val = reg_val & ~BIT(bit_off);
-
-	DPU_REG_WRITE(c, reg_off, new_val);
-
-	clk_forced_on = !(reg_val & BIT(bit_off));
-
-	return clk_forced_on;
+	return dpu_hw_clk_force_ctrl(&mdp->hw, &mdp->caps->clk_ctrls[clk_ctrl], enable);
 }
 
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 9d2273fd2fed..18b16b2d2bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -546,3 +546,24 @@ void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
 
 	DPU_REG_WRITE(c, offset, cdp_cntl);
 }
+
+bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
+			   const struct dpu_clk_ctrl_reg *clk_ctrl_reg,
+			   bool enable)
+{
+	u32 reg_val, new_val;
+	bool clk_forced_on;
+
+	reg_val = DPU_REG_READ(c, clk_ctrl_reg->reg_off);
+
+	if (enable)
+		new_val = reg_val | BIT(clk_ctrl_reg->bit_off);
+	else
+		new_val = reg_val & ~BIT(clk_ctrl_reg->bit_off);
+
+	DPU_REG_WRITE(c, clk_ctrl_reg->reg_off, new_val);
+
+	clk_forced_on = !(reg_val & BIT(clk_ctrl_reg->bit_off));
+
+	return clk_forced_on;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 1f6079f47071..4bea139081bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -367,4 +367,8 @@ int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_signature_offset,
 		u32 *misr_value);
 
+bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
+			   const struct dpu_clk_ctrl_reg *clk_ctrl_reg,
+			   bool enable);
+
 #endif /* _DPU_HW_UTIL_H */

-- 
2.34.1

