Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F053BB4C9
	for <lists+freedreno@lfdr.de>; Mon,  5 Jul 2021 03:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FF989B83;
	Mon,  5 Jul 2021 01:25:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5000A89B0B
 for <freedreno@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:14 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a18so29464623lfs.10
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R+K+UbuG5v4VrTgyGCC6/21CgPA+gPC+suGnCF7lATs=;
 b=qc/rsxkRlBj6s28k5DhOn8Sn8ahxTxlxxkhTQ0MJ5+KZVWCH1Z7qseO5FwyfsbBs24
 urKnvLKOZtR49aBz0LcEK8PKTaq2YWHWs5b7UfMAkp2jRJBJuZ2mt9QQAmFiDPF0bpKJ
 Py9+bjKV1qv5TxUG5SE9RhPqxsQwZ8R19LqorpYuDd+p+Im9VPZcM9q467ZMwp3PofP7
 PhHQRBFko2T202VXQbs/CYXd6EZpium8ur/tLjejKK0F+ONBYi0MTQrNmS956CnW9h9I
 79mCJhuiasts0txh8iX0oPCqtDmttiXmOgAkIPhqOlLaE09arpkHHvfjdymP1dMKZPoc
 mrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+K+UbuG5v4VrTgyGCC6/21CgPA+gPC+suGnCF7lATs=;
 b=oS2LFGIvcnWxYEK0KAnj3gfkeKOcimGfBB1llJr6dEiGXar+eGpB7tPnoj4TJqZakm
 yYk6tqIFtN/lJd+ayJZNXqhO2t/dzT+hctK4RIwZF7BeScJ9uJlkUuoT9UKdiMA6Ds5o
 AyT1ATzcyxRWZ4fS+8bmrDJ2K11JCuBSf4m8J2QuVvl9SCEzIbgoynfuO7/mWiQBMEhi
 KAd+zC8Y8GLhlvMCKwJ2KFkFtK0cFyI166Vt7wryc9QmiEbU5jvjb4Qk12IdNXjGGzY8
 6RpSA214R2jO2Joe2QwUlb8xE/5mMsdjvY03nBm9F+04lXqV2hOEO83BZzhyxjtfkcMQ
 UAEQ==
X-Gm-Message-State: AOAM532ichfE3V13WuWHP+gGF4ao7bSZkautZBXCYrnFcdARlLc1+asx
 VRsA0m4jCNTbHgh7F2Y+oedjpA==
X-Google-Smtp-Source: ABdhPJwSf9rF4R+uAsPto/DyyFyR+x5mKdzNHAIgT6hoKhjWmdMSat3+f3gpP3PQIMWm7XTIaLgLvg==
X-Received: by 2002:a19:7503:: with SMTP id y3mr8594591lfe.132.1625448312702; 
 Sun, 04 Jul 2021 18:25:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Mon,  5 Jul 2021 04:21:01 +0300
Message-Id: <20210705012115.4179824-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 08/22] drm/msm/dpu: drop dpu_csc_cfg from
 dpu_plane
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

