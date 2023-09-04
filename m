Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F16E790FD2
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 04:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B439310E275;
	Mon,  4 Sep 2023 02:05:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F92010E276
 for <freedreno@lists.freedesktop.org>; Mon,  4 Sep 2023 02:04:58 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bcb54226e7so11266191fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793096; x=1694397896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxIfvevq87WVmZljmdsOUb7zNfjaAH8j0tUqxn+e9Jw=;
 b=Fgvw6Qw+XBgDkwS4y+b6ocPTH5VAcsOMRMvxVbQBydtAXhIar7h15s3SJsPdY1u2ut
 F7MXis1J/GlTx8ks4moT8eF846+u8q0ZLkZmR9Muyx/dM4exxky0UX28oJD8rwyxQIGQ
 EIBOBLndabscKIGTA/YU3Ly72QeOeO98OSlfnTKht2YXsB8qZLYjXAoB1QEx1JRLlGyR
 uvt7uRHjJCcyFYJ/Y7tGbW1171WYdWM0hk1wkWewOvkEeh9Im9Q2JcTAHkbnKJFZ1Ny8
 Ka8s6M0sKIXUq4UjtC/LxIX8TwgDKnHumdMxHxPf567RVe7u9+J7VJeI+4dtkC9qvy6l
 UX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793096; x=1694397896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxIfvevq87WVmZljmdsOUb7zNfjaAH8j0tUqxn+e9Jw=;
 b=YRdOAdjwXflKiUG/bYEVwI7MrHEG6tQBjRT4Caqe0mm4JmDm7mYciG7XPmiYTQGW6l
 Qo9os7CnH8xYIGqjqN0e8pW9pmC1WFKCMNnAAjU0IAyoNWDgE60c3Hlgy+toYCnAlwEX
 jBaC21wB3g2AfFktb8D/8CL4ALbPkN4az06JOBG6GN0txdyBSmBmQnnxmhNmutfyRiRD
 /ug1SQVd1fAGK23J3yjJzE3asxTfJoFJas3bVgLFqSY01tjJ7Dnk9b+sD78AuXKgu8uZ
 cgcm/MaAnjwmiwcz1kOrM+tASpkuWOY1wrOP7Zhou/HqPvoTRtEGes2qlJKr6an7HZ/9
 GFpw==
X-Gm-Message-State: AOJu0Yxv6MS5ZUpdmNpo5+EChfq71gL6VcFOGN6G1P0lyLRLNqy3/9tA
 x/HcJaHfL5jmpFJiZtvcetZRfQ==
X-Google-Smtp-Source: AGHT+IF4AL00qrBYG914cfs2MtjwiEgixFaAhw+pEt4e47Fkg5dl2OorMKe4mVmiFeBh/XLwZZN5NQ==
X-Received: by 2002:a2e:910b:0:b0:2bd:d31:d1ee with SMTP id
 m11-20020a2e910b000000b002bd0d31d1eemr2456620ljg.14.1693793096654; 
 Sun, 03 Sep 2023 19:04:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  4 Sep 2023 05:04:48 +0300
Message-Id: <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 2/8] drm/msm/dpu: enable PINGPONG TE
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
index f9215643c71a..f3aff605554d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -146,7 +146,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
 
-		hw = dpu_hw_pingpong_init(pp, mmio);
+		hw = dpu_hw_pingpong_init(pp, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
-- 
2.39.2

