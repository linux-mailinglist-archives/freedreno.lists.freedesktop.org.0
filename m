Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73D3BB4CB
	for <lists+freedreno@lfdr.de>; Mon,  5 Jul 2021 03:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734F889B9F;
	Mon,  5 Jul 2021 01:25:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CED689B69
 for <freedreno@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu19so29487622lfb.9
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yinWqN6sitnN8VvWfqsYfxul5z49radOuOsQ6IiCc/o=;
 b=raxV6kKpSU2jsR4bKPXudOKVrgMbTqNuB/McIhO0LUU+3WV99Q5c4FWI8Aaiq6D0BB
 8yaI10eFF+20zN4gcJVQIO6Kflg0GtCngaUD0Ady3qbYnlEXlpfLCbHp8jG9UCTOX/5O
 al81cqDU34/GxOPh18eKw/JgwL5axaV6uaYxuyVWpmyl00MJ2KPTU1FGddOe8diGMoVw
 jpty0R37Jmg2ca2+8G6kjJ36z4v5rZ2zHtJW80WmH+XllXJ9h08kvmrsSgK7JGGPDHF/
 sXE/m5jU0Ablbjv5RCeUeiHgbdiSlaWLX0hqF1uzfbUF7NHaNcB+1o5e16rBTe+NgPp/
 c/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yinWqN6sitnN8VvWfqsYfxul5z49radOuOsQ6IiCc/o=;
 b=P29rwDOwRejlPHE8avpW05PRD7amPjHvohqK49K9MwgQkB2JId9YMQNO6yk/ZkF2gb
 AP4wd6S66XtMrdmYSsANbdkCoOSnlxjGOC+ZEozftSIDroGDP7LXbACqaVaR0W4/4e3F
 Vr1N+cP40pOP1Udx7xaQnbGlEhHcro7D1IgWGHFbE8lPMBfnQDYRcyo/8YAOlzj6M0Nw
 lNrtb9luuVwiI9sgDyj5Y2MeBH3D4l/KhOxq6K3TQbAadIpOWzb+WPIE97LsM6YNrUAk
 M093RhR+FRpUKpnrttEzB2czk0+8vbGUdOOG8xpKzLzuRovsbm8LkOmglsko7DdmyNno
 tFdQ==
X-Gm-Message-State: AOAM533rXOea1Vs/L65wJ28OUaXX1+ELxYUfNOD3137j4QrhHlymXvDK
 loLxXUfHPqHllX/BfbRSxxv9cQ==
X-Google-Smtp-Source: ABdhPJxXXCISyXSXqTpw1NmcO+okUMZsNuxIEPYRFRE+dPJhfMcsNupZt2sPHMls4ZZXRU3POrB/3A==
X-Received: by 2002:a05:6512:3e24:: with SMTP id
 i36mr8311158lfv.368.1625448314421; 
 Sun, 04 Jul 2021 18:25:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Mon,  5 Jul 2021 04:21:03 +0300
Message-Id: <20210705012115.4179824-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 10/22] drm/msm/dpu: don't cache
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
index fdae6520c2bb..65446e8f5718 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -99,7 +99,6 @@ struct dpu_plane {
 	struct mutex lock;
 
 	enum dpu_sspp pipe;
-	uint32_t features;      /* capabilities from catalog */
 
 	struct dpu_hw_pipe *pipe_hw;
 	uint32_t color_fill;
@@ -629,7 +628,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -992,8 +991,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pdpu->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->features & (BIT(DPU_SSPP_CSC)
+		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
 		 | BIT(DPU_SSPP_CSC_10BIT))))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
@@ -1415,8 +1414,8 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
-	debugfs_create_x32("features", 0600,
-			pdpu->debugfs_root, &pdpu->features);
+	debugfs_create_xul("features", 0600,
+			pdpu->debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
 
 	/* add register dump support */
 	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
@@ -1575,7 +1574,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
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