Simplify code surrounding CSC table setup by removing struct dpu_csc_cfg
pointer from dpu_plane and getting it directly at the CSC setup time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 96 +++++++++++----------
 5 files changed, 54 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index c16832898c51..2be43d5a235a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -537,7 +537,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
 }
 
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
-		struct dpu_csc_cfg *data)
+		const struct dpu_csc_cfg *data)
 {
 	u32 idx;
 	bool csc10 = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 35a848b1fcf8..264a9d0d5fca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -262,7 +262,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @data: Pointer to config structure
 	 */
-	void (*setup_csc)(struct dpu_hw_pipe *ctx, struct dpu_csc_cfg *data);
+	void (*setup_csc)(struct dpu_hw_pipe *ctx, const struct dpu_csc_cfg *data);
 
 	/**
 	 * setup_solidfill - enable/disable colorfill
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index f94584c982cd..aad85116b0a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -374,7 +374,7 @@ u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
 
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 		u32 csc_reg_off,
-		struct dpu_csc_cfg *data, bool csc10)
+		const struct dpu_csc_cfg *data, bool csc10)
 {
 	static const u32 matrix_shift = 7;
 	u32 clamp_shift = csc10 ? 16 : 8;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index ff3cffde84cd..bc2fdb2b8f5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -321,6 +321,6 @@ u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
 
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
-		struct dpu_csc_cfg *data, bool csc10);
+		const struct dpu_csc_cfg *data, bool csc10);
 
 #endif /* _DPU_HW_UTIL_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 46446610e07e..6f856aeaf6bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -90,7 +90,6 @@ enum dpu_plane_qos {
 /*
  * struct dpu_plane - local dpu plane structure
  * @aspace: address space pointer
- * @csc_ptr: Points to dpu_csc_cfg structure to use for current
  * @catalog: Points to dpu catalog structure
  * @revalidate: force revalidation of all the plane properties
  */
@@ -108,8 +107,6 @@ struct dpu_plane {
 	bool is_rt_pipe;
 	struct dpu_mdss_cfg *catalog;
 
-	struct dpu_csc_cfg *csc_ptr;
-
 	const struct dpu_sspp_sub_blks *pipe_sblk;
 
 	/* debugfs related stuff */
@@ -590,51 +587,59 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 	scale_cfg->enable = 1;
 }
 
-static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
-{
-	static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
-		{
-			/* S15.16 format */
-			0x00012A00, 0x00000000, 0x00019880,
-			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-			0x00012A00, 0x00020480, 0x00000000,
+static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xfff0, 0xff80, 0xff80,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
+	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
+};
+
+static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
 		},
-		/* signed bias */
-		{ 0xfff0, 0xff80, 0xff80,},
-		{ 0x0, 0x0, 0x0,},
-		/* unsigned clamp */
-		{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
-		{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
-	};
-	static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
-		{
-			/* S15.16 format */
-			0x00012A00, 0x00000000, 0x00019880,
-			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-			0x00012A00, 0x00020480, 0x00000000,
-			},
-		/* signed bias */
-		{ 0xffc0, 0xfe00, 0xfe00,},
-		{ 0x0, 0x0, 0x0,},
-		/* unsigned clamp */
-		{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
-		{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
-	};
+	/* signed bias */
+	{ 0xffc0, 0xfe00, 0xfe00,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
+	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
+};
+
+static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
+{
+	const struct dpu_csc_cfg *csc_ptr;
 
 	if (!pdpu) {
 		DPU_ERROR("invalid plane\n");
-		return;
+		return NULL;
 	}
 
+	if (!DPU_FORMAT_IS_YUV(fmt))
+		return NULL;
+
 	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
-		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc10_YUV2RGB_601L;
+		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
-		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc_YUV2RGB_601L;
+		csc_ptr = &dpu_csc_YUV2RGB_601L;
 
 	DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
-			pdpu->csc_ptr->csc_mv[0],
-			pdpu->csc_ptr->csc_mv[1],
-			pdpu->csc_ptr->csc_mv[2]);
+			csc_ptr->csc_mv[0],
+			csc_ptr->csc_mv[1],
+			csc_ptr->csc_mv[2]);
+
+	return csc_ptr;
 }
 
 static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
@@ -1050,8 +1055,13 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pdpu->pipe_hw && pdpu->csc_ptr && pdpu->pipe_hw->ops.setup_csc)
-		pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, pdpu->csc_ptr);
+	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
+		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
+		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
+
+		if (csc_ptr)
+			pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, csc_ptr);
+	}
 
 	/* flag h/w flush complete */
 	if (plane->state)
@@ -1167,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, cdp_cfg);
 		}
-
-		/* update csc */
-		if (DPU_FORMAT_IS_YUV(fmt))
-			_dpu_plane_setup_csc(pdpu);
-		else
-			pdpu->csc_ptr = 0;
 	}
 
 	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
