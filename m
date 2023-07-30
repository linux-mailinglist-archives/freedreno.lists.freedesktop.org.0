Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC297682DC
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 02:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDF510E23E;
	Sun, 30 Jul 2023 00:35:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFFE10E12F
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:23 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9c66e2e36so35703651fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677321; x=1691282121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WGTxwuguTU3dXt4Lk3WuumS2opM05gfHMcauuNG4c4=;
 b=QbouQ7P16qMJWKq3AVbvpS1HdHr12aa3JlVAGpM5VvslIRERINevz5Yn+QECe7CcFs
 OAUMF2vwO/OyGuER3kYfHQMZo5t0iAf8M/AZuwm6FFeVLIzG8QJr4W21G/zFyd6vxShY
 zMYXA+35dSk/V4kAMCJjLhNUXJHLFuwa51sGouT0HJhayswP6gPFOtYWWIJiHcW1j1TU
 aL1lPuFAzV3eDVaOt+JhpXIPK2HfouXlqdqqyoAGsHdN9PmGsZIkXs5jDFKKrzIYmDT5
 5mDaZuebEeO2fVtfIo7tcVn9T44LMOSOFWHxCQUg8sG+qQNL66M/zTjcpGurUjMwPZzS
 5cBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677321; x=1691282121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WGTxwuguTU3dXt4Lk3WuumS2opM05gfHMcauuNG4c4=;
 b=XhJYgKCm/e0L8mn1J0TbOw1Ewi6H9/E0bPY6U1W4Pgr120JamFA1hmdq0MEZZ8uYd0
 xjWqiZF/9SCTCbBgGTw5yEjqLl93WX17hCv/d3EfTuJ5PlTrLlrjL+UVXQ/+88PipCqT
 LDw/FZHV+24//C6X4RYe9JgY86BmdlLEPICkwjl61gd2glqtnl/zd/pPs645iYA+63hh
 sMqZvIYVwzl4ZnjgzPtRokOJI1HmGzAk9vBRd7gRBXo9Q4q2gnMxV+a7f1KXu8VFia/j
 2OdOqfCaLYvA38BZKWmogiBRwQ5HxkOzwvJdmxXuq+hWGHS0wI+eXUvJHB4+ggo7zr8c
 gD2w==
X-Gm-Message-State: ABy/qLZ6Rwqez5msaT3bmAZL87lWNjMZvEvx5NcTf8ioTvLLuk1WhrOu
 JUOEk1oRjxx15C5GO90YO/rtSw==
X-Google-Smtp-Source: APBJJlEz9mk1Vn83M58HDNGODCzKYp9Sn+qdE6uAPZ5V1RqkshhmSEsjGstnqtBoPNu6TMK5XgKGDA==
X-Received: by 2002:a05:651c:2ce:b0:2b9:ad75:2b01 with SMTP id
 f14-20020a05651c02ce00b002b9ad752b01mr3886982ljo.20.1690677321407; 
 Sat, 29 Jul 2023 17:35:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 03:35:12 +0300
Message-Id: <20230730003518.349197-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/8] drm/msm/dpu: enable PINGPONG TE
 operations only when supported by HW
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

The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
Rather than checking for the flag, check for the presense of the
corresponding interrupt line.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c          | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 9298c166b213..057cac7f5d93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -282,7 +282,7 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
 }
 
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
-		void __iomem *addr)
+		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_pingpong *c;
 
@@ -296,7 +296,9 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 	c->idx = cfg->id;
 	c->caps = cfg;
 
-	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
+	if (mdss_rev->core_major_ver < 5) {
+		WARN_ON(!cfg->intr_rdptr);
+
 		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
 		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index d3246a9a5808..0d541ca5b056 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -123,10 +123,11 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
  * pingpong catalog entry.
  * @cfg:  Pingpong catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
+ * @mdss_rev: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_pingpong context
  */
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
-		void __iomem *addr);
+		void __iomem *addr, const struct dpu_mdss_version *mdss_rev);
 
 /**
  * dpu_hw_pingpong_destroy - destroys pingpong driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 4a53e2c931d6..9894eea77b5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -145,7 +145,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
 
-		hw = dpu_hw_pingpong_init(pp, mmio);
+		hw = dpu_hw_pingpong_init(pp, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
-- 
2.39.2

